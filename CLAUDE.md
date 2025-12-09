# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a **GNU Stow-based dotfiles repository** for a Linux development environment. Each top-level directory corresponds to a specific tool/application and contains its configuration files in a home directory hierarchy structure.

## Installation and Management

### Installing Configurations

```bash
cd ~/dotfiles
stow nvim        # Install neovim config
stow tmux        # Install tmux config
stow zsh         # Install zsh config
# ... repeat for any other tool
```

Stow creates symlinks from each tool directory to the home directory, allowing version-controlled dotfiles while keeping a clean home directory.

### Updating Configurations

After modifying files in this repository, changes are immediately reflected in the home directory due to Stow's symlink approach. No restow is needed unless adding new files.

## Architecture and Key Design Patterns

### Unified Color Scheme

All visual applications share the **base16-atelier-savanna** color scheme for visual consistency:
- Neovim: `base16-atelier-savanna` theme (via base16-nvim plugin)
- Wezterm: `Atelier Savanna (base16)` theme
- Tmux: Ayu dark theme with `@tinted-color 'base16-atelier-savanna'`

When modifying themes, update all three locations to maintain consistency.

### Bépo Keyboard Layout Support

The setup is optimized for the **Bépo keyboard layout** (French alternative to QWERTY/AZERTY):
- i3 config includes Bépo layout with Azerty fallback (toggle with left Ctrl+right Ctrl)
- Neovim keybindings are Bépo-aware (uses `c/t/s/r` for navigation instead of standard `h/j/k/l`)
- Tmux pane navigation uses `M-c/s/t/r` (Alt+c/s/t/r) for left/down/up/right

### Tool Integration Stack

```
i3 (window manager)
  └─> wezterm (terminal emulator)
      └─> tmux (terminal multiplexer)
          └─> zsh (shell)
              └─> nvim (editor)
```

**Critical integration points:**
- Wezterm listens for nvim ZEN_MODE events to adjust font size
- Tmux has vim-aware pane navigation (detects nvim splits)
- Tmux binding `T` launches sesh session manager
- Zsh uses nvim as EDITOR and MANPAGER
- FZF_DEFAULT_COMMAND uses ripgrep for file finding

## Configuration Files by Tool

### Neovim (`nvim/.config/nvim/`)

**Structure:**
- `init.lua` - Bootstrap file loading lazy.nvim and core modules
- `lua/options.lua` - Editor settings
- `lua/keymaps.lua` - Custom keybindings (leader = space)
- `lua/autocmds.lua` - Auto-formatting, terminal setup, yank highlighting
- `lua/plugins/*.lua` - Plugin configurations organized by category

**Key plugins:**
- **Plugin manager:** lazy.nvim (lazy loading for fast startup)
- **AI integration:** Avante (AI chat), Copilot, MCPHub
- **Navigation:** Oil (file explorer), Telescope (fuzzy finder)
- **Git:** Fugitive, Gitsigns, Octo (GitHub PR editing in nvim)
- **LSP:** Mason for language server management
- **Completion:** blink.cmp with Copilot integration
- **Notes:** Obsidian plugin for note management

**Plugin file organization:**
- `autocompletion.lua` - Completion engine and sources
- `code.lua` - LSP, treesitter, language-specific tools
- `navigation.lua` - File navigation and fuzzy finding
- `git.lua` - Git integration
- `ai.lua` - AI assistants and code generation
- `styling.lua` - Theme, statusline, visual enhancements
- `debug.lua` - DAP (Debug Adapter Protocol)

**Common keybindings:**
- `<leader>` is space
- `<leader>ff` - Telescope find files
- `<leader>fg` - Telescope live grep
- `<leader>tn` - Telescope notes
- `-` - Open Oil file explorer

### Tmux (`tmux/.tmux.conf`)

**Key configurations:**
- Prefix: `Ctrl-A` (not default Ctrl-B)
- Vi mode enabled
- Mouse support enabled
- Status bar at top
- Theme: `~/.tmux/themes/tmux-ayu/ayu-dark.tmux`

**Plugins (via TPM):**
- tmux-sensible, tmux-yank, extrakto
- tmux-battery, tmux-cpu
- tinted-theming

**Custom keybindings:**
- `T` - Launch sesh session manager
- `M-c/s/t/r` - Vim-aware pane navigation (Bépo layout)
- `x` - Kill pane without confirmation

**Vim integration:**
Automatically detects when nvim is active in a pane and passes navigation keys to nvim, allowing seamless navigation between tmux panes and nvim splits.

### Zsh (`zsh/.zshrc`, `zsh/.aliases`)

**Environment:**
- `EDITOR=nvim`
- `TERMINAL=wezterm`
- `MANPAGER="nvim +Man!"`
- Uses Starship prompt (not oh-my-zsh)

**Git aliases:** Extensive shortcuts for common git operations (see `.aliases`)
- `g` = git
- `gst` = git status
- `gcm` = git checkout main
- `gwip` = git work-in-progress commit (skip CI)
- `prco` = PR checkout using fzf

**Utility aliases:**
- `e` = $EDITOR (nvim)
- `ls` = eza --icons
- `tree` = eza --tree --icons
- `less` = batcat
- `avante` = Launch nvim in Avante zen mode

