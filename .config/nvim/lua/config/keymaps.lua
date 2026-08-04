-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

--
-- zk Keymaps
--
-- use which-key pluging to define keymaps
wk.add({

  -- define Zettelkasten group
  { "<leader>z", group = "Zettelkasten", icon = { icon = "🗒️", color = "yellow" } },

  -- create new notes with title
  { "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", mode = "n", desc = "New note with title" },

  -- search for notes
  { "<leader>sz", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Notes", icon = "🗒️" },
  { "<leader>zs", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Search note", icon = "🔎" },

  -- show tag list
  { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Show tags", icon = "🏷️" },
})
