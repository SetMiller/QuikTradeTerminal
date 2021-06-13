Error = {}

-- 
-- 
--
function Error:new()
   local Private = {}

   Private.isError = false


   --------------------------------------------------------------------
   local Public = {}

   -- 
   -- 
   -- 
   function Public:getIsError()
      return Private.isError
   end

   -- 
   -- 
   -- 
   function Public:setIsError()
      Private.isError = true 
   end

   setmetatable(Public, self)
   self.__index = self
   return Public
end