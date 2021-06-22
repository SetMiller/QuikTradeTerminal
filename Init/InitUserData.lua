-- dofile(getScriptPath().."\\Lib\\CandleData.lua")
-- dofile(getScriptPath().."\\UserConfig\\QuikChartsID.lua")
-- dofile(getScriptPath().."\\UserConfig\\QuikStopKeys.lua")
-- dofile(getScriptPath().."\\UserConfig\\TradeConfig.lua")
-- dofile(getScriptPath().."\\UserConfig\\UserAccount.lua")
dofile(getScriptPath().."\\Lib\\getObjToRead.lua")

InitUserData = {}

-- 
-- Класс реализует получение данных с графиков Quik
--
-- @param chartsId string
function InitUserData:new(...)
  local Private = {}

  local bufferTable = nil
  local bufferType = nil
  for k,v in ipairs{...} do
    if type(select(k, ...)) ~= 'table' then error(("bad argument ARGS: InitUserData (table expected, got %s)"):format(type(select(k, ...))), 2) end
    bufferTable = select(k, ...):new()
    bufferType = bufferTable:toString()
    Private[bufferType] = bufferTable
  end

  -- for k,v in ipairs(Private) do
  --   if Private[k]:toString() == 'UserAccount' then
  --     message('2')
  --   end
  -- end
  getObjToRead(Private)
  -- getObjToRead(Private['TradeConfig']:get('dayWeights'))

  


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