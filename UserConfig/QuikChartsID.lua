QuikChartsID = {}

-- 
-- Класс реализует хранилище с данными по идентификационным ключам получения данных с графиков
--
function QuikChartsID:new()
  local Private = {}

    Private.stock = {
      ['SECCODE']     = "SBER",         -- код акции
      ['CLASSCODE']   = "TQBR",         -- класс акции 
    }
    Private.futures = {
      ['SECCODE']     = "SRZ1",         -- код фьючерса FIXME: при смене фьючерса, поменять !!!!!!!!!
      ['CLASSCODE']   = "SPBFUT",       -- класс фьючерса  
    }
    Private.charts = {
      ['stockD']      = "SBER_D_STOCK_PRICE",       -- id графика акции
      ['stockH']      = "SBER_H_STOCK_PRICE",       -- id графика акции
      ['futuresD']    = "SBER_D_FUTURES_PRICE",     -- id графика фьючерса
      ['futuresH']    = "SBER_H_FUTURES_PRICE",     -- id графика фьючерса
    }

  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к идентификаторам графиков для акции и фьючерса
  -- 
  -- @param idType string
  -- @param chartType string
  function Public:get(idType)
    if type(idType) ~= 'string' then error(("bad argument idType: QuikChartsID -> get() (string expected, got %s)"):format(type(idType)), 2) end
    
    local isFound = false
    
      for k, v in pairs(Private) do
        if k == idType then
          isFound = true
          return v
        end
      end
      if not isFound then error(("bad argument, there is no \"%s\" idType: QuikChartsID -> get())"):format(idType), 2) end
    end

  function Public:toString()
    message('QuikChartsID')
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end



-- TESTED