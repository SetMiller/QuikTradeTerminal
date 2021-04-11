package.cpath  = _G.getScriptPath().."\\TelegramBot\\?.dll"
package.path   = _G.getScriptPath().."\\TelegramBot\\?.lua"

require('luaPipe')

dofile(getScriptPath().."\\Logic\\Main\\MainLoop.lua")
dofile(getScriptPath().."\\Init\\UserData.lua")
dofile(getScriptPath().."\\Init\\ChartData.lua")
dofile(getScriptPath().."\\Lib\\PrintData.lua")

-- dofile(getScriptPath().."\\Components\\QuikData\\ChartData.lua")

-- 
-- Инициализация приложения
--
function OnInit()
  UserData    = UserData:new()
  ChartData   = ChartData:new()
  MainLoop    = MainLoop:new()

  -- printData(UserData, {'UserAccount'})
end

-- 
-- Запуск основного цикла приложения
--
function main()
  MainLoop:isOn()
end

-- 
-- Функция обратного вызова для отслеживания восстановления соединения с сервером
--
function OnConnected()
  MainLoop:onConnected()
end

-- 
-- Функция обратного вызова для отслеживания разрыва соединения с сервером
--
function OnDisconnected()
  MainLoop:onDisconnected()
end

-- 
-- Функция обратного вызова для завершения работы привода
--
function OnStop()                                                         
  MainLoop:isOff()
end

function OnParam(class, sec)
  
end