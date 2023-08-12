vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	nested = true,
	command = "WatchForChangesAllFile!",
})
