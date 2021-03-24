MainLoop = {}

-- 
-- Класс реализует основной цикл программы и ее реакцию на соединение 
-- с сервером
--
function MainLoop:new()
  local Private = {}

    Private.isConnected = false
    Private.isRun = true

    -- 
    -- Метод connectionCheck() реализует проверку наличия активного соединения quik с сервером
    -- 
    function Private:connectionCheck()
      Private.isConnected = isConnected() == 1 and true or false
      if Private.isConnected then
        message('The TradeTerminal is connected. All goes well. Good luck!')
      else
        message('The connection to quik lost! Chect the quik connection!')
      end
    end

  local Public = {}

  -- 
  -- Метод runOn() реализует запуск основного цикла программы
  -- 
  function Public:runOn()
    -- проверяем наличие активного соединения перед запуском программы
    Private:connectionCheck()

    -- проверяем наличие активного соединения для запуска основного цикла программы
    if Private.isConnected == false then
      message('Please, check the server connection! Quik is offline')
    else
      -- основной цикл программы
      while Private.isRun do
        -- в процессе работы проверяем наличие активного соединения, чтобы программы не завершалась из-за дисконнекта
        if Private.isConnected then
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
  -- Метод onConnect() реализует реакцию коллбэк функции на подключение к серверу:
  -- сервер подключен
  -- 
  function Public:onConnect()
    Private:connectionCheck()
  end

  -- 
  -- Метод onDisconnect() реализует взаимосвязь с переключателем состояния основного цикла программы:
  -- сервер отключен
  -- 
  function Public:onDisconnect()
    Private:connectionCheck()
  end

  -- 
  -- Метод runOff() реализует завершение работы программы
  -- 
  function Public:runOff()
    Private.isRun = false
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end