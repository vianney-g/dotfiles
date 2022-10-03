#!/home/vianney/.pr_format/bin/python
"""
Transform json output of
gh pr list --json number,title,headRefName,author
into fzf input
"""
import json
import sys

from rich import box
from rich.console import Console
from rich.table import Table


def main():
    console = Console()
    table = Table(
        show_header=False,
        show_edge=False,
        expand=False,
        pad_edge=False,
        box=box.SIMPLE,
    )
    table.add_column("Number", no_wrap=True, min_width=7)
    table.add_column("title", no_wrap=True)
    table.add_column("author", no_wrap=True)
    table.add_column("branch", no_wrap=True)
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
