Zen.Config.Gang = {   
    Gangs = {
        ['spades'] = {
            name = 'Spades',
            color = { 0, 0, 0 },
            tag = 'Spades',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['otr'] = {
            name = 'OTR',
            color = { 0, 0, 0 },
            tag = 'OTR',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'soilder',
                    label = 'Soilder',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'associate',
                    label = 'Associate',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'capo',
                    label = 'Capo',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'underboss',
                    label = 'Underboss',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'boss',
                    label = 'Boss',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['btd'] = {
            name = 'BTD',
            color = { 0, 0, 0 },
            tag = 'BTD',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-1547.3579, 115.1723, 56.7800, 185.6924),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'streetrat',
                    label = 'Street Rat',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-1534.6555, 80.0133, 56.7791),
                spawn = vec4(-1515.8506, 85.3447, 56.1683, 271.0587),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['haunted'] = {
            name = 'Haunted',
            color = { 0, 0, 0 },
            tag = 'Haunted',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'spirit',
                    label = 'Spirit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'ghost',
                    label = 'Ghost',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'phantom',
                    label = 'Phantom',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['tgf'] = {
            name = 'TGF',
            color = { 0, 0, 0 },
            tag = 'TGF',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shoota',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['prosper'] = {
            name = 'Prosper',
            color = { 0, 0, 0 },
            tag = 'Prosper',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['ebk'] = {
            name = 'EBK',
            color = { 255, 0, 0 },
            tag = 'EBK',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'hustler',
                    label = 'Hustler',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'blockbender',
                    label = 'Block Bender',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'bigsteppa',
                    label = 'Big Steppa',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'soulsnatcher',
                    label = 'Soul Snatcher',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'hoodstar',
                    label = 'Hoodstar',
                    rank = 5,
                    leader = false,
                },
                [6] = {
                    name = 'youngslobe',
                    label = 'Young Slo Be',
                    rank = 6,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['astriel'] = {
            name = 'Astriel',
            color = { 0, 0, 0 },
            tag = 'Astriel',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'astriel',
                    label = 'Astriel',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['dma'] = {
            name = 'DMA',
            color = { 0, 0, 0 },
            tag = 'DMA',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'rager',
                    label = 'Rager',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'hvh',
                    label = 'HVH',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'topcheater',
                    label = 'Top Cheater',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'dma',
                    label = 'DMA',
                    rank = 5,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['hoxtonboys'] = {
            name = 'Hoxtonboys',
            color = { 0, 0, 0 },
            tag = 'Hoxtonboys',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'staff',
                    label = 'Staff',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['script'] = {
            name = 'Script',
            color = { 0, 0, 0 },
            tag = 'Script',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'managment',
                    label = 'Managment',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['btw'] = {
            name = 'BTW',
            color = { 0, 0, 0 },
            tag = 'BTW',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'managment',
                    label = 'Managment',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['paradise'] = {
            name = 'Paradise',
            color = { 0, 0, 0 },
            tag = 'Paradise',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'princessa',
                    label = 'Princessa',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'managment',
                    label = 'Managment',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founde',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['gdk'] = {
            name = 'GDK',
            color = { 0, 0, 0 },
            tag = 'GDK',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'recruit',
                    label = 'Recruit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['detect'] = {
            name = 'Detect',
            color = { 0, 0, 0 },
            tag = 'Detect',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['faith'] = {
            name = 'Faith',
            color = { 0, 0, 0 },
            tag = 'Faith',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'faith',
                    label = 'Faith',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'higherup',
                    label = 'Higher Up',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['vile'] = {
            name = 'Vile',
            color = { 0, 0, 0 },
            tag = 'Vile',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 2,
                    leader = false,
                },
                [3] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 3,
                    leader = false,
                },
                [4] = {
                    name = 'turfrunner',
                    label = 'Turf Runner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'headrecruiter',
                    label = 'Head Recruiter',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'management',
                    label = 'Management',
                    rank = 8,
                    leader = false,

                },
                [9] = {
                    name = 'director',
                    label = 'Director',
                    rank = 9,
                    leader = false,

                },
                [10] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 10,
                    leader = true,

                },
                [11] = {
                    name = 'cofounder',
                    label = 'Co Founder',
                    rank = 11,
                    leader = true,

                },
                [12] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 12,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['virtue'] = {
            name = 'Virtue',
            color = { 0, 0, 0 },
            tag = 'Virtue',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'virtue',
                    label = 'Virtue',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'hitter',
                    label = 'Hitter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'stepper',
                    label = 'Stepper',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['toptier'] = {
            name = 'Top Tier',
            color = { 179, 0, 255 },
            tag = 'Top Tier',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'member',
                    label = 'Member',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['ss'] = {
            name = 'SS',
            color = { 0, 0, 0 },
            tag = 'SS',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshotta',
                    label = 'Top Shotta',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'headshoota ',
                    label = 'Head Shoota ',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'headrecruiter',
                    label = 'Head Recruiter',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'manager',
                    label = 'Manager',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'headmanager',
                    label = 'Head Manager',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 8,
                    leader = false,

                },
                [9] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 9,
                    leader = true,

                },
                [10] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 10,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['fishygang'] = {
            name = 'Fishy Gang',
            color = { 255, 124, 0 },
            tag = 'Fishy Gang',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'pipsqueak',
                    label = 'Pipsqueak',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['sacrifice'] = {
            name = 'Sacrifice',
            color = { 0, 0, 0 },
            tag = 'Sacrifice',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'killer',
                    label = 'Killer',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['illusion'] = {
            name = 'Illusion',
            color = { 0, 0, 0 },
            tag = 'Illusion',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'queens',
                    label = 'Queens',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'yn',
                    label = 'YN',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfgrinder',
                    label = 'Turf Grinder',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'overseer',
                    label = 'Overseer',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['lust'] = {
            name = 'Lu$t',
            color = { 0, 0, 0 },
            tag = 'Lu$t',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'spirits',
                    label = 'Spirits',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'angles',
                    label = 'Angles',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'god',
                    label = 'God',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['doa'] = {
            name = 'DOA',
            color = { 0, 0, 0 },
            tag = 'DOA',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['808mafia'] = {
            name = '808 Mafia',
            color = { 0, 0, 0 },
            tag = '808 Mafia',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-1296.4313, 296.7425, 64.8068, 85.1800),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'mafia',
                    label = 'Mafia',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topmafia',
                    label = 'Top Mafia',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'hitman',
                    label = 'Hitman',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'management',
                    label = 'Management',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['t5'] = {
            name = 'T5',
            color = { 0, 0, 0 },
            tag = 'T5',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'recruit',
                    label = 'Recruit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 4,
                    leader = true,

                },
                [5] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'management',
                    label = 'Management',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'headmanagement',
                    label = 'Head Management',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 8,
                    leader = false,

                },
                [9] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 9,
                    leader = true,

                },
                [10] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 10,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['tcc'] = {
            name = 'TCC',
            color = { 0, 0, 0 },
            tag = 'TCC',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'asociado',
                    label = 'Asociado',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'sicario',
                    label = 'Sicario',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'caporegime',
                    label = 'Caporegime',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'elsegundo',
                    label = 'El Segundo',
                    rank = 4,
                    leader = true,

                },
                [5] = {
                    name = 'eljefe',
                    label = 'El Jefe',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['skg'] = {
            name = 'SKG',
            color = { 0, 0, 0 },
            tag = 'SKG',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = true,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['mosthated'] = {
            name = 'Most Hated',
            color = { 0, 0, 0 },
            tag = 'Most Hated',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'member',
                    label = 'Member',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'management',
                    label = 'Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['nhl'] = {
            name = 'NHL',
            color = { 0, 0, 0 },
            tag = 'NHL',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'member',
                    label = 'Member',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'management',
                    label = 'Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['cheathiders'] = {
            name = 'Cheat Hiders',
            color = { 0, 0, 0 },
            tag = 'Cheat Hiders',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'cheathider',
                    label = 'Cheathider',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'huncho',
                    label = 'Huncho',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['secret'] = {
            name = 'Secret',
            color = { 0, 0, 0 },
            tag = 'Secret',
            members = {},

            block = {
                enabled = true,
                coords = vec4(664.6539, 939.2909, 247.5798, 81.4934),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'reaper',
                    label = 'Reaper',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'underboss',
                    label = 'Underboss',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'angel',
                    label = 'Angel',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'god',
                    label = 'God',
                    rank = 7,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(641.1834, 926.3664, 247.5809),
                spawn = vec4(641.5029, 938.4920, 247.5799, 253.4991),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['latinkings'] = {
            name = 'Latin Kings',
            color = { 0, 0, 0 },
            tag = 'Latin Kings',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'jit',
                    label = 'Jit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'lilooter',
                    label = 'Lil Ooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'bigsniper',
                    label = 'Big Sniper',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'mademan',
                    label = 'Made Man',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'boss',
                    label = 'Boss',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['lol'] = {
            name = 'LOL',
            color = { 0, 0, 0 },
            tag = 'LOL',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 5,
                    leader = true,

                },
                [6] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['embryo'] = {
            name = 'Embryo',
            color = { 0, 0, 0 },
            tag = 'Embryo',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['g59'] = {
            name = 'G59',
            color = { 164, 0, 255 },
            tag = 'G59',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'ghoul',
                    label = 'Ghoul',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'alchemist',
                    label = 'Alchemist',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'wardlord',
                    label = 'WardLord',
                    rank = 3,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['losvagos'] = {
            name = 'Los Vagos',
            color = { 255, 208, 0 },
            tag = 'Los Vagos',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'machine',
                    label = 'Machine',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'landlord',
                    label = 'Land Lord',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['akusha'] = {
            name = 'Akusha',
            color = { 88, 101, 242 },
            tag = 'Akusha',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = '25TURFSORSTRIP',
                    label = '25TURFSORSTRIP',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'akusha',
                    label = 'Akusha',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'thatnigga',
                    label = 'That Nigga',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['nfl'] = {
            name = 'Never Forget Loyalty',
            color = { 0, 0, 0 },
            tag = 'Never Forget Loyalty',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['fgf'] = {
            name = 'FGF',
            color = { 255, 255, 255 },
            tag = 'FGF',
            members = {},

            block = {
                enabled = true,
                coords = vec4(1365.7981, -579.8428, 74.3803, 269.8234),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'maniac',
                    label = 'Maniac',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'psycho',
                    label = 'Psycho',
                    rank = 5,
                    leader = true,

                },
                [6] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 6,
                    leader = true,

                },
                [7] = {
                    name = 'recruitermanager',
                    label = 'Recruiter Manager',
                    rank = 7,
                    leader = true,

                },
                [8] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 8,
                    leader = true,

                },
                [9] = {
                    name = 'director',
                    label = 'Director',
                    rank = 9,
                    leader = true,

                },
                [10] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 10,
                    leader = true,

                },
                [11] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 11,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(1392.8058, -607.6346, 74.3379),
                spawn = vec4(1377.0148, -595.4637, 74.3379, 35.1161),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = false },
                }
            },
        },
        ['hope'] = {
            name = 'Hope',
            color = { 136, 0, 214 },
            tag = 'Hope',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-1686.9255, 467.6601, 131.3977, 109.2856),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'recruit',
                    label = 'Recruit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-1670.1019, 487.6864, 128.8762),
                spawn = vec4(-1668.2694, 496.9919, 128.8764, 15.9950),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['kept'] = {
            name = 'Kept',
            color = { 0, 0, 0 },
            tag = 'Kept',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['venom'] = {
            name = 'Venom',
            color = { 0, 0, 0 },
            tag = 'Venom',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['demonboyz'] = {
            name = 'Demon Boyz',
            color = { 0, 0, 0 },
            tag = 'Demon Boyz',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['nlmb'] = {
            name = 'NLMB',
            color = { 0, 0, 0 },
            tag = 'NLMB',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['gsc'] = {
            name = 'GSC',
            color = { 255, 0, 228 },
            tag = 'GSC',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['skript'] = {
            name = 'Skrpit',
            color = { 0, 0, 0 },
            tag = 'Skrpit',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['anti'] = {
            name = 'ANTI',
            color = { 0, 0, 0 },
            tag = 'Anti',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'hittaz',
                    label = 'Hittaz',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'highhittaz',
                    label = 'High Hittaz',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['48s'] = {
            name = '48S',
            color = { 255, 0, 0 },
            tag = '48S',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['igm'] = {
            name = 'IGM',
            color = { 0, 0, 0 },
            tag = 'IGM',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['esluts'] = {
            name = 'Esluts',
            color = { 128, 0, 128 },
            tag = 'Esluts',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-985.6015, 179.7195, 64.4385, 252.0721),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'esluts',
                    label = 'Esluts',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'aimer',
                    label = 'Aimer',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owners',
                    label = 'Owners',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['demontime'] = {
            name = 'Demon Time',
            color = { 0,0,0 },
            tag = 'Demon Time',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'enforcement',
                    label = 'Enforcement',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['fbg'] = {
            name = 'FBG',
            color = { 255,0,0 },
            tag = 'FBG',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'headcapo',
                    label = 'Head Capo',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'headhuncho',
                    label = 'Head Huncho',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['demons'] = {
            name = 'DEMONS',
            color = { 255,0,0 },
            tag = 'Demons',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'TRIAL',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'SHOOTER',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'RECRUITER',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'CO OWNER',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'president',
                    label = 'PRESIDENT',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['3star'] = {
            name = '3 Star',
            color = { 255,192,203 },
            tag = '3 Star',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = '1star',
                    label = '1 Star',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = '2star',
                    label = '2 Star',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = '3star',
                    label = '3 Star',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = '4star',
                    label = '4 Star',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = '5star',
                    label = '5 Star',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['gangstersdisciples'] = {
            name = 'Gangsters Disciples',
            color = { 255,255,0 },
            tag = 'Gangsters Disciples',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'turfrunner',
                    label = 'Turf Runner',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshotta',
                    label = 'Top Shotta',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'bigpapa',
                    label = 'Big Papa',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['vez'] = {
            name = 'VEZ',
            color = { 0,0,0},
            tag = 'VEZ',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'rookie',
                    label = 'Rookie',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'thug',
                    label = 'Thug',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'chief',
                    label = 'Chief',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['pov'] = {
            name = 'POV',
            color = { 0,0,0},
            tag = 'POV',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'bot',
                    label = 'Bot',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'xplioter',
                    label = 'Xplioter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'spoofer',
                    label = 'Spoofer',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['dwc'] = {
            name = 'DWC',
            color = { 255,255,255},
            tag = 'DWC',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['jzo'] = {
            name = 'JZO',
            color = { 255,255,255},
            tag = 'JZO',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['lso'] = {
            name = 'LSO',
            color = { 0,0,0},
            tag = 'LSO',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'lso',
                    label = 'LSO',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'goddess',
                    label = 'Goddess',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['inpire'] = {
            name = 'Inpire',
            color = { 255,255,255},
            tag = 'Inpire',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['trust'] = {
            name = 'Trust',
            color = { 255,255,255},
            tag = 'Trust',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['hbg'] = {
            name = 'HBG',
            color = { 255,255,255},
            tag = 'HBG',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['stk'] = {
            name = 'STK',
            color = { 255,255,255},
            tag = 'STK',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['lostcontrol'] = {
            name = 'Lost Control',
            color = { 0,0,0},
            tag = 'Lost Control',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['annabelle'] = {
            name = 'Annabelle',
            color = { 0,0,0},
            tag = 'Annabelle',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['gunsquad'] = {
            name = 'Gun Squad',
            color = { 255,0,0},
            tag = 'Gun Squad',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'newbies',
                    label = 'Newbies',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'supervisor',
                    label = 'Supervisor',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'management',
                    label = 'Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['fno'] = {
            name = 'FNO',
            color = { 255,255,255},
            tag = 'FNO',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['immortal'] = {
            name = 'Immortal',
            color = { 0,0,0},
            tag = 'Immortal',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                },
                [6] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['phg'] = {
            name = 'P.H.G',
            color = { 0,0,0},
            tag = 'P.H.G',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'perfectpeter',
                    label = 'Perfect Peter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'greedygraham',
                    label = 'Greedy Graham',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'beefybert',
                    label = 'Beefy Bert',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'ruderalph',
                    label = 'Rude Ralph',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'horridhenry',
                    label = 'Horrid Henry',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['tga'] = {
            name = 'TGA',
            color = { 0,0,0},
            tag = 'TGA',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shotcaller',
                    label = 'Shot Caller',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'turfteam',
                    label = 'Turf Team',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['bloodhound'] = {
            name = 'Blood Hound',
            color = { 255,0,0},
            tag = 'Blood Hound',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'recruit',
                    label = 'Recruit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['wraith'] = {
            name = 'Wraith',
            color = { 0,0,0},
            tag = 'Wraith',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-3.6596, 335.0385, 113.0679, 335.2680),
                type = 310,
                color = 4
            },

            ranks = {
                [1] = {
                    name = 'shotta',
                    label = 'Shotta',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshotta',
                    label = 'Top Shotta',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['hks'] = {
            name = 'HKS',
            color = { 255,192,203},
            tag = 'HKS',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'hkstrial',
                    label = 'HKS Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'hksshooter',
                    label = 'HKS Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'hksrecruiter',
                    label = 'HKS Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'hksmanagement',
                    label = 'HKS Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'hksowner',
                    label = 'HKS Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['otf'] = {
            name = 'OTF',
            color = { 0,0,0},
            tag = 'OTF',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'headrecruiter',
                    label = 'Head Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'underboss',
                    label = 'Underboss',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'boss',
                    label = 'Boss',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['richethugs'] = {
            name = 'Rich E Thugs',
            color = { 255,255,255},
            tag = 'Rich E Thugs',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'turfsquad',
                    label = 'Turf Squad',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'bighomie',
                    label = 'Big Homie',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['pinkheartz'] = {
            name = 'PinkHeartz',
            color = { 249,115,155},
            tag = 'PinkHeartz',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'son',
                    label = 'Son',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'cheater',
                    label = 'Cheater',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'gum',
                    label = 'Gum',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['$inners'] = {
            name = '$inners',
            color = { 255,255,255},
            tag = '$inners',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = '$in',
                    label = '$in',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'management',
                    label = 'Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['sacred'] = {
            name = 'Sacred',
            color = { 0,0,0},
            tag = 'Sacred',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'babyshooter',
                    label = 'Baby Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfdemon',
                    label = 'Turf Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coleader',
                    label = 'Co Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['gbg'] = {
            name = 'GBG',
            color = { 0,0,0},
            tag = 'GBG',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'foundingfather',
                    label = 'Founding Father',
                    rank = 4,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['mfs'] = {
            name = 'MFS',
            color = { 255,0,0},
            tag = 'MFS',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'prospect',
                    label = 'Prospect',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'member',
                    label = 'Member',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfsquad',
                    label = 'Turf Squad',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['astro'] = {
            name = 'Astro',
            color = { 0,0,0},
            tag = 'Astro',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'lilastro',
                    label = 'Lil Astro',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'babyshoota',
                    label = 'Baby Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'manager',
                    label = 'Manager',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'headmanger',
                    label = 'Head Manger',
                    rank = 8,
                    leader = false,

                },
                [9] = {
                    name = 'cofoundingastro',
                    label = 'Co Founding Astro',
                    rank = 9,
                    leader = false,

                },
                [10] = {
                    name = 'foundingfarthers',
                    label = 'Founding Farthers',
                    rank = 10,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['bta'] = {
            name = 'BTA',
            color = { 0,0,0},
            tag = 'BTA',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'packrunner',
                    label = 'Pack Runner',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'soldier',
                    label = 'Soldier',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'capo',
                    label = 'Capo',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'big homie',
                    label = 'Big homie',
                    rank = 4,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['ghost'] = {
            name = 'Ghost',
            color = { 0,0,0},
            tag = 'Ghost',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-3304.9949, 536.2070, 14.4139, 30.7005),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trialgoon',
                    label = 'Trial Goon',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'cheater',
                    label = 'cheater',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'management',
                    label = 'Management',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'director',
                    label = 'Director',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'headdirector',
                    label = 'Head Director',
                    rank = 8,
                    leader = true,

                },
                [9] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 9,
                    leader = true,

                },
                [10] = {
                    name = 'headowner',
                    label = 'Head Owner',
                    rank = 10,
                    leader = true,

                },
                [11] = {
                    name = 'cofounder',
                    label = 'Co Founder',
                    rank = 11,
                    leader = true,

                },
                [12] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 12,
                    leader = true,

                },
                [13] = {
                    name = 'dwcbd',
                    label = 'DWCBD',
                    rank = 13,
                    leader = true,

                }
                
            },

            spawner = {
                coords = vec3(-3274.7725, 528.9720, 12.2654),
                spawn = vec4(-3284.1016, 524.9879, 12.2654, 111.8299),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['angels'] = {
            name = 'Angels',
            color = { 0,0,0},
            tag = 'Angels',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'director',
                    label = 'Director',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['sond3r'] = {
            name = 'Sond3r',
            color = { 0,0,255},
            tag = 'Sond3r',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'management',
                    label = 'Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['thegodfathers'] = {
            name = 'The God Fathers',
            color = { 0,0,0},
            tag = 'The God Fathers',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'prospect',
                    label = 'Prospect',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'member',
                    label = 'Member',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfsquad',
                    label = 'Turf Squad',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['sesh'] = {
            name = 'SESH',
            color = { 255,255,255},
            tag = 'Sesh',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'sesh - a',
                    label = 'Sesh - a',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'sesh',
                    label = 'Sesh',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'highhittaz',
                    label = 'High Hittaz',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'managment',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'headhuncho',
                    label = 'Head Huncho',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['btk'] = {
            name = 'BTK',
            color = { 0,0,0},
            tag = 'BTK',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'sesh - a',
                    label = 'Sesh - a',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'sesh',
                    label = 'Sesh',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'highhittaz',
                    label = 'High Hittaz',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'managment',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'headhuncho',
                    label = 'Head Huncho',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['anon'] = {
            name = 'Anon',
            color = { 0,0,0},
            tag = 'Anon',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'detectives',
                    label = 'Detectives',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'anon',
                    label = 'anon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'anonymous',
                    label = 'Anonymous',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'supremeleader',
                    label = 'Supreme Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'legion',
                    label = 'Legion',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['silent'] = {
            name = 'Silent',
            color = { 0,0,0},
            tag = 'Sielent',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['starcult'] = {
            name = 'St4rcult',
            color = { 0,0,0},
            tag = 'St4rcult',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'star',
                    label = 'Star',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'com',
                    label = 'Com',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'cult',
                    label = 'Cult',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'kauji',
                    label = 'Kauji',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['deadonsite'] = {
            name = 'Dead On Site',
            color = { 0,0,255},
            tag = 'Dead On Site',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'yn',
                    label = 'Yn',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shotta',
                    label = 'Shotta',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'injected',
                    label = 'Injected',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['crusaders'] = {
            name = 'Crusaders',
            color = { 0,0,255},
            tag = 'Crusaders',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'lostaim',
                    label = 'Lost Aim',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'turfsoverrunner',
                    label = 'Turfs OverRunner',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'mainmanagement',
                    label = 'Main management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'overseer',
                    label = 'Overseer',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['harmony'] = {
            name = 'Harmony',
            color = { 255,255,255},
            tag = 'Harmony',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = '.gg/harmony',
                    label = '.gg/harmony',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'harmonymembers',
                    label = 'Harmony Members',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'shotcaller',
                    label = 'Shot Caller',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['topgunners'] = {
            name = 'Top Gunners',
            color = { 255,0,0},
            tag = 'Top Gunners',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-2274.0391, -59.1689, 111.1060, 0.0000),
                type = 310,
                color = 4
            },

            ranks = {
                [1] = {
                    name = 'topgunner',
                    label = 'Top Gunner',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topg',
                    label = 'Top G',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'gunner',
                    label = 'Gunner',
                    rank = 2,
                    leader = false,

                },
                [4] = {
                    name = 'turfrunner',
                    label = 'Turf Runner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'turfrecruiter',
                    label = 'Turf Recruiter',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'turfgunner',
                    label = 'Turf Gunner',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'operations',
                    label = 'Operations',
                    rank = 8,
                    leader = false,

                },
                [9] = {
                    name = 'comanagement',
                    label = 'Co Management',
                    rank = 9,
                    leader = false,

                },
                [10] = {
                    name = 'management',
                    label = 'Management',
                    rank = 10,
                    leader = false,

                },
                [11] = {
                    name = 'directoroftg',
                    label = 'Director of TG',
                    rank = 11,
                    leader = false,

                },
                [12] = {
                    name = 'investor',
                    label = 'Investor',
                    rank = 12,
                    leader = false,

                },
                [13] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 13,
                    leader = true,

                },
                [14] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 14,
                    leader = true,

                },
                [15] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 15,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-2252.7397, -70.5042, 111.1060),
                spawn = vec4(-2259.8164, -70.2591, 111.1059, 56.6192),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['batclub'] = {
            name = 'Bat Club',
            color = { 0,0,0},
            tag = 'Bat Club',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'recruit',
                    label = 'Recruit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['desire'] = {
            name = 'Desire',
            color = { 255,255,0},
            tag = 'Desire',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'recruit',
                    label = 'Recruit',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'desired',
                    label = 'Desired',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'hittaz',
                    label = 'Hittaz',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'manager',
                    label = 'Manager',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 7,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['mystery'] = {
            name = 'Mystery',
            color = { 255,255,0},
            tag = 'Mystery',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Management',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 5,
                    leader = true,

                },
                [6] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['massacre'] = {
            name = 'Massacre',
            color = {194, 151, 99},
            tag = 'Massacre',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'massacre',
                    label = 'Massacre',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'sanctioned',
                    label = 'Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'wicked',
                    label = 'Wicked',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['tkg'] = {
            name = 'TKG',
            color = { 255,255,255},
            tag = 'TKG',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['unholysaintz'] = {
            name = 'Unholy Saintz',
            color = { 0,0,0},
            tag = 'Unholy Saintz',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'unholyshooter',
                    label = 'Unholy Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'holyshooter',
                    label = 'Holy Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'thegod',
                    label = 'The God',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'thegodfathersbrother',
                    label = 'The God Fathers Brother',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'thegodfather',
                    label = 'The God Father',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['unknown'] = {
            name = 'Unknown',
            color = { 0,0,0},
            tag = 'Unknown',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['chosen'] = {
            name = 'Chosen',
            color = { 214,0,255},
            tag = 'Chosen',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'director',
                    label = 'Director',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                },
                [6] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['injected'] = {
            name = 'Injected',
            color = { 0,0,0},
            tag = 'Injected',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'injectors',
                    label = 'Injectors',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topinjectors',
                    label = 'Top Injectors',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['tpl'] = {
            name = 'TPL',
            color = { 0,81,255},
            tag = 'TPL',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['kxuji'] = {
            name = 'Kxuji',
            color = { 214,0,255},
            tag = 'Kxuji',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'leadshooter',
                    label = 'Lead Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leadrecruiter',
                    label = 'Lead Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'possessor',
                    label = 'Possessor',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['bd'] = {
            name = 'BD',
            color = { 0,0,0},
            tag = 'BD',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'lilbd',
                    label = 'Lil BD',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'bigbd',
                    label = 'Big BD',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'management',
                    label = 'Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['opium'] = {
            name = 'Opium',
            color = { 0,0,0},
            tag = 'Opium',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'thug',
                    label = 'Thug',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'opium',
                    label = 'Opium',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'shooter',
                    label = 'shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'top shooter',
                    label = 'Top Shooter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['snf'] = {
            name = 'SNF',
            color = { 0,0,0},
            tag = 'SNF',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'rookie',
                    label = 'Rookie',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'member',
                    label = 'Member',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshootaz',
                    label = 'Top Shootaz',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'runnerz',
                    label = 'Runnerz',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['mld'] = {
            name = 'MLD',
            color = { 0,0,0},
            tag = 'MLD',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'member',
                    label = 'Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shoota',
                    label = 'Shoota',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshoota',
                    label = 'Top Shoota',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['prayers'] = {
            name = 'Prayers',
            color = { 255,255,255},
            tag = 'Prayers',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'gangmanagement',
                    label = 'Gang Management',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coowner',
                    label = 'Co Owner',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['heavenly'] = {
            name = 'Heavenly',
            color = { 255,255,255},
            tag = 'Heavenly',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'recruit',
                    label = 'recruit',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'underboss',
                    label = 'UnderBoss',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'boss',
                    label = 'Boss',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['rave'] = {
            name = 'Rave',
            color = { 174,223,38},
            tag = 'Rave',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1536.51, 868.57, 181.12, 100.0),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'rave',
                    label = 'Rave',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'staff',
                    label = 'Staff',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['1300'] = {
            name = '1300',
            color = { 255,255,255},
            tag = '1300',
            members = {},

            block = {
                enabled = true,
                coords = vec4(244.6351, -1710.5043, 29.1439, 137.7704),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'soldier',
                    label = 'Soldier',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'lilslime',
                    label = 'Lil Slime',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'enforcer',
                    label = 'Enforcer',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'bigslime',
                    label = 'Big Slime',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'headslime',
                    label = 'Head Slime',
                    rank = 5,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(269.2141, -1728.7384, 29.6455),
                spawn = vec4(261.9279, -1716.3331, 29.2963, 49.2596),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['krk'] = {
            name = 'KRK',
            color = { 255,105,180},
            tag = 'KRK',
            members = {},

            block = {
                enabled = false,
                coords = vec4(244.6351, -1710.5043, 29.1439, 137.7704),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'management',
                    label = 'Manangment',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'owner',
                    label = 'owner',
                    rank = 5,
                    leader = true,

                },
                [6] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['revenge'] = {
            name = 'Revenge',
            color = { 255,255,255},
            tag = 'Revenge',
            members = {},

            block = {
                enabled = false,
                coords = vec4(244.6351, -1710.5043, 29.1439, 137.7704),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'manager',
                    label = 'Manager',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 6,
                    leader = true,

                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['creed'] = {
            name = 'Creed',
            color = { 0, 0, 0 },
            tag = 'Creed',
            members = {},

            block = {
                enabled = false,
                coords = vec4(244.6351, -1710.5043, 29.1439, 137.7704),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'affiliate',
                    label = 'Affiliate',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'affiliate',
                    label = 'Affiliate',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'affiliate',
                    label = 'Affiliate',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'leader',
                    label = 'Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'founder',
                    label = 'Founder',
                    rank = 5,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-1317.8441, -939.2534, 9.7307),
                spawn = vec4(-1317.4161, -923.3798, 11.2021, 292.3874),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['ms13'] = {
            name = 'MS 13',
            color = { 255,255,255},
            tag = 'MS 13',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-1335.6423, -930.7723, 11.7529, 286.7603),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'turfrunners',
                    label = 'Turf Runners',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'clothingdesigner',
                    label = 'Clothing Designer',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'pcchecker',
                    label = 'Pc Checker',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'trialdemon',
                    label = 'trial demon',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'demonsoldier',
                    label = 'Demon Soldier',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'topdemon',
                    label = 'Top Demon',
                    rank = 6,
                    leader = false,

                },
                [7] = {
                    name = 'demonrecruiter',
                    label = 'Demon Recruiter',
                    rank = 7,
                    leader = false,

                },
                [8] = {
                    name = 'ogdemon',
                    label = 'OG Demon',
                    rank = 8,
                    leader = false,

                },
                [9] = {
                    name = 'demongeneral',
                    label = 'Demon General',
                    rank = 9,
                    leader = false,

                },
                [10] = {
                    name = 'overlord',
                    label = 'Overlord',
                    rank = 10,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-1317.8892, -939.2855, 9.7307),
                spawn = vec4(-1319.2838, -924.2272, 11.2021, 282.9461),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['777'] = {
            name = '777',
            color = { 0, 0, 0 },
            tag = '777',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1335.6423, -930.7723, 11.7529, 286.7603),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'angel ',
                    label = 'Angel ',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'chereb',
                    label = 'Chereb',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'knight',
                    label = 'Knight',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'seprah',
                    label = 'Seprah',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'archangel',
                    label = 'Archangel',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'godfather',
                    label = 'GodFather',
                    rank = 6,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['9s'] = {
            name = '9s',
            color = { 0, 0, 0 },
            tag = '9s',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1335.6423, -930.7723, 11.7529, 286.7603),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'aimerone',
                    label = 'Aimer One ',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'aimertwo',
                    label = 'Aimer Two',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'aimerthree',
                    label = 'Aimer Three',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'aimerfour',
                    label = 'Aimer Four',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'aimerfive',
                    label = 'Aimer Five',
                    rank = 5,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['flux'] = {
            name = 'FLUX',
            color = { 0, 0, 0 },
            tag = 'FLUX',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1335.6423, -930.7723, 11.7529, 286.7603),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'shooter',
                    label = 'Shooter',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'demon',
                    label = 'Demon',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'psycho',
                    label = 'Psycho',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'mainman ',
                    label = 'Main Man',
                    rank = 5,
                    leader = false,

                },
                [6] = {
                    name = 'teal',
                    label = 'Teal',
                    rank = 6,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['tg'] = {
            name = 'TOSSGANG',
            color = {0, 255, 0},
            tag = 'TOSSGANG',
            members = {},

            block = {
                enabled = false,
                coords = vec4(-1335.6423, -930.7723, 11.7529, 286.7603),
                type = 310,
                color = 1
            },

            ranks = {
                [1] = {
                    name = 'newmember',
                    label = 'New Member',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'shooters',
                    label = 'Shooters',
                    rank = 2,
                    leader = false,

                },
                [3] = {
                    name = 'topshooters',
                    label = 'Top Shooters',
                    rank = 3,
                    leader = false,

                },
                [4] = {
                    name = 'coleader',
                    label = 'Co Leader',
                    rank = 4,
                    leader = false,

                },
                [5] = {
                    name = 'leader ',
                    label = 'Leader',
                    rank = 5,
                    leader = true,

                },
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
        ['444'] = {
            name = '444',
            color = { 0,0,0},
            tag = '444',
            members = {},

            block = {
                enabled = true,
                coords = vec4(-3194.3142, 806.5958, 8.9271, 183.1284),
                type = 310,
                color = 4
            },

            ranks = {
                [1] = {
                    name = 'trial',
                    label = 'Trial',
                    rank = 1,
                    leader = false,
                },
                [2] = {
                    name = 'killa',
                    label = 'Killa',
                    rank = 2,
                    leader = false,
                },
                [3] = {
                    name = 'topkilla',
                    label = 'Top Killa',
                    rank = 3,
                    leader = false,
                },
                [4] = {
                    name = 'turfkilla',
                    label = 'Turf Killa',
                    rank = 4,
                    leader = false,
                },
                [5] = {
                    name = 'turftopkilla',
                    label = 'Turf Top Killa',
                    rank = 5,
                    leader = false,
                },
                [6] = {
                    name = 'Shooter',
                    label = 'Shooter',
                    rank = 6,
                    leader = false,
                },
                [7] = {
                    name = 'topshooter',
                    label = 'Top Shooter',
                    rank = 7,
                    leader = false,
                },
                [8] = {
                    name = 'recruiter',
                    label = 'Recruiter',
                    rank = 8,
                    leader = false,
                },
                [9] = {
                    name = 'headrecruiter',
                    label = 'Head Recruiter',
                    rank = 9,
                    leader = false,
                },
                [10] = {
                    name = 'owner',
                    label = 'Owner',
                    rank = 10,
                    leader = true,
                }
            },

            spawner = {
                coords = vec3(-75.4754, -1828.9033, 26.9419),
                spawn = vec4(-54.4454, -1846.8235, 26.3756, 328.2430),
                radius = 1.5,
                
                vehicles = {
                    { model = 'insurgent2', label = 'Insurgent', leader = true },
                }
            },
        },
    },

    PriorityTurfs = {
        'Legion Square', -- 1
        'Mega Mall',    -- 2
        'Weed',     -- 3
        'Meth',      -- 3
        'Money Wash'     -- 3
        -- add more if u want 
    },

    Turfs = {
        Timers = {
            ['Initiation'] = 10,
            ['Capture'] = 100,
            ['Ending'] = 8,
            ['Cooldown'] = 60
        },

        OnEnter = {
            ['Need Gang'] = true,
            ['Delete Vehicle'] = true,
            ['Toggle Money/Map'] = true
        },
        
        Zones = {
            ['Legion Square'] = {
                name = 'Legion Square',
                coords = vec3(198.0538, -935.8296, 30.6868),
                radius = 50.0,
                players = {},
                altcoords = vec3(201.63, -998.99, 30.09),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Dirt Field'] = {
                name = 'Dirt Field',
                coords = vec3(956.7980, -2622.0566, 5.2464),
                radius = 50.0,
                players = {},
                altcoords = vec3(1023.8530, -2632.6294, 6.4623),
                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Money Wash'] = {
                name = 'Money Wash',
                coords = vec3(902.69, -182.79, 73.92),
                radius = 40.0,
                players = {},
                altcoords = vec3(890.92, -225.73, 69.38),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Weed'] = {
                name = 'Weed',
                coords = vec3(-251.32, -1569.29, 32.17),
                radius = 45.0,
                players = {},
                altcoords = vec3(-255.7313, -1619.5931, 31.8488),

                rewards = {
                    { item = 'weed', amount = 200 },
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Construction Site'] = {
                name = 'Construction Site',
                coords = vec3(98.61, -391.34, 41.26),
                radius = 50.0,
                players = {},
                altcoords = vec3(127.27, -454.0, 42.07),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Meth'] = {
                name = 'Meth',
                coords = vec3(325.6, -211.37, 54.08),
                radius = 40.0,
                players = {},
                altcoords = vec3(306.29, -267.07, 53.96),

                rewards = {
                    { item = 'meth', amount = 200 },
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['BrokenHomes'] = {
                name = 'BrokenHomes',
                coords = vec3(1376.62, -740.33, 67.23),
                radius = 40.0,
                players = {},
                altcoords = vec3(1330.07, -708.47, 66.06),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Running Track'] = {
                name = 'Running Track',
                coords = vec3(-1738.22, 164.05, 64.37),
                radius = 40.0,
                players = {},
                altcoords = vec3(-1688.07, 132.94, 64.11),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Docks'] = {
                name = 'Docks',
                coords = vec3(486.77, -3339.45, 6.06),
                radius = 40.0,
                players = {},
                altcoords = vec3(488.85, -3273.22, 6.06),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Beach'] = {
                name = 'Beach',
                coords = vec3(-1164.21, -1743.28, 4.02),
                radius = 50.0,
                players = {},
                altcoords = vec3(-1204.97, -1680.08, 4.15),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['The Pier'] = {
                name = 'The Pier',
                coords = vec3(-1816.65, -1202.85, 13.01),
                radius = 50.0,
                players = {},
                altcoords = vec3(-1759.27, -1138.97, 13.12),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Golf Course'] = {
                name = 'Golf Course',
                coords = vec3(-1162.32, 91.09, 58.21),
                radius = 50.0,
                players = {},
                altcoords = vec3(-1230.43, 120.34, 58.13),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Alien Field'] = {
                name = 'Alien Field',
                coords = vec3(2488.7246, 3778.5098, 44.4666), -- Location on where the marker to 
                radius = 50.0,
                players = {},
                altcoords = vec3(2403.590088, 3784.828613, 39.535236),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
            ['Mega Mall'] = {
                name = 'Mega Mall',
                coords = vec3(27.86, -1740.29, 29.3),
                radius = 38.5,
                players = {},
                altcoords = vec3(19.1578, -1784.1976, 28.5301),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Parking Lot'] = {
                name = 'Parking Lot',
                coords = vec3(-78.4642, -2013.6592, 18.0169),
                radius = 45.0,
                players = {},
                altcoords = vec3(-115.7938, -2059.5115, 17.4262),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },


            ['Observatory'] = {
                name = 'Observatory',
                coords = vec3(-412.67, 1169.65, 325.85),
                radius = 50.0,
                players = {},
                altcoords = vec3(-477.88, 1190.52, 325.12),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Backlot'] = {
                name = 'Backlot',
                coords = vec3(2723.4099, 1358.5509, 24.5240),
                radius = 50.0,
                players = {},
                altcoords = vec3(2730.6750, 1428.3173, 24.6528),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Mansion Lot'] = {
                name = 'Mansion Lot',
                coords = vec3(-1900.3387, 2028.9932, 140.7404),
                radius = 50.0,
                players = {},
                altcoords = vec3(-1893.8982, 1977.4490, 142.6019),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Ghost Turf'] = {
                name = 'Ghost Turf',
                coords = vec3(-3406.9670, 516.4150, 9.1958),
                radius = 30.0,
                players = {},
                altcoords = vec3(-3369.9004, 537.4357, 12.2648),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Government Facility'] = {
                name = 'Government Facility',
                coords = vec3(2547.594238, -385.272644, 97.278336),
                radius = 70.0,
                players = {},
                altcoords = vec3(2576.4019, -330.3144, 92.9928),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Sandy Hangar'] = {
                name = 'Sandy Hangar',
                coords = vec3(1751.6387, 3269.1428, 41.2226),
                radius = 50.0,
                players = {},
                altcoords = vec3(1694.2784, 3232.6245, 40.8709),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },

            ['Camp'] = {
                name = 'Camp',
                coords = vec3(1437.3518, 6348.5322, 23.9850),
                radius = 50.0,
                players = {},
                altcoords = vec3(1495.2643, 6345.2808, 23.9724),

                rewards = {
                    { account = 'black_money', amount = { 200000, 500000 } }
                }      
            },
        },

        Message = function(message)
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div style="padding: 0.38vw; background: linear-gradient(90deg, rgba(10, 9, 11, 0.66) 49.81%, rgba(10, 9, 11, 0.47) 99.96%); border-radius: 4px; width: auto; display: flex; align-items: center;"><text style="margin-left: 1.5%;"> {0} </text></div>',
                args = { message }
            })
        end
    }
}