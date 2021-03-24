dofile(getScriptPath().."\\Logic\\Main\\MainLoop.lua")

-- 
-- Инициализация приложения
--
function OnInit()
  MainLoop = MainLoop:new()
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