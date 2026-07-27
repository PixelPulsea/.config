#!/bin/sh

HOME="/home/achka"
cnt=0
plenary="https://github.com/nvim-lua/plenary.nvim"
treesit="https://github.com/nvim-treesitter/nvim-treesitter"
orgmode="https://github.com/nvim-orgmode/orgmode.git"
oil="https://github.com/stevearc/oil.nvim"
rosepine="https://github.com/rose-pine/neovim"
telescope="https://github.com/nvim-telescope/telescope.nvim"
harpoon="-b harpoon2 https://github.com/theprimeagen/harpoon"

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/treesit" ]; then
    git clone $treesit $HOME/.config/nvim/pack/my-plugins/start/treesit
else
    cnt=$((cnt+1))
fi

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/orgmode" ]; then
    git clone $orgmode $HOME/.config/nvim/pack/my-plugins/start/orgmode
else
    cnt=$((cnt+1))
fi

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/oil" ]; then
    git clone $oil $HOME/.config/nvim/pack/my-plugins/start/oil
else
    cnt=$((cnt+1))
fi

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/rosepine" ]; then
    git clone $rosepine $HOME/.config/nvim/pack/my-plugins/start/rosepine
else
    cnt=$((cnt+1))
fi

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/telescope" ]; then
    git clone $telescope $HOME/.config/nvim/pack/my-plugins/start/telescope
else
    cnt=$((cnt+1))
fi

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/harpoon" ]; then
    git clone $harpoon $HOME/.config/nvim/pack/my-plugins/start/harpoon
else
    cnt=$((cnt+1))
fi

if [ ! -d "$HOME/.config/nvim/pack/my-plugins/start/plenary" ]; then
    git clone $plenary $HOME/.config/nvim/pack/my-plugins/start/plenary
else
    cnt=$((cnt+1))
fi
