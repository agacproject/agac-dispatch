teamCloud = {}

teamCloud.Framework = 'qb' -- qb or oldqb or esx

teamCloud["PDJob"] = {
    "police",
    "statepolice",
    "sheriff",
    "ranger"
}

teamCloud["EMSJob"] = {
    "ambulance"
}

teamCloud.DispatchMenuKey = 'F6'

teamCloud.UnknownArea = 'Bilinmiyor'

function waypointMessage()
    QBCore.Functions.Notify('Dispatch işaretlendi.', 'success')
    -- print('Dispatch marked.')
    -- exports['mythic_notify']:DoHudText('success', 'Dispatch marked.')
end