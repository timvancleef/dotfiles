-- NVIM
-- https://martinlwx.github.io/en/config-neovim-from-scratch/
-- https://learnxinyminutes.com/docs/lua/
-- https://neovim.io/doc/user/lua-guide.html#lua-guide
-- https://github.com/ThePrimeagen/init.lua

--
-- Tab
--
vim.g.mapleader = ' '    -- Space as leader key for keymaps
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.smarttab = true

--
-- UI config
--
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right

--
-- Searching
--
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

--
-- Folding
--
vim.g.markdown_folding = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 1
vim.opt.foldcolumn = "auto:9"

--
-- Netrw
--
vim.g.netrw_liststyle = 3

--
-- Backups and undo
--
vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 250
--vim.opt.timeoutlen = 300
vim.opt.colorcolumn = "80"

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

vim.opt.wildmenu = true
-- vim.opt.wildoptions = 'pum'
vim.opt.wildmode = 'longest:full,full'

--
-- Key Mappings
--
local opts = {
    noremap = true, -- non-recursive
    silent = false, -- do not show message
}

-- Fast save
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)

-- Fast quit
vim.keymap.set('n', '<leader>q', ':q<CR>', opts)

-- Search
vim.keymap.set('n', '-', '/', opts)

-- Split pane navigation
vim.keymap.set('n', '<leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<leader>l', '<C-w>l', opts)

-- Resize (by 2 lines)
vim.keymap.set('n', '<leader>i', ':resize -4<CR>', opts)
vim.keymap.set('n', '<leader>u', ':resize +4<CR>', opts)
vim.keymap.set('n', '<leader>z', ':vertical resize -4<CR>', opts)
vim.keymap.set('n', '<leader>o', ':vertical resize +4<CR>', opts)

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep cursor in the middle of the page when browsing and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Paste and delete into void (do not replace yank buffer)
vim.keymap.set("x", "<leader>p", [["_dP]], opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/cgI<Left><Left><Left><Left>]], opts)

-- Open file explorer
vim.keymap.set("n", "<C-n>", ":NnnPicker %:p:h<CR>", opts)
--nnoremap <leader>dd :Lexplore %:p:h<CR>
--nnoremap <Leader>da :Lexplore<CR>

-- Highlight yanked text
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

--
-- Plugins
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

--
-- Telescope
--
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

require('telescope').setup({
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').git_files, { desc = '[F]ile [O]pen' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fc', function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) end,
        { desc = '[F]ind files in [C]urrent directory' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind [W]ord under cursor' })
vim.keymap.set('v', '<space>fw', function()
	local text = vim.getVisualSelection()
	require('telescope.builtin').live_grep({ default_text = text })
end, opts)


--
-- LSP
--
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "tsserver", "html", "cssls", "volar" },
}
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.lua_ls.setup {}
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.volar.setup {}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('i', '<c-space>', vim.lsp.omnifunc, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gf', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>ci', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>cn', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        --  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    end,
})
