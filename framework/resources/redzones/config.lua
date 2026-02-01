Zen.Config.Redzones = {
    Zones = {
        {
            label = 'F-Block',
            coords = vec3(-28.1047, -1462.3207, 30.9854),
            radius = 60.0,
            weapon = 'weapon_appistol',
            reward = 5000,
            revives = {
                vec3(53.2215, -1490.6333, 29.1302),
                vec3(-103.1181, -1509.0243, 33.7657)
            }
        },
        {
            label = 'Jungle',
            coords = vec3(447.47, -1512.48, 28.07),
            radius = 70.0,
            weapon = 'weapon_combatpistol',
            reward = 5000,
            revives = {
                vec3(412.48, -1441.86, 29.29),
                vec3(399.15, -1578.49, 29.34),
                vec3(477.88, -1588.64, 29.24),
                vec3(531.89, -1506.07, 29.33)
            }
        },
    },

    OnEnter = {
        ['Delete Vehicle'] = true,
        ['Toggle Money/Map'] = true
    },

    Message = function(message) 
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.38vw; background: linear-gradient(to right, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)); border-left: 0.208vw solid rgba(255,0,0,0.5); border-radius: 0.26vw; width: auto; display: flex; align-items: center;"><text style="margin-left: 1.5%;"> {0} </text></div>',
            args = { message }
        })
    end
}