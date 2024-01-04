M = {
	scopes = {},
	actived_scope = nil
}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local telescope_conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require("telescope.actions.state")

local function sanitize_path(path)
	path = vim.fn.substitute(path, "file\\[main\\]:", "", "")
	path = vim.fn.substitute(path, "//", "/*", "g")
	return path
end

local load_scope_file = function(scope_file)
	local scope_name = vim.split(vim.fs.basename(scope_file), ".", { plain = true })[1]
	local scope_content = vim.fn.readfile(scope_file)
	M.scopes[scope_name] = {}
	local patterns = M.scopes[scope_name]
	for _, line in ipairs(scope_content) do
		-- naive implementation, we are searching for the line that contains
		-- pattern="file[main].*" and then we extract the value of the path attributes
		local pattern = vim.fn.matchstr(line, 'pattern="\\zs[^"]*\\ze"')
		if pattern ~= "" then
			local paths = vim.split(pattern, "||", { trimempty = true })
			for _, path in ipairs(paths) do
				patterns[#patterns + 1] = sanitize_path(path)
			end
		end
	end
end

local function reset()
	M.actived_scope = nil
end

local function load_scope(scope)
	M.actived_scope = scope
end

local function search_scope()
	local scopes = vim.tbl_keys(M.scopes)
	pickers.new({}, {
		prompt_title = "Jetbrains Scopes",
		finder = finders.new_table(scopes),
		sorter = telescope_conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local scope = action_state.get_selected_entry()
				load_scope(scope[1])
			end)
			return true
		end
	}):find()
end

local function search_in_scope(scope)
	local patterns = M.scopes[scope]
	local find_command = { "rg", "--files", "--color", "never" }
	for _, pattern in ipairs(patterns) do
		find_command[#find_command + 1] = "--glob"
		find_command[#find_command + 1] = pattern
	end
	pickers.new({}, {
		prompt_title = "Jetbrains Scope",
		finder = finders.new_oneshot_job(find_command, {}),
		sorter = telescope_conf.generic_sorter({}),
	}):find()
end

local function search_in_current_scope()
	if M.actived_scope == nil then
		return
	end
	search_in_scope(M.actived_scope)
end

local setup_scope_commands = function()
	vim.api.nvim_create_user_command("JetbrainsScopesReset", reset, {})
	vim.api.nvim_create_user_command("JetbrainsScopes", search_scope, {})
	vim.api.nvim_create_user_command("JetbrainsSearch", search_in_current_scope, {})
end

local setup = function()
	local jetbrains_dir = vim.fs.find(".idea", { upward = true })[1]
	if jetbrains_dir == nil then
		return
	end
	local scope_files = vim.fn.globpath(jetbrains_dir, "scopes/*.xml")
	for _, scope_file in ipairs(vim.split(scope_files, '\n')) do
		load_scope_file(scope_file)
	end
	setup_scope_commands()
end


return {
	setup = setup,
	state = M
}
