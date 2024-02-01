vim.o.background = 'dark'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    transparent = false,
    bold = true,
    italic_comments = true,
    disable_nvimtree_bg = true,
    underline = true,
    undercurl = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    dim_inactive = false,
    transparent_mode = false,

    -- Override colors
    color_overrides = {
        vscLineNumber = '#73c991',
    },
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
require('vscode').load()
-- Default colors
-- {
--     vscNone = 'NONE',
--     vscFront = '#D4D4D4',
--     vscBack = '#1E1E1E',

--     vscTabCurrent = '#1E1E1E',
--     vscTabOther = '#2D2D2D',
--     vscTabOutside = '#252526',

--     vscLeftDark = '#252526',
--     vscLeftMid = '#373737',
--     vscLeftLight = '#636369',

--     vscPopupFront = '#BBBBBB',
--     vscPopupBack = '#272727',
--     vscPopupHighlightBlue = '#004b72',
--     vscPopupHighlightGray = '#343B41',

--     vscSplitLight = '#898989',
--     vscSplitDark = '#444444',
--     vscSplitThumb = '#424242',

--     vscCursorDarkDark = '#222222',
--     vscCursorDark = '#51504F',
--     vscCursorLight = '#AEAFAD',
--     vscSelection = '#264F78',
--     vscLineNumber = '#5A5A5A',

--     vscDiffRedDark = '#4B1818',
--     vscDiffRedLight = '#6F1313',
--     vscDiffRedLightLight = '#FB0101',
--     vscDiffGreenDark = '#373D29',
--     vscDiffGreenLight = '#4B5632',
--     vscSearchCurrent = '#515c6a',
--     vscSearch = '#613315',

--     vscGitAdded = '#81b88b',
--     vscGitModified = '#e2c08d',
--     vscGitDeleted = '#c74e39',
--     vscGitRenamed = '#73c991',
--     vscGitUntracked = '#73c991',
--     vscGitIgnored = '#8c8c8c',
--     vscGitStageModified = '#e2c08d',
--     vscGitStageDeleted = '#c74e39',
--     vscGitConflicting = '#e4676b',
--     vscGitSubmodule = '#8db9e2',

--     vscContext = '#404040',
--     vscContextCurrent = '#707070',

--     vscFoldBackground = '#202d39',

--     -- Syntax colors
--     vscGray = '#808080',
--     vscViolet = '#646695',
--     vscBlue = '#569CD6',
--     vscAccentBlue = '#4FC1FE',
--     vscDarkBlue = '#223E55',
--     vscMediumBlue = '#18a2fe',
--     vscLightBlue = '#9CDCFE',
--     vscGreen = '#6A9955',
--     vscBlueGreen = '#4EC9B0',
--     vscLightGreen = '#B5CEA8',
--     vscRed = '#F44747',
--     vscOrange = '#CE9178',
--     vscLightRed = '#D16969',
--     vscYellowOrange = '#D7BA7D',
--     vscYellow = '#DCDCAA',
--     vscDarkYellow = '#FFD602',
--     vscPink = '#C586C0',

--     -- Low contrast with default background
--     vscDimHighlight = '#51504F',
-- }
