-----------------------------------------------------------------------------------------
--
-- stats.lua
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


local function onMainBtnRelease(event)
	
		main22Btn.isVisible = true
	
	
         composer.gotoScene( "menu", "fade", 800 )
	-- go to level1.lua scene
	
	
	return true	-- indicates successful touch
end

local function onBlindBtnRelease(event)
	
		normal2Btn.isVisible = true
	
	
         composer.gotoScene( "stats", "fade", 800 )
	-- go to level1.lua scene
	
	
	return true	-- indicates successful touch
end


function scene:create( event )



	local sceneGroup = self.view
	

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	
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


	function savetoCurrentAttemptFile(data)
		local path = system.pathForFile("currentBlindAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoTotalAttemptFile(data)
		local path = system.pathForFile("totalBlindAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoBestAttemptFile(data)
		local path = system.pathForFile("bestBlindAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoFirstAttemptFile(data)
		local path = system.pathForFile("firstBlindAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoCompletionsFile(data)
		local path = system.pathForFile("100BlindCompletions.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoCurrentPercentFile(data)
		local path = system.pathForFile("currentBlindPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoBestPercentFile(data)
		local path = system.pathForFile("bestBlindPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoTotalPercentFile(data)
		local path = system.pathForFile("totalBlindPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoAveragePercentFile(data)
		local path = system.pathForFile("averageBlindPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	savedBlindCurrentAttempt = loadTextFile("currentBlindAttempt.txt")
savedBlindTotalAttempt = loadTextFile("totalBlindAttempt.txt")
savedBlindBestAttempt = loadTextFile("bestBlindAttempt.txt")
savedBlindFirstAttempt = loadTextFile("firstBlindAttempt.txt")

savedBlindCompletions = loadTextFile("100BlindCompletions.txt")

savedBlindCurrentPercent = loadTextFile("currentBlindPercent.txt")
savedBlindBestPercent = loadTextFile("bestBlindPercent.txt")
savedBlindTotalPercent = loadTextFile("totalBlindPercent.txt")
savedBlindAveragePercent = loadTextFile("averageBlindPercent.txt")
	
		if savedBlindTotalPercent ~=  nil then
			averagePercent = (savedBlindTotalPercent / savedBlindTotalAttempt)
			savetoAveragePercentFile(averagePercent)
		end
	
	if savedBlindCurrentAttempt == nil then
		currentAttempt = 0
		savetoCurrentAttemptFile(currentAttempt)
	end
	
	if savedBlindTotalAttempt == nil then
		totalAttempt = 0
		savetoTotalAttemptFile(totalAttempt)
	end
	
	if savedBlindFirstAttempt == nil then
		firstAttempt = 0
		savetoFirstAttemptFile(firstAttempt)
	end
	
	if savedBlindCompletions == nil then
		completions = 0
		savetoCompletionsFile(completions)
	end
	
	if savedBlindCurrentPercent == nil then
		currentPercent = 0
		savetoCurrentPercentFile(currentPercent)
	end
	
	if savedBlindBestPercent == nil then
		bestPercent = 0
		savetoBestPercentFile(bestPercent)
	end
	
	if savedBlindTotalPercent == nil then
		totalPercent = 0
		savetoTotalPercentFile(totalPercent)
	end
	
	if savedBlindAveragePercent == nil then
		averagePercent = 0
		savetoAveragePercentFile(averagePercent)
	end
	
	if savedBlindBestAttempt == nil then
		bestAttempt = 0
		savetoBestAttemptFile(bestAttempt)
	end

savedBlindCurrentAttempt = loadTextFile("currentBlindAttempt.txt")
savedBlindTotalAttempt = loadTextFile("totalBlindAttempt.txt")
savedBlindBestAttempt = loadTextFile("bestBlindAttempt.txt")
savedBlindFirstAttempt = loadTextFile("firstBlindAttempt.txt")

savedBlindCompletions = loadTextFile("100BlindCompletions.txt")

savedBlindCurrentPercent = loadTextFile("currentBlindPercent.txt")
savedBlindBestPercent = loadTextFile("bestBlindPercent.txt")
savedBlindTotalPercent = loadTextFile("totalBlindPercent.txt")
savedBlindAveragePercent = loadTextFile("averageBlindPercent.txt")

	
	local background = display.newImageRect( "blindModeBackground.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	sceneGroup:insert( background )
	
	mainBtn = display.newImageRect( "mainStat.png", 60, 60 )
	mainBtn.x, mainBtn.y = 70, 260
	mainBtn:addEventListener("touch", onMainBtnRelease)
	sceneGroup:insert( mainBtn )
	
	main22Btn = display.newImageRect( "mainStat2.png", 60, 60 )
	main22Btn.x, main22Btn.y = 70, 260
	main22Btn.isVisible = false
	sceneGroup:insert( main22Btn )
	
		normalBtn = display.newImageRect( "normalStatsButton.png", 60, 60 )
	normalBtn.x, normalBtn.y = 410, 260
	normalBtn:addEventListener("touch", onBlindBtnRelease)
	sceneGroup:insert( normalBtn )
	
	normal2Btn = display.newImageRect( "normalStatsButton2.png", 60, 60 )
	normal2Btn.x, normal2Btn.y = 410, 260
	normal2Btn.isVisible = false
	sceneGroup:insert( normal2Btn )

	currentBlindAttempt = display.newText( "Current # of Attempts(resets to 0 after 100% completion):", 240, 70, "native.systemFontBold", 16 )
	currentBlindAttempt:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(currentBlindAttempt)
	
	currentBlindAttempt1 = display.newText( tostring(savedBlindCurrentAttempt), 240, 90, "native.systemFontBold", 14 )
	currentBlindAttempt1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(currentBlindAttempt1)

	
	totalBlindAttempt = display.newText( "Total # of Attempts:", 240, 110, "native.systemFontBold", 16 )
	totalBlindAttempt:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(totalBlindAttempt)
	
	totalBlindAttempt1 = display.newText( tostring(savedBlindTotalAttempt), 240, 130, "native.systemFontBold", 14 )
	totalBlindAttempt1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(totalBlindAttempt1)

	
	bestBlindPercent = display.newText( "Best Completion %:", 240, 150, "native.systemFontBold", 16 )
	bestBlindPercent:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(bestBlindPercent)
	
	bestBlindPercent1 = display.newText( tostring(savedBlindBestPercent).. "%", 240, 170, "native.systemFontBold", 14 )
	bestBlindPercent1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(bestBlindPercent1)
	
	
	averageBlindPercent = display.newText( "Average Completion %:", 240, 190, "native.systemFontBold", 16 )
	averageBlindPercent:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(averageBlindPercent)
	
	averageBlindPercent1 = display.newText( string.format("%.2f", savedBlindAveragePercent).. "%", 240, 210, "native.systemFontBold", 14 )
	averageBlindPercent1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(averageBlindPercent1)
	
	
	hundredBlindPercent = display.newText( "100% Completions:", 240, 230, "native.systemFontBold", 16 )
	hundredBlindPercent:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(hundredBlindPercent)

	hundredBlindPercent1 = display.newText( tostring(savedBlindCompletions), 240, 250, "native.systemFontBold", 14 )
	hundredBlindPercent1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(hundredBlindPercent1)

	
	firstBlindAttempt = display.newText( "Best # of Attempts to 100%:", 240, 270, "native.systemFontBold", 16 )
	firstBlindAttempt:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(firstBlindAttempt)
		
	firstBlindAttempt1 = display.newText( tostring(savedBlindBestAttempt), 240, 290, "native.systemFontBold", 14 )
	firstBlindAttempt1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(firstBlindAttempt1)


	

	
	-- all display objects must be inserted into group
end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
	composer.removeHidden()
	
	main22Btn.isVisible = false
	normal2Btn.isVisible = false


	
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