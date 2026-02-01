Zen.Config.BikeSpawner = {
    Spawners = {
        {
            Marker = vec3(-20.0149, -1823.6511, 25.7825),
            Spawn = vec4(-23.1308, -1827.3158, 25.3089, 50.4967),
        }
    },

    Models = {
        { 
            label = 'Tuk-Tuk', 
            icon = 'car',
            args = {
                model = 'blazer4'
            } 
        },
        { 
            label = 'Manchez', 
            icon = 'motorcycle',
            args = {
                model = 'manchez'
            } 
        },
    },

    Marker = { 
        Text = '[E] Open Spawner', 
        Distance = 5 
    },

    Blip = { 
        Name = 'Bike Spawner', 
        Type = 348, 
        Color = 59
    }
}