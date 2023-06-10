import os
try:
    from urllib.request import urlretrieve
except ImportError:
    from urllib import urlretrieve


URL_BASE = "https://raw.githubusercontent.com/aayushdutt/dotfiles/main"


def create_required_dirs(filepath: str) -> bool:
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


def download(filepath: str):
    home_directory = os.path.expanduser('~')
    abspath = os.path.join(home_directory, filepath)

    already_exists = create_required_dirs(abspath)
    if already_exists:
        return
    
    url = f'{URL_BASE}/{filepath}'
    print(f'Downloading ~/{filepath} from {url}')

    return urlretrieve(url, abspath)


def setup():
    """
    TODO:
    - Parallelize downloads
    - Add package installations
    - CLI options for OS and to only setup one of packages or dotfiles
    - Add flag to force overwrite if exists
    """
    dotfiles = [
        '.bash_aliases',
        '.bash_profile',
        '.tmux.conf',
        '.config/nvim/init.lua',
    ]
    for path in dotfiles:
        download(path)

if __name__ == "__main__":
    setup()
