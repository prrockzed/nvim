local status_ok, options = pcall(require, "mason")
if not status_ok then
	return
end

options.setup()
