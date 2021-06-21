-- dofile(getScriptPath().."\\Lib\\CandleData.lua")
-- dofile(getScriptPath().."\\UserConfig\\QuikChartsID.lua")
-- dofile(getScriptPath().."\\UserConfig\\QuikStopKeys.lua")
-- dofile(getScriptPath().."\\UserConfig\\TradeConfig.lua")
-- dofile(getScriptPath().."\\UserConfig\\UserAccount.lua")

InitUserData = {}

-- 
-- Класс реализует получение данных с графиков Quik
--
-- @param chartsId string
function InitUserData:new(...)
  local Private = {}


  for k,v in ipairs{...} do
    if type(select(k, ...)) ~= 'table' then error(("bad argument ARGS: InitUserData (table expected, got %s)"):format(type(select(k, ...))), 2) end
    Private[k] = select(k, ...):new()
  end

  for k,v in ipairs(Private) do
    Private[k]:toString() 
  end

  


  --------------------------------------------------------------------
  local Public = {}

  -- 
  -- Метод get() реализует доступ к данным с графиков
  -- 
--   function Public:get()

--   end

  setmetatable(Public, self)
  self.__index = self
  return Public
end