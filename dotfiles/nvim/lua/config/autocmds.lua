vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "help" then
      vim.cmd("wincmd L")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local wins = vim.api.nvim_list_wins()
        local non_neotree = vim.tbl_filter(function(w)
            local buf = vim.api.nvim_win_get_buf(w)
            local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
            return ft ~= "neo-tree"
        end, wins)
        if #non_neotree == 0 then
            vim.cmd("quit")
        end
    end,
})
