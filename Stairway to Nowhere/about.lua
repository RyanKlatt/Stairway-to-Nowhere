-----------------------------------------------------------------------------------------
--
-- menu.lua
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
	local background = display.newImageRect( "aboutApp.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	mainBtn = display.newImageRect( "mainStat.png", 90, 90 )
	mainBtn.x, mainBtn.y = 300, 260
	mainBtn:addEventListener("tap", onMainBtnRelease)
	
	main2Btn = display.newImageRect( "mainStat2.png", 90, 90 )
	main2Btn.x, main2Btn.y = 300, 260
	main2Btn.isVisible = false
	
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( mainBtn )
	sceneGroup:insert( main2Btn )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	composer.removeHidden()
	
	main2Btn.isVisible = false

		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	

	
	elseif phase == "did" then
	
		-- Called when the scene is now on screen


		
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