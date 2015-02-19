-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()

--physics.setDrawMode("hybrid")
--composer.isDebug = true

local widget = require "widget"

--------------------------------------------

local function onMainBtnRelease(event)
	
		main22Btn.isVisible = true
	
	
         composer.gotoScene( "menu", "fade", 800 )
	-- go to level1.lua scene
	
	
	return true	-- indicates successful touch
end


function scene:create( event )


	local sceneGroup = self.view
	

	jumpSound = audio.loadSound ( "Audio/jump.wav" )
	explosionSound = audio.loadSound ( "Audio/explosion.wav" )
	moveSound = audio.loadSound ( "Audio/move.wav" )


	local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5
	
	local function jumpBlockRight(event)

	if ( event.phase == "began" ) then
		if isAudioPlaying then
			audio.play (jumpSound)
		end
	greenBlock:applyForce( 50, -180, greenBlock.x, greenBlock.y )
	greenBlock:applyTorque(2.4)
	end
	
	return true
end

local function jumpBlockLeft(event)

	if ( event.phase == "began" ) then
		if isAudioPlaying then
			audio.play (jumpSound)
		end
	greenBlock:applyForce( -50, -180, greenBlock.x, greenBlock.y )
	greenBlock:applyTorque(-2.4)
	end
	
	return true
end

local function moveBlockRight(event)

	if ( event.phase == "began" ) then
		if isAudioPlaying then
			audio.play (moveSound)
		end
	greenBlock:applyForce( 101, 0, greenBlock.x, greenBlock.y )
	
	end
	
	return true
end

local function moveBlockLeft(event)

	if ( event.phase == "began" ) then
		if isAudioPlaying then
			audio.play (moveSound)
		end
	greenBlock:applyForce( -101, 0, greenBlock.x, greenBlock.y )
	
	end
	
	return true
end

local function wallVisible()
	
	spikeWall3.isVisible = false
	spikeWall4.isVisible = false
	
end


local function onSpikeWallCollision(event)
	
	local collision = event.other
	if collision.myName == "greenBlock" then
		if isAudioPlaying then
			audio.play ( explosionSound )
		end
	spikeWall3.isVisible = true
	transition.to( greenBlock,{ x=240 , y=240}  )
	physics.addBody( greenBlock, { isSensor = false, density= 1, friction=10, bounce=0 } )
	timer.performWithDelay( 10,  wallVisible)
	end
	return true
end
---------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------
local function onSpikeWall2Collision(event)
	
	local collision = event.other
	if collision.myName == "greenBlock" then
		if isAudioPlaying then
			audio.play ( explosionSound )
		end
	spikeWall4.isVisible = true
		transition.to( greenBlock,{ x=240 , y=240}  )
		physics.addBody( greenBlock, { isSensor = false, density= 1, friction=10, bounce=0 } )
		timer.performWithDelay( 10,  wallVisible)
	end
	return true
end

local function onTriangleCollision(event)
	local collision = event.other
	local target = event.target
	if collision.myName == "greenBlock" then
			if isAudioPlaying then
			audio.play ( explosionSound )
			end
			transition.to( greenBlock,{ x=240 , y=240}  )
			physics.addBody( greenBlock, { isSensor = false, density= 1, friction=10, bounce=0 } )
		else if (target.direction == "Down" and collision.myName == "spikeWall") then
			target:removeSelf()
			target = nil
		end
	end
	return true
end

local function onUpTriangleCollision(event)
	local collision = event.other
	local target = event.target
	if collision.myName == "greenBlock" then
			if isAudioPlaying then
			audio.play ( explosionSound )
			end
			transition.to( greenBlock,{ x=240 , y=240}  )
			physics.addBody( greenBlock, { isSensor = false, density= 1, friction=10, bounce=0 } )
		else if (target.direction == "Up" and collision.myName == "spikeWall2") then
			target:removeSelf()
			target = nil
		end
	end
	return true
