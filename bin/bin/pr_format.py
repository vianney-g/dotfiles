#!/home/vianney/.pr_format/bin/python
"""
Transform json output of
`gh pr list --json number,title,headRefName,author`
into fzf input

e.g:
    create a alias or function in your shell conf to quickly checkout a pr
    `gh pr list --json number,title,headRefName,author --limit 500 | pr_format.py | fzf | cut -f1 -d" " | xargs gh pr checkout`
"""
import json
import sys

from rich.console import Console
from rich.table import Table


def main():
    console = Console()
    table = Table(
        show_header=False,
        show_edge=False,
        expand=True,
        pad_edge=False,
        box=None,
    )
    table.add_column("Number", no_wrap=True, min_width=5)
    table.add_column("title", no_wrap=True)
    table.add_column("author")
    table.add_column("branch")
    prs = json.load(sys.stdin)
    for pr in prs:
        table.add_row(
            str(pr["number"]),
            pr["title"],
            pr["author"]["login"],
            pr["headRefName"],
        )

    console.print(table)


if __name__ == "__main__":
    main()
