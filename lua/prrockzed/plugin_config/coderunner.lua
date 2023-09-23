local status_ok, options = pcall(require, "code_runner")
if not status_ok then
	return
end

options.setup({
	filetype = {
		go = { "cd $dir &&", "go run $fileName &&" },
	},
})
