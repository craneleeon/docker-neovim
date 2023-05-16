local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

gitsigns.setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        -- Remap keys for navigating gitsigns
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})
    end
}
