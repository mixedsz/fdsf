-- Server Configuration File
-- This file contains server-side configuration settings

Zen.Config.Server.Database = {
    -- Database table names
    Tables = {
        Players = 'users',
        Vehicles = 'owned_vehicles',
        Properties = 'owned_properties',
        Gangs = 'gangs',
        GangMembers = 'gang_members',
        GangStorages = 'gang_storages',
        Bills = 'billing',
        Evidence = 'police_evidence',
        Bans = 'bans',
        CachedPlayers = 'cached_players'
    }
}

Zen.Config.Server.Admin = {
    -- Admin permission groups
    Groups = {
        ['superadmin'] = {
            kick = true, ban = true, teleport = true, freeze = true,
            spectate = true, revive = true, offlineban = true, tpm = true,
            entitywipe = true, unban = true, coords = true, spawnvehicle = true,
            repairvehicle = true, cleanvehicle = true, flipvehicle = true,
            deletevehicle = true, heal = true, godmode = true, invisible = true,
            noclip = true, givemoney = true, giveitem = true, giveweapon = true,
            givevehicle = true
        },
        ['admin'] = {
            kick = true, ban = true, teleport = true, freeze = true,
            spectate = true, revive = true, tpm = true, entitywipe = true,
            coords = true, spawnvehicle = true, repairvehicle = true,
            cleanvehicle = true, flipvehicle = true, deletevehicle = true,
            heal = true, godmode = true, invisible = true, noclip = true
        },
        ['mod'] = {
            kick = true, teleport = true, freeze = true, spectate = true,
            revive = true, tpm = true, coords = true, heal = true
        }
    },

    -- Discord roles that grant admin access (role ID -> group name)
    DiscordRoles = {
        -- ['123456789012345678'] = 'superadmin',
        -- ['234567890123456789'] = 'admin',
        -- ['345678901234567890'] = 'mod'
    }
}

Zen.Config.Server.Discord = {
    -- Discord bot token for role checking (leave empty to disable)
    BotToken = '',
    GuildId = '',

    -- Roles configuration
    Roles = {
        -- Donor roles
        Donor = {},
        -- Staff roles
        Staff = {},
        -- Key drop permission roles
        KeyDrop = {},
        CoinDrop = {}
    }
}

Zen.Config.Server.Economy = {
    -- Starting money for new players
    StartingCash = 50000,
    StartingBank = 100000,

    -- Money wash settings
    MoneyWash = {
        MinAmount = 100,
        MaxAmount = 1000000
    }
}

Zen.Config.Server.Vehicles = {
    -- Default vehicle spawn settings
    DefaultFuel = 100,

    -- Plate generation
    PlateFormat = 'AAAA0000' -- A = letter, 0 = number
}

Zen.Config.Server.Gangs = {
    -- Gang storage limits
    Storage = {
        MaxMoney = 10000000,
        MaxDirtyMoney = 10000000,
        MaxItems = 1000
    },

    -- Turf war settings
    Turfs = {
        MinPlayersToStart = 1,
        CooldownMinutes = 30,
        MaxStrikes = 3
    }
}

Zen.Config.Server.Police = {
    -- Society account name
    SocietyAccount = 'society_police',

    -- Evidence locker
    EvidenceLocker = {
        MaxItems = 500
    }
}

Zen.Config.Server.Robbery = {
    -- Cooldown between robberies (in seconds)
    Cooldown = 300,

    -- Police required for robbery
    MinPolice = 0
}

Zen.Config.Server.Redzones = {
    -- Kill reward multiplier
    RewardMultiplier = 1.0,

    -- Headshot bonus
    HeadshotBonus = 500
}

Zen.Config.Server.Logging = {
    -- Enable logging
    Enabled = true,

    -- Discord webhook for logging (leave empty to disable)
    Webhook = ''
}
