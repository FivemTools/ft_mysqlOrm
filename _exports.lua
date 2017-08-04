-- -
-- @Project  FiveM Tools
-- @License  GNU General Public License v3.0
-- @Version  2017.08.04
--

function DefineTable (config)
  return Table.define(config)
end

function inTable(table, key)
  return table[key] ~= nil
end