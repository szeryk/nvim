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

    -- enclose word under cursor in parentheses
    vim.keymap.set("n", "<leader>ew(", "ciw()<Esc>P", { desc = "[E]nclose [W]ord with parentheses ()" })

    -- enclose word under cursor in brackets
    vim.keymap.set("n", "<leader>ew[", "ciw[]<Esc>P", { desc = "[E]nclose [W]ord with brackets []" })

    -- enclose word under cursor in braces
    vim.keymap.set("n", "<leader>ew{", "ciw{}<Esc>P", { desc = "[E]nclose [W]ord with braces {}" })

    -- enclose word under cursor in double quotes
    vim.keymap.set("n", '<leader>ew"', 'ciw""<Esc>P', { desc = '[E]nclose [W]ord with double quotes ""' })

    -- enclose word under cursor in single quotes
    vim.keymap.set("n", "<leader>ew'", "ciw''<Esc>P", { desc = "[E]nclose [W]ord with single quotes ''" })

    -- tabs managments
    vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext}" })
    vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]revious}" })
    vim.keymap.set("n", "<leader>tx", ":tab close<CR>", { desc = "[T]ab [C]lose}" })

    -- buffers managments
    vim.keymap.set("n", "<leader>bn", ":bn<CR>", { desc = "[B]uffer [N]ext}" })
    vim.keymap.set("n", "<leader>bp", ":bp<CR>", { desc = "[B]uffer [P]revious}" })

    -- super fast macro
    vim.keymap.set("n", "<leader><Space>", "@q")
end

function K.setNeotreeKeymap()
    vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>")
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

-- TODO: align this with prvious way of defining keymaps
K.copilot_chat_keys = {
    { "<leader>cc", ":CopilotChatToggle<CR>", mode = "n", desc = "Toggle CopilotChat main window" },
    {
        "<leader>cq",
        function()
            local input = vim.fn.input("Quick Chat: ")
            if input ~= "" then
                require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
            end
        end,
        mode = "n",
        desc = "CopilotChat - Quick chat",
    },
}

-- TODO: fix undefined global variable
K.snacks_keys = {
    -- picker keymaps
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "[S]earch [B]uffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch by [G]rep" },
    { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
    { "<leader>sh", function() Snacks.picker.lines() end, desc = "[S]earch [H]ere" }, -- kinad buggy?
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch [W]ord", mode = { "n", "x" } },
    { "<leader>sg", function() Snacks.picker.git_log() end, desc = "[S]earch [G]it" },

    -- other keymaps
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    -- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
}

K.snacks_toggles = function ()
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    -- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
    -- Snacks.toggle.treesitter():map("<leader>uT")
    -- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    -- Snacks.toggle.inlay_hints():map("<leader>uh")
    Snacks.toggle.indent():map("<leader>ug")
    -- Snacks.toggle.dim():map("<leader>uD")
end

return K
