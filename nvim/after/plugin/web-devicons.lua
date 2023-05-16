local status, devicons = pcall(require, "nvim-web-devicons")
if (not status) then return end

devicons.setup {
    override = {
        html = {
            icon = "",
            color = "#DE8C92",
            name = "html"
        }
    },
    default = true
}
