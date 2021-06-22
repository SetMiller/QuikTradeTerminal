QuikStopKeys = {}

-- 
-- Класс реализует хранилище с данными по идентификационным ключам для стоп-лимит заявок
--
function QuikStopKeys:new()
  local Private = {}

    Private.activeKeys = {
      ['long']   = {25, 89},
      ['short']  = {29, 93},
      ['all']    = {25, 89, 29, 93}
    }
    Private.activatedKeys = {
      ['long']  = {24, 88},
      ['short'] = {28, 92},
    }

    
  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к ключам стоп-лимит заявок в терминале QUIK
  -- 
  -- @param keyType string
  -- @param possType string
  function Public:get(keyType, possType)
    if type(keyType) ~= 'string' then error(("bad argument keyType: QuikStopKeys -> get() (string expected, got %s)"):format(type(keyType)), 2) end
    if type(possType) ~= 'string' then error(("bad argument possType: QuikStopKeys -> get() (string expected, got %s)"):format(type(possType)), 2) end
    
    local isFound = false

    for ik, iv in pairs(Private) do
      if ik == keyType then
        for jk, jv in pairs(iv) do
          if jk == possType then
            isFound = true
            return jv
          end
        end
        if not isFound then error(("bad argument, there is no \"%s\" possType: QuikStopKeys -> get())"):format(possType), 2) end
      end
    end
    if not isFound then error(("bad argument, there is no \"%s\" keyType: QuikStopKeys -> get())"):format(keyType), 2) end
  end

  function Public:toString()
    return 'QuikStopKeys'
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end