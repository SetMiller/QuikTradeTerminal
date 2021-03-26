dofile(getScriptPath().."\\Logic\\Main\\MainLoop.lua")
dofile(getScriptPath().."\\UserData\\QuikChartsID.lua")
dofile(getScriptPath().."\\UserData\\QuikStopKeys.lua")
dofile(getScriptPath().."\\UserData\\TradeConfig.lua")

-- 
-- Инициализация приложения
--
function OnInit()
  MainLoop    = MainLoop:new()
  ChartsID    = QuikChartsID:new()
  StopKeys    = QuikStopKeys:new()
  TradeConfig = TradeConfig:new()
  
end

-- 
-- Запуск основного цикла приложения
--
function main()
  MainLoop:runOn()
end

-- 
-- Функция обратного вызова для отслеживания восстановления соединения с сервером
--
function OnConnected()
  MainLoop:onConnect()
end

-- 
-- Функция обратного вызова для отслеживания разрыва соединения с сервером
--
function OnDisconnected()
  MainLoop:onDisconnect()
end

-- 
-- Функция обратного вызова для завершения работы привода
--
function OnStop()                                                         
  MainLoop:runOff()
end

function OnParam(class, sec)
  
end