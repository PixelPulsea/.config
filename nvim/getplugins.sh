#!/bin/sh

plenary="https://github.com/nvim-lua/plenary.nvim"
treesit="https://github.com/nvim-treesitter/nvim-treesitter"
orgmode="https://github.com/nvim-orgmode/orgmode.git"
oil="https://github.com/stevearc/oil.nvim"
rosepine="https://github.com/rose-pine/neovim"
telescope="https://github.com/nvim-telescope/telescope.nvim"
harpoon="-b harpoon2 https://github.com/theprimeagen/harpoon"

if   [ ! -d "pack/my-plugins/start/treesit" ]; then
    git clone $treesit pack/my-plugins/start/treesit
fi

if [ ! -d "pack/my-plugins/start/orgmode" ]; then
    git clone $orgmode pack/my-plugins/start/orgmode
fi

if [ ! -d "pack/my-plugins/start/oil" ]; then
    git clone $oil pack/my-plugins/start/oil
fi

if [ ! -d "pack/my-plugins/start/rosepine" ]; then
    git clone $rosepine pack/my-plugins/start/rosepine
fi

if [ ! -d "pack/my-plugins/start/telescope" ]; then
    git clone $telescope pack/my-plugins/start/telescope
fi

if [ ! -d "pack/my-plugins/start/harpoon" ]; then
    git clone $harpoon pack/my-plugins/start/harpoon
fi

if [ ! -d "pack/my-plugins/start/plenary" ]; then
    git clone $plenary pack/my-plugins/start/plenary
fi

echo "Plugins are installed!"
