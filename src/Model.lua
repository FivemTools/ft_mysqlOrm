-- -
-- @Project  FiveM Tools
-- @License  GNU General Public License v3.0
-- @Version  2017.08.04
--

Model = {}
local Config = {}

-- -
-- Configure the model with Table's settings.
--
-- @param  {Table}  config
-- @return {void}
--
Model.useConfig = function (config)
  Config.tableName = config.tableName
  Config.primaryKey = config.primaryKey or 'id'
  Config.updateKey = config.updateKey or 'id'
end

-- -
-- Create a new Model instance.
--
-- @param  {Table}  attributes
-- @return {Model}
--
Model.new = function (attributes)
  local instance = {}

  instance.isDirty = false
  instance.attributes = attributes

  -- -
  -- Set/Change the value of an attribute.
  --
  -- @param  {String}          attribute
  -- @param  {String|Integer}  value
  -- @return {this}
  --
  instance.set = function (attribute, value)
    instance.isDirty = true
    instance.attributes[attribute] = value

    return instance
  end

  -- -
  -- Get the value of an attribute.
  --
  -- @param  {String}  attribute
  -- @return {String|Integer}
  --
  instance.get = function (attribute)
    return instance.attributes[attribute]
  end

  -- -
  -- Save the current instance into the database.
  --
  -- @return {void}
  --
  instance.save = function ()
    -- TODO : Generate INSERT/UPDATE SQL
  end

  return instance
end

-- -
-- Search into the database with the primary key given.
--
-- @param  {Integer}  primaryKey
-- @return {Model}
--
Model.find = function (primaryKey)
  return Model.new(
    MySQL.Sync.fetchAll('SELECT * FROM ' .. Config.tableName .. ' WHERE ' .. Config.primaryKey .. ' = @primaryKey',
    { ['@primaryKey'] = primaryKey })[1]
  )
end

-- -
-- Search into the database with the field and value given.
--
-- @param  {String}  field
-- @param  {String}  value
-- @return {Model}
--
Model.findBy = function (field, value)
  return Model.new(
    MySQL.Sync.fetchAll('SELECT * FROM ' .. Config.tableName .. ' WHERE ' .. field .. ' = @value',
    { ['@value'] = value })[1]
  )
end

-- -
-- Adds a WHERE query contraint.
--
-- @param  {...}  conditions
-- @return {void}
--
Model.where = function (...)
  -- TODO : Should use a QueryBuilder
  local arg = {...}
  local query = "WHERE "

  if #arg == 1 and type(arg[1]) == "table" then
    for i, condition in ipairs(arg[1]) do

      if i > 1 then
        query = query .. "AND "
      end

      local count = #condition
      if count == 2 then
        query = query .. condition[1] .. " = " .. condition[2] .. " "
      else
        query = query .. condition[1] .. " " .. condition[2].. " " .. condition[3] .. " "
      end

    end
  elseif #arg == 2 then
    query = query .. arg[1] .. " = " .. arg[2] .. " "
  elseif #arg == 3 then
    query = query .. arg[1] .. " " .. arg[2].. " " .. arg[3] .. " "
  end
end
