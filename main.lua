package.cpath  = _G.getScriptPath().."\\TelegramBot\\?.dll"
package.path   = _G.getScriptPath().."\\TelegramBot\\?.lua"

require('luaPipe')

dofile(getScriptPath().."\\Logic\\Main\\MainLoop.lua")
dofile(getScriptPath().."\\Init\\InitUserData.lua")
dofile(getScriptPath().."\\UserConfig\\QuikChartsID.lua")
dofile(getScriptPath().."\\UserConfig\\QuikStopKeys.lua")
dofile(getScriptPath().."\\UserConfig\\TradeConfig.lua")
dofile(getScriptPath().."\\UserConfig\\UserAccount.lua")


-- dofile(getScriptPath().."\\Components\\QuikData\\ChartData.lua")

--
-- Инициализация приложения
--
function OnInit()
  MainLoop        = MainLoop:new()
  InitUserData    = InitUserData:new(QuikChartsID, TradeConfig, QuikStopKeys, UserAccount)
  -- InitUserData    = InitUserData:new(TradeConfig)
 
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