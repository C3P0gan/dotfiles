-- markdown-preview.nvim configuration in Lua

-- open preview window automatically when entering Markdown buffer
vim.g.mkdp_auto_start = 0

-- auto close preview when leaving Markdown buffer
vim.g.mkdp_auto_close = 1

-- refresh only on save or leaving insert mode
vim.g.mkdp_refresh_slow = 0

-- allow MarkdownPreview command for all filetypes
vim.g.mkdp_command_for_global = 0

-- make preview server available to others in the network
vim.g.mkdp_open_to_the_world = 0

-- custom IP to open preview page (useful for remote setups)
vim.g.mkdp_open_ip = ''

-- specify browser to open preview page
vim.g.mkdp_browser = ''

-- echo preview URL when opening preview page
vim.g.mkdp_echo_preview_url = 0

-- custom function name to open preview page
vim.g.mkdp_browserfunc = ''

-- rendering options
vim.g.mkdp_preview_options = {
  mkit = {},
  katex = {},
  uml = {},
  maid = {},
  disable_sync_scroll = 0,
  sync_scroll_type = 'middle', -- 'middle', 'top', or 'relative'
  hide_yaml_meta = 1,
  sequence_diagrams = {},
  flowchart_diagrams = {},
  content_editable = false,
  disable_filename = 0,
  toc = {}
}

-- custom markdown CSS (absolute path)
vim.g.mkdp_markdown_css = ''

-- custom highlight CSS (absolute path)
vim.g.mkdp_highlight_css = ''

-- custom port (empty for random)
vim.g.mkdp_port = ''

-- preview page title
vim.g.mkdp_page_title = '「${name}」'

-- custom path for images
vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- recognized filetypes
vim.g.mkdp_filetypes = { 'markdown' }

-- default theme (dark or light)
vim.g.mkdp_theme = 'dark'

-- combine preview window (reuse existing)
vim.g.mkdp_combine_preview = 0

-- auto refresh combined preview content
vim.g.mkdp_combine_preview_auto_refresh = 1
