-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local image

function love.load()
    largeur = love.graphics.getWidth()
    hauteur = love.graphics.getHeight()

    image = love.graphics.newImage("images/heros.png")
end
  
function love.update(dt)
  
end
  
function love.draw()

    love.graphics.line(largeur/2, 0, largeur/2, hauteur)
    love.graphics.line(0, hauteur/2, largeur, hauteur/2)

    local lHeros = image:getWidth()
    local hHeros = image:getHeight()

    love.graphics.draw(image,largeur/2,hauteur/2,0,1,1,lHeros/2,hHeros/2)
end
  
function love.keypressed(key)
    
end