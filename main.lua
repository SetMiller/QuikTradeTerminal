dofile(getScriptPath().."\\Logic\\Main\\MainLoop.lua")
dofile(getScriptPath().."\\Init\\UserData.lua")

-- dofile(getScriptPath().."\\Components\\QuikData\\ChartData.lua")

-- 
-- Инициализация приложения
--
function OnInit()
  UserData:new()
  MainLoop    = MainLoop:new()
  -- ChartsID    = QuikChartsID:new()
  -- StopKeys    = QuikStopKeys:new()
  -- TradeConfig = TradeConfig:new()
  -- StockDayChart = ChartData:new(ChartsID:get('charts', 'stockD'))
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