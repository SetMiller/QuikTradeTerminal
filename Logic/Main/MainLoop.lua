MainLoop = {}

-- 
-- Класс реализует основной цикл программы и ее реакцию на соединение 
-- с сервером
--
function MainLoop:new()
  local Private = {}

    Private.isConnected = false
    Private.isRun = true

  local Public = {}

  -- 
  -- Метод isOn() реализует запуск основного цикла программы
  -- 
  function Public:isOn()
    -- проверяем наличие активного соединения перед запуском программы
    Private.isConnected = isConnected() == 1 and true or false

    -- проверяем наличие активного соединения для запуска основного цикла программы
    if Private.isConnected == false then
      message('Check your Quik connection')    
    else
      -- основной цикл программы
      while Private.isRun do
        -- в процессе работы проверяем наличие активного соединения, чтобы программы не завершалась из-за дисконнекта
        if Private.isConnected then

          -- local aa = TradeConfig:get('dayWeights')
          -- for k, v in pairs(aa) do
          --   message(k .. " = " .. v)
          -- end
          -- message(tostring(aa))
          sleep(400)
          -- Public:runOff()
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
  -- Метод onConnected() реализует реакцию коллбэк функции на подключение к серверу:
  -- сервер подключен
  -- 
  function Public:onConnected()
    Private.isConnected = true
    _G.luaPipe.SendMessage('The Quik is online now', 'telegram_pipe')

  end

  -- 
  -- Метод onDisconnected() реализует взаимосвязь с переключателем состояния основного цикла программы:
  -- сервер отключен
  -- 
  function Public:onDisconnected()
    Private.isConnected = false
    _G.luaPipe.SendMessage('Quik connection lost. Check your network Connection and try again!', 'telegram_pipe')
  end

  -- 
  -- Метод isOff() реализует завершение работы программы
  -- 
  function Public:isOff()
    Private.isRun = false
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end