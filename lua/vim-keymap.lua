-- local table for the functions
local K = {}

function K.setGeneralKeymap()
    -- my leader is SPACE
    vim.g.mapleader = " "

    -- moving highlighted block up and down
    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

    -- keep cursor in the middle when jumping or searching
    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")

    -- yank into system clipboard with leader y
    -- when working with wsl - requires win32yank to be installed on host
    vim.keymap.set("n", "<leader>y", '"+y')
    vim.keymap.set("v", "<leader>y", '"+y')
    vim.keymap.set("n", "<leader>Y", '"+Y')

    -- substitute word under cursor in whole file - BONKERS!
    vim.keymap.set(
        "n",
        "<leader>rw",
        [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
        { desc = "[R]eplace [W]ord, globally}" }
    )

    -- tabs managments
    vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext}" })
    vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]revious}" })
    vim.keymap.set("n", "<leader>tx", ":tab close<CR>", { desc = "[T]ab [C]lose}" })

    -- super fast macro
    vim.keymap.set("n", "<leader><Space>", "@q")
end

function K.setNeotreeKeymap()
    vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>")
end

function K.setTelescopeKeymap()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles}" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

    local themes = require("telescope.themes")
    vim.keymap.set("n", "<leader>sb", function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown({
            winblend = 10,
            previewer = false,
        }))
    end, { desc = "[/] Fuzzily search in current buffer" })
end

function K.setLspKeymap()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>=", function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end,
    })
end

return K
