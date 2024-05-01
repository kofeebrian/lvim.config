-- Key mappings [view all the defaults by pressing <leader>Lk]
--------------------------------------------------------------
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Navigate Opened Tabs
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- Behave Vim
lvim.keys.normal_mode["Y"] = "y$"

-- Keep it center
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- Undo break points
lvim.keys.insert_mode["."] = ".<C-g>u"
lvim.keys.insert_mode[","] = ",<C-g>u"
lvim.keys.insert_mode["!"] = "!<C-g>u"
lvim.keys.insert_mode["?"] = "?<C-g>u"
lvim.keys.insert_mode["["] = "[<C-g>u"

lvim.keys.normal_mode["gR"] = ":Telescope lsp_references<CR>"

-- Visual mode indent
lvim.keys.visual_mode["<Tab>"] = ">gv"
lvim.keys.visual_mode["<S-Tab>"] = "<gv"
