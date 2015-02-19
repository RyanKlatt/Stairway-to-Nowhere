-----------------------------------------------------------------------------------------
--
-- blindFail.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

-- include Corona's "physics" library
--local physics = require "physics"
--physics.start(); physics.pause()

--------------------------------------------

-- forward declarations and other locals


-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
		play2Btn.isVisible = true
		
	-- go to level1.lua scene
	composer.gotoScene( "blindLevel", "fade", 800 )
	
	return true	-- indicates successful touch
end

local function onMainBtnRelease()
	
		main2Btn.isVisible = true
	
	-- go to level1.lua scene
	composer.gotoScene( "menu", "fade", 800 )
	
	return true	-- indicates successful touch
end




function scene:create( event )



	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image

	
	percent = display.newText( "You completed "..tostring(savedBlindCurrentPercent ).."% of the level!", 240, 160, "native.systemFontBold", 24 )
	percent:setFillColor( 1.0, 1.0, 1.0 )
	
	attemptNumber = display.newText( "This was attempt # "..tostring(loadedBlindCurrentAttempt ), 240, 190, "native.systemFontBold", 24 )
	attemptNumber:setFillColor( 1.0, 1.0, 1.0 )
	
	local background = display.newImageRect( "fail.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	playBtn = display.newImageRect( "playAgainButton.png", 200, 50 )
	playBtn.x, playBtn.y = 130, 240
	playBtn:addEventListener("tap", onPlayBtnRelease)
	
	play2Btn = display.newImageRect( "playAgainButton2.png", 200, 50 )
	play2Btn.x, play2Btn.y = 130, 240
	play2Btn.isVisible = false
	
	mainBtn = display.newImageRect( "mainMenuButton.png", 200, 50 )
	mainBtn.x, mainBtn.y = 350, 240
	mainBtn:addEventListener("tap", onMainBtnRelease)
	
	main2Btn = display.newImageRect( "mainMenuButton2.png", 200, 50 )
	main2Btn.x, main2Btn.y = 350, 240
	main2Btn.isVisible = false
	
	-- all display objects must be inserted into group
	
	sceneGroup:insert( background )
	sceneGroup:insert( playBtn )
	sceneGroup:insert( play2Btn )
	sceneGroup:insert( mainBtn )
	sceneGroup:insert( main2Btn )
	sceneGroup:insert(percent)
	sceneGroup:insert(attemptNumber)
end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
	composer.removeHidden()
	
	play2Btn.isVisible = false
	main2Btn.isVisible = false
	
				function loadTextFile( fname, base )
	local base = base or system.DocumentsDirectory
	local path = system.pathForFile( fname, base )
	local txtData
	local file = io.open( path, "r" )
	if file then
	   txtData = file:read( "*a" )
	   io.close( file )
	end
	return txtData
end

savedBlindCurrentPercent = loadTextFile("currentBlindPercent.txt")
loadedBlindCurrentAttempt = loadTextFile("currentBlindAttempt.txt")

percent.text = "You completed ".. tostring(savedBlindCurrentPercent).. "% of the level!"
attemptNumber.text = "This was attempt #".. tostring(loadedBlindCurrentAttempt)
	
	elseif phase == "did" then
	
	
	
		-- Called when the scene is now on screen

		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	
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
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



-----------------------------------------------------------------------------------------

return scene