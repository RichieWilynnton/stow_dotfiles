local M = {}

--- @param low integer the lower value for this range
--- @param high integer the upper value for this range
--- @return integer
function M.rand_int(low, high)
	-- Use lua to generate random int, see also: https://stackoverflow.com/a/20157671/6064933
	math.randomseed(os.time())

	return math.random(low, high)
end

--- @param seq any[] the sequence to choose an element
function M.rand_element(seq)
	local idx = M.rand_int(1, #seq)

	return seq[idx]
end

local use_theme = function(name)
	local ok, err = pcall(vim.cmd.colorscheme, name)

	if not ok then
		vim.notify(string.format("Failed to load colorscheme %s, err: %s", name, err), vim.log.levels.WARN)

		vim.cmd.colorscheme("default")
	end
end

-- Colorscheme to its directory name mapping, because colorscheme repo name is not necessarily
-- the same as the colorscheme name itself.
M.colorscheme_conf = {
	gruvbox_material = function()
		-- foreground option can be material, mix, or original
		vim.g.gruvbox_material_foreground = "original"
		--background option can be hard, medium, soft
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_better_performance = 1

		use_theme("gruvbox")
	end,
	nightfox = function()
		use_theme("duskfox")
	end,
	-- onedarkpro = function()
	-- 	-- set colorscheme after options
	-- 	-- onedark_vivid does not enough contrast
	-- 	use_theme("onedark_dark")
	-- end,
	-- material = function()
	-- 	vim.g.material_style = "darker"
	--
	-- 	local material = require("material")
	-- 	material.setup({
	-- 		custom_highlights = {
	-- 			Pmenu = { bg = "None", fg = "LightGreen" },
	-- 		},
	-- 	})
	-- 	use_theme("material")
	-- end,
	-- arctic = function()
	-- 	use_theme("arctic")
	-- end,
	-- kanagawa = function()
	-- 	use_theme("kanagawa-dragon")
	-- end,
	-- modus = function()
	-- 	use_theme("modus")
	-- end,
	-- jellybeans = function()
	-- 	use_theme("jellybeans")
	-- end,
	-- github = function()
	-- 	use_theme("github_dark_default")
	-- end,
	-- ashen = function()
	-- 	use_theme("ashen")
	-- end,
	-- melange = function()
	-- 	use_theme("melange")
	-- end,
	-- makurai = function()
	-- 	use_theme("makurai_dark")
	-- end,
	-- vague = function()
	-- 	use_theme("vague")
	-- end,
	-- kanso = function()
	-- 	use_theme("kanso")
	-- end,
	-- citruszest = function()
	-- 	use_theme("citruszest")
	-- end,
	-- oxocarbon = function()
	-- 	use_theme("oxocarbon")
	-- end,
	-- ember = function()
	-- 	use_theme("ember")
	-- end,
	-- lake_dweller = function()
	-- 	require("lake-dweller").setup({
	-- 		-- "lake-dweller", "pond-dweller", or "ocean-dweller"
	-- 		variant = "lake-dweller",
	-- 	})
	-- 	use_theme("lake-dweller")
	-- end,
	-- alabaster = function()
	-- 	use_theme("alabaster")
	-- end,
	-- thorn = function()
	-- 	use_theme("thorn")
	-- end,
}

--- Use a random colorscheme from the pre-defined list of colorschemes.
M.rand_colorscheme = function()
	local colorscheme_names = vim.tbl_keys(M.colorscheme_conf)
	local colorscheme = M.rand_element(colorscheme_names)

	local color_scheme_loader = M.colorscheme_conf[colorscheme]

	color_scheme_loader()

	return colorscheme
end

M.rand_colorscheme()
-- call the func directly from the map if you want to use a specific colorscheme, e.g.: M.colorscheme_conf["gruvbox_material"]()

return M
