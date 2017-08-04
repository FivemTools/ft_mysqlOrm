-- -
-- @Project  FiveM Tools
-- @License  GNU General Public License v3.0
-- @Version  2017.08.04
--

server_scripts {
  '@mysql-async/lib/MySQL.lua',

  'src/Table.lua',
  'src/Model.lua',

  '_exports.lua',
  '_events.lua',
}

server_exports {
  'DefineTable',
}
