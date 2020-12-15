-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

heros = {}

math.randomseed(love.timer.getTime())

-- listes d'éléments
listeSprites = {}
listeTirs = {}
listeAliens = {}

-- Niveau 16x12
niveau = {}
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3 })

-- Camera
camera = {}
camera.y = 0
camera.vitesse = 1

-- Images des tuiles
imgTuiles = {}
local n
for n=1, 3 do
    imgTuiles[n] = love.graphics.newImage("images/tuile_"..n..".png")
end

sonShoot = love.audio.newSource("sons/shoot.wav", "static")

function math.angle(x1,y1,x2,y2) return math.atan2(y2-y1, x2-x1) end

function creeTir(pImage, pX, pY, pVitesseX, pVitesseY)
    local tir = creeSprite(pImage, pX, pY)
    tir.vx = pVitesseX
    tir.vy = pVitesseY
    table.insert(listeTirs, tir)

    sonShoot:play()
end

function creeAlien(pType, pX, pY)
    local nomImage = ""
    if pType == 1 then
        nomImage = "enemy1"
    elseif pType == 2 then
        nomImage = "enemy2"
    elseif pType == 3 then
        nomImage = "tourelle"
    end

    local alien = creeSprite(nomImage, pX, pY)

    alien.type = pType

    alien.endormi = true
    alien.chronoTir = 0

    if pType == 1 then
        alien.vy = 2
        alien.vx = 0        
    elseif pType == 2 then
        alien.vy = 2
        local direction = math.random(1, 2)
        if direction == 1 then alien.vx = 1 else alien.vx = -1 end
    elseif pType == 3 then
        alien.vx = 0
        alien.vy = camera.vitesse
    end
    table.insert(listeAliens, alien)
end

function creeSprite(pNomImage, pX, pY)
    sprite = {}
    sprite.x = pX
    sprite.y = pY
    sprite.supprime = false
    sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
    sprite.l = sprite.image:getWidth()
    sprite.h = sprite.image:getHeight()
    table.insert(listeSprites, sprite)

    return sprite
end

function love.load()

    love.window.setMode(1024, 768)
    love.window.setTitle("Mon super shooter !")
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    heros = creeSprite("heros", largeur/2, hauteur/2)

    demarreJeu()
end

function demarreJeu()
    heros.x = largeur/2
    heros.y = hauteur - heros.h*2
    
    local ligne=4
    creeAlien(1, largeur/2, -64/2-64*(ligne-1))
    ligne=10
    creeAlien(2, largeur/2, -64/2-64*(ligne-1))
    ligne=11
    creeAlien(3, 64*3, -64/2-64*(ligne-1))

    -- RAZ de la camera
    camera.y = 0
    camera.vitesse = 1
end
  
function love.update(dt)

    -- Avance la camera
    camera.y = camera.y + camera.vitesse

    local n
    
    -- Traitement des tirs
    for n=#listeTirs,1,-1 do
        local tir = listeTirs[n]
        tir.y = tir.y + tir.vy
        tir.x = tir.x + tir.vx


        -- Vérifier si le tir est sortie de l'écran
        if tir.y < 0 or tir.y > hauteur then
            tir.supprime = true
            table.remove(listeTirs, n)
        end
    end    

    -- Traitement des aliens
    for n=#listeAliens, 1, -1 do
        local alien = listeAliens[n]

        if alien.y > 0 then
            alien.endormi = false
        end

        if alien.endormi == false then
            alien.x = alien.x + alien.vx
            alien.y = alien.y + alien.vy

            if alien.type == 1 or alien.type == 2 then
                alien.chronoTir = alien.chronoTir - 1
                if alien.chronoTir <= 0 then
                    alien.chronoTir = math.random(60,100)
                    creeTir("laser2", alien.x, alien.y, 0, 10)
                end
            elseif alien.type == 3 then
                alien.chronoTir = alien.chronoTir - 1
                if alien.chronoTir <= 0 then
                    alien.chronoTir = math.random(20,30)
                    local vx, vy
                    local angle
                    angle = math.angle(alien.x, alien.y, heros.x, heros.y)
                    vx = 10 * math.cos(angle)
                    vy = 10 * math.sin(angle)

                    creeTir("laser2", alien.x, alien.y, vx, vy)
                end
            end
        else
            alien.y = alien.y + camera.vitesse
        end

        if alien.y > hauteur then
            alien.supprime = true
            table.remove(listeAliens, n)
        end
    end

    -- Purge des listeSprites à supprimer
    for n=#listeSprites,1,-1 do
        if listeSprites[n].supprime then
            table.remove(listeSprites, n)
        end
    end

    if love.keyboard.isDown("right") and heros.x < largeur then
        heros.x = heros.x + 4
    end
    if love.keyboard.isDown("left") and heros.x > 0 then
        heros.x = heros.x - 4
    end
    if love.keyboard.isDown("down") and heros.y < hauteur then
        heros.y = heros.y + 4
    end
    if love.keyboard.isDown("up") and heros.y > 0 then
        heros.y = heros.y - 4
    end
end
  
function love.draw()

    -- Dessin du niveau
    local nbLignes = #niveau
    local ligne, colonne
    local x, y

    x=0 
    y=0 - 64 + camera.y

    for ligne=nbLignes, 1, -1 do
        for colonne=1, 16 do
            -- Dessine la tuile
            if niveau[ligne][colonne] > 0 then
                local tuile = niveau[ligne][colonne]
                love.graphics.draw(imgTuiles[tuile], x, y, 0, 2, 2)
            end
            x = x + 64
        end
        x = 0
        y = y - 64
    end

    local n

    for n=1,#listeSprites do
        local s = listeSprites[n]
        love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2,s.h/2)
    end

    love.graphics.print("Nombre de listeTirs = "..#listeTirs.." Nombre de listeSprites = "..#listeSprites.." Nombre d'aliens = "..#listeAliens, 0, 0)

end
  
function love.keypressed(key)
    if key == "space" or key == " " then 
        creeTir("laser1", heros.x, heros.y - heros.h, 0, -10)
    end
end