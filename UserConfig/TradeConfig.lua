TradeConfig = {}

-- 
-- Класс реализует хранилище с данными для расчета точек входа и закрытия позиций
--
function TradeConfig:new()
  local Private = {}

    Private.tradeConfig = {
      -- SBER
      ['stockOffset']           = 1,                -- спред на вход в позицию (значения в единицах!!!)
      ['futuresPossOffset']     = 40,               -- дельта на проскальзывание по фьючерсу для входа в позицию
      ['futuresStopOffset']     = 200,              -- дельта на проскальзывание по фьючерсу для входа в позицию
      ['tradeRisk']             = 3.00,             -- риск на сделку (3%)
      ['minStop']               = 0,                -- минимальный размер стопа
      ['maxStop']               = 5.0,              -- максимальный размер стопа
      ['stopRate']              = 0.35,             -- 35% от диапазона средневзвешенного дня для стопа
      ['minimumStop']           = 0.60,             -- минимальный размер стопа
      ['dayWeights']            = {2, 3, 4, 2, 1},  -- весовые показатели для дней от мелкого к самому крупному по диапазону
      ['isFuturesStop']         = false             -- стоп по фьючерсу или акции, если она есть
    }

  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным для расчета позиций и стопов
  -- 
  -- @param confOption string
  function Public:get(confOption)
    if type(confOption) ~= 'string' then error(("bad argument confOption: TradeConfig -> get() (string expected, got %s)"):format(type(confOption)), 2) end
    
    local isFound = false

    for k, v in pairs(Private.tradeConfig) do
      if k == confOption then
        isFound = true
        return v
      end
    end
    if not isFound then error(("bad argument, there is no \"%s\" confOption: TradeConfig -> get())"):format(confOption), 2) end
  end

  function Public:toString()
    return 'TradeConfig'
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end