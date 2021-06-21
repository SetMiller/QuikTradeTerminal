CandleData = {}

-- 
-- Класс реализует получение данных с графиков Quik
--
-- @param chartsId string
function CandleData:new(chartId, chartInterval)
  
  if type(chartId)            ~= 'table'  then error(("bad argument chartId: CandleData (table expected, got %s)"):format(type(chartId)), 2) end
  if type(chartId.SECCODE)    ~= 'string' then error(("bad argument chartId.SECCODE: CandleData (string expected, got %s)"):format(type(chartId.SECCODE)), 2) end
  if type(chartId.CLASSCODE)  ~= 'string' then error(("bad argument chartId.CLASSCODE: CandleData (string expected, got %s)"):format(type(chartId.CLASSCODE)), 2) end
  if type(chartInterval)      ~= 'number' then error(("bad argument chartInterval: CandleData (number expected, got %s)"):format(type(chartInterval)), 2) end
  
  local Private = {}
  Private.chartOptions = {
    ["SECCODE"]       = chartId.SECCODE,
    ["CLASSCODE"]     = chartId.CLASSCODE,
    ["chartInterval"] = chartInterval,
  }
  Private.chartCandles = {
    ["high"]    = "",
    ["low"]     = "",
  }

  function Private:isObjUpdate(mainObj, bufferObj)
    for k, v in pairs(bufferObj) do
      if v ~= mainObj[k] then
        mainObj[k] = bufferObj[k]
      end
    end
  end

  function Private:getChartCandles(mainObj)
    -- local osDay = os.sysdate().day
    -- local try_count = 0
    -- local serverDay = 0
    -- local ds, Error = CreateDataSource(Private.chartOptions.CLASSCODE, Private.chartOptions.SECCODE, Private.chartOptions.chartInterval)
    -- local bufferObj = {
    --   ["high"]    = "",
    --   ["low"]     = "",
    -- }
    -- local time = os.time()
    -- local await = time + 4
    -- message(tostring(time))
    -- message(tostring(await))
    
    -- if osDay == ds:T(ds:Size()).day then  -- так же присутсвует параметр week_day = 5 (день недели)
    --   serverDay = serverDay + 1
    -- end
    -- -- ds:SetEmptyCallback()
    -- while time < await do
    --   time = os.time()
    --   if ds:Size() > 0 then
    --     break
    --   end
    --   -- sleep(1)
    --   -- try_count = try_count + 1
    --   -- message(tostring(os.time()))
    -- end
    
    -- -- if try_count == 1000 then
    -- --   message(tostring(Error))
    -- --   error(Private.chartOptions.SECCODE .. " chart connection error")
    -- -- end
    
    -- bufferObj.high = ds:H(ds:Size() - serverDay)
    -- bufferObj.low = ds:L(ds:Size() - serverDay)
    -- ds:Close()


    Private:isObjUpdate(mainObj, bufferObj)
  end

  


  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным с графиков
  -- 
  function Public:get()
    Private:getChartCandles(Private.chartCandles)
    return Private.chartCandles
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end