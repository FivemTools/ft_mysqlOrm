RegisterServerEvent('ft_orm:Loaded')
AddEventHandler('onServerResourceStart', function (resource)
  if resource == "ft_orm" then
    TriggerEvent('ft_orm:Loaded')
  end
end)
