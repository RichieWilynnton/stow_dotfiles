return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"stevearc/conform.nvim",
			"mfussenegger/nvim-lint",
		},
		config = function()
			-- 1. LSP
			local servers = {
				-- C++
				clangd = {
					on_attach = function(client)
						client.server_capabilities.documentFormattingProvider = false
					end,
				},
				-- Python
				pyright = {},
				hls = {
					filetypes = { "haskell", "lhaskell", "cabal" },
					settings = {
						haskell = { formattingProvider = "ormolu" },
					},
				},
				-- JavaScript/TypeScript
				vtsls = {
					settings = {
						javascript = { updateImportsOnRename = "always" },
						typescript = { updateImportsOnRename = "always" },
					},
				},
				-- HTML
				html = {
					filetypes = { "html", "templ", "javascriptreact", "typescriptreact" },
				},
				-- Lua
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
							telemetry = { enable = false },
						},
					},
				},
				-- Java
				jdtls = {
					cmd = { "jdtls" },
					filetypes = { "java" },
					root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "build.xml" },
					-- root_dir = require("jdtls.setup").find_root({ "gradlew", ".git", "pom.xml", "mvnw" }),
					settings = {
						java = {
							format = { enabled = true },
							saveActions = { organizeImports = true },
						},
					},
				},
			}

			-- 2. Formatters (conform)
			local formatters = {
				python = { "black" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
			}

			-- 3. Linters (nvim-lint)
			local linters = {
				-- Python handled by pyright
				-- C++ handled by clangd
				-- Lua handled by lua_ls
				-- JS / TS handled by vtsls
				html = { "htmlhint" },
			}

			-- 4. MASON & TOOL INSTALLATION
			require("mason").setup()

			-- Combine keys for auto-install
			local ensure_installed = vim.tbl_keys(servers)
			-- Add extra tools that aren't LSPs (like formatters/linters)
			vim.list_extend(ensure_installed, { "black", "stylua", "prettierd", "clang-format" })

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				automatic_installation = true,
			})
			require("mason-lspconfig").setup()

			-- 5. LSP SETUP
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for server, config in pairs(servers) do
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				-- This replaces the old .setup() call
				vim.lsp.config(server, config)
			end

			-- Tell Neovim to actually use these configs
			vim.lsp.enable(vim.tbl_keys(servers))

			-- 6. CONFORM SETUP
			require("conform").setup({
				formatters_by_ft = formatters,
			})

			-- 7. LINT SETUP
			local lint = require("lint")
			lint.linters_by_ft = linters
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
				callback = function()
					lint.try_lint()
				end,
			})

			-- 8. KEYMAPS
			vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set({ "n", "v" }, "<leader>lf", function()
				require("conform").format({ lsp_fallback = true, timeout_ms = 500 })
			end, { desc = "Format file" })
		end,
	},
}
