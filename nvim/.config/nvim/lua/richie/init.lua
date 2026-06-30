vim.g.mapleader = " "
vim.g.maplocalleader = " c"

require("richie.lazy_init")
-- All bindings in lazy directory override the ones defined in /lazy
require("richie.remap-keys")
require("richie.theme")
require("richie.text-settings")
require("richie.error-check")

