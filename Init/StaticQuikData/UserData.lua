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

  Private.ChartsID    = QuikChartsID:new()
  Private.StopKeys    = QuikStopKeys:new()
  Private.TradeConfig = TradeConfig:new()
  Private.UserAccount = UserAccount:new()

  
  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным для расчета позиций и стопов
  -- 
  -- @param typeOfUserData string
  function Public:get(typeOfUserData, featureOfData, chartId)
    if type(typeOfUserData) ~= 'string' then error(("bad argument typeOfUserData: UserData -> get() (string expected, got %s)"):format(type(typeOfUserData)), 2) end
    
    local isFound = false

    for k, v in pairs(Private) do
      if k == typeOfUserData then
        isFound = true
        return v:get(featureOfData, chartId)
      end
    end
    if not isFound then error(("bad argument, there is no \"%s\" typeOfUserData: UserData -> get())"):format(typeOfUserData), 2) end
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end