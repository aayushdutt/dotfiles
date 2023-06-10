### Description
Oneliner to effortlessly get up and running with your configs and packages in a new environment

### Usage

```sh
# Use any of these
# -sL silent request, follow redirects
curl -sL aayushdutt.com/setup | python3

# or using wget
wget -qO- aayushdutt.com/setup | python3

# or using GitHub's URL
wget -qO- https://raw.githubusercontent.com/aayushdutt/dotfiles/main/setup.py | python3 -

```

### `setup.py` options

- Sets up dotfiles by default if no option is provided
- `-h` or `--help`: Display help
- `-d` or `--dotfiles`: Setup dotfiles 
- `-i` or `--install`: Install packages

Example:
```sh
curl -sL aayushdutt.com/setup | python3 - -h # show help
curl -sL aayushdutt.com/setup | python3 - -i # install only
curl -sL aayushdutt.com/setup | python3 - -id # install and setup dotfiles
curl -sL aayushdutt.com/setup | python3 # setup dotfiles
```
### Using with your own files

If you wish to reuse this script with your own domain and files, you can do so by updating the dotfiles and the `install.sh`. 

Setting up a domain redirect is optional, you can just use the GitHub URL `https://raw.githubusercontent.com/<username>/dotfiles/main/setup.py`, but makes it much easier to quickly type when needed.

URL Redirect for Cloudflare:
1. Setup Cloudflare on your domain so the traffic is proxied.
2. Add a redirect rule ([guide](https://developers.cloudflare.com/rules/url-forwarding/single-redirects/create-dashboard/))
   - `URI full - equals - https://aayushdutt.com/setup`

### Using with Git Bash in Windows

This script also works in Windows with Git Bash when python is installed. You may need to use `python` instead of `python3`
```sh
curl -sL aayushdutt.com/setup | python
```

