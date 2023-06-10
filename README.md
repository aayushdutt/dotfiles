## Usage

Use any of
```sh
wget -qO- aayushdutt.com/setup | python3 -

curl -L aayushdutt.com/setup | python3 -

wget -qO- https://raw.githubusercontent.com/aayushdutt/dotfiles/main/setup.py | python3 -

# -sSfLo- silent request, handle errors gracefully, follow redirects,
# write the output to stdout
curl -sSfLo- aayushdutt.com/setup | python3 -
```