-- 
-- Метод printData() печатаем данные для проверки
-- 
function printData()
  local aa = UserData:get('StopKeys', 'active', 'all')
  if type(aa) == 'table' then
    for k, v in pairs(aa) do
      message(k .. " = " .. v)
    end
  else
    message(tostring(aa))
  end
end
