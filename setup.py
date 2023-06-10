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
    1. Parallelize downloads
    2. Add package installations
    3. CLI options for OS and to only setup one of packages or dotfiles
    """
    download('.bash_aliases')
    download('.bash_profile')
    download('.tmux.conf')
    download('.config/nvim/init.lua')


if __name__ == "__main__":
    setup()
