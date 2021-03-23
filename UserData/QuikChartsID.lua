QuikChartsID = {}

-- 
-- Класс реализует хранилище с данными по идентификационным ключам получения данных с графиков
--
function QuikChartsID:new()
  local Private = {}

    Private.chartsID = {
      stock = {
        ['SECCODE']     = "SBER",         -- код акции
        ['CLASSCODE']   = "TQBR",         -- класс акции 
      },
      futures = {
        ['SECCODE']     = "SRM1",         -- код фьючерса FIXME: при смене фьючерса, поменять !!!!!!!!!
        ['CLASSCODE']   = "SPBFUT",       -- класс фьючерса  
      },
      charts = {
        ['stockDayChartId']     = "SBER_D_STOCK_PRICE",       -- id графика акции
        ['stockHourChartId']    = "SBER_H_STOCK_PRICE",       -- id графика акции
        ['futuresDayChartId']   = "SBER_D_FUTURES_PRICE",     -- id графика фьючерса
        ['futuresHourChartId']  = "SBER_H_FUTURES_PRICE",     -- id графика фьючерса
    }

  local Public = {}

  -- 
  -- Метод getStockID() реализует доступ к идентификаторам акции
  -- 
  function getStockID()
    return Private.chartsID.stock
  end

  -- 
  -- Метод getFuturesID() реализует доступ к идентификаторам фьючерса
  -- 
  function getFuturesID()
    return Private.chartsID.futures
  end

  -- 
  -- Метод getQuikChartsID() реализует доступ к идентификаторам графиков для акции и фьючерса
  -- 
  function getQuikChartsID()
    return Private.chartsID.charts
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end