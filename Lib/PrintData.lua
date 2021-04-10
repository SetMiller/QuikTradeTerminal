-- 
-- Метод printData() печатаем данные для проверки
-- 
function printData(callBackFunc, checkData)
  local data = callBackFunc:get(checkData[1], checkData[2], checkData[3])
  if type(data) == 'table' then
    for k, v in pairs(data) do
      message(k .. " = " .. v)
    end
  else
    message(tostring(data))
  end
end
