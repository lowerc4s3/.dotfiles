local alpha = require("alpha")

local ascii = {
   "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
   "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
   "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
   "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
   "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
   "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
   "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
   " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
   " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
   "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
   "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
}

local header = {
    type = "text",
    val = ascii,
    opts = {
        position = "center",
        hl = "Comment",
   },
}

local footer = {
    type = "text",
    val = "Учи уроки дебил",
    opts = {
        position = "center",
        hl = "Comment",
    },
}

local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        cursor = 5,
        width = 36,
        align_shortcut = "right",
        hl = "Comment",
        -- hl_shortcut = "Keyword"
        hl_shortcut = "CursorLine"
    }

    if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
        type = "button",
        val = txt,
        on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button(" n ", "  New File  ", ":enew<CR>"),
        button(" f ", "  Find File  ", ":Telescope find_files<CR>"),
        button(" r ", "  Recent Files  ", ":Telescope oldfiles<CR>"),
        button(" p ", "  Open Project  ", ":Telescope projects<CR>"),
        button(" d ", "  Open directory  ", ":Telescope file_browser<CR>"),
        button(" l ", "  Load last session  ", ":lua require('persistence').load({ last = true })<CR>"),
        button(" q ", "  Quit  ", ":qa!<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = header,
    buttons = buttons,
    footer = footer,
}

alpha.setup {
    layout = {
        { type = "padding", val = 3 },
        section.header,
        { type = "padding", val = 3 },
        section.buttons,
        -- { type = "padding", val = 3 },
        -- section.footer,
    },
    opts = {},
}

vim.api.nvim_create_augroup("alpha_tabline", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "alpha_tabline",
    pattern = "AlphaReady",
    command = "set showtabline=0 laststatus=0"
})
vim.api.nvim_create_autocmd("User", {
    group = "alpha_tabline",
    pattern = "AlphaClosed",
    command = "set showtabline=2 laststatus=3"
})
