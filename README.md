# Pre-requisites
- neovim
- neovim-remote
- fzf
- bat
- python

# Usage
Create a file called .env at the root of this project with the following contents:
```
LANGUAGE=haskell
EXT=hs
```

# Download new exercise and open on neovim
The following command downloads a new exercise and opens it in neovim using neovim-remote

```
make download && make new
```

Once tests are passing, submit using the following command
```
make submit
```

repeat 🤓
