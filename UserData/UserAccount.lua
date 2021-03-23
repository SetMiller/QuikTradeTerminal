UserAccount = {}

function UserAccount:new()
  local Private = {}

    Private.accountData = {
      ["firmid"]    = "SPBFUT",
      ["trdaccid"]  = "SPBFUTJRk1N",
      
      ['limitType'] = 0,                      -- тип лимита (0 -  денежные средства)
      ['currcode'] = "SUR"                    -- валюта, в которой транслируется органичение
    }

  local Public = {}

    function getUserAccountData()
      return Private.accountData
    end

  setmetatable(Public, self)
  self.__index = self
  return Public
end