end


	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	heading = display.newText( "Practice Controls Here!", 240, 20, "native.systemFontBold", 19 )
	heading:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(heading)
		
	moveLeft = display.newText( "<-- Move Left", 85, 70, "native.systemFontBold", 13 )
	moveLeft:setFillColor( 0.0, 0.7, 0.9 )
	sceneGroup:insert(moveLeft)
	
	jumpLeft = display.newText( "<-- Jump Left", 85, 240, "native.systemFontBold", 13 )
	jumpLeft:setFillColor( 0.0, 0.7, 0.9 )
	sceneGroup:insert(jumpLeft)
	
	moveRight = display.newText( "Move Right -->", 390, 70, "native.systemFontBold", 13 )
	moveRight:setFillColor( 0.0, 0.7, 0.9 )
	sceneGroup:insert(moveRight)
	
	jumpRight = display.newText( "Jump Right -->", 390, 240, "native.systemFontBold", 13 )
	jumpRight:setFillColor( 0.0, 0.7, 0.9 )
	sceneGroup:insert(jumpRight)
	
	mainBtn = display.newImageRect( "mainStat.png", 50, 50 )
	mainBtn.x, mainBtn.y = 240, 60
	mainBtn:addEventListener("touch", onMainBtnRelease)
	sceneGroup:insert( mainBtn )
	
	main22Btn = display.newImageRect( "mainStat2.png", 50, 50 )
	main22Btn.x, main22Btn.y = 240, 60
	main22Btn.isVisible = false
	sceneGroup:insert( main22Btn )
	
	background = display.newImageRect( "levelBackground2.png", 90, 380 )
	background.x, background.y = 0, 355
	background.rotation = 180
	physics.addBody( background, "static", { density= 30, friction=0.1, bounce=0 } )
	background:addEventListener("touch", jumpBlockLeft)
	sceneGroup:insert(background)
	
	background2 = display.newImageRect( "levelBackground2.png", 90, 380 )
	background2.x, background2.y = 480, 355
	physics.addBody( background2, "static", { density= 30, friction=0.1, bounce=0 } )
	background2:addEventListener("touch", jumpBlockRight)
	sceneGroup:insert(background2)
	
	background3 = display.newImageRect( "levelBackground.png", 90, 380 )
	background3.x, background3.y = 0, -30
	background3.rotation = 180
	physics.addBody( background3, "static", { density= 30, friction=0.1, bounce=0 } )
	background3:addEventListener("touch", moveBlockLeft)
	sceneGroup:insert(background3)
	
	background4 = display.newImageRect( "levelBackground.png", 90, 380 )
	background4.x, background4.y = 480, -30
	physics.addBody( background4, "static", { density= 30, friction=0.1, bounce=0 } )
	background4:addEventListener("touch", moveBlockRight)
	sceneGroup:insert(background4)
	
