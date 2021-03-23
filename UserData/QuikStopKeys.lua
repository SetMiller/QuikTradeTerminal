QuikStopKeys = {}

-- 
-- Класс реализует хранилище с данными по идентификационным ключам для стоп-лимит заявок
--
function QuikStopKeys:new()
  local Private = {}

    Private.keys = {

      active = {
        ['longActiveStops']   = {25, 89},
        ['shortActiveStops']  = {29, 93},
        ['allActiveStops']    = {25, 89, 29, 93}
      },

      activated = {
        ['longActivatedStops']  = {24, 88},
        ['shortActivatedStops'] = {28, 92},
      },

    }

  local Public = {}

  -- 
  -- Метод getActiveStopKeys() реализует доступ к идентификаторам активных стоп-лимит завок
  -- 
  function getActiveStopKeys()
    return Private.keys.active
  end

  -- 
  -- Метод getActivatedStopKeys() реализует доступ к идентификаторам активированных стоп-лимит завок
  -- 
  function getActivatedStopKeys()
    return Private.keys.activated
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end