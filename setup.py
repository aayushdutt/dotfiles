import os
try:
    from urllib.request import urlretrieve
except ImportError:
    from urllib import urlretrieve


URL_BASE="https://raw.githubusercontent.com/aayushdutt/dotfiles/main"

def download(filepath: str):
  directory, _filename = os.path.split(filepath)
  if directory:
    os.makedirs(directory, exist_ok=True)

  # Check if the file already exists and has a non-zero size
  if os.path.isfile(filepath) and os.path.getsize(filepath) > 0:
      print(f"Skipping download for {filepath}. File already exists and is not empty.")
      return

  return urlretrieve(f'{URL_BASE}/{filepath}', f'~/{filepath}')

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