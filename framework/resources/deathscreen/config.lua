Zen.Config.DeathScreen = {
    Buttons = {
        {
            label = 'Grove Street', 
            price = 5000, 
            coords = vec4(-11.0048, -1829.7074, 25.3714, 137.6733), 
            key = 'E'
        },
        {
            label = 'Grove Street w/AP',
            price = 50000,
            coords = vec4(-11.0048, -1829.7074, 25.3714, 137.6733),
            weapon = 'weapon_appistol',
            key = 'F'
        },
        {
            label = 'Skate Park', 
            price = 2500, 
            coords = vec4(-941.4001, -792.1478, 15.9451, 104.6610), 
            weapon = 'weapon_appistol', 
            key = 'G'
        },
    },

    OnDeath = {
        RespawnTime = 5000,
        BleedoutTime = 3000 * 60,
        RemoveLoadout = true,
        keepWeapons = {
            "WEAPON_M27",
            "WEAPON_CRACKN_G20",
            "WEAPON_CYNZV8",
            "WEAPON_BLACKUMP",
            "WEAPON_FREEE",
            "WEAPON_TASERX",
            "WEAPON_PACMAN_PPSH",
            "WEAPON_RAGE_ARP",
            "WEAPON_ANIMATED_CARBINE",
            'WEAPON_PUMKINSLAYER',
            'WEAPON_TOPGUNNERSWITCH',
            'WEAPON_ANIMATED_AR13',
            'WEAPON_KNIFEFOU',
            'WEAPON_MAZEFOU',
            "WEAPON_WIENERV2",
            'WEAPON_GHOST_AP',
            'WEAPON_HAMMERFOU',
            'WEAPON_SLICEFOU',
            'WEAPON_VILE',
            'WEAPON_GHOSTAR',
            "WEAPON_KINODERTOTEN"
        },
        PoliceKeepWeapons = {
            "WEAPON_APPISTOL",
            "WEAPON_STUNGUN",
            "WEAPON_M27",
            "WEAPON_CRACKN_G20",
            "WEAPON_CYNZV8",
            "WEAPON_BLACKUMP",
            "WEAPON_FREEE",
            "WEAPON_TASERX",
            "WEAPON_WIENERV2",
            'WEAPON_TOPGUNNERSWITCH',
            'WEAPON_GHOST_AP',
            'WEAPON_VILE',
            "WEAPON_PACMAN_PPSH",
            "WEAPON_RAGE_ARP",
            'WEAPON_GHOSTAR',
            "WEAPON_ANIMATED_CARBINE",
            'WEAPON_PUMKINSLAYER',
            'WEAPON_ANIMATED_AR13',
            'WEAPON_KNIFEFOU',
            'WEAPON_MAZEFOU',
            'WEAPON_HAMMERFOU',
            'WEAPON_SLICEFOU',
            "WEAPON_KINODERTOTEN",
            "WEAPON_HEAVYSNIPER",
            "WEAPON_CARBINERIFLE"
        }
    },

    PoliceStation = vec4(427.8087, -981.6189, 30.7110, 93.1928),

    Hospitals = {
        Locations = {
            vec4(297.9086, -584.1340, 43.2609, 88.4865),
        },

        Blip = {
            Type = 61, 
            Color = 25, 
            Name = 'Hospital', 
            Scale = 0.6
        }
    },

    ReviveZones = { 
        { label = "Hospital", coords = vec3(297.9086, -584.1340, 43.2609), distance = 15},
        { label = "Skate Ramp", coords = vec3(-941.3925, -792.1401, 15.9510), distance = 50 }, 
        { label = "Basketball Ramp", coords = vec3(-919.2553, -724.0322, 19.9167), distance = 25 }, 
        { label = "AP Hanger", coords = vec3(-1097.1250, -3402.0742, 14.1408), distance = 40 },
        { label = "AP Gas", coords = vec3(-1090.6547, -3484.0205, 14.1966), distance = 44.8 },
        { label = "AP Mid", coords = vec3(-1012.4911, -3527.3713, 14.1434), distance = 50 },
        { label = "AP Lonley", coords = vec3(-962.5154, -3282.6667, 14.3136), distance = 45 },
        { label = "AP Bleachers", coords = vec3(-989.0190, -3390.9797, 14.1421), distance = 45 },
        { label = "AP Box", coords = vec3(-954.0045, -3548.2017, 14.1465), distance = 50 },
        { label = "AP Extra", coords = vec3(-1835.0225, -3121.9915, 14.9446), distance = 150 },
        { label = "Redzone", coords = vec3(-3505.6829, 5754.1479, 658.2696), distance = 150 },
        { label = "Stables", coords = vec3(1457.7836, 1154.2823, 114.2940), distance = 200 },
        { label = "Van Wars 1", coords = vec3(3848.4092, 1454.9110, 84.0571), distance = 100 },
        { label = "Van Wars 2", coords = vec3(3940.5969, 1982.9178, 84.0570), distance = 100 },
        { label = "Dock Ramp 1", coords = vec3(907.2126, -3143.2156, 6.1040), distance = 25 },
        { label = "Dock Ramp 2", coords = vec3(953.1420, -3144.0532, 6.1040), distance = 25 },
        { label = "Dock Ramp 3", coords = vec3(1003.18, -3144.3, 6.1), distance = 25 },
        { label = "Dock Ramp 4", coords = vec3(1049.1794, -3144.3633, 6.1040), distance = 25 },
        { label = "Dock Ramp 5", coords = vec3(1049.6654, -3197.6135, 6.1040), distance = 25 },
        { label = "Dock Ramp 6", coords = vec3(1003.5241, -3196.6655, 6.1040), distance = 25 },
        { label = "Dock Ramp 7", coords = vec3(952.9418, -3196.7268, 6.1040), distance = 25 },
        { label = "Dock Ramp 8", coords = vec3(907.4965, -3197.2000, 6.1040), distance = 25 },
        { label = "Sky Ramps", coords = vec3(-3402.3313, -3353.2732, 669.4406), distance = 150 },
        { label = "Floaters", coords = vec3(-3462.1643, -2426.6660, 158.2659), distance = 250 },

    }
}