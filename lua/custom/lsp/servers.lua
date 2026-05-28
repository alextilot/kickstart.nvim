return {
  pyright = {},
  ts_ls = {},
  graphql = {},
  svelte = {},
  astro = {},
  templ = {
    filetypes = { 'html', 'templ' },
  },
  html = {
    filetypes = { 'html', 'templ' },
  },
  tailwindcss = {
    filetypes = { 'templ', 'astro', 'javascript', 'typescript', 'react' },
    settings = {
      tailwindCSS = {
        includeLanguages = {
          templ = 'html',
        },
      },
    },
  },
}
