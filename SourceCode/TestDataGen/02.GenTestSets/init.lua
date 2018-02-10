local paths  = {
  "@b/LuaTools/?.lua",
  "@b/GenerationEngine/?.lua",
  "@b/GenerationEngine/Aux/?.lua"
}

BasePath = '/Users/chentz/L/LGen.git'
pathStr = table.concat(paths,";"):gsub("@b",BasePath)

package.path = package.path..";" .. pathStr
--package.cpath = package.cpath..";./modules/?.so;./Aux/?.so"