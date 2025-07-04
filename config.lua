Config = {}

Config = {

    ShopItem = {

        {
            Banner = "img_red",
            Directory = "test",

            NameMenu = "Lebensmittel",
            DescriptionMenu = "Interaktion",
            ColorMenu = "r",

            PositonMenu = {
                vector3(214.9206, -922.072, 60.70964)
            }, 

            PedEnable = true, 
            Ped = {
                pos = vector4(214.9206, -922.072, 60.70964, 180.0),
                hash = "a_f_m_beach_01",
            },

            BlipsEnable = true,
            Blips = {
                Id = 59,
                Color = 2,
                Taille = 0.7,
                Range = true,
                Name = "Lebensmittel",
                pos = vector3(214.9206, -922.072, 60.70964)
            },

            MarkesEnable = true,
            Marker = {
                Type = 23,
                ColorR = 255,
                ColorG = 0,
                ColorB = 0,
                Opacite = 200, 
                SizeLargeur = 0.3,
                SizeEpaisseur = 0.3,
                SizeHauteur = 0.3,
                Saute = false, 
                Tourne = false,
                Distance = 20.0,
            },

            Items = {
                {label = "Brot", name = "bread", price = 5, qtmax = 10, ListIndex = 1, donttouch = {}},
                {label = "Wasser", name = "water", price = 10, qtmax = 5, ListIndex = 1, donttouch = {}},

            },

            PayedMethode = {
                Cash = true,
                Bank = true,
                BlackMoney = false
            },

        },
        
        {
            Banner = "",
            Directory = "",

            NameMenu = "",
            DescriptionMenu = "",
            ColorMenu = "",

            PositonMenu = {
                vector3(0,0,0)
            }, 

            PedEnable = true, 
            Ped = {
                pos = vector4(0,0,0,0),
                hash = "",
            },

            BlipsEnable = true,
            Blips = {
                Id = 59,
                Color = 2,
                Taille = 0.7,
                Range = true,
                Name = "",
                pos = vector3(0,0,0)
            },

            MarkesEnable = true,
            Marker = {
                Type = 23,
                ColorR = 255,
                ColorG = 0,
                ColorB = 0,
                Opacite = 200, 
                SizeLargeur = 0.3,
                SizeEpaisseur = 0.3,
                SizeHauteur = 0.3,
                Saute = false, 
                Tourne = false,
                Distance = 20.0,
            },

            Items = {
                {label = "", name = "", price = , qtmax = , ListIndex = , donttouch = {}},
                {label = "", name = "", price = , qtmax = , ListIndex = , donttouch = {}},

            },

            PayedMethode = {
                Cash = true,
                Bank = true,
                BlackMoney = false
            },

        },

    },
}