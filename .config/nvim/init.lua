--- Options
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 3
vim.opt.smartindent    = true
vim.opt.mouse          = "a"
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.hlsearch       = false
vim.g.mapleader        = ","
vim.opt.syntax         = "enable"
vim.opt.termguicolors  = true
vim.opt.background     = "dark"
vim.cmd("colorscheme slate")

--- Plugins: VimPlug
-- local Plug = vim.fn['plug#']
-- vim.call("plug#begin")
-- Plug("tpope/vim-repeat")
-- Plug("sheerun/vim-polyglot")
-- Plug("bkad/CamelCaseMotion")
-- Plug("junegunn/vim-easy-align")
-- Plug("kana/vim-textobj-user")
-- Plug("kana/vim-textobj-entire")
-- Plug("kana/vim-textobj-line")
-- Plug("michaeljsmith/vim-indent-object")
-- Plug("vim-scripts/ReplaceWithRegister")
-- Plug("wellle/targets.vim")
-- vim.call("plug#end")


--# Vscode: Folding
function Vscode_toggle_fold() vim.fn.VSCodeNotify("editor.toggleFold") end
function Vscode_goto_parent_fold() vim.fn.VSCodeNotify("editor.gotoParentFold") end
function Vscode_next_folding_section() vim.fn.VSCodeNotify("editor.gotoNextFold") end
function Vscode_prev_folding_section() vim.fn.VSCodeNotify("editor.gotoPreviousFold") end

--# Vscode: All remaps
function Vscode_toggle_typewriter() vim.fn.VSCodeNotify("toggleTypewriter") end

--# Vscode: Normal remaps
function Vscode_trim_left() vim.fn.VSCodeNotify("yo1dog.cursor-trim.lTrimCursor") end
function Vscode_trim_right() vim.fn.VSCodeNotify("yo1dog.cursor-trim.rTrimCursor") end
function Vscode_trim_both() vim.fn.VSCodeNotify("yo1dog.cursor-trim.trimCursor") end
function Vscode_reveal_definition_aside() vim.fn.VSCodeNotify("editor.action.revealDefinitionAside") end
function Vscode_toggle_sticky_scroll() vim.fn.VSCodeNotify("editor.action.toggleStickyScroll") end
function Vscode_trim_trailing_whitespace() vim.fn.VSCodeNotify("editor.action.trimTrailingWhitespace") end
function Vscode_open_link() vim.fn.VSCodeNotify("editor.action.openLink") end
function Vscode_outdent()
---@diagnostic disable-next-line: unused-local
    for i = 1, vim.v.count1 do
        vim.fn.VSCodeNotify("editor.action.outdentLines")
    end
end
function Vscode_indent()
---@diagnostic disable-next-line: unused-local
    for i = 1, vim.v.count1 do
        vim.fn.VSCodeNotify("editor.action.indentLines")
    end
end
function Vscode_comment() vim.fn.VSCodeNotify("editor.action.commentLine") end
function Vscode_reindent() vim.fn.VSCodeNotify("editor.action.reindentlines") end
function Vscode_convert_to_spaces() vim.fn.VSCodeNotify("editor.action.indentationToSpaces") end
function Vscode_convert_to_tabs() vim.fn.VSCodeNotify("editor.action.indentationToTabs") end
function Vscode_indent_with_spaces() vim.fn.VSCodeNotify("editor.action.indentUsingSpaces") end
function Vscode_indent_with_tabs() vim.fn.VSCodeNotify("editor.action.indentUsingTabs") end
function Vscode_change_encoding() vim.fn.VSCodeNotify("workbench.action.editor.changeEncoding") end
function Vscode_previous_window_tab() vim.fn.VSCodeNotify("workbench.action.previousEditor") end
function Vscode_next_window_tab() vim.fn.VSCodeNotify("workbench.action.nextEditor") end
function Vscode_rename_symbol() vim.fn.VSCodeNotify("editor.action.rename") end
function Vscode_format_document()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
    Vscode_trim_trailing_whitespace()
end

--# Vscode: Visual remaps
function Vscode_vis_codesnap() vim.fn.VSCodeNotifyVisual("codesnap.start", true) end
function Vscode_vis_outdent() vim.fn.VSCodeNotifyVisual("editor.action.outdentLines", false) end
function Vscode_vis_indent() vim.fn.VSCodeNotifyVisual("editor.action.indentLines", false) end
function Vscode_vis_comment() vim.fn.VSCodeNotifyVisual("editor.action.commentLine", false) end
function Vscode_vis_reindent() vim.fn.VSCodeNotifyVisual("editor.action.reindentselectedlines", true) end

--- Vscode
if vim.g.vscode then

    --# Vscode: All remaps
    vim.keymap.set("", "zy", Vscode_toggle_typewriter)
    vim.keymap.set("", "zp", Vscode_goto_parent_fold)
    vim.keymap.set("", "]f", Vscode_next_folding_section)
    vim.keymap.set("", "[f", Vscode_prev_folding_section)

    --# Vscode: Normal remaps
    vim.keymap.set("n", "gD",        Vscode_reveal_definition_aside)
    vim.keymap.set("n", "<leader>s", Vscode_toggle_sticky_scroll)
    vim.keymap.set("n", "<leader>r", Vscode_rename_symbol)
    vim.keymap.set("n", "==",        Vscode_trim_trailing_whitespace)
    vim.keymap.set("n", "gl",        Vscode_open_link)
    vim.keymap.set("n", "<<",        Vscode_outdent)
    vim.keymap.set("n", ">>",        Vscode_indent)
    vim.keymap.set("n", "gcc",       Vscode_comment)
    vim.keymap.set("n", "=>",        Vscode_reindent)
    vim.keymap.set("n", "=s",        Vscode_convert_to_spaces)
    vim.keymap.set("n", "=t",        Vscode_convert_to_tabs)
    vim.keymap.set("n", "za",        Vscode_toggle_fold)
    vim.keymap.set("n", "=ie",       Vscode_format_document)
    vim.keymap.set("n", "K",         Vscode_previous_window_tab)
    vim.keymap.set("n", "J",         Vscode_next_window_tab)

    --# Vscode: Visual remaps
    vim.keymap.set("v", "gs", Vscode_vis_codesnap)
    vim.keymap.set("v", "<",  Vscode_vis_outdent)
    vim.keymap.set("v", ">",  Vscode_vis_indent)
    vim.keymap.set("v", "gc", Vscode_vis_comment)

else
-- TODO (aayush) uncomment this
--    vim.keymap.set("!", "<C-v>", "<C-r><C-p>+")

end


print("nvim loaded")
