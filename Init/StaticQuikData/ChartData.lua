dofile(getScriptPath().."\\Lib\\QuikData\\GetCharts.lua")


ChartData = {}

-- 
-- Класс реализует хранилище с данными с графиков
-- 
-- получаем объект вида ['stockD'] = {'cData', 'tData', 'nData'}
--
function ChartData:new(charts)
  local Private = {}

  Private = GetCharts:new(charts):get()


  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным с графиков
  -- 
  -- @param typeOfChart string
  function Public:get(typeOfChart)
    if type(typeOfChart) ~= 'string' then error(("bad argument typeOfChart: ChartData -> get() (string expected, got %s)"):format(type(typeOfChart)), 2) end
    
    local isFound = false

    for k, v in pairs(Private) do
      if k == typeOfChart then
        isFound = true
        return v
      end
    end
    if not isFound then error(("bad argument, there is no \"%s\" typeOfChart: ChartData -> get())"):format(typeOfChart), 2) end
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end