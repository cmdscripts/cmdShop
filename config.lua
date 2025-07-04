Config = {}

Config.Shops = {
    {
        banner = "img_red",
        directory = "test",

        menuTitle = "Food Store",
        menuDescription = "Interaction",
        color = "r",

        locations = {
            vector3(214.9206, -922.072, 60.70964)
        },

        ped = {
            enable = true,
            coords = vector4(214.9206, -922.072, 60.70964, 180.0),
            model = "a_f_m_beach_01",
        },

        blip = {
            enable = true,
            id = 59,
            color = 2,
            scale = 0.7,
            range = true,
            name = "Food Store",
            coords = vector3(214.9206, -922.072, 60.70964)
        },

        marker = {
            enable = true,
            type = 23,
            color = {r = 255, g = 0, b = 0, a = 200},
            size = {x = 0.3, y = 0.3, z = 0.3},
            bounce = false,
            rotate = false,
            distance = 20.0,
        },

        items = {
            {label = "Bread", name = "bread", price = 5, max = 10, index = 1, list = {}},
            {label = "Water", name = "water", price = 10, max = 5, index = 1, list = {}},
        },

        payment = {
            cash = true,
            bank = true,
            black = false
        },
    },

    {
        banner = "",
        directory = "",

        menuTitle = "",
        menuDescription = "",
        color = "",

        locations = {
            vector3(0, 0, 0)
        },

        ped = {
            enable = true,
            coords = vector4(0, 0, 0, 0),
            model = "",
        },

        blip = {
            enable = true,
            id = 59,
            color = 2,
            scale = 0.7,
            range = true,
            name = "",
            coords = vector3(0, 0, 0)
        },

        marker = {
            enable = true,
            type = 23,
            color = {r = 255, g = 0, b = 0, a = 200},
            size = {x = 0.3, y = 0.3, z = 0.3},
            bounce = false,
            rotate = false,
            distance = 20.0,
        },

        items = {
            {label = "", name = "", price = 0, max = 0, index = 1, list = {}},
            {label = "", name = "", price = 0, max = 0, index = 1, list = {}},
        },

        payment = {
            cash = true,
            bank = true,
            black = false
        },
    },
}

