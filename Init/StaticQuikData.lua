dofile(getScriptPath().."\\Init\\StaticQuikData\\UserData.lua")
dofile(getScriptPath().."\\Init\\StaticQuikData\\ChartData.lua")

StaticQuikData = {}

-- 
-- Класс реализует основную коллекцию со статичными данными из квика
--
function StaticQuikData:new()
  local Private = {}

  Private.UserData    = UserData:new()
  Private.ChartData   = ChartData:new(Private.UserData:get('ChartsID', 'charts'))

  
  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным для расчета позиций и стопов
  -- 
  -- @param typeOfUserData string
  function Public:get(typeOfUserData, featureOfData, chartId)
   --  if type(typeOfUserData) ~= 'string' then error(("bad argument typeOfUserData: UserData -> get() (string expected, got %s)"):format(type(typeOfUserData)), 2) end
    
   --  local isFound = false

   --  for k, v in pairs(Private) do
   --    if k == typeOfUserData then
   --      isFound = true
   --      return v:get(featureOfData, chartId)
   --    end
   --  end
   --  if not isFound then error(("bad argument, there is no \"%s\" typeOfUserData: UserData -> get())"):format(typeOfUserData), 2) end
  end

  setmetatable(Public, self)
  self.__index = self
  return Public
end