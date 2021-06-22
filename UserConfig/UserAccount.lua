UserAccount = {}

-- 
-- Класс реализует хранилище с данными для расчета точек входа и закрытия позиций
--
function UserAccount:new()
  local Private = {}

    Private.account = {
      ['firmid']    = "SPBFUT",              -- идентификатор фирмы
      ['trdaccid']  = "SPBFUTJRk1N",         -- торговый счет
      ['limitType'] = 0,                     -- тип лимита (0 -  денежные средства)
      ['currcode']  = "SUR",                 -- валюта, в которой транслируется органичение
    }
    

    
  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным аккаунта пользователя
  -- 
  function Public:get()
    return Private.account
  end

  function Public:toString()
    return 'UserAccount'
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end