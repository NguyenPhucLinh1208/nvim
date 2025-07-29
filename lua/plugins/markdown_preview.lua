return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}