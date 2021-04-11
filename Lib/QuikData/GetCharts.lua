GetCharts = {}

-- 
-- Класс реализует получение данных с графиков Quik
--
function GetCharts:new(chartsId)
  local chartsId = chartsId


  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным с графиков
  -- 
  function Public:get()
   local chartsData = {}
   
   for k, v in pairs(chartsId) do
     local obj = {
       ['cData'] = "",
       ['tData'] = "",
       ['nData'] = "",
     }

     obj.cData = getNumCandles(v)
     obj.tData, obj.nData, _ = getCandlesByIndex(v, 0, 0, obj.cData)
     
     chartsData[k] = obj
   end
   
   return chartsData
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end