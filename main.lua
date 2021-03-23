dofile(getScriptPath().."\\Logic\\MainLoop.lua")

-- 
-- Функция обратного вызова для активации объектов для запуска привода
--
function OnInit()
  mainLoop = MainLoop:new()
end

function main()
  -- проверяем наличие активного соединения с сервером
  local isConnected = isConnected() == 1 and true or false
  -- при наличии, запускаем основной цикл программы
  mainLoop:setIsConnected(isConnected)
  -- при отсутствии, выдаем сообщение, что соединение отсутствует и его необходимо проверить
  if mainLoop:getIsConnected() == false then
    message('Please, check the server connection! Quik is offline')
  else
    -- основной цикл привода
    while mainLoop:getMainLoop() do
      -- проверяем наличие активного соединения
      if mainLoop:getIsConnected() then
        sleep(400)
      else
      -- в случае отсутствия активного соединения программа продолжает работать
      -- TODO: 
      -- добавить отправку сообщения в телеграмм о разрыве соединения с сервером
        sleep(1000)
      end
    end
  end
  
end

-- 
-- Функция обратного вызова для отслеживания восстановления соединения с сервером
--
function OnConnected()
  mainLoop:setIsConnected(true)
end

-- 
-- Функция обратного вызова для отслеживания разрыва соединения с сервером
--
function OnDisconnected()
  mainLoop:setIsConnected(false)
end

-- 
-- Функция обратного вызова для завершения работы привода
--
function OnStop()                                                         
  mainLoop:setMainLoop(false)
end

function OnParam(class, sec)
  
end