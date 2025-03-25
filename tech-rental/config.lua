Config = {} -- TECH RENTALS 


─────────────────────────────────────────────────────────────
─██████████████─██████████████─██████████████─██████──██████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─
─██████░░██████─██░░██████████─██░░██████████─██░░██──██░░██─
─────██░░██─────██░░██─────────██░░██─────────██░░██──██░░██─
─────██░░██─────██░░██████████─██░░██─────────██░░██████░░██─
─────██░░██─────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██─
─────██░░██─────██░░██████████─██░░██─────────██░░██████░░██─
─────██░░██─────██░░██─────────██░░██─────────██░░██──██░░██─
─────██░░██─────██░░██████████─██░░██████████─██░░██──██░░██─
─────██░░██─────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─
─────██████─────██████████████─██████████████─██████──██████─
─────────────────────────────────────────────────────────────

Config.Cooldown = 1


Config.carlist = {
    [1] = {
        ['label'] = "Araç Kiralama", -- Kategori İsmi
        ['model'] = "t20", -- Araç Mpodelini Buraya Yazınız
        ['price'] = 500 -- Koyacağınız Aracın Fiyatı
    }, 
    -- [2] = { (2. Kategori)
    --     ['label'] = "", # AYRI ARAÇ KATEGORİSİ!
    --     ['model'] = "", 
    --     ['price'] = 0

    -- }, 
    -- [3] = { (3. Kategori)
    --     ['label'] = "", # AYRI ARAÇ KATEGORİSİ!
    --     ['model'] = ", # AYRI ARAÇ KATEGORİSİ!
    --     ['price'] = 0

    -- }, 
}

Config.PedList = { -- Ped Bölümü                                      
    {
		model = "cs_fbisuit_01", -- Pedin Modelini Buraya Yapıştıracaksınız (https://docs.fivem.net/docs/game-references/ped-models/)
		coords = vector3(-1026.54, -2736.93, 19.17), -- Pedin Kordinat Bölümü     
		heading =  326.32, -- Rota Bölümü
		gender = "male", -- Cinsiyet
        scenario = "WORLD_HUMAN_CLIPBOARD"
	},
}

Config.Coords = { -- Config Kordinat
    x = -1025.14,
    y =  -2734.43,
    z = 19.5,
    h = 234.88,
}

Config.Keybind = 56 -- https://docs.fivem.net/docs/game-references/controls/

