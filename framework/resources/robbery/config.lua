Zen.Config.Robbery = {
    Locations = {
        -- Removed: Jewelry Store (per user request)
        -- Keeping banks and one store near main clothing
        {
            name = 'Pacific Bank',
            coords = vec3(254.25, 225.57, 101.87),
            radius = 30,
            reward = { 500000, 1000000 },
            timers = { 400, 600 },
            cops = 1,
        },
        {
            name = 'Fleeca Bank',
            coords = vec3(146.8808, -1044.8379, 29.3778),
            radius = 20,
            reward = { 250000, 400000 },
            timers = { 180, 120 },
            cops = 1,
        },
        {
            name = 'Fleeca Bank',
            coords = vec3(-1211.85, -335.76, 37.79),
            radius = 20,
            reward = { 250000, 400000 },
            timers = { 300, 500 },
            cops = 1,
        },
        {
            name = 'Fleeca Bank',
            coords = vec3(-354.52, -54.2, 49.84),
            radius = 20,
            reward = { 250000, 400000 },
            timers = { 300, 500 },
            cops = 1,
        },
        {
            name = 'Fleeca Bank',
            coords = vec3(311.03, -283.0, 54.17),
            radius = 20,
            reward = { 250000, 400000 },
            timers = { 300, 500 },
            cops = 1,
        },
        {
            name = 'Fleeca Bank',
            coords = vec3(-2957.97, 481.03, 15.7),
            radius = 20,
            reward = { 250000, 400000 },
            timers = { 300, 500 },
            cops = 1,
        },
        {
            name = 'Fleeca Bank',
            coords = vec3(1176.57, 2711.83, 38.09),
            radius = 20,
            reward = { 250000, 400000 },
            timers = { 300, 500 },
            cops = 1,
        },
        {
            name = 'Paleto Savings Bank',
            coords = vec3(-104.87, 6476.45, 31.62),
            radius = 20,
            reward = { 250000, 350000 },
            timers = { 300, 500 },
            cops = 1,
        },
        -- One store near main clothing (vec3(75.39, -1398.28, 29.38))
        {
            name = 'Store',
            coords = vec3(28.15, -1339.27, 29.49),
            radius = 20,
            reward = { 250000, 300000 },
            timers = { 200, 400 },
            cops = 1,
        },
    },

    Blip = {
        Type = 156,
        Color = 40,
        Name = 'Robbery'
    },

    Marker = {
        Distance = 5,
        Text = '[E] - Rob'
    }
}
