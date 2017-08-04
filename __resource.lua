-- -
-- @Project  FiveM Tools
-- @License  GNU General Public License v3.0
-- @Version  2017.08.04
--

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

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
