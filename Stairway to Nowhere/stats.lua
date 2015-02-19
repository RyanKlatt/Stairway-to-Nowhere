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
	
		main2Btn.isVisible = true
	
	
         composer.gotoScene( "menu", "fade", 800 )
	-- go to level1.lua scene
	
	
	return true	-- indicates successful touch
end

local function onBlindBtnRelease(event)
	
		blind2Btn.isVisible = true
	
	
         composer.gotoScene( "blindStats", "fade", 800 )
	-- go to level1.lua scene
	
	
	return true	-- indicates successful touch
end

function loadTextFile( fname, base )
	local base = base or system.DocumentsDirectory
	local path = system.pathForFile( fname, base )
	local txtData
	local file = io.open( path, "r" )
	if file then
	   txtData = file:read( "*n" )
	   io.close( file )
	end
	return txtData
end

function savetoCurrentAttemptFile(data)
		local path = system.pathForFile("currentAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoTotalAttemptFile(data)
		local path = system.pathForFile("totalAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoBestAttemptFile(data)
		local path = system.pathForFile("bestAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoFirstAttemptFile(data)
		local path = system.pathForFile("firstAttempt.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoCompletionsFile(data)
		local path = system.pathForFile("100Completions.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoCurrentPercentFile(data)
		local path = system.pathForFile("currentPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoBestPercentFile(data)
		local path = system.pathForFile("bestPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoTotalPercentFile(data)
		local path = system.pathForFile("totalPercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end
	
	function savetoAveragePercentFile(data)
		local path = system.pathForFile("averagePercent.txt", system.DocumentsDirectory)
		local file = io.open(path, "w+")
		
		local fileContent = file:read("*a")
		local newData = data 
		file:write(newData)
		
	
		io.close(file)
	end

savedCurrentAttempt = loadTextFile("currentAttempt.txt")
savedTotalAttempt = loadTextFile("totalAttempt.txt")
savedBestAttempt = loadTextFile("bestAttempt.txt")
savedFirstAttempt = loadTextFile("firstAttempt.txt")

savedCompletions = loadTextFile("100Completions.txt")

savedCurrentPercent = loadTextFile("currentPercent.txt")
savedBestPercent = loadTextFile("bestPercent.txt")
savedTotalPercent = loadTextFile("totalPercent.txt")
savedAveragePercent = loadTextFile("averagePercent.txt")


	if savedTotalPercent ~= nil then
	averagePercent = (savedTotalPercent / savedTotalAttempt) 
	savetoAveragePercentFile(averagePercent)
	end

	
	if savedCurrentAttempt == nil then
		currentAttempt = 0
		savetoCurrentAttemptFile(currentAttempt)
	end
	
	if savedTotalAttempt == nil then
		totalAttempt = 0
		savetoTotalAttemptFile(totalAttempt)
	end
	
	if savedFirstAttempt == nil then
		firstAttempt = 0
		savetoFirstAttemptFile(firstAttempt)
	end
	
	if savedCompletions == nil then
		completions = 0
		savetoCompletionsFile(completions)
	end
	
	if savedCurrentPercent == nil then
		currentPercent = 0
		savetoCurrentPercentFile(currentPercent)
	end
	
	if savedBestPercent == nil then
		bestPercent = 0
		savetoBestPercentFile(bestPercent)
	end
	
	if savedTotalPercent == nil then
		totalPercent = 0
		savetoTotalPercentFile(totalPercent)
	end
	
	if savedAveragePercent == nil then
		averagePercent = 0
		savetoAveragePercentFile(averagePercent)
	end
	
	if savedBestAttempt == nil then
		bestAttempt = 0
		savetoBestAttemptFile(bestAttempt)
	end
	
savedCurrentAttempt = loadTextFile("currentAttempt.txt")
savedTotalAttempt = loadTextFile("totalAttempt.txt")
savedBestAttempt = loadTextFile("bestAttempt.txt")
savedFirstAttempt = loadTextFile("firstAttempt.txt")

savedCompletions = loadTextFile("100Completions.txt")

savedCurrentPercent = loadTextFile("currentPercent.txt")
savedBestPercent = loadTextFile("bestPercent.txt")
savedTotalPercent = loadTextFile("totalPercent.txt")
savedAveragePercent = loadTextFile("averagePercent.txt")

function scene:create( event )



	local sceneGroup = self.view
	

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	


		local background = display.newImageRect( "normalModeBackground.png", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	sceneGroup:insert( background )
	
	mainBtn = display.newImageRect( "mainStat.png", 60, 60 )
	mainBtn.x, mainBtn.y = 70, 260
	mainBtn:addEventListener("touch", onMainBtnRelease)
	sceneGroup:insert( mainBtn )
	
	main2Btn = display.newImageRect( "mainStat2.png", 60, 60 )
	main2Btn.x, main2Btn.y = 70, 260
	main2Btn.isVisible = false
	sceneGroup:insert( main2Btn )
	
		blindBtn = display.newImageRect( "blindStatsButton.png", 60, 60 )
	blindBtn.x, blindBtn.y = 410, 260
	blindBtn:addEventListener("touch", onBlindBtnRelease)
	sceneGroup:insert( blindBtn )
	
	blind2Btn = display.newImageRect( "blindStatsButton2.png", 60, 60 )
	blind2Btn.x, blind2Btn.y = 410, 260
	blind2Btn.isVisible = false
	sceneGroup:insert( blind2Btn )


	currentAttempt = display.newText( "Current # of Attempts(resets to 0 after 100% completion):", 240, 70, "native.systemFontBold", 16 )
	currentAttempt:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(currentAttempt)
	
	currentAttempt1 = display.newText( tostring(savedCurrentAttempt), 240, 90, "native.systemFontBold", 14 )
	currentAttempt1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(currentAttempt1)
	
	
	totalAttempt = display.newText( "Total # of Attempts:", 240, 110, "native.systemFontBold", 16 )
	totalAttempt:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(totalAttempt)

	
	totalAttempt1 = display.newText( tostring(savedTotalAttempt), 240, 130, "native.systemFontBold", 14 )
	totalAttempt1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(totalAttempt1)

	
	bestPercent = display.newText( "Best Completion %:", 240, 150, "native.systemFontBold", 16 )
	bestPercent:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(bestPercent)

	
	bestPercent1 = display.newText( tostring(savedBestPercent).."%", 240, 170, "native.systemFontBold", 14 )
	bestPercent1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(bestPercent1)

	
	averagePercent = display.newText( "Average Completion %:", 240, 190, "native.systemFontBold", 16 )
	averagePercent:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(averagePercent)

	
	averagePercent1 = display.newText( string.format("%.2f", savedAveragePercent)  .. "%", 240, 210, "native.systemFontBold", 14 )
	averagePercent1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(averagePercent1)

	
	hundredPercent = display.newText( "100% Completions:", 240, 230, "native.systemFontBold", 16 )
	hundredPercent:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(hundredPercent)

	
	hundredPercent1 = display.newText( tostring(savedCompletions), 240, 250, "native.systemFontBold", 14 )
	hundredPercent1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(hundredPercent1)
	
	
	firstAttempt = display.newText( "Best # of Attempts to 100%:", 240, 270, "native.systemFontBold", 16 )
	firstAttempt:setFillColor( 1.0, 1.0, 1.0 )
	sceneGroup:insert(firstAttempt)

	
	firstAttempt1 = display.newText( tostring(savedBestAttempt), 240, 290, "native.systemFontBold", 14 )
	firstAttempt1:setFillColor( 1.0, 0.0, 0.0 )
	sceneGroup:insert(firstAttempt1)

	-- all display objects must be inserted into group
end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	

	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		
	composer.removeHidden()
	
	main2Btn.isVisible = false
	blind2Btn.isVisible = false
	
	

--currentAttempt1.text = tostring(savedCurrentAttempt)
--totalAttempt1.text = tostring(savedTotalAttempt)
--bestPercent1.text = tostring(savedBestPercent).. "%"

	
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