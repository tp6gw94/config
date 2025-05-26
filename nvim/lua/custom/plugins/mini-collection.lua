return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup {
        mappings = {
          add = 'msa',
          delete = 'msd',
          replace = 'msr',
          find = '',
          find_left = '',
          highlight = '',
          update_n_lines = '',
          suffix_last = '',
          suffix_next = '',
        },
      }

      -- Auto pairs [] () {}
      require('mini.pairs').setup()

      local statusline = require 'mini.statusline'
      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local check_macro_recording = function()
              if vim.fn.reg_recording() ~= '' then
                return 'Recording @' .. vim.fn.reg_recording()
              else
                return ''
              end
            end

            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 40 }
            local diff = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location = MiniStatusline.section_location { trunc_width = 200 }
            local search = MiniStatusline.section_searchcount { trunc_width = 75 }
            local macro = check_macro_recording()

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFilename', strings = { macro } },
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },
      }

      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }

      require('mini.cursorword').setup()
    end,
  },
}
