dofile(getScriptPath().."\\Lib\\Interfaces\\IQuikRequest.lua")

DepoLimits = IQuikRequest:new()

function DepoLimits:new()

   local Public = {}

      function Public:getData(accData) 
        -- local buffer = ''

        local status, res = pcall(function()
          return getFuturesLimit(accData.firmid, accData.trdaccid, accData.limitType, accData.currcode).cbplimit
        end)

        if not status then
          message ('DepoLimits.getData() Error!!! Server doesn\'t response! ')
          sleep(200)
          -- res = buffer
          --FIXME: добавить завершение программы в случае ошибки
        else
          -- buffer = res
        end      
         
      end

   setmetatable(Public, self)
   self.__index = self
   return Public
end