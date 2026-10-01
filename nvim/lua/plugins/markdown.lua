return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      -- Keep Markdown support, but do not report markdownlint diagnostics.
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = nil
      opts.linters_by_ft["markdown.mdx"] = nil
    end,
  },
}
