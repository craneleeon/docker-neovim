local status, neosolarized = pcall(require, "neosolarized")
if (not status) then return end
function ColorMyPencils(color)
	color = color or "neosolarized"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
