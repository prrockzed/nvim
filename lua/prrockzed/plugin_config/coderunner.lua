local status_ok, options = pcall(require, "code_runner")
if not status_ok then
	return
end

options.setup({
	filetype = {
		cpp = {
			"cd $dir &&",
			"g++ -std=c++20 $fileName",
			"-o $fileNameWithoutExt &&",
			"$dir/$fileNameWithoutExt",
		},
		go = { "cd $dir &&", "go run $fileName &&" },
	},
})
