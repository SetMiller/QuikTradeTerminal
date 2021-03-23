QuikChartsID = {}

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

  function getQuikChartsID()
    return Private.chartsID
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end