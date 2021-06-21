function getObjToRead(obj)
   if type(obj) == 'table' then
      for k, v in pairs(obj) do
         if type(v) == 'table' then
            message(k .. " = " .. tostring(v))
            getObjToRead(v)
         else
            message(k .. " = " .. tostring(v))
            sleep(40)
         end
      end
   else
      -- message(name .. " = " .. tostring(obj))
   end
end