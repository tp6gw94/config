-- Set commentstring based on current syntax context
local ts_utils = require('nvim-treesitter.ts_utils')

-- Function to get the current syntax context
local function get_vue_commentstring()
  local node = ts_utils.get_node_at_cursor()
  
  while node do
    local node_type = node:type()
    
    -- Template section
    if node_type == "template_element" or node_type == "element" or node_type == "start_tag" or node_type == "end_tag" then
      return "<!-- %s -->"
    end
    
    -- Script section  
    if node_type == "script_element" then
      return "// %s"
    end
    
    -- Style section
    if node_type == "style_element" then
      return "/* %s */"
    end
    
    node = node:parent()
  end
  
  -- Default to HTML comment for Vue files
  return "<!-- %s -->"
end

-- Set initial commentstring
vim.bo.commentstring = "<!-- %s -->"

-- Create autocmd to update commentstring when cursor moves
local group = vim.api.nvim_create_augroup("VueCommentString", { clear = true })

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  group = group,
  buffer = 0,
  callback = function()
    local ok, commentstring = pcall(get_vue_commentstring)
    if ok and commentstring then
      vim.bo.commentstring = commentstring
    end
  end,
})