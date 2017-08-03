local Config = {}
Model = {}

Model.useConfig = function (config)
  Config.tableName = config.tableName
  Config.primaryKey = config.primaryKey or 'id'
  Config.updateKey = config.updateKey or 'id'
end

Model.new = function (attributes)
  local instance = {}

  instance.isDirty = false
  instance.attributes = attributes

  instance.set = function (attribute, value)
    instance.isDirty = true
    instance.attributes[attribute] = value
  end

  instance.get = function (attribute)
    return instance.attributes[attribute]
  end

  instance.save = function ()

  end

  return instance
end

Model.find = function (primaryKey)
  return Model.new(
    MySQL.Sync.fetchAll('SELECT * FROM ' .. Config.tableName .. ' WHERE ' .. Config.primaryKey .. ' = @primaryKey',
    { ['@primaryKey'] = primaryKey })[1]
  )
end

Model.findBy = function (field, value)
  return Model.new(
    MySQL.Sync.fetchAll('SELECT * FROM ' .. Config.tableName .. ' WHERE ' .. field .. ' = @value',
    { ['@value'] = value })[1]
  )
end

Model.create = function (attributes)
end

Model.update = function (value, fields)
end
