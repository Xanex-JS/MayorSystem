-- Exports
function SendAlertToDisplay(result)
    TriggerClientEvent("alert:Send", -1, result)
end

-- Exprts Emergency

function SendAlertToDisplayEmerg(result)
    TriggerClientEvent("alert:SendEmerg", -1, result)
end