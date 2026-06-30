return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true,
                }
            end

            -- Default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Remove unwanted mappings
            vim.keymap.del("n", "<C-k>", { buffer = bufnr }) -- Let tmux-navigation handle it
            vim.keymap.del("n", "<C-x>", { buffer = bufnr }) -- Remove original horizontal split mapping

            vim.keymap.set("n", "<leader>h", api.node.open.horizontal, opts("Open: Horizontal Split"))
            vim.keymap.set("n", "<leader>v", api.node.open.vertical, opts("Open: Vertical Split"))
            vim.keymap.set("n", "<leader>t", api.node.open.tab, opts("Open: New Tab"))
        end
        nvimtree.setup({
            view = { width = 35, relativenumber = true },
            on_attach = my_on_attach,
        })

        -- Global toggle keymaps
        vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        vim.keymap.set("n", "<leader>pc", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus current file" })
    end,
}
