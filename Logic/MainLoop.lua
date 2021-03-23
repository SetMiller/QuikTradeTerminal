MainLoop = {}

-- 
-- Класс реализует ключи для управления циклами программы
--
function MainLoop:new()
  local Private = {}

    Private.mainLoop      = true      -- ключ управления основным циклом программы
    Private.isConnected   = false     -- ключ управления отслеживанием наличия соединения с сервером

  local Public = {}

  -- 
  -- Метод setIsConnected(key) реализует возможность изменения состояний в зависимости от наличия активного соединения с сервером
  -- 
  ---@param key bool
  function Public:setIsConnected(key)
    if type(key) ~= 'boolean' then error(('bad argument key (boolean expected, got %s)'):format(type(key)), 2) end
    if key == true then
      message('The TradeTerminal is connected. All goes well. Good luck!')
    else
      message('The connection to quik lost! Chect the quik connection!')
    end

    Private.isConnected = key
  end

  -- 
  -- Метод setMainLoop(key) реализует переключение между состояниями программы (вкл/выкл)
  -- 
  ---@param key bool
  function Public:setMainLoop(key)
    if type(key) ~= 'boolean' then error(('bad argument key (boolean expected, got %s)'):format(type(key)), 2) end
    Private.mainLoop = key
  end

  -- 
  -- Метод getIsConnected() реализует доступ к данным состояния ключа
  -- 
  function Public:getIsConnected()
    return Private.isConnected
  end

  -- 
  -- Метод getMainLoop() реализует доступ к данным состояния ключа
  -- 
  function Public:getMainLoop()
    return Private.mainLoop
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end