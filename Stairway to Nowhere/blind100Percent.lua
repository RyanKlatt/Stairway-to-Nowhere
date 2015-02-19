-----------------------------------------------------------------------------------------
--
-- blind100Percent.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()


--------------------------------------------

-- forward declarations and other locals


-- 'onRelease' event listener for playBtn

local function goToPlay()

	composer.gotoScene( "blindLevel", "fade", 800 )
	
end

local function onPlayBtnRelease()
	
		play2Btn.isVisible = true
		
		timer.performWithDelay( 10,  goToPlay)
		
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
	
	crowdSound = audio.loadStream ( "Audio/clapping.mp3")

	
	wall1 = display.newRect( 240, 330, 480, 50 )
	wall1.strokeWidth = 3
	wall1:setFillColor( 0.0 )
	wall1:setStrokeColor( 0, 0, 1 )
	wall1.isVisible = false
	physics.addBody( wall1, "static", { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert(wall1)
	
	wall2 = display.newRect( -10, 160, 1000, 50 )
	wall2.rotation = 90
	wall2.strokeWidth = 3
	wall2:setFillColor( 0.0 )
	wall2:setStrokeColor( 0, 0, 1 )
	wall2.isVisible = false
	physics.addBody( wall2, "static", { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert(wall2)
	
	wall3 = display.newRect( 490, 160, 1000, 50 )
	wall3.rotation = 90
	wall3.strokeWidth = 3
	wall3:setFillColor( 0.0 )
	wall3:setStrokeColor( 0, 0, 1 )
	wall3.isVisible = false
	physics.addBody( wall3, "static", { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert(wall3)
	
	wall4 = display.newRect( 150, 130, 50, 10 )
	wall4.rotation = 0
	wall4.strokeWidth = 3
	wall4:setFillColor( 0.0 )
	wall4:setStrokeColor( 0, 0, 1 )
	wall4.isVisible = false
	physics.addBody( wall4, "static", { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert(wall4)
	
	wall5 = display.newRect( 320, 130, 50, 10 )
	wall5.rotation = 0
	wall5.strokeWidth = 3
	wall5:setFillColor( 0.0 )
	wall5:setStrokeColor( 0, 0, 1 )
	wall5.isVisible = false
	physics.addBody( wall5, "static", { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert(wall5)
	
		hundred1 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred1.x, hundred1.y = 100, -50
	hundred1.rotation = 0
	hundred1.isVisible = true
	physics.addBody( hundred1, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred1 )
	
		hundred2 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred2.x, hundred2.y = 100, -110
	hundred2.rotation = 0
	hundred2.isVisible = true
	physics.addBody( hundred2, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred2 )
	
	hundred3 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred3.x, hundred3.y = 360, -50
	hundred3.rotation = 0
	hundred3.isVisible = true
	physics.addBody( hundred3, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred3 )
	
	hundred4 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred4.x, hundred4.y = 360, -110
	hundred4.rotation = 0
	hundred4.isVisible = true
	physics.addBody( hundred4, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred4 )
	
		hundred5 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred5.x, hundred5.y = 240, -140
	hundred5.rotation = 0
	hundred5.isVisible = true
	physics.addBody( hundred5, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred5 )
	
			hundred6 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred6.x, hundred6.y = 100, -150
	hundred6.rotation = 0
	hundred6.isVisible = true
	physics.addBody( hundred6, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred6 )
	
		hundred7 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred7.x, hundred7.y = 100, -210
	hundred7.rotation = 0
	hundred7.isVisible = true
	physics.addBody( hundred7, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred7 )
	
	hundred8 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred8.x, hundred8.y = 360, -150
	hundred8.rotation = 0
	hundred8.isVisible = true
	physics.addBody( hundred8, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred8 )
	
	hundred9 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred9.x, hundred9.y = 360, -210
	hundred9.rotation = 0
	hundred9.isVisible = true
	physics.addBody( hundred9, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred9 )
	
		hundred10 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred10.x, hundred10.y = 240, -240
	hundred10.rotation = 0
	hundred10.isVisible = true
	physics.addBody( hundred10, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred10 )
	
			hundred11 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred11.x, hundred11.y = 100, -250
	hundred11.rotation = 0
	hundred11.isVisible = true
	physics.addBody( hundred11, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred11 )
	
		hundred12 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred12.x, hundred12.y = 100, -310
	hundred12.rotation = 0
	hundred12.isVisible = true
	physics.addBody( hundred12, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred12 )
	
	hundred13 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred13.x, hundred13.y = 360, -250
	hundred13.rotation = 0
	hundred13.isVisible = true
	physics.addBody( hundred13, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred13 )
	
	hundred14 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred14.x, hundred14.y = 360, -310
	hundred14.rotation = 0
	hundred14.isVisible = true
	physics.addBody( hundred14, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred14 )
	
		hundred15 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred15.x, hundred15.y = 240, -340
	hundred15.rotation = 0
	hundred15.isVisible = true
	physics.addBody( hundred15, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred15 )
	
			hundred16 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred16.x, hundred16.y = 100, -350
	hundred16.rotation = 0
	hundred16.isVisible = true
	physics.addBody( hundred16, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred16 )
	
		hundred17 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred17.x, hundred17.y = 100, -410
	hundred17.rotation = 0
	hundred17.isVisible = true
	physics.addBody( hundred17, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred17 )
	
	hundred18 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred18.x, hundred18.y = 360, -350
	hundred18.rotation = 0
	hundred18.isVisible = true
	physics.addBody( hundred18, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred18 )
	
	hundred19 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred19.x, hundred19.y = 360, -410
	hundred19.rotation = 0
	hundred19.isVisible = true
	physics.addBody( hundred19, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred19 )
	
		hundred20 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred20.x, hundred20.y = 240, -440
	hundred20.rotation = 0
	hundred20.isVisible = true
	physics.addBody( hundred20, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred20 )
	
			hundred21 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred21.x, hundred21.y = 100, -450
	hundred21.rotation = 0
	hundred21.isVisible = true
	physics.addBody( hundred21, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred21 )
	
		hundred22 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred22.x, hundred22.y = 100, -510
	hundred22.rotation = 0
	hundred22.isVisible = true
	physics.addBody( hundred22, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred22 )
	
	hundred23 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred23.x, hundred23.y = 360, -450
	hundred23.rotation = 0
	hundred23.isVisible = true
	physics.addBody( hundred23, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred23 )
	
	hundred24 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred24.x, hundred24.y = 360, -510
	hundred24.rotation = 0
	hundred24.isVisible = true
	physics.addBody( hundred24, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred24 )
	
		hundred25 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred25.x, hundred25.y = 240, -540
	hundred25.rotation = 0
	hundred25.isVisible = true
	physics.addBody( hundred25, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred25 )
	
			hundred26 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred26.x, hundred26.y = 100, -550
	hundred26.rotation = 0
	hundred26.isVisible = true
	physics.addBody( hundred26, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred26 )
	
		hundred27 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred27.x, hundred27.y = 100, -610
	hundred27.rotation = 0
	hundred27.isVisible = true
	physics.addBody( hundred27, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred27 )
	
	hundred28 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred28.x, hundred28.y = 360, -550
	hundred28.rotation = 0
	hundred28.isVisible = true
	physics.addBody( hundred28, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred28 )
	
	hundred29 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred29.x, hundred29.y = 360, -610
	hundred29.rotation = 0
	hundred29.isVisible = true
	physics.addBody( hundred29, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred29 )
	
		hundred30 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred30.x, hundred30.y = 240, -640
	hundred30.rotation = 0
	hundred30.isVisible = true
	physics.addBody( hundred30, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred30 )
	
			hundred31 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred31.x, hundred31.y = 100, -650
	hundred31.rotation = 0
	hundred31.isVisible = true
	physics.addBody( hundred31, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred31 )
	
		hundred32 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred32.x, hundred32.y = 100, -710
	hundred32.rotation = 0
	hundred32.isVisible = true
	physics.addBody( hundred32, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred32 )
	
	hundred33 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred33.x, hundred33.y = 360, -650
	hundred33.rotation = 0
	hundred33.isVisible = true
	physics.addBody( hundred33, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred33 )
	
	hundred34 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred34.x, hundred34.y = 360, -710
	hundred34.rotation = 0
	hundred34.isVisible = true
	physics.addBody( hundred34, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred34 )
	
		hundred35 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred35.x, hundred35.y = 240, -740
	hundred35.rotation = 0
	hundred35.isVisible = true
	physics.addBody( hundred35, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred35 )
	
			hundred36 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred36.x, hundred36.y = 100, -750
	hundred36.rotation = 0
	hundred36.isVisible = true
	physics.addBody( hundred36, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred36 )
	
		hundred37 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred37.x, hundred37.y = 100, -810
	hundred37.rotation = 0
	hundred37.isVisible = true
	physics.addBody( hundred37, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred37 )
	
	hundred38 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred38.x, hundred38.y = 360, -750
	hundred38.rotation = 0
	hundred38.isVisible = true
	physics.addBody( hundred38, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred38 )
	
	hundred39 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred39.x, hundred39.y = 360, -810
	hundred39.rotation = 0
	hundred39.isVisible = true
	physics.addBody( hundred39, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred39 )
	
		hundred40 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred40.x, hundred40.y = 240, -840
	hundred40.rotation = 0
	hundred40.isVisible = true
	physics.addBody( hundred40, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred40 )
	
			hundred41 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred41.x, hundred41.y = 100, -850
	hundred41.rotation = 0
	hundred41.isVisible = true
	physics.addBody( hundred41, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred41 )
	
		hundred42 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred42.x, hundred42.y = 100, -910
	hundred42.rotation = 0
	hundred42.isVisible = true
	physics.addBody( hundred42, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred42 )
	
	hundred46 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred46.x, hundred46.y = 360, -850
	hundred46.rotation = 0
	hundred46.isVisible = true
	physics.addBody( hundred46, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred46 )
	
	hundred43 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred43.x, hundred43.y = 360, -910
	hundred43.rotation = 0
	hundred43.isVisible = true
	physics.addBody( hundred43, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred43 )
	
		hundred44 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred44.x, hundred44.y = 240, -940
	hundred44.rotation = 0
	hundred44.isVisible = true
	physics.addBody( hundred44, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred44 )
	
			hundred45 = display.newImageRect( "hundredWhite.png", 100, 40 )
	hundred45.x, hundred45.y = 100, -950
	hundred45.rotation = 0
	hundred45.isVisible = true
	physics.addBody( hundred45, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred45 )
	
		hundred47 = display.newImageRect( "hundredBlue.png", 100, 40 )
	hundred47.x, hundred47.y = 100, -1010
	hundred47.rotation = 0
	hundred47.isVisible = true
	physics.addBody( hundred47, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred47 )
	
	hundred48 = display.newImageRect( "hundredGreen.png", 80, 20 )
	hundred48.x, hundred48.y = 360, -950
	hundred48.rotation = 0
	hundred48.isVisible = true
	physics.addBody( hundred48, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred48 )
	
	hundred49 = display.newImageRect( "hundredRed.png", 80, 20 )
	hundred49.x, hundred49.y = 360, -1010
	hundred49.rotation = 0
	hundred49.isVisible = true
	physics.addBody( hundred49, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred49 )
	
		hundred50 = display.newImageRect( "hundredYellow.png", 80, 20 )
	hundred50.x, hundred50.y = 240, -1040
	hundred50.rotation = 0
	hundred50.isVisible = true
	physics.addBody( hundred50, { isSensor = false, density= 30, friction=0.1, bounce=1 } )
	sceneGroup:insert( hundred50 )
	
		playBtn = display.newImageRect( "playAgainButton.png", 200, 40 )
	playBtn.x, playBtn.y = 130, 160
	playBtn:addEventListener("tap", onPlayBtnRelease)
	sceneGroup:insert( playBtn )
	
	play2Btn = display.newImageRect( "playAgainButton2.png", 200, 40 )
	play2Btn.x, play2Btn.y = 130, 160
	play2Btn.isVisible = false
	sceneGroup:insert( play2Btn )
	
	mainBtn = display.newImageRect( "mainMenuButton.png", 200, 40 )
	mainBtn.x, mainBtn.y = 350, 160
	mainBtn:addEventListener("tap", onMainBtnRelease)
	sceneGroup:insert( mainBtn )
	
	main2Btn = display.newImageRect( "mainMenuButton2.png", 200, 40 )
	main2Btn.x, main2Btn.y = 350, 160
	main2Btn.isVisible = false
	sceneGroup:insert( main2Btn )
	

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

savedCurrentPercent = loadTextFile("currentPercent.txt")
loadedCurrentAttempt = loadTextFile("currentAttempt.txt")


	
	elseif phase == "did" then
	
		if isAudioPlaying then
			if audioRewind then
				audio.resume()
				else
				audio.play(crowdSound)
			end
		end
	
		physics.start()
		physics.setGravity(0, 9.8)
	
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
		
		audio.stop()
		audio.rewind()
		audioRewind = audio.rewind()
		
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