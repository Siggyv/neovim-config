## Neovim Config ##
This is my neovim config. 

init.lua - contains the initialization and importing of the lazy package manager. 

plugins/ - contains all the plugins I have added to my neovim. Each file name is the plugin I have used.

Plugins generally take the formatting of
```{lua}
return {
    'github repo',
    'added args',
    config = function()
        'code for this plugin, mappings etc',
        'auto runs the require("plugin").setup() line'
    end
}
```

To get the current list just `ls` the plugins directory or run `nvim` which will start the lazy package manager.
Can use `:Lazy` too.

`vim-opts.lua` includes basic configurations for the editor itself, such as spaces as tabs etc.
