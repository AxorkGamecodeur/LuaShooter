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

-- écran courant
ecranCourant = "menu"

victoire = false
timerVictoire = 0

imgMenu = love.graphics.newImage("images/menu.jpeg")
imgGameover = love.graphics.newImage("images/gameover.jpeg")
imgVictoire = love.graphics.newImage("images/victory.jpeg")


-- Images des tuiles
imgTuiles = {}
local n
for n=1, 3 do
    imgTuiles[n] = love.graphics.newImage("images/tuile_"..n..".png")
end

imgExplosion = {}
for n=1, 5 do
    imgExplosion[n] = love.graphics.newImage("images/explode_"..n..".png")
end

sonShoot = love.audio.newSource("sons/shoot.wav", "static")
sonExplode = love.audio.newSource("sons/explode_touch.wav", "static")

function math.angle(x1,y1,x2,y2) return math.atan2(y2-y1, x2-x1) end

function collide(a1, a2)
    if (a1==a2) then return false end
        local dx = a1.x - a2.x
        local dy = a1.y - a2.y
    if (math.abs(dx) < a1.image:getWidth()+a2.image:getWidth()) then
        if (math.abs(dy) < a1.image:getHeight()+a2.image:getHeight()) then
            return true
        end
    end
    return false
end

function creeTir(pType, pImage, pX, pY, pVitesseX, pVitesseY)
    local tir = creeSprite(pImage, pX, pY)
    tir.type = pType
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
    elseif pType == 10 then
        nomImage = "enemy3"
    end

    local alien = creeSprite(nomImage, pX, pY)

    alien.type = pType

    alien.endormi = true
    alien.chronoTir = 0

    if pType == 1 then
        alien.vy = 2
        alien.vx = 0    
        alien.energie = 1    
    elseif pType == 2 then
        alien.vy = 2
        alien.energie = 3
        local direction = math.random(1, 2)
        if direction == 1 then alien.vx = 1 else alien.vx = -1 end
    elseif pType == 3 then
        alien.vx = 0
        alien.vy = camera.vitesse
        alien.energie = 5
    elseif pType == 10 then
        alien.vx = 0
        alien.vy = camera.vitesse * 2
        alien.energie = 20
        alien.angle = 0
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

    sprite.frame = 1
    sprite.listeFrames = {}
    sprite.maxFrame = 1

    table.insert(listeSprites, sprite)

    return sprite
end

function creeExplosion(pX, pY)
    local nouvExplosion = creeSprite("explode_1", pX, pY)
    nouvExplosion.listeFrames = imgExplosion
    nouvExplosion.maxFrame = #imgExplosion
end

function love.load()

    love.window.setMode(1024, 768)
    love.window.setTitle("Mon super shooter !")
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    demarreJeu()
end

function demarreJeu()

    listeSprites = {}
    listeTirs = {}
    listeAliens = {}
    
    heros = creeSprite("heros", largeur/2, hauteur/2)

    heros.x = largeur/2
    heros.y = hauteur - heros.h*2
    
    local ligne = 4
    creeAlien(1, largeur/2, -64/2-64*(ligne-1))
    ligne=10
    creeAlien(2, largeur/2, -64/2-64*(ligne-1))
    ligne=11
    creeAlien(3, 64*3, -64/2-64*(ligne-1))

    ligne = #niveau
    creeAlien(10, largeur/2, -64/2-64*(ligne-1))

    -- RAZ de la camera
    camera.y = 0

    ecranCourant = "menu"
    victoire = false
    timerVictoire = 0
end

