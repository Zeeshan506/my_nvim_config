return {
	-- Plugin for enhanced % matching and other text object features
	"andymass/vim-matchup",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" } -- shows popup when match is offscreen
	end,
}
