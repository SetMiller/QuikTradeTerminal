GetParam = {}

-- 
-- Класс реализует получение данных с графиков Quik
--
function GetParam:new(params)
  local Private = {}

  Private.chartsId = chartsId


  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным с графиков
  -- 
  function Public:get()
   
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end