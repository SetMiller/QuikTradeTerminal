dofile(getScriptPath().."\\Lib\\GetChartData.lua")

ChartData = {}

-- 
-- Класс реализует хранилище с данными аккаунта трейдера
--
function ChartData:new()
  local Private = {}

  Private.charts = {
    ['stockD']    = "",
    ['stockH']    = "",
    ['futuresD']  = "",
    ['futuresH']  = "",
  }

  -- 
  -- Метод getData() при создании объекта заполняет поле charts данными с графиков
  -- 
  -- @param obj string
  function Private:getData(obj)
    for k, v in pairs(obj) do
      obj[k] = GetChartData:new(UserData:get('ChartsID', 'charts', k))
    end
  end

  -- Вызываем метод при создании объекта
  Private:getData(Private.charts)

  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным для расчета позиций и стопов
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