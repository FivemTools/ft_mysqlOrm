-- -
-- @Project  FiveM Tools
-- @License  GNU General Public License v3.0
-- @Version  2017.08.04
--

Table = {}

-- -
-- Define a new table.
--
-- @param  {Table}  config
-- @return {Model}
--
Table.define = function (config)
  Model.useConfig(config)
  return Model
end
