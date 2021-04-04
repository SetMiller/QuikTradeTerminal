dofile(getScriptPath().."\\UserConfig\\QuikChartsID.lua")
dofile(getScriptPath().."\\UserConfig\\QuikStopKeys.lua")
dofile(getScriptPath().."\\UserConfig\\TradeConfig.lua")
dofile(getScriptPath().."\\UserConfig\\UserAccount.lua")

UserData = {}

-- 
-- Класс реализует хранилище с данными аккаунта трейдера
--
function UserData:new()
  local Private = {}

  Private.userData = {
    ['ChartsID']    = QuikChartsID:new(),
    ['StopKeys']    = QuikStopKeys:new(),
    ['TradeConfig'] = TradeConfig:new(),
    ['UserAccount'] = UserAccount:new(),
  }

  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным для расчета позиций и стопов
  -- 
  -- @param typeOfUserData string
  function Public:get(typeOfUserData)
    if type(typeOfUserData) ~= 'string' then error(("bad argument typeOfUserData: TradeConfig -> get() (string expected, got %s)"):format(type(confOption)), 2) end
    
    local isFound = false

    for k, v in pairs(Private.tradeConfig) do
      if k == confOption then
        isFound = true
        return v
      end
    end
    if not isFound then error(("bad argument, there is no \"%s\" confOption: TradeConfig -> get())"):format(confOption), 2) end
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end