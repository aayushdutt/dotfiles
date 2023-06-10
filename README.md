### Description
Script to effortlessly get up and running with your configs and packages in a new environment

### Usage

```sh
# Use any of these
curl -L aayushdutt.com/setup | python3

wget -qO- aayushdutt.com/setup | python3

wget -qO- https://raw.githubusercontent.com/aayushdutt/dotfiles/main/setup.py | python3 -

# -sSfLo- silent request, handle errors gracefully, follow redirects,
# write the output to stdout
curl -sSfLo- aayushdutt.com/setup | python3 -
```

### `setup.py` options

- Sets up dotfiles by default if no option is provided
- `-d`: Setup dotfiles 
- `-i`: Install packages

Example
```sh
curl -L aayushdutt.com/setup | python3 - -i # install only
curl -L aayushdutt.com/setup | python3 - -id # install and setup dotfiles
curl -L aayushdutt.com/setup | python3 # setup dotfiles
```

### Reusing this script

If you wish to reuse this script with your own domain and files, you can do so by updating the files and setting up a URL redirect.
For Cloudflare:
1. Setup Cloudflare on your domain so the traffic is proxied.
2. Add a redirect rule ([guide](https://developers.cloudflare.com/rules/url-forwarding/single-redirects/create-dashboard/))
   - `URI full - equals - https://aayushdutt.com/setup`