--[
	blueWall = display.newImageRect( "blueWall.png", 150, 25 )
	blueWall.x, blueWall.y = 240, 265
	blueWall.direction = "Down"
	blueWall.isVisible = true
	physics.addBody( blueWall, "static", { density= 200, friction=10, bounce=0 } )
	blueWall.gravityScale = 0.1
	blueWall.myName = "blueWall"
	sceneGroup:insert( blueWall)
	
		blueWall2 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall2.x, blueWall2.y = 370, 200
	blueWall2.direction = "Down"
	blueWall2.isVisible = true
	physics.addBody( blueWall2, "static", { density= 200, friction=10, bounce=0 } )
	blueWall2.gravityScale = 0.1
	blueWall2.myName = "blueWall2"
	sceneGroup:insert( blueWall2)
	
			blueWall3 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall3.x, blueWall3.y = 110, 200
	blueWall3.direction = "Down"
	blueWall3.isVisible = true
	physics.addBody( blueWall3, "static", { density= 200, friction=10, bounce=0 } )
	blueWall3.gravityScale = 0.1
	blueWall3.myName = "blueWall3"
	sceneGroup:insert( blueWall3)
	
	blueWall4 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall4.x, blueWall4.y = 150, 100
	physics.addBody( blueWall4, "static", { density= 200, friction=10, bounce=0 } )
	sceneGroup:insert( blueWall4)
	
	blueWall5 = display.newImageRect( "blueWall.png", 35, 25 )
	blueWall5.x, blueWall5.y = 70, 150
	physics.addBody( blueWall5, "static", { density= 200, friction=10, bounce=0 } )
	sceneGroup:insert( blueWall5)
	
	blueWall6 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall6.x, blueWall6.y = 240, 150
	physics.addBody( blueWall6, "static", { density= 200, friction=10, bounce=0 } )
	sceneGroup:insert( blueWall6)
	
		blueWall7 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall7.x, blueWall7.y = 330, 100
	physics.addBody( blueWall7, "static", { density= 200, friction=10, bounce=0 } )
	sceneGroup:insert( blueWall7)
	
	blueWall8 = display.newImageRect( "blueWall.png", 35, 25 )
	blueWall8.x, blueWall8.y = 410, 150
	physics.addBody( blueWall8, "static", { density= 200, friction=10, bounce=0 } )
	sceneGroup:insert( blueWall8)

	orangeTriangle = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle.x, orangeTriangle.y = 240, 95
	orangeTriangle.rotation = 180
	orangeTriangleShape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle, "static", { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangleShape } )
	orangeTriangle:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle )
	
		orangeTriangle2 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle2.x, orangeTriangle2.y = 82, 175
	orangeTriangle2.rotation = 90
	orangeTriangleShape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle2, "static", { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangleShape } )
	orangeTriangle2:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle2 )
	
	orangeTriangle3 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle3.x, orangeTriangle3.y = 395, 175
	orangeTriangle3.rotation = 270
	orangeTriangleShape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle3, "static", { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangleShape } )
	orangeTriangle3:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle3 )
	
	cheaterBlock66 = display.newImageRect( "cheaterBlock.png", 70, 25)
	cheaterBlock66.x, cheaterBlock66.y = 240, 180
	cheaterBlock66.rotation = 180
	physics.addBody( cheaterBlock66, "static", { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock66:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock66)
	
	
	spikeWall = display.newImageRect( "spikeWall.png", 390, 100 )
	spikeWall.x, spikeWall.y = 240, 360
	physics.addBody( spikeWall, "static", { isSensor = true, density= 30, friction=0.1, bounce=0 } )
	spikeWall.myName = "spikeWall"
	spikeWall:addEventListener("collision", onSpikeWallCollision)
	sceneGroup:insert( spikeWall )
	
	spikeWall2 = display.newImageRect( "spikeWall.png", 390, 100 )
	spikeWall2.x, spikeWall2.y = 240, -40
	spikeWall2.rotation = 180
	physics.addBody( spikeWall2, "static", { isSensor = true, density= 30, friction=0.1, bounce=0 } )
	spikeWall2.myName = "spikeWall2"
	spikeWall2:addEventListener("collision", onSpikeWall2Collision)
	sceneGroup:insert( spikeWall2 )
	
	spikeWall3 = display.newImageRect( "spikeWall2.png", 390, 100 )
	spikeWall3.x, spikeWall3.y = 240, 360
	spikeWall3.isVisible = false
	physics.addBody( spikeWall3, "static", { isSensor = true, density= 30, friction=0.1, bounce=0 } )
	sceneGroup:insert( spikeWall3 )
	
	spikeWall4 = display.newImageRect( "spikeWall2.png", 390, 100 )
	spikeWall4.x, spikeWall4.y = 240, -40
	spikeWall4.rotation = 180
	spikeWall4.isVisible = false
	physics.addBody( spikeWall4, "static", { isSensor = true, density= 30, friction=0.1, bounce=0 } )
	sceneGroup:insert( spikeWall4 )
	
	
	greenBlock = display.newImageRect( "greenBlock.png", 20, 20 )
	greenBlock.x, greenBlock.y = 240, 240
	--greenBlock.x, greenBlock.y = 70, 70
	greenBlock.isVisible = true
	physics.addBody( greenBlock, { isSensor = false, density= 1, friction=10, bounce=0 } )
	greenBlock.gravityScale = 3
	greenBlock.isAwake = true
	greenBlock.myName = "greenBlock"
	sceneGroup:insert( greenBlock )

	
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		composer.removeHidden()

		
	elseif phase == "did" then
		-- Called when the scene is now on screen
		
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		
		physics.start()
		physics.setGravity(0, 9.8)
	end
	
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	
		
	elseif phase == "did" then
		-- Called when the scene is now off screen
		
		

	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.

	local sceneGroup = self.view
	
	
	--package.loaded[physics] = nil
	--physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


-----------------------------------------------------------------------------------------

return scene