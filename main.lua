-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

heros = {}
sprites = {}
tirs = {}

sonShoot = love.audio.newSource("sons/shoot.wav", "static")

function creeSprite(pNomImage, pX, pY)
    sprite = {}
    sprite.x = pX
    sprite.y = pY
    sprite.supprime = false
    sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
    sprite.l = sprite.image:getWidth()
    sprite.h = sprite.image:getHeight()
    table.insert(sprites, sprite)

    return sprite
end

function love.load()

    love.window.setMode(1024, 768)
    love.window.setTitle("Mon super shooter !")
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    heros = creeSprite("heros", largeur/2, hauteur/2)
    heros.y = hauteur - heros.h*2
    
end
  
function love.update(dt)
    local n
    for n=#tirs,1,-1 do
        local tir = tirs[n]
        tir.y = tir.y + tir.v

        -- Vérifier si le tir est sortie de l'écran
        if tir.y < 0 or tir.y > hauteur then
            tir.supprime = true
            table.remove(tirs, n)
        end
    end    

    -- Purge des sprites à supprimer
    for n=#sprites,1,-1 do
        if sprites[n].supprime then
            table.remove(sprites, n)
        end
    end

    if love.keyboard.isDown("right") and heros.x < largeur then
        heros.x = heros.x + 10
    end
    if love.keyboard.isDown("left") and heros.x > 0 then
        heros.x = heros.x - 10
    end
    if love.keyboard.isDown("down") and heros.y < hauteur then
        heros.y = heros.y + 10
    end
    if love.keyboard.isDown("up") and heros.y > 0 then
        heros.y = heros.y - 10
    end
end
  
function love.draw()

    local n

    for n=1,#sprites do
        local s = sprites[n]
        love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2,s.h/2)
    end

    love.graphics.print("Nombre de tirs = "..#tirs.." Nombre de sprites = "..#sprites, 0, 0)

end
  
function love.keypressed(key)
    if key == "space" or key == " " then 
        local tir = creeSprite("laser1", heros.x, heros.y - heros.h)
        tir.v = -10
        table.insert(tirs, tir)

        sonShoot:play()
    end
end