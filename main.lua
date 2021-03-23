dofile(getScriptPath().."\\Components\\DepoLimits.lua")

account = {
  ['firmid'] = "SPBFUT",                    -- идентификатор фирмы
  ['trdaccid'] = "SPBFUTJRk1N",                  -- торговый счет
  ['limitType'] = 0,                  -- тип лимита (0 -  денежные средства)
  ['currcode'] = "SUR"                -- валюта, в которой транслируется органичение
}

function OnConnected()
  message(tostring(run))
  run = true

end
function OnDisconnected()
  message(tostring(run))
  run = false

end

mainrun = true

function OnInit()
  depoLimits = DepoLimits:new()
end

function main()
    depoLimits:getData()
    -- messsage(tostring(run))

  while mainrun do
    -- serverTime:getTime(mess)
    if run then
      message('2')
    end
    
    sleep(200)
  end
end

function OnStop()                                                         -- действия при нажатии кнопки "Остановить"
  mainrun = false
end

function OnParam(class, sec)
  
end