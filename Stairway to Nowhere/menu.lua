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
local function onPlayBtnRelease()
	
		play2Btn.isVisible = true
		
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 800 )
	
	return true	-- indicates successful touch
end

local function onBlindBtnRelease()
	
		blind2Btn.isVisible = true
	
	-- go to level1.lua scene
	composer.gotoScene( "blindLevel", "fade", 800 )
	
	return true	-- indicates successful touch
end

local function onStatsBtnRelease()
	
		stats2Btn.isVisible = true

	-- go to level1.lua scene
	composer.gotoScene( "stats", "fade", 800 )
	
	return true	-- indicates successful touch
end

local function onHowToBtnRelease()
	
		howTo2Btn.isVisible = true
		
	-- go to level1.lua scene
	composer.gotoScene( "howTo", "fade", 800 )
	
	return true	-- indicates successful touch
end

local function onAboutBtnRelease()
	
		about2Btn.isVisible = true
		
	-- go to level1.lua scene
	composer.gotoScene( "about", "fade", 800 )
	
	return true	-- indicates successful touch
end

local function onSoundBtnRelease()
	
	soundOnBtn.isVisible = false
	soundOffBtn.isVisible = true
	isAudioPlaying = false
	savedSoundNumber = "1"
	savetoSoundFile(savedSoundNumber)
	

	return true	-- indicates successful touch
end

local function onOffSoundBtnRelease()

	soundOffBtn.isVisible = false
	soundOnBtn.isVisible = true
	isAudioPlaying = true
	savedSoundNumber = "0"
	savetoSoundFile(savedSoundNumber)
	
	
	return true	-- indicates successful touch
end


function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "background2.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	playBtn = display.newImageRect( "playNowButton.png", 175, 40 )
	playBtn.x, playBtn.y = 240, 104
	playBtn:addEventListener("tap", onPlayBtnRelease)
	
	play2Btn = display.newImageRect( "playNow2Button.png", 175, 40 )
	play2Btn.x, play2Btn.y = 240, 104
	play2Btn.isVisible = false
	
	blindBtn = display.newImageRect( "blindButton.png", 175, 40 )
	blindBtn.x, blindBtn.y = 240, 149
	blindBtn:addEventListener("tap", onBlindBtnRelease)
	
	blind2Btn = display.newImageRect( "blind2Button.png", 175, 40 )
	blind2Btn.x, blind2Btn.y = 240, 149
	blind2Btn.isVisible = false
	
	statsBtn = display.newImageRect( "statsButton.png", 175, 40 )
	statsBtn.x, statsBtn.y = 240, 194
	statsBtn:addEventListener("tap", onStatsBtnRelease)
	
	stats2Btn = display.newImageRect( "stats2Button.png", 175, 40 )
	stats2Btn.x, stats2Btn.y = 240, 194
	stats2Btn.isVisible = false
	
	howToBtn = display.newImageRect( "howToButton.png", 175, 40 )
	howToBtn.x, howToBtn.y = 240, 239
	howToBtn:addEventListener("tap", onHowToBtnRelease)
	
	howTo2Btn = display.newImageRect( "howTo2Button.png", 175, 40 )
	howTo2Btn.x, howTo2Btn.y = 240, 239
	howTo2Btn.isVisible = false
	
	aboutBtn = display.newImageRect( "aboutButton.png", 175, 40 )
	aboutBtn.x, aboutBtn.y = 240, 284
	aboutBtn:addEventListener("tap", onAboutBtnRelease)
	
	about2Btn = display.newImageRect( "about2Button.png", 175, 40 )
	about2Btn.x, about2Btn.y = 240, 284
	about2Btn.isVisible = false
	
	soundOnBtn = display.newImageRect( "soundOn.png", 60, 60 )
	soundOnBtn.x, soundOnBtn.y = 380, 238
	soundOnBtn:addEventListener("tap", onSoundBtnRelease)
	
	soundOffBtn = display.newImageRect( "soundOff.png", 60, 60 )
	soundOffBtn.x, soundOffBtn.y = 380, 238
	soundOffBtn:addEventListener("tap", onOffSoundBtnRelease)

	

	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( playBtn )
	sceneGroup:insert( play2Btn )
	sceneGroup:insert( blindBtn )
	sceneGroup:insert( blind2Btn )
	sceneGroup:insert( statsBtn )
	sceneGroup:insert( stats2Btn )
	sceneGroup:insert( howToBtn )
	sceneGroup:insert( howTo2Btn )
	sceneGroup:insert( aboutBtn )
	sceneGroup:insert( about2Btn )
	sceneGroup:insert( soundOnBtn)
	sceneGroup:insert( soundOffBtn)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	composer.removeHidden()
	
	play2Btn.isVisible = false
	blind2Btn.isVisible = false
	stats2Btn.isVisible = false
	howTo2Btn.isVisible = false
	about2Btn.isVisible = false
	
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

savedSound = loadTextFile("savedSound.txt")

	function savetoSoundFile(data)
		local path = system.pathForFile("savedSound.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	
	
	if savedSound == nil then
		savedSoundNumber = "0"
		savetoSoundFile(savedSoundNumber)
		soundOnBtn.isVisible = true
		soundOffBtn.isVisible = false
		isAudioPlaying = true
	end

	if savedSound == "0" then
		soundOnBtn.isVisible = true
		soundOffBtn.isVisible = false
		isAudioPlaying = true
	end

	if savedSound == "1" then
		soundOnBtn.isVisible = false
		soundOffBtn.isVisible = true
		isAudioPlaying = false
	end
	
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