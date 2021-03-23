TradeConfig = {}

-- 
-- Класс реализует хранилище с данными для расчета точек входа и закрытия позиций
--
function TradeConfig:new()
  local Private = {}

    Private.tradeConfig = {
      -- SBER
      ['dayPossOffset']         = 1,                -- спред на вход в позицию (значения в единицах!!!)
      ['futuresPossOffset']     = 40,               -- дельта на проскальзывание по фьючерсу для входа в позицию
      ['futuresStopOffset']     = 200,              -- дельта на проскальзывание по фьючерсу для входа в позицию
      ['tradeRisk']             = 3.00,             -- риск на сделку (3%)
      ['minStop']               = 0,                -- минимальный размер стопа
      ['maxStop']               = 5.0,              -- максимальный размер стопа
      ['stopRate']              = 0.35,             -- 35% от диапазона средневзвешенного дня для стопа
      ['dayWeights']            = {2, 3, 4, 2, 1},  -- весовые показатели для дней от мелкого к самому крупному по диапазону
    }

  local Public = {}

  -- 
  -- Метод getTradeConfig() реализует доступ к данным для расчета позиций и стопов
  -- 
  function getTradeConfig()
    return Private.tradeConfig
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end