function updateJeu(dt)
    -- Avance la camera
    camera.y = camera.y + camera.vitesse

    local n
    
    -- Traitement des tirs
    for n=#listeTirs,1,-1 do
        local tir = listeTirs[n]
        tir.y = tir.y + tir.vy
        tir.x = tir.x + tir.vx

        -- Vérifier si on touche le heros
        if tir.type == "alien" then
            if collide(heros, tir) then
                tir.supprime = true
                table.remove(listeTirs, n)
                ecranCourant = "gameover"
            end
        end

        -- Vérifier si on touche l'alien
        if tir.type == "heros" then
            local nAlien
            for nAlien=#listeAliens, 1, -1 do
                local alien = listeAliens[nAlien]
                if alien.endormi == false then
                    if collide(alien, tir) then
                        creeExplosion(tir.x, tir.y)
                        alien.energie = alien.energie - 1 
                        tir.supprime = true
                        sonExplode:play()
                        table.remove(listeTirs, n)
                        if alien.energie <= 0 then
                            local nExplosion
                            for nExplosion=1,5 do
                                creeExplosion(alien.x + math.random(-10, 10), alien.y + math.random(-10, 10))
                            end
                            if alien.type == 10 then
                                victoire = true
                                timerVictoire = 500
                                for nExplosion=1,5 do
                                    creeExplosion(alien.x + math.random(-100, 100), alien.y + math.random(-100, 100))
                                end
                            end
                            alien.supprime = true
                            table.remove(listeAliens,nAlien)
                        end
                    end
                end
            end
        end

        -- Vérifier si le tir est sortie de l'écran
        if tir.y < 0 or tir.y > hauteur and tir.supprime == false then
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
                    creeTir("alien", "laser2", alien.x, alien.y, 0, 10)
                end
            elseif alien.type == 3 then
                alien.chronoTir = alien.chronoTir - 1
                if alien.chronoTir <= 0 then
                    alien.chronoTir = 40
                    local vx, vy
                    local angle
                    angle = math.angle(alien.x, alien.y, heros.x, heros.y)
                    vx = 10 * math.cos(angle)
                    vy = 10 * math.sin(angle)

                    creeTir("alien", "laser2", alien.x, alien.y, vx, vy)
                end
            elseif alien.type == 10 then
                if alien.y > hauteur/3 then
                    alien.y = hauteur/3
                end
                alien.chronoTir = alien.chronoTir - 1
                if alien.chronoTir <= 0 then
                    alien.chronoTir = 15
                    local vx, vy
                    alien.angle = alien.angle + 0.5
                    vx = 10 * math.cos(alien.angle)
                    vy = 10 * math.sin(alien.angle)

                    creeTir("alien", "laser2", alien.x, alien.y, vx, vy)
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

    -- Traitement et purge des sprites 
    for n=#listeSprites,1,-1 do
        local sprite = listeSprites[n]

        if sprite.maxFrame > 1 then
            sprite.frame = sprite.frame + 0.2
            if math.floor(sprite.frame) > sprite.maxFrame then
                sprite.supprime = true
            else
                sprite.image = sprite.listeFrames[math.floor(sprite.frame)]
            end
        end

        if sprite.supprime then
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

    if victoire then
        timerVictoire = timerVictoire - 1
        if timerVictoire == 0 then
            ecranCourant = "victoire"
        end
    end
end

function updateMenu(dt)

end
  
function love.update(dt)
    if ecranCourant == "jeu" then        
        updateJeu(dt)
    end
    if ecranCourant == "menu" then
        updateMenu(dt)
    end
end

function drawJeu()
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

function drawMenu()
    love.graphics.draw(imgMenu, 0, 0)
end

function drawGameover()
    love.graphics.draw(imgGameover, 0, 0)
end

function drawVictoire()
    love.graphics.draw(imgVictoire, 0, 0)
end
  
function love.draw()
    if ecranCourant == "jeu" then
        drawJeu()
    elseif ecranCourant == "menu" then
        drawMenu()
    elseif ecranCourant == "gameover" then
        drawGameover()
    elseif ecranCourant == "victoire" then
        drawVictoire()
    end
end
  
function love.keypressed(key)
    if ecranCourant == "jeu" then
        if key == "space" or key == " " then 
            creeTir("heros", "laser1", heros.x, heros.y - heros.h, 0, -10)
        end
    elseif ecranCourant == "menu" then
        if key == "space" or key == " " then 
            ecranCourant = "jeu"
        end
    elseif ecranCourant == "gameover" then
        if key == "space" or key == " " then 
            demarreJeu()
        end
    end
end