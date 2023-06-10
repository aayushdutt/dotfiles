## Usage

Use any of
```sh
wget -qO- aayushdutt.com/setup | python3

curl -sLo- aayushdutt.com/setup | python3

wget -qO- https://raw.githubusercontent.com/aayushdutt/dotfiles/main/setup.py | python3

# -sSfLo- performs a silent request, follows redirects, handles errors gracefully, and writes the output to stdout
curl -sSfLo- aayushdutt.com/setup | python3
```