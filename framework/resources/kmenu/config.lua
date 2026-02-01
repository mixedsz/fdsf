Zen.Config.KMenu = {
    Locations = {
        { vec3(-924.37,-753.8,19.63), 100 }, -- Skate Park
        { vec3(-1020.0,-3453.26,13.91144), 250 }, -- Airport Ramps
        { vec3(1414.78, 1119.6, 114.83), 140 }, -- Stables
        { vec3(-11.3399, -1829.4583, 25.3891), 20 }, -- Grove
        { vec3(-3402.3665, -3353.3599, 669.4283), 250 }, -- Sky Ramps
        { vec3(-1809.5565, -3142.7522, 14.3137), 250 }, -- AP EX Left
        { vec3(-3462.3752, -2425.5168, 158.2657), 250 }, -- FLOATERS
    },
    Buttons = {
        Teleports = {
            ['Airport Teleports'] = {
                -- { 'icon', 'label', coords }
                { 'AP Hanger', vec4(-1085.8271, -3382.2192, 13.9450, 147.8603) },
                { 'AP Bleachers', vec4(-987.9485, -3389.3000, 14.9449, 145.9897) },
                { 'AP Gas', vec4(-1089.6533, -3483.9221, 14.1434, 236.7817) },
                { 'AP Mid', vec4(-1019.5769, -3496.9175, 14.1434, 149.4246) },
                { 'AP Box', vec4(-954.2078, -3546.9155, 14.0738, 326.6472) },
                { 'AP Lonley', vec4(-963.2320, -3284.7783, 14.3136, 148.3539) },
                { 'AP EX Mid', vec4(-1838.5571, -3123.3665, 14.7045, 147.8075) },
                { 'AP EX Right', vec4(-1867.7166, -3104.9702, 14.0233, 149.0253) },
                { 'AP EX Left', vec4(-1809.5565, -3142.8367, 14.3058, 147.5581) },
            },
            ['Skate Park'] = {
                -- { 'icon', 'label', coords }
                { 'Skate Park', vec4(-959.0424, -780.0302, 17.8361, 231.8172) },
            },
            ['Stables'] = {
                -- { 'icon', 'label', coords }
                { 'Ranch Stables', vec4(1456.3782, 1117.1167, 114.3338, 356.6016) },
            },
            ['Floater Ramps'] = {
                -- { 'icon', 'label', coords }
                { 'Floater 1', vec4(-3461.5, -2291.49, 158.26, 4.49) },
                { 'Floater 2', vec4(-3462.9, -2361.28, 158.26, 177.68) },
                { 'Floater 3', vec4(-3462.27, -2425.27, 158.26, 328.64) },
                { 'Floater 4', vec3(-3462.28, -2491.28, 158.26) },
                { 'Floater 5', vec4(-3462.56, -2558.53, 158.26, 201.18) },
            },
            },
            
        },
        Weapons = {
            ['weapon_appistol'] = { 
                weapon = 'weapon_appistol', 
                price = 50000 
            },
            ['weapon_combatpistol'] = { 
                weapon = 'weapon_combatpistol', 
                price = 30000 
            },
        },

        Items = {
            ['armour'] = {
                item = 'armour',
                icon = 'shield',
                price = 500
            },
            ['clip'] = {
                item = 'clip',
                icon = 'gun',
                price = 500
            },
            ['medkit'] = {
                item = 'medkit',
                icon = 'suitcase-medical',
                price = 500
            },
        }
    }