UserAccount = {}

-- 
-- Класс реализует хранилище с данными для расчета точек входа и закрытия позиций
--
function UserAccount:new()
  local Private = {}

    Private.firmid    = "SPBFUT"              -- идентификатор фирмы
    Private.trdaccid  = "SPBFUTJRk1N"         -- торговый счет
    Private.limitType = 0                     -- тип лимита (0 -  денежные средства)
    Private.currcode  = "SUR"                 -- валюта, в которой транслируется органичение

    
  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным аккаунта пользователя
  -- 
  function Public:get()
    return Private
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end