GetChartData = {}

-- 
-- Класс реализует хранилище с данными аккаунта трейдера
--
function GetChartData:new(chartId)
  local Private = {}

  Private.chartId   = chartId
  Private.cData     = ''
  Private.tData     = ''
  Private.nData     = ''

  function Private:init(chartId)
    Private.cData = getNumCandles(chartId)
    Private.tData, Private.nData, _ = getCandlesByIndex(chartId, 0, 0, cData)
    message(chartId)
  end

  Private:init(Private.chartId)

  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным для расчета позиций и стопов
  -- 
  -- @param typeOfChartData string
  function Public:get(typeOfChartData)
    if type(typeOfChartData) ~= 'string' then error(("bad argument typeOfChartData: GetChartData -> get() (string expected, got %s)"):format(type(typeOfChartData)), 2) end
    
    local isFound = false

    for k, v in pairs(Private) do
      if k == typeOfChartData then
        isFound = true
        return v
      end
    end
    if not isFound then error(("bad argument, there is no \"%s\" typeOfChartData: GetChartData -> get())"):format(typeOfChartData), 2) end
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end