import os
import argparse
import subprocess
try:
    from urllib.request import urlretrieve, urlopen
except ImportError:
    from urllib import urlretrieve, urlopen


URL_BASE = "https://raw.githubusercontent.com/aayushdutt/dotfiles/main"
INSTALL_SCRIPT_URL = f"{URL_BASE}/install.sh"

def _create_required_dirs(filepath: str) -> bool:
    directory, _filename = os.path.split(filepath)
    if directory:
        os.makedirs(directory, exist_ok=True)
    # create file if doesn't exist
    os.close(os.open(filepath, os.O_CREAT))

    # Check if the file has a non-zero size
    if os.path.getsize(filepath) > 0:
        print(
            f"Skipping download for {filepath}. File already exists and is not empty.")
        return True
    
    os.chmod(filepath, 0o644)
    return False


def _download(filepath: str):
    home_directory = os.path.expanduser('~')
    abspath = os.path.join(home_directory, filepath)

    already_exists = _create_required_dirs(abspath)
    if already_exists:
        return
    
    url = f'{URL_BASE}/{filepath}'
    print(f'Downloading ~/{filepath} from {url}')

    return urlretrieve(url, abspath)


def setup_dotfiles():
    """
    TODO:
    - Parallelize downloads
    - Add package installations
    - CLI options for OS and to only setup one of packages or dotfiles
    - Add flag to force overwrite if exists
    """
    print("Setting up dotfiles")
    dotfiles = [
        '.bash_aliases',
        '.bash_profile',
        '.tmux.conf',
        '.config/nvim/init.lua',
    ]
    for path in dotfiles:
        _download(path)


def install_packages():
    print("Installing Packages")
    # Fetch the installation script
    response = urlopen(INSTALL_SCRIPT_URL)
    script_content = response.read().decode('utf-8')
    print(script_content)

    # Execute the installation script
    subprocess.run(script_content, shell=True)


def main():
    parser = argparse.ArgumentParser(description="Setup a new environment",
                                    formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-i", "--install", action="store_true", help="Install packages")
    parser.add_argument("-d", "--dotfiles", action="store_true", help="Setup dotfiles")
    args = parser.parse_args()

    if args.dotfiles or (not args.install and not args.dotfiles):
        setup_dotfiles()
    if args.install:
        install_packages()


if __name__ == "__main__":
    main()
