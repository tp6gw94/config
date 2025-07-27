-- ~/.config/yazi/init.lua
if os.getenv("GO_ROOT") then
  local root = io.popen("git rev-parse --show-toplevel"):read("*a")
  ya.mgr_emit("cd", { root:gsub("[\r\n]", "") })
end
