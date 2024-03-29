"""Create Interface Document as README.md for each Modules."""

from sys import stdout
from pathlib import Path
import subprocess


def create_readme() -> None:
    """Create README.md for each module."""
    tf_list = subprocess.run(["find", "./modules", "-name", "main.tf"],
                             capture_output=True,
                             check=True).stdout.decode().split("\n")

    pwd = Path.cwd()
    for pathes in tf_list:
        dir_name = Path(pathes).parent

        if (dir_name.name == "" or dir_name.name == "."):
            # remove NULL
            continue

        target_dir = pwd.joinpath(dir_name)
        target_md = target_dir.joinpath("README.md")
        markdown_process = subprocess.Popen(["terraform-docs",
                                             "markdown",
                                             f"{target_dir}"],
                                            stdout=subprocess.PIPE)

        with Path(f"{target_md}").open("w") as fp:
            fp.write(markdown_process.communicate()[0].decode("utf-8"))
            stdout.write(f"Create: {target_md}\n")


if __name__ == "__main__":
    create_readme()
