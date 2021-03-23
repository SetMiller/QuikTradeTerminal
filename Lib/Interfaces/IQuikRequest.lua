IQuikRequest = {}

function IQuikRequest:new()

  local Public = {}

    function Public:getData() 
      message('Hello from Interface')
    end

  setmetatable(Public, self)
  self.__index = self
  return Public
end