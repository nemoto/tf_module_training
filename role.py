"""AWS role checker for tf_module_sample(Terraform sample)."""
from sys import stdout
from pathlib import Path
import subprocess
import argparse

tool_desc = "AWS role checker for tf_module_sample(Terraform sample)."
parser = argparse.ArgumentParser(description = tool_desc)
parser.add_argument("environment",
                    choices=["prd", "dev"],
                    help="environment [prd|dev].")
args = parser.parse_args()
env = args.environment


def get_role(env: str) -> None:
    """Extract AWS action required."""
    # get directry list which has main.tf
    tf_list = subprocess.run(["find", "./modules", "-name", "main.tf"],
                             capture_output=True,
                             check=True).stdout.decode().split("\n")
    tf_list.extend(subprocess.run(["find", f"./env/{env}", "-name", "main.tf"],
                                  capture_output=True,
                                  check=True).stdout.decode().split("\n"))

    # Extract AWS actions required from each module.
    roles = []
    pwd = Path.cwd()
    for pathes in tf_list:
        dir_name = Path(pathes).parent

        # remove NULL
        if (dir_name.name in {"", "."}):
            continue

        target_dir = pwd.joinpath(dir_name)
        pike_process = subprocess.Popen(["pike",
                                         "scan",
                                         "-d",
                                         f"{target_dir}"],
                                        stdout=subprocess.PIPE)
        role_tf = pike_process.communicate()[0].decode("utf-8")
        role_lines = role_tf.split("\n")
        action_area = False
        for each_line in role_lines:
            stripped_line = each_line.strip()
            if (stripped_line == '"Action": ['):
                action_area = True
                continue
            if (stripped_line == "],"):
                action_area = False
                break
            if (action_area is True):
                roles.append(stripped_line)

    # Remove duplicates without changing the order.
    return list(dict.fromkeys(roles))


if __name__ == "__main__":
    for role in get_role(env):
        stdout.write(f"{role}\n")
