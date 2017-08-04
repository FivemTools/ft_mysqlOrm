-- -
-- @Project  FiveM Tools
-- @License  GNU General Public License v3.0
-- @Version  2017.08.04
--

RegisterServerEvent('ft_orm:Loaded')
AddEventHandler('onServerResourceStart', function (resource)
  if resource == "ft_orm" then
    TriggerEvent('ft_orm:Loaded')
  end
end)
