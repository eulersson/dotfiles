# Dotfiles

Collection of configuration files.

| Tool                                      | Purpose                                                   |
| ----------------------------------------- | --------------------------------------------------------- |
| [Alacritty](https://alacritty.org/)       | Cross-platform terminal emulator.                         |
| [tmux](https://github.com/tmux/tmux/wiki) | Terminal multiplexer.                                     |
| [Zsh](https://zsh.org/)                   | Unix shell.                                               |
| [Starship](https://starship.rs/)          | Cross-shell prompt.                                       |
| [LazyVim](https://www.lazyvim.org/)       | Customizable Neovim setup.                                |
| [Raycast](https://www.raycast.com/)       | Productivity app (among best features is window manager). |

| Manager                                 | Purpose                     |
| --------------------------------------- | --------------------------- |
| [Antigen](https://antigen.sharats.me)   | Package manager for zsh.    |
| [tpm](https://antigen.sharats.me)       | Tmux plugin manager.        |
| [pyenv](https://github.com/pyenv/pyenv) | Python version management.  |
| [nvm](https://github.com/nvm-sh/nvm)    | Node.js version management. |

## Cheat Sheet

See the [CHEATSHEET.md](CHEATSHEET.md) document for most common commands and key strokes.

## Requirements

Install Homebrew (`brew`):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install brew packages (produce with `brew bundle dump --file=Brewfile`):

```sh
brew bundle --file=Brewfile
```

Find a description of all the casks and packages installed in:

- [brew/descr-formulae.txt](./brew/descr-formulae.txt)
  - (generate with `brew leaves | xargs brew desc --eval-all | tee descr-formulae.txt`)
- [brew/descr-casks.txt](./brew/descr-casks.txt)
  - (generated with `brew ls --casks | xargs brew desc --eval-all | tee descr-casks.txt`)

Install **JetBrainsMono Nerd Font** from [fonts/JetBrainsMono/fonts/ttf](fonts):

```sh
cp ./fonts/JetBrainsMono/fonts/ttf/*.ttf ~/Library/Fonts
```

## Tools

Some of the tools included in the brew file:

| Tool               | Purpose                                                                                                                 |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| anki               | Memory training application.                                                                                            |
| asciinema          | Record and share terminal sessions.                                                                                     |
| cloudflared        | Cloudflare local tunnel proxy.                                                                                          |
| dark-notify        | Watcher for macOS 10.14+ light/dark mode changes.                                                                       |
| difftastic         | Diff that understands syntax.                                                                                           |
| fzf                | Command-line fuzzy finder written in Go.                                                                                |
| get_iplayer        | Utility for downloading TV and radio programmes from BBC iPlayer.                                                       |
| glow               | Render markdown on the CLI.                                                                                             |
| grip               | Preview GitHub README.md files locally before committing them.                                                          |
| horcrux            | A program for splitting your files into encrypted fragments.                                                            |
| keycastr           | Open-source keystroke visualiser.                                                                                       |
| lazygit            | Simple terminal UI for git commands.                                                                                    |
| mas                | Mac App Store command-line interface.                                                                                   |
| mat2               | Metadata anonymization toolkit.                                                                                         |
| obsidian           | Private flexible note‑taking app that adapts to the way you think.                                                      |
| ocenaudio          | Audio editor.                                                                                                           |
| rancher            | Open-source multi-cluster orchestration platform.                                                                       |
| raycast            | Control your tools with a few keystrokes.                                                                               |
| ripgrep            | Search tool like grep and The Silver Searcher.                                                                          |
| virtualbox         | Virtualiser for x86 hardware.                                                                                           |
| visual-studio-code | Open-source code editor                                                                                                 |
| yt-dlp             | Feature-rich command-line audio/video downloader.                                                                       |
| ...                | Check [brew/descr-formulae.txt](./brew/descr-formulae.txt) and [brew/descr-casks.txt](./brew/descr-casks.txt) for more. |

## Installation

Clone the configurations at home:

```sh
cd ~
git clone git@github.com:eulersson/.dotfiles
```

Symlink the configuration folders:

```sh
cd ~

touch .env.secrets
chmod 600 .env.secrets

ln -s $HOME/.dotfiles/.markdownlint-cli2.yaml .

mkdir -p $HOME/.config
cd $HOME/.config

ln -s $HOME/.dotfiles/themes .
ln -s $HOME/.dotfiles/config/alacritty .
ln -s $HOME/.dotfiles/config/tmux .
ln -s $HOME/.dotfiles/config/lazygit .
ln -s $HOME/.dotfiles/config/nvim .

cd $HOME
ln -s .dotfiles/*.zsh* .
```

Install an agent that detects changes on dark-light macOS preference and update Alacritty theme.

```sh
./config/alacritty/create-launch-agent.sh
```

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm):

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now run `tmux` and install all the tpm plugins within `tmux` with: `⌃ + b, I`.

> [!IMPORTANT]  
> If you don't get the tokyonight.nvim theme in tmux, try opening tmux and
> toggle back and forth the Light-Dark mode in _System Settings > Appearance_,
> this will create the file that tmux looks for when loading the theme. You
> won't have to run it again.

### Raycast

- [Avoid Raycast key conflicts](https://manual.raycast.com/hotkey)
  - Disable hotkey for Spotlight
    - _System Preferences > Keyboard > Shortcuts > Spotlight_ and disable the
      keyboard shortcut.
  - Disable hotkey for language switching
    - _System Preferences > Keyboard > Shortcuts > Input Sources_ and disable
      or change the shortcut.
  - Ensure "Ask Siri" is not using the same shortcut
    - _System Preferences > Siri_ and set it to something else like pressing fn
      (Function) Space\_.
- [Exclude folders from search](https://manual.raycast.com/core)
- [Search Files](https://manual.raycast.com/troubleshooting/spotlight)
  - You can check that Raycast has access to your files and folders in _System
    Preferences > Security & Privacy > Privacy > Files and Folders_.
- [Set Hyper Key](https://manual.raycast.com/hyperkey) to be Caps Lock (⇪).
- Extensions:
  - [Apple Reminders](https://www.raycast.com/raycast/apple-reminders)
  - [Unicode Symbols Search](https://www.raycast.com/mmazzarolo/unicode-symbols)

### Zsh

Now make `zsh` your default shell as explained [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default):

```sh
chsh -s $(which zsh)
```

### Secrets

- Using `keepassxc-cli show -sa password ~/Documents/MySecrets.kdbx "/Internet/OpenAI ChatGPT.nvim API Key"`
- Using `gpg --encrypt` and `gpg --decrypt` on files that contain tokens
  - For `ChatGPT.nvim` to work it needs a `openai-api-token.txt.gpg` encrypted file in your home.

### pyenv

<https://github.com/pyenv/pyenv#installation>

Install the latest Python version and set it as default system-wide:

```sh
env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.12.2
pyenv global 3.12.2
pyenv virtualenv shell
pyenv global shell
```

Some tools I use with my shell have to be installed with pip:

```sh
pip install shell-gpt
```

### nvm

<https://github.com/nvm-sh/nvm#installing-and-updating>

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

### Visual Studio Code

<https://code.visualstudio.com/>

## Python Development

I usually install poetry on all `pyenv` distributions I have, otherwise if you install
poetry using the bash script they offer it will be tied to a particular python version.

It's useful to have the zsh completions:

```sh
mkdir -p ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry
```

For Python I use the [poetry](https://python-poetry.org/) for an organized way to manage
and resolve dependencies.

When installing packages with poetry it is all encapsulated in a virtual environment
managed by poetry.

```sh
❯ poetry env info

Virtualenv
Python:         3.11.5
Implementation: CPython
Path:           /Users/eulersson/Library/Caches/pypoetry/virtualenvs/sound-detector-oq1WgInS-py3.11
Executable:     /Users/eulersson/Library/Caches/pypoetry/virtualenvs/sound-detector-oq1WgInS-py3.11/bin/python
Valid:          True

System
Platform:   darwin
OS:         posix
Python:     3.11.5
Path:       /Users/eulersson/.pyenv/versions/3.11.5/Library/Frameworks/Python.framework/Versions/3.11
Executable: /Users/eulersson/.pyenv/versions/3.11.5/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11
```

To develop with `Neovim` having the Python LSP available these are the requirements:

- To have `pynvim` as a dev dependency in the poetry project `poetry add --dev pynvim`.
- To have a `pyrightconfig.json` pointing to the poetry virtualenv.

After having the information with `poetry env show` you can craft the
`pyrightconfig.json` at the root of the python project.

```json
{
  "venv": "sound-detector-oq1WgInS-py3.11",
  "venvPath": "/Users/eulersson/Library/Caches/pypoetry/virtualenvs"
}
```

You can now open up `Neovim`.

## C++ Development

Neovim's LSP for C++ uses a JSON file that has information on how to build the source
files. This file can be built using **Bear** (or if using CMake, then exporting
`CMAKE_EXPORT_COMPILE_COMMANDS`).

## Other macOS Applications

- [KodeLife](https://hexler.net/kodelife)