**Custom functions:**
- `csv` - Format CSV for console viewing
- `prco` - Checkout PRs using fzf (integrates with gh CLI)

### i3 Window Manager (`i3/.config/i3/config`)

**Modifier keys:**
- `$meta` = Super (Windows key) - primary modifier
- `$alt` = Alt
- Custom `$hyper` and `$meh` keys

**Key application launchers:**
- `Super+Return` - wezterm terminal
- `Super+comma` - snippets system
- `Super+space` - rofi launcher
- `Super+c` - clipboard manager (rofi-gpaste)

**Startup applications:**
- Multi-monitor setup via `monitors_layout`
- Wallpaper via feh
- Flameshot for screenshots

### Sesh Session Manager (`sesh/.config/sesh/sesh.toml`)

Predefined sessions for quick access:
- "main (Alma)" - Main project workspace at `~/alma/main/`
- "nvim config" - Opens nvim dotfiles (`init.lua`)
- "tmux config" - Opens tmux dotfiles (`.tmux.conf`)

Access via `T` key in tmux.

## Custom Scripts (`scripts/bin/`)

### Workflow Scripts

- **`snippets`** - System-wide snippet manager via rofi
  - Snippets in `~/dotfiles/snippets/`
  - Executable snippets run and paste output
  - Text snippets paste content directly
  - Accessible in i3 via `Super+comma`

- **`clipboard`** - Rofi-based clipboard manager using gpaste-client

### Quick Launchers

Browser/web app shortcuts:
- `github`, `mistral`, `meet`, `gmail`, `gcal`, `datadog`, `linear`, `whatsapp`

### Note-Taking System

- `notetaker` - Interactive note creation in `~/notes/src/note-YYYY-MM-DD.md`
- `notepad`, `mostRecentNote` - Note utilities
- `buildNote` - Convert markdown notes to PDF using Pandoc

### System Utilities

- `monitors_layout` - Multi-monitor configuration
- `s` / `S` - Firefox web search (with/without "I'm feeling lucky")
- `pfetch` - System information display

## Neovim Plugin Development Patterns

When adding or modifying neovim plugins:

1. **Create/edit plugin file in `lua/plugins/`** following the category structure
2. **Use lazy.nvim format:**
   ```lua
   return {
     "author/plugin-name",
     event = "VeryLazy",  -- or appropriate lazy-loading trigger
     config = function()
       -- plugin setup
     end
   }
   ```
3. **Respect Bépo keybindings** - avoid using `h/j/k/l` for navigation
4. **Match color scheme** - integrate with base16-atelier-savanna where applicable
5. **Document keybindings** in comments within the plugin file

## Theme Customization

To change the color scheme across all applications:

1. **Neovim:** Update `lua/plugins/styling.lua` to use different base16 theme
2. **Tmux:** Modify `set -g @tinted-color` in `.tmux.conf`
3. **Wezterm:** Update `config.color_scheme` in `wezterm.lua`
4. **Starship:** Adjust colors in `starship.toml` if needed

## Common Development Patterns

### Adding a New Tool Configuration

1. Create directory at repository root: `mkdir newtool`
2. Inside, recreate home directory structure: `mkdir -p newtool/.config/newtool`
3. Add configuration files
4. Install with: `stow newtool`

### Adding Custom Scripts

1. Create script in `scripts/bin/scriptname`
2. Make executable: `chmod +x scripts/bin/scriptname`
3. Script will be in PATH after `stow scripts` (or if already stowed)

### Adding System-Wide Snippets

1. Create file in `snippets/` directory
2. For static text: just add content
3. For dynamic content: make executable and add script
4. Access via `Super+comma` in i3

### Session Management Workflow

1. Add new session to `sesh/.config/sesh/sesh.toml`
2. Include `name`, `path`, optional `startup_command`, `preview_command`
3. Access via `T` key in tmux

## Testing Configuration Changes

- **Neovim:** Restart nvim or `:source $MYVIMRC`
- **Tmux:** Prefix + `r` to reload (if binding exists) or restart tmux
- **Zsh:** `source ~/.zshrc`
- **i3:** `Super+Shift+r` to reload (check i3 config for exact binding)
- **Wezterm:** Usually auto-reloads on config change

## Requirements

Core dependencies (from README.md):
- stow
- neovim >= 0.6
- alacritty (alternate terminal)
- oh-my-zsh (legacy, now using Starship)
- powerlevel10k (p10k, fallback prompt)

Additional inferred dependencies:
- tmux with TPM (Tmux Plugin Manager)
- wezterm
- i3 window manager
- fzf, ripgrep (rg), eza, batcat, fdfind
- rofi, gpaste-client
- gh (GitHub CLI)
- Starship prompt
- sesh session manager

## Notes

- **Keyboard layout:** This setup assumes Bépo layout; keybindings may need adjustment for QWERTY/AZERTY
- **AI integration:** Neovim includes Copilot, Avante, and MCPHub - may require separate authentication/setup
- **Git workflow:** Extensive git aliases optimize for trunk-based development with main/master branch support
