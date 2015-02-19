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

savedCurrentAttempt = loadTextFile("currentAttempt.txt")
savedTotalAttempt = loadTextFile("totalAttempt.txt")
savedBestAttempt = loadTextFile("bestAttempt.txt")
savedFirstAttempt = loadTextFile("firstAttempt.txt")

savedCompletions = loadTextFile("100Completions.txt")

savedCurrentPercent = loadTextFile("currentPercent.txt")
savedBestPercent = loadTextFile("bestPercent.txt")
savedTotalPercent = loadTextFile("totalPercent.txt")
savedAveragePercent = loadTextFile("averagePercent.txt")



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
	
	currentPercent = 0
	savetoCurrentPercentFile(currentPercent)
	
	if savedCurrentAttempt == nil then
		currentAttempt = 1
		savetoCurrentAttemptFile(currentAttempt)
		else 
		currentAttempt = savedCurrentAttempt + 1
		savetoCurrentAttemptFile(currentAttempt)
	end
	
	if savedTotalAttempt == nil then
		totalAttempt = 1
		savetoTotalAttemptFile(totalAttempt)
		else 
		totalAttempt = savedTotalAttempt + 1
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
		
	jumpSound = audio.loadSound ( "Audio/jump.wav" )
	explosionSound = audio.loadSound ( "Audio/explosion.wav" )
	moveSound = audio.loadSound ( "Audio/move.wav" )
	finishSound = audio.loadSound ( "Audio/finishLine.wav")
	backgroundMusic = audio.loadStream ( "Audio/backgroundMusic.wav")

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

local function onGravityCollision(event)
	local collision = event.other
	if collision.myName == "greenBlock" then
	blueWall4.gravityScale = -0.1
	blueWall5.gravityScale = -0.1
	end
	return true
end

local function goToFail()

	
	composer.gotoScene("fail", "fade", 800)
	
end

local function bodyActive()
	
	local collision = myCollision
	
	if collision == "blueWall117" then
	
		orangeTriangle44.isBodyActive = true
		
		orangeTriangle45.isBodyActive = true
		
		orangeTriangle46.isBodyActive = true
		
		orangeTriangle47.isBodyActive = true
	
		cheaterBlock35.isBodyActive = true
	
		cheaterBlock36.isBodyActive = true
	end
	
	if collision == "blueWall82" then
	
		cheaterBlock23.isBodyActive = true
		
		cheaterBlock24.isBodyActive = true
		
		cheaterBlock25.isBodyActive = true
		
		cheaterBlock26.isBodyActive = true
		
		orangeTriangle31.isBodyActive = true
		
		orangeTriangle32.isBodyActive = true
		
		orangeTriangle33.isBodyActive = true
		
		orangeTriangle34.isBodyActive = true
	end
	
	if collision == "blueWall72" then
	
		cheaterBlock18.isBodyActive = true
		
		cheaterBlock19.isBodyActive = true
		
		cheaterBlock20.isBodyActive = true
		
		cheaterBlock21.isBodyActive = true
		
		cheaterBlock22.isBodyActive = true
	end
	
	if collision == "blueWall38" then
	
		cheaterBlock15.isBodyActive = true
		
		cheaterBlock16.isBodyActive = true
		
		cheaterBlock17.isBodyActive = true
		
		orangeTriangle29.isBodyActive = true
		
		orangeTriangle30.isBodyActive = true
	end
	
	if collision == "blueWall35" then
			
		cheaterBlock12.isBodyActive = true
		
		cheaterBlock13.isBodyActive = true
		
		cheaterBlock14.isBodyActive = true
		
		orangeTriangle25.isBodyActive = true
		
		orangeTriangle26.isBodyActive = true
		
		orangeTriangle27.isBodyActive = true
		
		orangeTriangle28.isBodyActive = true
		
	end
	
	if collision == "blueWall30" then
	
		cheaterBlock6.isBodyActive = true
		
		cheaterBlock7.isBodyActive = true
		
		cheaterBlock8.isBodyActive = true
	end
	
	if collision == "blueWall18" then
	
		cheaterBlock9.isBodyActive = true
		
		cheaterBlock10.isBodyActive = true
		
		cheaterBlock11.isBodyActive = true
		
		orangeTriangle21.isBodyActive = true
		
		orangeTriangle22.isBodyActive = true
		
		orangeTriangle23.isBodyActive = true
		
		orangeTriangle24.isBodyActive = true
	end
	
	if collision == "blueWall11" then
	
		orangeTriangle18.isBodyActive = true
		
		orangeTriangle19.isBodyActive = true
		
		orangeTriangle20.isBodyActive = true
		
		cheaterBlock0.isBodyActive = true
		
	end
	
	if collision == "blueWall113" then
	
		cheaterBlock32.isBodyActive = true
		
		cheaterBlock33.isBodyActive = true
		
		cheaterBlock34.isBodyActive = true
	end
	
	if collision == "blueWall105" then
	
		cheaterBlock30.isBodyActive = true
		
		cheaterBlock31.isBodyActive = true
		
		orangeTriangle41.isBodyActive = true
		
		orangeTriangle42.isBodyActive = true
		
		orangeTriangle43.isBodyActive = true
	end
	
	if collision == "blueWall97" then
	
		cheaterBlock28.isBodyActive = true
		
		cheaterBlock29.isBodyActive = true
		
		orangeTriangle38.isBodyActive = true
		
		orangeTriangle39.isBodyActive = true
		
		orangeTriangle40.isBodyActive = true
	end
	
	if collision == "blueWall89" then
	
		cheaterBlock27.isBodyActive = true
		
		orangeTriangle35.isBodyActive = true
		
		orangeTriangle36.isBodyActive = true
		
		orangeTriangle37.isBodyActive = true
	end
	
	if collision == "blueWall9" then
	
		cheaterBlock4.isBodyActive = true
		
		orangeTriangle17.isBodyActive = true
	end
	
	if collision == "blueWall119" then 
	
		cheaterBlock37.isBodyActive = true
		
		cheaterBlock38.isBodyActive = true
		
		cheaterBlock39.isBodyActive = true
		
		cheaterBlock40.isBodyActive = true
		
		cheaterBlock41.isBodyActive = true
		
		cheaterBlock42.isBodyActive = true
	end
	
	if collision == "blueCircle5" then
	
		cheaterBlock43.isBodyActive = true
		
		cheaterBlock44.isBodyActive = true
		
		cheaterBlock45.isBodyActive = true
		
		cheaterBlock56.isBodyActive = true
	end
	
	if collision == "blueCircle8" then
	
		cheaterBlock46.isBodyActive = true
		
		cheaterBlock47.isBodyActive = true
		
		cheaterBlock48.isBodyActive = true
		
		cheaterBlock49.isBodyActive = true
		
		cheaterBlock50.isBodyActive = true
		
		cheaterBlock51.isBodyActive = true
		
		cheaterBlock52.isBodyActive = true
		
		cheaterBlock53.isBodyActive = true
		
		cheaterBlock54.isBodyActive = true
		
		cheaterBlock55.isBodyActive = true
		
		cheaterBlock57.isBodyActive = true
		
		cheaterBlock58.isBodyActive = true
		
		cheaterBlock59.isBodyActive = true
		
	end
	
	if collision == "blueCircle14" then
	
		orangeTriangle48.isBodyActive = true
		
		orangeTriangle49.isBodyActive = true
		
		orangeTriangle50.isBodyActive = true
		
		orangeTriangle51.isBodyActive = true
		
		orangeTriangle52.isBodyActive = true
		
	end
	
	if collision == "blueWall184" then
	
		finishLine.isBodyActive = true
		
	end
	
	if collision == "blueWall161" then
	
		cheaterBlock60.isBodyActive = true
		
		cheaterBlock61.isBodyActive = true
		
		cheaterBlock62.isBodyActive = true
		
		cheaterBlock63.isBodyActive = true
		
		cheaterBlock64.isBodyActive = true
		
		cheaterBlock65.isBodyActive = true
		
		cheaterBlock66.isBodyActive = true
	
	end
	
end

local function onSpikeWallCollision(event)
	
	local collision = event.other
	if collision.myName == "greenBlock" then
		if isAudioPlaying then
			audio.play ( explosionSound )
		end
	spikeWall3.isVisible = true
	greenBlock.isVisible = false
	timer.performWithDelay( 10,  goToFail)
	end
	if collision.myName == "blueWall9" then
	
		myCollision = "blueWall9"
		
		blueWall11.isAwake = true
		blueWall11.isSensor = false
		
		blueWall12.isAwake = true
		blueWall12.isSensor = false
		
		blueWall13.isAwake = true
		blueWall13.isSensor = false
		
		blueWall14.isAwake = true
		blueWall14.isSensor = false
		
		blueWall15.isAwake = true
		blueWall15.isSensor = false
		
		blueWall16.isAwake = true
		blueWall16.isSensor = false
		
		blueWall17.isAwake = true
		blueWall17.isSensor = false
		
		blueWall18.isAwake = true
		blueWall18.isSensor = false
		
		cheaterBlock4.isAwake = true
		
		orangeTriangle17.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall89" then
	
		myCollision = "blueWall89"
		
		blueWall91.isVisible = true
		blueWall91.isSensor = false
		blueWall91.isAwake = true
		
		blueWall92.isVisible = true
		blueWall92.isSensor = false
		blueWall92.isAwake = true
		
		blueWall93.isVisible = true
		blueWall93.isSensor = false
		blueWall93.isAwake = true
		
		blueWall94.isVisible = true
		blueWall94.isSensor = false
		blueWall94.isAwake = true
		
		blueWall95.isVisible = true
		blueWall95.isSensor = false
		blueWall95.isAwake = true
		
		blueWall96.isVisible = true
		blueWall96.isSensor = false
		blueWall96.isAwake = true
		
		blueWall97.isVisible = true
		blueWall97.isSensor = false
		blueWall97.isAwake = true
		
		blueWall98.isVisible = true
		blueWall98.isSensor = false
		blueWall98.isAwake = true
		
		cheaterBlock27.isAwake = true
		
		orangeTriangle35.isAwake = true
		
		orangeTriangle36.isAwake = true
		
		orangeTriangle37.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
		if collision.myName == "blueWall97" then
		
		myCollision = "blueWall97"
		
		blueWall99.isVisible = true
		blueWall99.isSensor = false
		blueWall99.isAwake = true
		
		blueWall100.isVisible = true
		blueWall100.isSensor = false
		blueWall100.isAwake = true
		
		blueWall101.isVisible = true
		blueWall101.isSensor = false
		blueWall101.isAwake = true
		
		blueWall102.isVisible = true
		blueWall102.isSensor = false
		blueWall102.isAwake = true
		
		blueWall103.isVisible = true
		blueWall103.isSensor = false
		blueWall103.isAwake = true
		
		blueWall104.isVisible = true
		blueWall104.isSensor = false
		blueWall104.isAwake = true
		
		blueWall105.isVisible = true
		blueWall105.isSensor = false
		blueWall105.isAwake = true
		
		blueWall106.isVisible = true
		blueWall106.isSensor = false
		blueWall106.isAwake = true
		
		cheaterBlock28.isAwake = true
		
		cheaterBlock29.isAwake = true
		
		orangeTriangle38.isAwake = true
		
		orangeTriangle39.isAwake = true
		
		orangeTriangle40.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
		if collision.myName == "blueWall105" then
		--if collision.myName == "blueWallTest" then
		
		myCollision = "blueWall105"
		
		blueWall107.isVisible = true
		blueWall107.isSensor = false
		blueWall107.isAwake = true
		
		blueWall108.isVisible = true
		blueWall108.isSensor = false
		blueWall108.isAwake = true
		
		blueWall109.isVisible = true
		blueWall109.isSensor = false
		blueWall109.isAwake = true
		
		blueWall110.isVisible = true
		blueWall110.isSensor = false
		blueWall110.isAwake = true
		
		blueWall111.isVisible = true
		blueWall111.isSensor = false
		blueWall111.isAwake = true
		
		blueWall112.isVisible = true
		blueWall112.isSensor = false
		blueWall112.isAwake = true
		
		blueWall113.isVisible = true
		blueWall113.isSensor = false
		blueWall113.isAwake = true
		
		blueWall114.isVisible = true
		blueWall114.isSensor = false
		blueWall114.isAwake = true
		
		cheaterBlock30.isAwake = true
		
		cheaterBlock31.isAwake = true
		
		orangeTriangle41.isAwake = true
		
		orangeTriangle42.isAwake = true
		
		orangeTriangle43.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall113" then
	
		myCollision = "blueWall113"
		
		blueWall115.isVisible = true
		blueWall115.isSensor = false
		blueWall115.isAwake = true
		
		blueWall116.isVisible = true
		blueWall116.isSensor = false
		blueWall116.isAwake = true
		
		blueWall117.isVisible = true
		blueWall117.isSensor = false
		blueWall117.isAwake = true
		
		blueWall118.isSensor = false
		blueWall118.isAwake = true
		
		cheaterBlock32.isAwake = true
		
		cheaterBlock33.isAwake = true
		
		cheaterBlock34.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall184" then
	
	--if collision.myName == "blueWallTest" then
	
		myCollision = "blueWall184"
		
		--greenBlock.isVisible = true
		--greenBlock.isSensor = false
		--greenBlock.isAwake = true
		
		blueWall199.isVisible = true
		blueWall199.isSensor = false
		blueWall199.isAwake = true
		
		blueWall200.isVisible = true
		blueWall200.isSensor = false
		blueWall200.isAwake = true
		
		blueWall201.isVisible = true
		blueWall201.isSensor = false
		blueWall201.isAwake = true
		
		blueWall202.isVisible = true
		blueWall202.isSensor = false
		blueWall202.isAwake = true
		
		blueWall203.isVisible = true
		blueWall203.isSensor = false
		blueWall203.isAwake = true
		
		blueWall204.isVisible = true
		blueWall204.isSensor = false
		blueWall204.isAwake = true
		
		blueWall205.isVisible = true
		blueWall205.isSensor = false
		blueWall205.isAwake = true
		
		blueWall206.isVisible = true
		blueWall206.isSensor = false
		blueWall206.isAwake = true
		
		blueWall207.isVisible = true
		blueWall207.isSensor = false
		blueWall207.isAwake = true
		
		blueWall208.isVisible = true
		blueWall208.isSensor = false
		blueWall208.isAwake = true
		
		blueWall209.isVisible = true
		blueWall209.isSensor = false
		blueWall209.isAwake = true
	
		
		finishLine.isVisible = true
		finishLine.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
	
	end
	
	if collision.direction == "Down" then
			if collision.isEven then
	
				currentPercent = currentPercent + 1
				savetoCurrentPercentFile(currentPercent)
				completion.text = tostring(currentPercent) .. "%"
			end
		collision:removeSelf()
		collision = nil
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
	greenBlock.isVisible = false
	timer.performWithDelay( 10,  goToFail)
	end
	
	if collision.myName == "blueWall11" then
	
		myCollision = "blueWall11"
	
		orangeTriangle18.isAwake = true
		
		orangeTriangle19.isAwake = true
		
		orangeTriangle20.isAwake = true
		
		cheaterBlock0.isAwake = true
		
		blueWall19.isSensor = false
		blueWall19.isAwake = true
		
		blueWall20.isSensor = false
		blueWall20.isAwake = true
		
		blueWall21.isSensor = false
		blueWall21.isAwake = true
		
		blueWall22.isSensor = false
		blueWall22.isAwake = true
		
		blueWall23.isSensor = false
		blueWall23.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	if collision.myName == "blueWall18" then
	
		myCollision = "blueWall18"
		
		blueWall24.isVisible = true
		blueWall24.isSensor = false
		blueWall24.isAwake = true
		
		blueWall25.isVisible = true
		blueWall25.isSensor = false
		blueWall25.isAwake = true
		
		blueWall26.isVisible = true
		blueWall26.isSensor = false
		blueWall26.isAwake = true
		
		blueWall27.isSensor = false
		blueWall27.isAwake = true
		
		blueWall28.isSensor = false
		blueWall28.isAwake = true
		
		blueWall29.isSensor = false
		blueWall29.isAwake = true
		
		blueWall30.isSensor = false
		blueWall30.isAwake = true
		
		blueWall31.isSensor = false
		blueWall31.isAwake = true
		
		blueWall32.isSensor = false
		blueWall32.isAwake = true
		
		cheaterBlock9.isAwake = true
		
		cheaterBlock10.isAwake = true
		
		cheaterBlock11.isAwake = true
		
		orangeTriangle21.isAwake = true
		
		orangeTriangle22.isAwake = true
		
		orangeTriangle23.isAwake = true
		
		orangeTriangle24.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
		
	end
	if collision.myName == "blueWall30" then
	
		myCollision = "blueWall30"
		
		blueWall33.isSensor = false
		blueWall33.isAwake = true
		
		cheaterBlock6.isAwake = true
		
		cheaterBlock7.isAwake = true
		
		cheaterBlock8.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
	
	end
	if collision.myName == "blueWall32" then
		
		blueWall34.isVisible = true
		blueWall34.isSensor = false
		blueWall34.isAwake = true
		
		blueWall35.isSensor = false
		blueWall35.isAwake = true
		
		blueWall36.isSensor = false
		blueWall36.isAwake = true
		
	end
	if collision.myName == "blueWall35" then
	
		myCollision = "blueWall35"
		
		blueWall37.isVisible = true
		blueWall37.isSensor = false
		blueWall37.isAwake = true
		
		blueWall38.isSensor = false
		blueWall38.isAwake = true
		
		blueWall39.isSensor = false
		blueWall39.isAwake = true
		
		blueWall40.isSensor = false
		blueWall40.isAwake = true
		
		cheaterBlock12.isAwake = true
		
		cheaterBlock13.isAwake = true
		
		cheaterBlock14.isAwake = true
		
		orangeTriangle25.isAwake = true
		
		orangeTriangle26.isAwake = true
		
		orangeTriangle27.isAwake = true
		
		orangeTriangle28.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	if collision.myName == "blueWall38" then
	--if collision.myName == "blueWallTest" then
	
		myCollision = "blueWall38"
		
		blueWall41.isVisible = true
		blueWall41.isSensor = false
		blueWall41.isAwake = true
		
		blueWall42.isVisible = true
		blueWall42.isSensor = false
		blueWall42.isAwake = true
		
		blueWall43.isVisible = true
		blueWall43.isSensor = false
		blueWall43.isAwake = true
		
		blueWall44.isSensor = false
		blueWall44.isAwake = true
		
		cheaterBlock15.isAwake = true
		
		cheaterBlock16.isAwake = true
		
		cheaterBlock17.isAwake = true
		
		orangeTriangle29.isAwake = true
		
		orangeTriangle30.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	--if collision.myName == "blueWallTest" then
	if collision.myName == "blueWall42" then
	
		blueWall45.isVisible = true
		blueWall45.isSensor = false
		blueWall45.isAwake = true
		
		blueWall46.isVisible = true
		blueWall46.isSensor = false
		blueWall46.isAwake = true
		
		blueWall47.isSensor = false
		blueWall47.isAwake = true
		
		blueWall48.isSensor = false
		blueWall48.isAwake = true
		
		blueWall49.isSensor = false
		blueWall49.isAwake = true
		
		blueWall50.isSensor = false
		blueWall50.isAwake = true
		
		blueWall51.isSensor = false
		blueWall51.isAwake = true
		
		blueWall52.isSensor = false
		blueWall52.isAwake = true
		
		blueWall53.isSensor = false
		blueWall53.isAwake = true
		
		blueWall54.isSensor = false
		blueWall54.isAwake = true
		
		blueWall55.isSensor = false
		blueWall55.isAwake = true
		
		blueWall56.isSensor = false
		blueWall56.isAwake = true
		
		blueWall57.isSensor = false
		blueWall57.isAwake = true
		
		blueWall58.isSensor = false
		blueWall58.isAwake = true
		
		blueWall59.isSensor = false
		blueWall59.isAwake = true
		
		blueWall60.isSensor = false
		blueWall60.isAwake = true
		
		blueWall61.isSensor = false
		blueWall61.isAwake = true
		
	end
	
	if collision.myName == "blueWall56" then
		
		blueWall62.isVisible = true
		blueWall62.isSensor = false
		blueWall62.isAwake = true
		
		blueWall63.isVisible = true
		blueWall63.isSensor = false
		blueWall63.isAwake = true
		
		blueWall64.isSensor = false
		blueWall64.isAwake = true
		
		blueWall65.isSensor = false
		blueWall65.isAwake = true
		
		blueWall66.isSensor = false
		blueWall66.isAwake = true
		
		blueWall67.isSensor = false
		blueWall67.isAwake = true
		
		blueWall68.isSensor = false
		blueWall68.isAwake = true
		
		blueWall69.isSensor = false
		blueWall69.isAwake = true
		
		blueWall70.isSensor = false
		blueWall70.isAwake = true
		
		blueWall71.isSensor = false
		blueWall71.isAwake = true
		
		blueWall72.isSensor = false
		blueWall72.isAwake = true
		
		blueWall73.isSensor = false
		blueWall73.isAwake = true
		
		blueWall74.isSensor = false
		blueWall74.isAwake = true
		
		blueWall75.isSensor = false
		blueWall75.isAwake = true
		
		blueWall76.isSensor = false
		blueWall76.isAwake = true
		
	end
	if collision.myName == "blueWall72" then
	--if collision.myName == "blueWallTest" then
	
		myCollision = "blueWall72"
	
		blueWall77.isVisible = true
		blueWall77.isSensor = false
		blueWall77.isAwake = true
		
		blueWall78.isVisible = true
		blueWall78.isSensor = false
		blueWall78.isAwake = true
		
		blueWall79.isVisible = true
		blueWall79.isSensor = false
		blueWall79.isAwake = true
		
		blueWall80.isVisible = true
		blueWall80.isSensor = false
		blueWall80.isAwake = true
		
		blueWall81.isVisible = true
		blueWall81.isSensor = false
		blueWall81.isAwake = true
		
		blueWall82.isVisible = true
		blueWall82.isSensor = false
		blueWall82.isAwake = true
		
		cheaterBlock18.isAwake = true
		
		cheaterBlock19.isAwake = true
		
		cheaterBlock20.isAwake = true
		
		cheaterBlock21.isAwake = true
		
		cheaterBlock22.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall82" then
	--if collision.myName == "blueWallTest" then
	
	myCollision = "blueWall82"
	
		blueWall83.isVisible = true
		blueWall83.isSensor = false
		blueWall83.isAwake = true
		
		blueWall84.isSensor = false
		blueWall84.isAwake = true
		
		blueWall85.isSensor = false
		blueWall85.isAwake = true
		
		blueWall86.isSensor = false
		blueWall86.isAwake = true
		
		blueWall87.isSensor = false
		blueWall87.isAwake = true
		
		blueWall88.isSensor = false
		blueWall88.isAwake = true
		
		blueWall89.isSensor = false
		blueWall89.isAwake = true
		
		blueWall90.isSensor = false
		blueWall90.isAwake = true
		
		cheaterBlock23.isAwake = true
		
		cheaterBlock24.isAwake = true
		
		cheaterBlock25.isAwake = true
		
		cheaterBlock26.isAwake = true
		
		orangeTriangle31.isAwake = true
		
		orangeTriangle32.isAwake = true
		
		orangeTriangle33.isAwake = true
		
		orangeTriangle34.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
		if collision.myName == "blueWall117" then
		
		--if collision.myName == "blueWallTest" then
		
		myCollision = "blueWall117"
		
		blueWall119.isVisible = true
		blueWall119.isSensor = false
		blueWall119.isAwake = true
		
		blueWall120.isVisible = true
		blueWall120.isSensor = false
		blueWall120.isAwake = true
		
		blueWall121.isVisible = true
		blueWall121.isSensor = false
		blueWall121.isAwake = true
		
		orangeTriangle44.isAwake = true
		
		orangeTriangle45.isAwake = true
		
		orangeTriangle46.isAwake = true
		
		orangeTriangle47.isAwake = true
		
		cheaterBlock35.isVisible = true
		cheaterBlock35.isAwake = true
		
		cheaterBlock36.isVisible = true
		cheaterBlock36.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall119" then
	
		myCollision = "blueWall119"
		
		blueWall122.isVisible = true
		blueWall122.isSensor = false
		blueWall122.isAwake = true
		
		blueWall123.isVisible = true
		blueWall123.isSensor = false
		blueWall122.isAwake = true
		
		blueWall124.isVisible = true
		blueWall124.isSensor = false
		blueWall124.isAwake = true
		
		blueWall125.isVisible = true
		blueWall125.isSensor = false
		blueWall125.isAwake = true
		
		blueWall126.isVisible = true
		blueWall126.isSensor = false
		blueWall126.isAwake = true
		
		blueWall127.isVisible = true
		blueWall127.isSensor = false
		blueWall127.isAwake = true
		
		blueWall128.isVisible = true
		blueWall128.isSensor = false
		blueWall128.isAwake = true
		
		blueWall129.isVisible = true
		blueWall129.isSensor = false
		blueWall129.isAwake = true
		
		blueCircle2.isVisible = true
		blueCircle2.isSensor = false
		blueCircle2.isAwake = true
		
		blueCircle3.isVisible = true
		blueCircle3.isSensor = false
		blueCircle3.isAwake = true
		
		blueCircle4.isVisible = true
		blueCircle4.isSensor = false
		blueCircle4.isAwake = true
		
		blueCircle5.isVisible = true
		blueCircle5.isSensor = false
		blueCircle5.isAwake = true
		
		cheaterBlock37.isVisible = true
		cheaterBlock37.isAwake = true
		
		cheaterBlock38.isVisible = true
		cheaterBlock38.isAwake = true
		
		cheaterBlock39.isVisible = true
		cheaterBlock39.isAwake = true
		
		cheaterBlock40.isVisible = true
		cheaterBlock40.isAwake = true
		
		cheaterBlock41.isVisible = true
		cheaterBlock41.isAwake = true
		
		cheaterBlock42.isVisible = true
		cheaterBlock42.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueCircle5" then
	
	--if collision.myName == "blueWallTest" then
	
		myCollision = "blueCircle5" 
		
		blueWall130.isVisible = true
		blueWall130.isSensor = false
		blueWall130.isAwake = true
		
		blueWall131.isVisible = true
		blueWall131.isSensor = false
		blueWall131.isAwake = true
		
		blueWall132.isVisible = true
		blueWall132.isSensor = false
		blueWall132.isAwake = true
		
		blueWall133.isVisible = true
		blueWall133.isSensor = false
		blueWall133.isAwake = true
		
		blueCircle6.isVisible = true
		blueCircle6.isSensor = false
		blueCircle6.isAwake = true
		
		blueCircle7.isVisible = true
		blueCircle7.isSensor = false
		blueCircle7.isAwake = true
		
		blueCircle8.isVisible = true
		blueCircle8.isSensor = false
		blueCircle8.isAwake = true
		
		cheaterBlock43.isVisible = true
		cheaterBlock43.isAwake = true
		
		cheaterBlock44.isVisible = true
		cheaterBlock44.isAwake = true
		
		cheaterBlock45.isVisible = true
		cheaterBlock45.isAwake = true
		
		cheaterBlock56.isVisible = true
		cheaterBlock56.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
	end
	
	if collision.myName == "blueCircle8" then
		
		myCollision = "blueCircle8"
		
		blueWall134.isVisible = true
		blueWall134.isSensor = false
		blueWall134.isAwake = true
		
		blueWall135.isVisible = true
		blueWall135.isSensor = false
		blueWall135.isAwake = true
		
		blueWall136.isVisible = true
		blueWall136.isSensor = false
		blueWall136.isAwake = true
		
		blueWall137.isVisible = true
		blueWall137.isSensor = false
		blueWall137.isAwake = true
		
		blueWall138.isVisible = true
		blueWall138.isSensor = false
		blueWall138.isAwake = true
		
		blueWall139.isVisible = true
		blueWall139.isSensor = false
		blueWall139.isAwake = true
		
		blueWall140.isVisible = true
		blueWall140.isSensor = false
		blueWall140.isAwake = true
		
		blueWall141.isVisible = true
		blueWall141.isSensor = false
		blueWall141.isAwake = true
		
		cheaterBlock46.isVisible = true
		cheaterBlock46.isAwake = true
		
		cheaterBlock47.isVisible = true
		cheaterBlock47.isAwake = true
		
		cheaterBlock48.isVisible = true
		cheaterBlock48.isAwake = true
		
		cheaterBlock49.isVisible = true
		cheaterBlock49.isAwake = true
		
		cheaterBlock50.isVisible = true
		cheaterBlock50.isAwake = true
		
		cheaterBlock51.isVisible = true
		cheaterBlock51.isAwake = true
		
		cheaterBlock52.isVisible = true
		cheaterBlock52.isAwake = true
		
		cheaterBlock53.isVisible = true
		cheaterBlock53.isAwake = true
		
		cheaterBlock54.isVisible = true
		cheaterBlock54.isAwake = true
		
		cheaterBlock55.isVisible = true
		cheaterBlock55.isAwake = true
		
		cheaterBlock57.isVisible = true
		cheaterBlock57.isAwake = true
		
		cheaterBlock58.isVisible = true
		cheaterBlock58.isAwake = true
		
		cheaterBlock59.isVisible = true
		cheaterBlock59.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall139" then
	
		blueWall142.isVisible = true
		blueWall142.isSensor = false
		blueWall142.isAwake = true
		
		blueWall143.isVisible = true
		blueWall143.isSensor = false
		blueWall143.isAwake = true
		
		blueWall144.isVisible = true
		blueWall144.isSensor = false
		blueWall144.isAwake = true
		
		blueWall145.isVisible = true
		blueWall145.isSensor = false
		blueWall145.isAwake = true
		
		blueWall146.isVisible = true
		blueWall146.isSensor = false
		blueWall146.isAwake = true
		
		blueWall147.isVisible = true
		blueWall147.isSensor = false
		blueWall147.isAwake = true
		
		blueWall148.isVisible = true
		blueWall148.isSensor = false
		blueWall148.isAwake = true
		
		blueCircle9.isVisible = true
		blueCircle9.isSensor = false
		blueCircle9.isAwake = true
		
		blueCircle10.isVisible = true
		blueCircle10.isSensor = false
		blueCircle10.isAwake = true
		
		blueCircle11.isVisible = true
		blueCircle11.isSensor = false
		blueCircle11.isAwake = true
		
		blueCircle12.isVisible = true
		blueCircle12.isSensor = false
		blueCircle12.isAwake = true
		
		blueCircle13.isVisible = true
		blueCircle13.isSensor = false
		blueCircle13.isAwake = true
		
		blueCircle14.isVisible = true
		blueCircle14.isSensor = false
		blueCircle14.isAwake = true
	
	end
	
	if collision.myName == "blueCircle14" then
	
	--if collision.myName == "blueWallTest" then
	
		myCollision = "blueCircle14"
		
		blueWall149.isVisible = true
		blueWall149.isSensor = false
		blueWall149.isAwake = true
		
		blueWall150.isVisible = true
		blueWall150.isSensor = false
		blueWall150.isAwake = true
		
		blueWall151.isVisible = true
		blueWall151.isSensor = false
		blueWall151.isAwake = true
		
		blueWall152.isVisible = true
		blueWall152.isSensor = false
		blueWall152.isAwake = true
		
		blueWall153.isVisible = true
		blueWall153.isSensor = false
		blueWall153.isAwake = true
		
		blueWall154.isVisible = true
		blueWall154.isSensor = false
		blueWall154.isAwake = true
		
		blueWall155.isVisible = true
		blueWall155.isSensor = false
		blueWall155.isAwake = true
		
		blueWall156.isVisible = true
		blueWall156.isSensor = false
		blueWall156.isAwake = true
		
		blueWall157.isVisible = true
		blueWall157.isSensor = false
		blueWall157.isAwake = true
		
		blueWall158.isVisible = true
		blueWall158.isSensor = false
		blueWall158.isAwake = true
		
		blueWall159.isVisible = true
		blueWall159.isSensor = false
		blueWall159.isAwake = true
		
		blueWall160.isVisible = true
		blueWall160.isSensor = false
		blueWall160.isAwake = true
		
		blueWall161.isVisible = true
		blueWall161.isSensor = false
		blueWall161.isAwake = true
		
		orangeTriangle48.isAwake = true
		
		orangeTriangle49.isAwake = true
		
		orangeTriangle50.isAwake = true
		
		orangeTriangle51.isAwake = true
		
		orangeTriangle52.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.myName == "blueWall158" then
	
	--if collision.myName == "blueWallTest" then
	
		myCollision = "blueWall158"
	
		blueWall162.isVisible = true
		blueWall162.isSensor = false
		blueWall162.isAwake = true
		
		blueWall163.isVisible = true
		blueWall163.isSensor = false
		blueWall163.isAwake = true
		
		blueWall164.isVisible = true
		blueWall164.isSensor = false
		blueWall164.isAwake = true
		
		blueWall165.isVisible = true
		blueWall165.isSensor = false
		blueWall165.isAwake = true
		
		blueWall166.isVisible = true
		blueWall166.isSensor = false
		blueWall166.isAwake = true
		
		blueWall167.isVisible = true
		blueWall167.isSensor = false
		blueWall167.isAwake = true
		
		blueWall168.isVisible = true
		blueWall168.isSensor = false
		blueWall168.isAwake = true
		
		blueWall169.isVisible = true
		blueWall169.isSensor = false
		blueWall169.isAwake = true
		
		blueWall170.isVisible = true
		blueWall170.isSensor = false
		blueWall170.isAwake = true
		
		blueWall171.isVisible = true
		blueWall171.isSensor = false
		blueWall171.isAwake = true
		
		blueWall172.isVisible = true
		blueWall172.isSensor = false
		blueWall172.isAwake = true
		
		blueWall173.isVisible = true
		blueWall173.isSensor = false
		blueWall173.isAwake = true
		
		blueWall174.isVisible = true
		blueWall174.isSensor = false
		blueWall174.isAwake = true
		
		blueWall175.isVisible = true
		blueWall175.isSensor = false
		blueWall175.isAwake = true
		
		blueWall176.isVisible = true
		blueWall176.isSensor = false
		blueWall176.isAwake = true
		
		blueWall184.isSensor = false
		blueWall184.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
	
	end
	
	if collision.myName == "blueWall161" then
	
		myCollision = "blueWall161"
	
		cheaterBlock60.isVisible = true
		cheaterBlock60.isAwake = true
		
		cheaterBlock61.isVisible = true
		cheaterBlock61.isAwake = true
		
		cheaterBlock62.isVisible = true
		cheaterBlock62.isAwake = true
		
		cheaterBlock63.isVisible = true
		cheaterBlock63.isAwake = true
		
		cheaterBlock64.isVisible = true
		cheaterBlock64.isAwake = true
		
		cheaterBlock65.isVisible = true
		cheaterBlock65.isAwake = true
		
		cheaterBlock66.isVisible = true
		cheaterBlock66.isAwake = true
		
		timer.performWithDelay( 10,  bodyActive)
		
	end
	
	if collision.direction == "Up" then
			if collision.isEven then
	
				currentPercent = currentPercent + 1
				savetoCurrentPercentFile(currentPercent)
				completion.text = tostring(currentPercent) .. "%"
			end
		collision:removeSelf()
		collision = nil
	end
	return true
end


local function spikeWall5Collision (event)
	local collision = event.other
	if collision.myName == "blueWall4" or collision.myName == "blueWall5" then
		event.contact.isEnabled = true
		if event.contact.isEnabled == true then
		event.contact.isEnabled = false
				if collision.isEven then
	
				currentPercent = currentPercent + 1
				completion.text = tostring(currentPercent) .. "%"
			end
		collision:removeSelf()
		collision = nil
		end
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
		greenBlock.isVisible = false
		timer.performWithDelay( 10,  goToFail)
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
		greenBlock.isVisible = false
		timer.performWithDelay( 10,  goToFail)
		else if (target.direction == "Up" and collision.myName == "spikeWall2") then
			target:removeSelf()
			target = nil
		end
	end
	return true
end

local function goToHundred()

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

savedBestAttempt = loadTextFile("bestAttempt.txt")
savedCurrentAttempt = loadTextFile("currentAttempt.txt")

			
		if savedBestAttempt == 0 then
				bestAttempt = savedCurrentAttempt
				savetoBestAttemptFile(bestAttempt)
			else if tonumber(savedBestAttempt) > tonumber(savedCurrentAttempt) then
					bestAttempt = savedCurrentAttempt
					savetoBestAttemptFile(bestAttempt)
			end
		end
		
		if currentAttempt == 1 then
			firstAttempt = savedFirstAttempt + 1
			savetoFirstAttemptFile(firstAttempt)
		end
		
		completions = savedCompletions + 1
		savetoCompletionsFile(completions)
		currentPercent = 100
		savetoCurrentPercentFile(currentPercent)
		currentAttempt = 0
		savetoCurrentAttemptFile(currentAttempt)
		greenBlock.isVisible = false
	composer.gotoScene("100Percent", "fade", 800)
	
end

local function onFinishLineCollision(event)
	local collision = event.other
	local target = event.target
	if collision.myName == "greenBlock" then
			if isAudioPlaying then
			audio.play ( finishSound )
			end

		timer.performWithDelay( 10,  goToHundred)
	end
	return true
end



	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	

	--]]
		finishLine = display.newImageRect( "finishLine.png", 480, 50)
	finishLine.x, finishLine.y = 240, -595
	finishLine.direction = "Down"
	finishLine.rotation = 0
	finishLine.isVisible = false
	physics.addBody( finishLine, { isSensor = true, density= 200, friction=10, bounce=0 } )
	finishLine.gravityScale = 0.008
	finishLine.isAwake = false
	finishLine.isBodyActive = false
	finishLine:addEventListener("collision", onFinishLineCollision)
	sceneGroup:insert( finishLine)
	
	attempt = display.newText( tostring(currentAttempt), 100, 30, "native.systemFontBold", 19 )
	attempt:setFillColor( 0.0, 0.7, 0.9 )
	sceneGroup:insert(attempt)
	
	completion = display.newText( tostring(currentPercent) .. "%", 380, 30, "native.systemFontBold", 19 )
	completion:setFillColor( 0.0, 0.7, 0.9 )
	sceneGroup:insert(completion)
	
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
	blueWall = display.newImageRect( "blueWall.png", 50, 30 )
	blueWall.x, blueWall.y = 150, 100
	blueWall.direction = "Down"
	blueWall.isVisible = true
	physics.addBody( blueWall, { density= 200, friction=10, bounce=0 } )
	blueWall.gravityScale = 0.1
	blueWall.myName = "blueWall"
	sceneGroup:insert( blueWall)

	orangeTriangle = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle.x, orangeTriangle.y = 185, 60
	orangeTriangle.direction = "Down"
	orangeTriangle.isVisible = true
	orangeTriangle.rotation = 0
	orangeTriangleShape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangleShape } )
	orangeTriangle.gravityScale = 0.1
	orangeTriangle:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle )
	
	blueWall2 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall2.x, blueWall2.y = 220, 25
	blueWall2.direction = "Down"
	blueWall2.isEven = true
	blueWall2.isVisible = true
	physics.addBody( blueWall2, { density= 200, friction=10, bounce=0 } )
	blueWall2.gravityScale = 0.1
	sceneGroup:insert( blueWall2)

	orangeTriangle2 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle2.x, orangeTriangle2.y = 270, 0
	orangeTriangle2.direction = "Down"
	orangeTriangle2.isVisible = true
	orangeTriangle2Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle2, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle2Shape } )
	orangeTriangle2.gravityScale = 0.1
	orangeTriangle2:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle2 )
	
	blueWall3 = display.newImageRect( "blueWall.png", 55, 25 )
	blueWall3.x, blueWall3.y = 300, -50
	blueWall3.direction = "Down"
	blueWall3.isVisible = true
	physics.addBody( blueWall3, { density= 200, friction=10, bounce=0 } )
	blueWall3.gravityScale = 0.1
	blueWall3:addEventListener("collision", onGravityCollision)
	sceneGroup:insert( blueWall3)
	
	orangeTriangle3 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle3.x, orangeTriangle3.y = 345, -70
	orangeTriangle3.direction = "Down"
	orangeTriangle3.isVisible = true
	orangeTriangle3.rotation = 0
	orangeTriangle3Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle3, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle3Shape } )
	orangeTriangle3.gravityScale = 0.1
	orangeTriangle3:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle3 )
	
	orangeTriangle4 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle4.x, orangeTriangle4.y = 345, -225
	orangeTriangle4.direction = "Down"
	orangeTriangle4.isVisible = true
	orangeTriangle4.rotation = 180
	orangeTriangle4Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle4, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle4Shape } )
	orangeTriangle4.gravityScale = 0.1
	orangeTriangle4:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle4 )
	
	orangeTriangle11 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle11.x, orangeTriangle11.y = 385, -330
	orangeTriangle11.direction = "Down"
	orangeTriangle11.isVisible = true
	orangeTriangle11.rotation = 180
	orangeTriangle11Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle11, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle11Shape } )
	orangeTriangle11.gravityScale = 0.1
	orangeTriangle11:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle11 )
	
	orangeTriangle12 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle12.x, orangeTriangle12.y = 310, -525
	orangeTriangle12.direction = "Down"
	orangeTriangle12.isVisible = true
	orangeTriangle12.rotation = 180
	orangeTriangle12Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle12, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle12Shape } )
	orangeTriangle12.gravityScale = 0.08
	orangeTriangle12:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle12 )
	
	blueWall4 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall4.x, blueWall4.y = 385, -90
	blueWall4.isVisible = true
	blueWall4.isEven = true
	physics.addBody( blueWall4, { density= 200, friction=10, bounce=0 } )
	blueWall4.gravityScale = 0.1
	blueWall4.myName = "blueWall4"
	sceneGroup:insert( blueWall4)
	
	blueWall5 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall5.x, blueWall5.y = 280, -165 
	blueWall5.isVisible = true
	physics.addBody( blueWall5, { density= 200, friction=10, bounce=0 } )
	blueWall5.gravityScale = 0.1
	blueWall5.myName = "blueWall5"
	sceneGroup:insert( blueWall5)
	
	blueWall6 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall6.x, blueWall6.y = 150, -35
	blueWall6.direction = "Down"
	blueWall6.isVisible = true
	blueWall6.isEven = true
	physics.addBody( blueWall6, { density= 200, friction=10, bounce=0 } )
	blueWall6.gravityScale = 0.01
	sceneGroup:insert( blueWall6)
	
	cheaterBlock = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock.x, cheaterBlock.y = 350, -35
	cheaterBlock.direction = "Down"
	cheaterBlock.rotation = 180
	cheaterBlock.isVisible = true
	physics.addBody( cheaterBlock, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock.gravityScale = 0.01
	cheaterBlock:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock)
	
	cheaterBlock2 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock2.x, cheaterBlock2.y = 350, -120
	cheaterBlock2.direction = "Down"
	cheaterBlock2.rotation = 180
	cheaterBlock2.isVisible = true
	physics.addBody( cheaterBlock2, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock2.gravityScale = 0.01
	cheaterBlock2:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock2)
	
	orangeTriangle5 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle5.x, orangeTriangle5.y = 220, -30
	orangeTriangle5.direction = "Down"
	orangeTriangle5.isVisible = true
	orangeTriangle5.rotation = 90
	orangeTriangle5Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle5, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle5Shape } )
	orangeTriangle5.gravityScale = 0.01
	orangeTriangle5:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle5 )
	
	orangeTriangle6 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle6.x, orangeTriangle6.y = 70, -30
	orangeTriangle6.direction = "Down"
	orangeTriangle6.isVisible = true
	orangeTriangle6.rotation = 0
	orangeTriangle6Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle6, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle6Shape } )
	orangeTriangle6.gravityScale = 0.01
	orangeTriangle6:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle6 )
	
	orangeTriangle7 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle7.x, orangeTriangle7.y = 130, -60
	orangeTriangle7.direction = "Down"
	orangeTriangle7.isVisible = true
	orangeTriangle7.rotation = 180
	orangeTriangle7Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle7, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle7Shape } )
	orangeTriangle7.gravityScale = 0.1
	orangeTriangle7:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle7 )
	
	orangeTriangle8 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle8.x, orangeTriangle8.y = 80, -30
	orangeTriangle8.direction = "Down"
	orangeTriangle8.isVisible = true
	orangeTriangle8.rotation = 180
	orangeTriangle8Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle8, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle8Shape } )
	orangeTriangle8.gravityScale = 0.1
	orangeTriangle8:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle8 )
	
	orangeTriangle9 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle9.x, orangeTriangle9.y = 180, -80
	orangeTriangle9.direction = "Down"
	orangeTriangle9.isVisible = true
	orangeTriangle9.rotation = 180
	orangeTriangle9Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle9, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle9Shape } )
	orangeTriangle9.gravityScale = 0.1
	orangeTriangle9:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle9 )
	
	orangeTriangle10 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle10.x, orangeTriangle10.y = 220, -130
	orangeTriangle10.direction = "Down"
	orangeTriangle10.isVisible = true
	orangeTriangle10.rotation = 180
	orangeTriangle10Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle10, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle10Shape } )
	orangeTriangle10.gravityScale = 0.1
	orangeTriangle10:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle10 )
	
	blueWall7 = display.newImageRect( "blueWall.png", 45, 25 )
	blueWall7.x, blueWall7.y = 85, -100
	blueWall7.direction = "Down"
	blueWall7.myName = "blueWall7"
	blueWall7.isVisible = true
	physics.addBody( blueWall7, { density= 200, friction=10, bounce=0 } )
	blueWall7.gravityScale = 0.01
	sceneGroup:insert( blueWall7)
	
	blueWall8 = display.newImageRect( "blueWall.png", 45, 25 )
	blueWall8.x, blueWall8.y = 155, -165
	blueWall8.direction = "Down"
	blueWall8.isVisible = true
	blueWall8.isEven = true
	physics.addBody( blueWall8, { density= 200, friction=10, bounce=0 } )
	blueWall8.gravityScale = 0.01
	sceneGroup:insert( blueWall8)
	
	blueWall9 = display.newImageRect( "blueWall.png", 45, 25 )
	blueWall9.x, blueWall9.y = 85, -235
	blueWall9.direction = "Down"
	blueWall9.myName = "blueWall9"
	blueWall9.isVisible = true
	physics.addBody( blueWall9, { density= 200, friction=10, bounce=0 } )
	blueWall9.gravityScale = 0.01
	sceneGroup:insert( blueWall9)
	
	orangeTriangle13 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle13.x, orangeTriangle13.y = 120, -2000
	orangeTriangle13.direction = "Down"
	orangeTriangle13.isVisible = true
	orangeTriangle13.rotation = 180
	orangeTriangle13Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle13, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle13Shape } )
	orangeTriangle13.gravityScale = 0.1
	orangeTriangle13:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle13 )
	
	orangeTriangle14 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle14.x, orangeTriangle14.y = 120, -2500
	orangeTriangle14.direction = "Down"
	orangeTriangle14.isVisible = true
	orangeTriangle14.rotation = 180
	orangeTriangle14Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle14, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle14Shape } )
	orangeTriangle14.gravityScale = 0.1
	orangeTriangle14:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle14 )
	
	orangeTriangle15 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle15.x, orangeTriangle15.y = 120, -3000
	orangeTriangle15.direction = "Down"
	orangeTriangle15.isVisible = true
	orangeTriangle15.rotation = 180
	orangeTriangle15Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle15, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle15Shape } )
	orangeTriangle15.gravityScale = 0.1
	orangeTriangle15:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle15 )
	
	orangeTriangle16 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle16.x, orangeTriangle16.y = 120, -3700
	orangeTriangle16.direction = "Down"
	orangeTriangle16.isVisible = true
	orangeTriangle16.rotation = 180
	orangeTriangle16Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle16, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle16Shape } )
	orangeTriangle16.gravityScale = 0.1
	orangeTriangle16:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle16 )
	
	cheaterBlock3 = display.newImageRect( "cheaterBlock.png", 100, 50 )
	cheaterBlock3.x, cheaterBlock3.y = 100, -400
	cheaterBlock3.direction = "Down"
	cheaterBlock3.rotation = 180
	cheaterBlock3.isVisible = true
	physics.addBody( cheaterBlock3, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock3.gravityScale = 0.01
	cheaterBlock3:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock3)
	
	cheaterBlock5 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock5.x, cheaterBlock5.y = 300, -280
	cheaterBlock5.direction = "Down"
	cheaterBlock5.rotation = 180
	cheaterBlock5.isVisible = true
	physics.addBody( cheaterBlock5, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock5.gravityScale = 0.01
	cheaterBlock5:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock5)
	
	orangeTriangle18 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle18.x, orangeTriangle18.y = 400, -300
	orangeTriangle18.direction = "Down"
	orangeTriangle18.isVisible = true
	orangeTriangle18.rotation = 180
	orangeTriangle18Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle18, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle18Shape } )
	orangeTriangle18.gravityScale = 0.01
	orangeTriangle18:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle18 )
	
	orangeTriangle19 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle19.x, orangeTriangle19.y = 200, -150
	orangeTriangle19.direction = "Down"
	orangeTriangle19.isVisible = true
	orangeTriangle19.rotation = 180
	orangeTriangle19Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle19, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle19Shape } )
	orangeTriangle19.gravityScale = 0.01
	orangeTriangle19:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle19 )
	
	orangeTriangle20 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle20.x, orangeTriangle20.y = 260, -200
	orangeTriangle20.direction = "Down"
	orangeTriangle20.isVisible = true
	orangeTriangle20.rotation = 180
	orangeTriangle20Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle20, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle20Shape } )
	orangeTriangle20.gravityScale = 0.01
	orangeTriangle20:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle20 )
	
	orangeTriangle21 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle21.x, orangeTriangle21.y = 340, -250
	orangeTriangle21.direction = "Down"
	orangeTriangle21.isVisible = true
	orangeTriangle21.rotation = 180
	orangeTriangle21Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle21, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle21Shape } )
	orangeTriangle21.gravityScale = 0.01
	orangeTriangle21:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle21 )
	
	orangeTriangle22 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle22.x, orangeTriangle22.y = 100, -400
	orangeTriangle22.direction = "Down"
	orangeTriangle22.isVisible = true
	orangeTriangle22.rotation = 180
	orangeTriangle22Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle22, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle22Shape } )
	orangeTriangle22.gravityScale = 0.008
	orangeTriangle22:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle22 )
	
	orangeTriangle23 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle23.x, orangeTriangle23.y = 150, -450
	orangeTriangle23.direction = "Down"
	orangeTriangle23.isVisible = true
	orangeTriangle23.rotation = 180
	orangeTriangle23Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle23, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle23Shape } )
	orangeTriangle23.gravityScale = 0.008
	orangeTriangle23:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle23 )
	
	orangeTriangle24 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle24.x, orangeTriangle24.y = 200, -500
	orangeTriangle24.direction = "Down"
	orangeTriangle24.isVisible = true
	orangeTriangle24.rotation = 180
	orangeTriangle24Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle24, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle24Shape } )
	orangeTriangle24.gravityScale = 0.008
	orangeTriangle24:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle24 )
	
	orangeTriangle25 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle25.x, orangeTriangle25.y = 280, -500
	orangeTriangle25.direction = "Down"
	orangeTriangle25.isVisible = true
	orangeTriangle25.rotation = 180
	orangeTriangle25Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle25, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle25Shape } )
	orangeTriangle25.gravityScale = 0.008
	orangeTriangle25:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle25 )
	
	orangeTriangle26 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle26.x, orangeTriangle26.y = 380, -300
	orangeTriangle26.direction = "Down"
	orangeTriangle26.isVisible = true
	orangeTriangle26.rotation = 180
	orangeTriangle26Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle26, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle26Shape } )
	orangeTriangle26.gravityScale = 0.008
	orangeTriangle26:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle26 )
	
	blueWall10 = display.newImageRect( "blueWall.png", 90, 25 )
	blueWall10.x, blueWall10.y = 180, 740
	blueWall10.direction = "Up"
	blueWall10.myName = "blueWall10"
	blueWall10.isVisible = true
	blueWall10.isEven = true
	physics.addBody( blueWall10, { density= 200, friction=10, bounce=0 } )
	blueWall10.gravityScale = -0.0085
	sceneGroup:insert( blueWall10)

	
	orangeTriangle17 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle17.x, orangeTriangle17.y = 120, 360
	orangeTriangle17.direction = "Up"
	orangeTriangle17.isVisible = true
	orangeTriangle17.rotation = 0
	orangeTriangle17Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle17, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle17Shape } )
	orangeTriangle17.gravityScale = -3.5
	orangeTriangle17.isAwake = false
	orangeTriangle17.isBodyActive = false
	orangeTriangle17:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle17 )
	
	blueWall11 = display.newImageRect( "blueWall.png", 90, 25 )
	blueWall11.x, blueWall11.y = 290, 360
	blueWall11.direction = "Up"
	blueWall11.myName = "blueWall11"
	blueWall11.isVisible = true
	physics.addBody( blueWall11, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall11.isAwake = false
	blueWall11.gravityScale = -0.09
	sceneGroup:insert( blueWall11)
	
	blueWall12 = display.newImageRect( "blueWall.png", 90, 25 )
	blueWall12.x, blueWall12.y = 385, 370
	blueWall12.direction = "Up"
	blueWall12.myName = "blueWall12"
	blueWall12.isVisible = true
	blueWall12.isEven = true
	physics.addBody( blueWall12, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall12.isAwake = false
	blueWall12.gravityScale = -0.028
	sceneGroup:insert( blueWall12)
	
	cheaterBlock4 = display.newImageRect( "cheaterBlock.png", 85, 25 )
	cheaterBlock4.x, cheaterBlock4.y = 380, 400
	cheaterBlock4.direction = "Up"
	cheaterBlock4.rotation = 0
	cheaterBlock4.isVisible = true
	physics.addBody( cheaterBlock4, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock4.gravityScale = -0.015
	cheaterBlock4.isAwake = false
	cheaterBlock4.isBodyActive = false
	cheaterBlock4:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock4)
	
	blueWall13 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall13.x, blueWall13.y = 295, 400
	blueWall13.direction = "Up"
	blueWall13.myName = "blueWall13"
	blueWall13.isVisible = true
	physics.addBody( blueWall13, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall13.isAwake = false
	blueWall13.gravityScale = -0.015
	sceneGroup:insert( blueWall13)
	
	blueWall14 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall14.x, blueWall14.y = 235, 430
	blueWall14.direction = "Up"
	blueWall14.myName = "blueWall14"
	blueWall14.isVisible = true
	blueWall14.isEven = true
	physics.addBody( blueWall14, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall14.isAwake = false
	blueWall14.gravityScale = -0.015
	sceneGroup:insert( blueWall14)
	
	blueWall15 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall15.x, blueWall15.y = 205, 460
	blueWall15.direction = "Up"
	blueWall15.myName = "blueWall15"
	blueWall15.isVisible = true
	physics.addBody( blueWall15, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall15.isAwake = false
	blueWall15.gravityScale = -0.015
	sceneGroup:insert( blueWall15)
	
	blueWall16 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall16.x, blueWall16.y = 175, 490
	blueWall16.direction = "Up"
	blueWall16.myName = "blueWall16"
	blueWall16.isVisible = true
	blueWall16.isEven = true
	physics.addBody( blueWall16, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall16.isAwake = false
	blueWall16.gravityScale = -0.015
	sceneGroup:insert( blueWall16)
	
	blueWall17 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall17.x, blueWall17.y = 145, 520
	blueWall17.direction = "Up"
	blueWall17.myName = "blueWall17"
	blueWall17.isVisible = true
	physics.addBody( blueWall17, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall17.isAwake = false
	blueWall17.gravityScale = -0.015
	sceneGroup:insert( blueWall17)

	
	orangeTriangle18 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle18.x, orangeTriangle18.y = 110, -20
	orangeTriangle18.direction = "Down"
	orangeTriangle18.isVisible = true
	orangeTriangle18.rotation = 180
	orangeTriangle18Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle18, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle18Shape } )
	orangeTriangle18.gravityScale = 0.022
	orangeTriangle18.isAwake = false
	orangeTriangle18.isBodyActive = false
	orangeTriangle18:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle18 )
	
	orangeTriangle19 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle19.x, orangeTriangle19.y = 170, -60
	orangeTriangle19.direction = "Down"
	orangeTriangle19.isVisible = true
	orangeTriangle19.rotation = 180
	orangeTriangle19Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle19, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle19Shape } )
	orangeTriangle19.gravityScale = 0.022
	orangeTriangle19.isAwake = false
	orangeTriangle19.isBodyActive = false
	orangeTriangle19:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle19 )
	
	orangeTriangle20 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle20.x, orangeTriangle20.y = 210, -100
	orangeTriangle20.direction = "Down"
	orangeTriangle20.isVisible = true
	orangeTriangle20.rotation = 180
	orangeTriangle20Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle20, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle20Shape } )
	orangeTriangle20.gravityScale = 0.022
	orangeTriangle20.isAwake = false
	orangeTriangle20.isBodyActive = false
	orangeTriangle20:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle20 )
	
	blueWall18 = display.newImageRect( "blueWall.png", 140, 30 )
	blueWall18.x, blueWall18.y = 126, 610
	blueWall18.direction = "Up"
	blueWall18.myName = "blueWall18"
	blueWall18.isVisible = true
	blueWall18.isEven = true
	physics.addBody( blueWall18, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall18.isAwake = false
	blueWall18.gravityScale = -0.015
	sceneGroup:insert( blueWall18)
	
		cheaterBlock0 = display.newImageRect( "cheaterBlock.png", 130, 25 )
	cheaterBlock0.x, cheaterBlock0.y = 130, 450
	cheaterBlock0.direction = "Up"
	cheaterBlock0.rotation = 0
	cheaterBlock0.isVisible = true
	physics.addBody( cheaterBlock0, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock0.gravityScale = -0.015
	cheaterBlock0.isAwake = false
	cheaterBlock0.isBodyActive = false
	cheaterBlock0:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock0)
	
	blueWall19 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall19.x, blueWall19.y = 240, 450
	blueWall19.direction = "Up"
	blueWall19.myName = "blueWall19"
	blueWall19.isVisible = true
	physics.addBody( blueWall19, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall19.isAwake = false
	blueWall19.gravityScale = -0.015
	sceneGroup:insert( blueWall19)
	
	blueWall20 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall20.x, blueWall20.y = 270, 480
	blueWall20.direction = "Up"
	blueWall20.myName = "blueWall20"
	blueWall20.isVisible = true
	blueWall20.isEven = true
	physics.addBody( blueWall20, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall20.isAwake = false
	blueWall20.gravityScale = -0.015
	sceneGroup:insert( blueWall20)
	
	blueWall21 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall21.x, blueWall21.y = 300, 510
	blueWall21.direction = "Up"
	blueWall21.myName = "blueWall21"
	blueWall21.isVisible = true
	physics.addBody( blueWall21, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall21.isAwake = false
	blueWall21.gravityScale = -0.015
	sceneGroup:insert( blueWall21)
	
	blueWall22 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall22.x, blueWall22.y = 330, 540
	blueWall22.direction = "Up"
	blueWall22.myName = "blueWall22"
	blueWall22.isVisible = true
	blueWall22.isEven = true
	physics.addBody( blueWall22, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall22.isAwake = false
	blueWall22.gravityScale = -0.015
	sceneGroup:insert( blueWall22)
	
	blueWall23 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall23.x, blueWall23.y = 360, 570
	blueWall23.direction = "Up"
	blueWall23.myName = "blueWall23"
	blueWall23.isVisible = true
	physics.addBody( blueWall23, { isSensor = true, density= 200, friction=10, bounce=0 } )
	blueWall23.isAwake = false
	blueWall23.gravityScale = -0.015
	sceneGroup:insert( blueWall23)
	
	orangeTriangle21 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle21.x, orangeTriangle21.y = 390, -50
	orangeTriangle21.direction = "Down"
	orangeTriangle21.isVisible = true
	orangeTriangle21.rotation = 180
	orangeTriangle21Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle21, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle21Shape } )
	orangeTriangle21.gravityScale = 0.1
	orangeTriangle21.isAwake = false
	orangeTriangle21:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle21 )
	
	orangeTriangle22 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle22.x, orangeTriangle22.y = 290, -200
	orangeTriangle22.direction = "Down"
	orangeTriangle22.isVisible = true
	orangeTriangle22.rotation = 180
	orangeTriangle22Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle22, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle22Shape } )
	orangeTriangle22.gravityScale = 0.05
	orangeTriangle22.isAwake = false
	orangeTriangle22:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle22 )
	
	orangeTriangle23 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle23.x, orangeTriangle23.y = 190, -300
	orangeTriangle23.direction = "Down"
	orangeTriangle23.isVisible = true
	orangeTriangle23.rotation = 180
	orangeTriangle23Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle23, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle23Shape } )
	orangeTriangle23.gravityScale = 0.05
	orangeTriangle23.isAwake = false
	orangeTriangle23:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle23 )
	
	orangeTriangle24 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle24.x, orangeTriangle24.y = 90, -400
	orangeTriangle24.direction = "Down"
	orangeTriangle24.isVisible = true
	orangeTriangle24.rotation = 180
	orangeTriangle24Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle24, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle24Shape } )
	orangeTriangle24.gravityScale = 0.05
	orangeTriangle24.isAwake = false
	orangeTriangle24:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle24 )
	
	blueWall24 = display.newImageRect( "blueWall.png", 250, 25 )
	blueWall24.x, blueWall24.y = 300, 315
	blueWall24.direction = "Up"
	blueWall24.myName = "blueWall24"
	blueWall24.isVisible = false
	blueWall24.isEven = true
	physics.addBody( blueWall24, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall24.isAwake = false
	blueWall24.gravityScale = -0.015
	sceneGroup:insert( blueWall24)
	
	blueWall25 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall25.x, blueWall25.y = 120, 425
	blueWall25.direction = "Up"
	blueWall25.myName = "blueWall25"
	blueWall25.isVisible = false
	physics.addBody( blueWall25, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall25.isAwake = false
	blueWall25.gravityScale = -0.015
	sceneGroup:insert( blueWall25)
	
	blueWall26 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall26.x, blueWall26.y = 260, 425
	blueWall26.rotation = 135
	blueWall26.direction = "Up"
	blueWall26.myName = "blueWall26"
	blueWall26.isVisible = false
	blueWall26.isEven = true
	physics.addBody( blueWall26, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall26.isAwake = false
	blueWall26.gravityScale = -0.015
	sceneGroup:insert( blueWall26)
	
	blueWall27 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall27.x, blueWall27.y = 190, 530
	blueWall27.rotation = 150
	blueWall27.direction = "Up"
	blueWall27.myName = "blueWall27"
	blueWall27.isVisible = true
	physics.addBody( blueWall27, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall27.isAwake = false
	blueWall27.gravityScale = -0.015
	sceneGroup:insert( blueWall27)
	
	blueWall28 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall28.x, blueWall28.y = 105, 610
	blueWall28.rotation = 35
	blueWall28.direction = "Up"
	blueWall28.myName = "blueWall28"
	blueWall28.isVisible = true
	blueWall28.isEven = true
	physics.addBody( blueWall28, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall28.isAwake = false
	blueWall28.gravityScale = -0.015
	sceneGroup:insert( blueWall28)
	
	blueWall29 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall29.x, blueWall29.y = 240, 680
	blueWall29.rotation = 150
	blueWall29.direction = "Up"
	blueWall29.myName = "blueWall29"
	blueWall29.isVisible = true
	physics.addBody( blueWall29, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall29.isAwake = false
	blueWall29.gravityScale = -0.015
	sceneGroup:insert( blueWall29)
	
	blueWall30 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall30.x, blueWall30.y = 120, 770
	blueWall30.rotation = 35
	blueWall30.direction = "Up"
	blueWall30.myName = "blueWall30"
	blueWall30.isVisible = true
	blueWall30.isEven = true
	physics.addBody( blueWall30, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall30.isAwake = false
	blueWall30.gravityScale = -0.015
	sceneGroup:insert( blueWall30)
	
	blueWall31 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall31.x, blueWall31.y = 250, 830
	blueWall31.rotation = 150
	blueWall31.direction = "Up"
	blueWall31.myName = "blueWall31"
	blueWall31.isVisible = true
	physics.addBody( blueWall31, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall31.isAwake = false
	blueWall31.gravityScale = -0.015
	sceneGroup:insert( blueWall31)
	
	blueWall32 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall32.x, blueWall32.y = 130, 920
	blueWall32.rotation = 35
	blueWall32.direction = "Up"
	blueWall32.myName = "blueWall32"
	blueWall32.isVisible = true
	blueWall32.isEven = true
	physics.addBody( blueWall32, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall32.isAwake = false
	blueWall32.gravityScale = -0.015
	sceneGroup:insert( blueWall32)
	
	blueWall33 = display.newImageRect( "blueWall.png", 125, 25 )
	blueWall33.x, blueWall33.y = 280, 360
	blueWall33.direction = "Up"
	blueWall33.myName = "blueWall33"
	blueWall33.isVisible = true
	physics.addBody( blueWall33, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall33.isAwake = false
	blueWall33.gravityScale = -0.1
	sceneGroup:insert( blueWall33)
	
	blueWall34 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall34.x, blueWall34.y = 385, 100
	blueWall34.direction = "Down"
	blueWall34.myName = "blueWall34"
	blueWall34.isVisible = false
	blueWall34.isEven = true
	physics.addBody( blueWall34, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall34.isAwake = false
	blueWall34.gravityScale = 0.05
	sceneGroup:insert( blueWall34)
	
	blueWall35 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall35.x, blueWall35.y = 315, 400
	blueWall35.direction = "Up"
	blueWall35.myName = "blueWall35"
	blueWall35.isVisible = true
	physics.addBody( blueWall35, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall35.isAwake = false
	blueWall35.gravityScale = -0.04
	sceneGroup:insert( blueWall35)
	
	blueWall36 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall36.x, blueWall36.y = 385, -150
	blueWall36.direction = "Down"
	blueWall36.myName = "blueWall36"
	blueWall36.isVisible = true
	blueWall36.isEven = true
	physics.addBody( blueWall36, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall36.isAwake = false
	blueWall36.gravityScale = 0.04
	sceneGroup:insert( blueWall36)
	
	blueWall37 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall37.x, blueWall37.y = 295, 300
	blueWall37.direction = "Up"
	blueWall37.myName = "blueWall37"
	blueWall37.isVisible = false
	physics.addBody( blueWall37, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall37.isAwake = false
	blueWall37.gravityScale = -0.04
	sceneGroup:insert( blueWall37)
	
	orangeTriangle25 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle25.x, orangeTriangle25.y = 270, 370
	orangeTriangle25.direction = "Up"
	orangeTriangle25.isVisible = true
	orangeTriangle25.rotation = 0
	orangeTriangle25Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle25, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle25Shape } )
	orangeTriangle25.gravityScale = -0.04
	orangeTriangle25.isAwake = false
	orangeTriangle25.isBodyActive = false
	orangeTriangle25:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle25 )
	
	orangeTriangle26 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle26.x, orangeTriangle26.y = 220, 390
	orangeTriangle26.direction = "Up"
	orangeTriangle26.isVisible = true
	orangeTriangle26.rotation = 0
	orangeTriangle26Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle26, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle26Shape } )
	orangeTriangle26.gravityScale = -0.04
	orangeTriangle26.isAwake = false
	orangeTriangle26.isBodyActive = false
	orangeTriangle26:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle26 )
	
	blueWall38 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall38.x, blueWall38.y = 150, 430
	blueWall38.direction = "Up"
	blueWall38.myName = "blueWall38"
	blueWall38.isVisible = true
	blueWall38.isEven = true
	physics.addBody( blueWall38, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall38.isAwake = false
	blueWall38.gravityScale = -0.04
	sceneGroup:insert( blueWall38)
	
	orangeTriangle27 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle27.x, orangeTriangle27.y = 120, 470
	orangeTriangle27.direction = "Up"
	orangeTriangle27.isVisible = true
	orangeTriangle27.rotation = 0
	orangeTriangle27Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle27, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle27Shape } )
	orangeTriangle27.gravityScale = -0.04
	orangeTriangle27.isAwake = false
	orangeTriangle27.isBodyActive = false
	orangeTriangle27:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle27 )
	
	orangeTriangle28 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle28.x, orangeTriangle28.y = 120, 510
	orangeTriangle28.direction = "Up"
	orangeTriangle28.isVisible = true
	orangeTriangle28.rotation = 0
	orangeTriangle28Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle28, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle28Shape } )
	orangeTriangle28.gravityScale = -0.04
	orangeTriangle28.isAwake = false
	orangeTriangle28.isBodyActive = false
	orangeTriangle28:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle28 )
	
	blueWall39 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall39.x, blueWall39.y = 85, 570
	blueWall39.direction = "Up"
	blueWall39.myName = "blueWall39"
	blueWall39.isVisible = true
	physics.addBody( blueWall39, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall39.isAwake = false
	blueWall39.gravityScale = -0.04
	sceneGroup:insert( blueWall39)
	
	blueWall40 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall40.x, blueWall40.y = 180, 750
	blueWall40.direction = "Up"
	blueWall40.myName = "blueWall40"
	blueWall40.isVisible = true
	blueWall40.isEven = true
	physics.addBody( blueWall40, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall40.isAwake = false
	blueWall40.gravityScale = -0.04
	sceneGroup:insert( blueWall40)
	
	blueWall41 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall41.x, blueWall41.y = 270, 130
	blueWall41.direction = "Down"
	blueWall41.myName = "blueWall41"
	blueWall41.isVisible = false
	physics.addBody( blueWall41, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall41.isAwake = false
	blueWall41.gravityScale = 0.02
	sceneGroup:insert( blueWall41)
	
	blueWall42 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall42.x, blueWall42.y = 175, 360
	blueWall42.direction = "Up"
	blueWall42.myName = "blueWall42"
	blueWall42.isVisible = false
	blueWall42.isEven = true
	physics.addBody( blueWall42, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall42.isAwake = false
	blueWall42.gravityScale = -0.02
	sceneGroup:insert( blueWall42)
	
	orangeTriangle29 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle29.x, orangeTriangle29.y = 115, 430
	orangeTriangle29.direction = "Up"
	orangeTriangle29.isVisible = true
	orangeTriangle29.rotation = 0
	orangeTriangle29Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle29, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle29Shape } )
	orangeTriangle29.gravityScale = -0.02
	orangeTriangle29.isAwake = false
	orangeTriangle29.isBodyActive = false
	orangeTriangle29:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle29 )
	
	orangeTriangle30 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle30.x, orangeTriangle30.y = 115, 470
	orangeTriangle30.direction = "Up"
	orangeTriangle30.isVisible = true
	orangeTriangle30.rotation = 0
	orangeTriangle30Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle30, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle30Shape } )
	orangeTriangle30.gravityScale = -0.02
	orangeTriangle30.isAwake = false
	orangeTriangle30.isBodyActive = false
	orangeTriangle30:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle30 )
	
	blueWall43 = display.newImageRect( "blueWall.png", 90, 25 )
	blueWall43.x, blueWall43.y = 360, 540
	blueWall43.direction = "Up"
	blueWall43.myName = "blueWall43"
	blueWall43.isVisible = false
	physics.addBody( blueWall43, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall43.isAwake = false
	blueWall43.gravityScale = -0.02
	sceneGroup:insert( blueWall43)
	
	blueWall44 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall44.x, blueWall44.y = 152, 540
	blueWall44.direction = "Up"
	blueWall44.myName = "blueWall44"
	blueWall44.isVisible = true
	blueWall44.isEven = true
	physics.addBody( blueWall44, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall44.isAwake = false
	blueWall44.gravityScale = -0.02
	sceneGroup:insert( blueWall44)
	
	blueWall45 = display.newImageRect( "blueWall.png", 260, 25 )
	blueWall45.x, blueWall45.y = 220, 340
	blueWall45.direction = "Up"
	blueWall45.myName = "blueWall45"
	blueWall45.isVisible = false
	physics.addBody( blueWall45, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall45.isAwake = false
	blueWall45.gravityScale = -0.07
	sceneGroup:insert( blueWall45)
	
	blueWall46 = display.newImageRect( "blueWall.png", 45, 25 )
	blueWall46.x, blueWall46.y = 405, 340
	blueWall46.direction = "Up"
	blueWall46.myName = "blueWall46"
	blueWall46.isVisible = false
	blueWall46.isEven = true
	physics.addBody( blueWall46, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall46.isAwake = false
	blueWall46.gravityScale = -0.07
	sceneGroup:insert( blueWall46)
	
	blueWall47 = display.newImageRect( "blueWall.png", 180, 25 )
	blueWall47.x, blueWall47.y = 155, 490
	blueWall47.direction = "Up"
	blueWall47.myName = "blueWall47"
	blueWall47.isVisible = true
	physics.addBody( blueWall47, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall47.isAwake = false
	blueWall47.gravityScale = -0.04
	sceneGroup:insert( blueWall47)
	
	blueWall48 = display.newImageRect( "blueWall.png", 90, 25 )
	blueWall48.x, blueWall48.y = 360, 490
	blueWall48.direction = "Up"
	blueWall48.myName = "blueWall48"
	blueWall48.isVisible = true
	blueWall48.isEven = true
	physics.addBody( blueWall48, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall48.isAwake = false
	blueWall48.gravityScale = -0.04
	sceneGroup:insert( blueWall48)
	
	blueWall49 = display.newImageRect( "blueWall.png", 140, 25 )
	blueWall49.x, blueWall49.y = 130, 690
	blueWall49.direction = "Up"
	blueWall49.myName = "blueWall49"
	blueWall49.isVisible = true
	physics.addBody( blueWall49, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall49.isAwake = false
	blueWall49.gravityScale = -0.04
	sceneGroup:insert( blueWall49)
	
	blueWall50 = display.newImageRect( "blueWall.png", 130, 25 )
	blueWall50.x, blueWall50.y = 295, 690
	blueWall50.direction = "Up"
	blueWall50.myName = "blueWall50"
	blueWall50.isVisible = true
	blueWall50.isEven = true
	physics.addBody( blueWall50, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall50.isAwake = false
	blueWall50.gravityScale = -0.04
	sceneGroup:insert( blueWall50)
	
	blueWall51 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall51.x, blueWall51.y = 160, 890
	blueWall51.direction = "Up"
	blueWall51.myName = "blueWall51"
	blueWall51.isVisible = true
	physics.addBody( blueWall51, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall51.isAwake = false
	blueWall51.gravityScale = -0.04
	sceneGroup:insert( blueWall51)
	
	blueWall52 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall52.x, blueWall52.y = 180, 920
	blueWall52.direction = "Up"
	blueWall52.myName = "blueWall52"
	blueWall52.isVisible = true
	blueWall52.isEven = true
	physics.addBody( blueWall52, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall52.isAwake = false
	blueWall52.gravityScale = -0.04
	sceneGroup:insert( blueWall52)
	
	blueWall53 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall53.x, blueWall53.y = 200, 950
	blueWall53.direction = "Up"
	blueWall53.myName = "blueWall53"
	blueWall53.isVisible = true
	physics.addBody( blueWall53, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall53.isAwake = false
	blueWall53.gravityScale = -0.04
	sceneGroup:insert( blueWall53)
	
	blueWall54 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall54.x, blueWall54.y = 220, 980
	blueWall54.direction = "Up"
	blueWall54.myName = "blueWall54"
	blueWall54.isVisible = true
	blueWall54.isEven = true
	physics.addBody( blueWall54, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall54.isAwake = false
	blueWall54.gravityScale = -0.04
	sceneGroup:insert( blueWall54)
	
	blueWall55 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall55.x, blueWall55.y = 240, 1010
	blueWall55.direction = "Up"
	blueWall55.myName = "blueWall55"
	blueWall55.isVisible = true
	physics.addBody( blueWall55, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall55.isAwake = false
	blueWall55.gravityScale = -0.04
	sceneGroup:insert( blueWall55)
	
	blueWall56 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall56.x, blueWall56.y = 330, 1210
	blueWall56.direction = "Up"
	blueWall56.myName = "blueWall56"
	blueWall56.isVisible = true
	blueWall56.isEven = true
	physics.addBody( blueWall56, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall56.isAwake = false
	blueWall56.gravityScale = -0.04
	sceneGroup:insert( blueWall56)
	
		blueWall57 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall57.x, blueWall57.y = 320, 1240
	blueWall57.direction = "Up"
	blueWall57.myName = "blueWall57"
	blueWall57.isVisible = true
	physics.addBody( blueWall57, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall57.isAwake = false
	blueWall57.gravityScale = -0.04
	sceneGroup:insert( blueWall57)
	
	blueWall58 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall58.x, blueWall58.y = 300, 1270
	blueWall58.direction = "Up"
	blueWall58.myName = "blueWall58"
	blueWall58.isVisible = true
	blueWall58.isEven = true
	physics.addBody( blueWall58, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall58.isAwake = false
	blueWall58.gravityScale = -0.04
	sceneGroup:insert( blueWall58)
	
	blueWall59 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall59.x, blueWall59.y = 280, 1300
	blueWall59.direction = "Up"
	blueWall59.myName = "blueWall59"
	blueWall59.isVisible = true
	physics.addBody( blueWall59, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall59.isAwake = false
	blueWall59.gravityScale = -0.04
	sceneGroup:insert( blueWall59)
	
	blueWall60 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall60.x, blueWall60.y = 260, 1330
	blueWall60.direction = "Up"
	blueWall60.myName = "blueWall60"
	blueWall60.isVisible = true
	blueWall60.isEven = true
	physics.addBody( blueWall60, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall60.isAwake = false
	blueWall60.gravityScale = -0.04
	sceneGroup:insert( blueWall60)
	
	blueWall61 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall61.x, blueWall61.y = 240, 1360
	blueWall61.direction = "Up"
	blueWall61.myName = "blueWall61"
	blueWall61.isVisible = true
	physics.addBody( blueWall61, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall61.isAwake = false
	blueWall61.gravityScale = -0.04
	sceneGroup:insert( blueWall61)
	
			blueWall62 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall62.x, blueWall62.y = 155, 300
	blueWall62.direction = "Up"
	blueWall62.myName = "blueWall62"
	blueWall62.isVisible = false
	blueWall62.isEven = true
	physics.addBody( blueWall62, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall62.isAwake = false
	blueWall62.gravityScale = -0.2
	sceneGroup:insert( blueWall62)
	
	blueWall63 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall63.x, blueWall63.y = 175, 330
	blueWall63.direction = "Up"
	blueWall63.myName = "blueWall63"
	blueWall63.isVisible = false
	physics.addBody( blueWall63, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall63.isAwake = false
	blueWall63.gravityScale = -0.2
	sceneGroup:insert( blueWall63)
	
	blueWall64 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall64.x, blueWall64.y = 195, 360
	blueWall64.direction = "Up"
	blueWall64.myName = "blueWall64"
	blueWall64.isVisible = true
	blueWall64.isEven = true
	physics.addBody( blueWall64, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall64.isAwake = false
	blueWall64.gravityScale = -0.2
	sceneGroup:insert( blueWall64)
	
	blueWall65 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall65.x, blueWall65.y = 215, 390
	blueWall65.direction = "Up"
	blueWall65.myName = "blueWall65"
	blueWall65.isVisible = true
	physics.addBody( blueWall65, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall65.isAwake = false
	blueWall65.gravityScale = -0.2
	sceneGroup:insert( blueWall65)
	
	blueWall66 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall66.x, blueWall66.y = 235, 420
	blueWall66.direction = "Up"
	blueWall66.myName = "blueWall66"
	blueWall66.isVisible = true
	blueWall66.isEven = true
	physics.addBody( blueWall66, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall66.isAwake = false
	blueWall66.gravityScale = -0.2
	sceneGroup:insert( blueWall66)
	
				blueWall67 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall67.x, blueWall67.y = 330, 600
	blueWall67.direction = "Up"
	blueWall67.myName = "blueWall67"
	blueWall67.isVisible = true
	physics.addBody( blueWall67, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall67.isAwake = false
	blueWall67.gravityScale = -0.18
	sceneGroup:insert( blueWall67)
	
	blueWall68 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall68.x, blueWall68.y = 320, 630
	blueWall68.direction = "Up"
	blueWall68.myName = "blueWall68"
	blueWall68.isVisible = true
	blueWall68.isEven = true
	physics.addBody( blueWall68, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall68.isAwake = false
	blueWall68.gravityScale = -0.18
	sceneGroup:insert( blueWall68)
	
	blueWall69 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall69.x, blueWall69.y = 300, 660
	blueWall69.direction = "Up"
	blueWall69.myName = "blueWall69"
	blueWall69.isVisible = true
	physics.addBody( blueWall69, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall69.isAwake = false
	blueWall69.gravityScale = -0.18
	sceneGroup:insert( blueWall69)
	
	blueWall70 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall70.x, blueWall70.y = 280, 690
	blueWall70.direction = "Up"
	blueWall70.myName = "blueWall70"
	blueWall70.isVisible = true
	blueWall70.isEven = true
	physics.addBody( blueWall70, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall70.isAwake = false
	blueWall70.gravityScale = -0.18
	sceneGroup:insert( blueWall70)
	
	blueWall71 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall71.x, blueWall71.y = 260, 720
	blueWall71.direction = "Up"
	blueWall71.myName = "blueWall71"
	blueWall71.isVisible = true
	physics.addBody( blueWall71, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall71.isAwake = false
	blueWall71.gravityScale = -0.18
	sceneGroup:insert( blueWall71)
	
			blueWall72 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall72.x, blueWall72.y = 155, 890
	blueWall72.direction = "Up"
	blueWall72.myName = "blueWall72"
	blueWall72.isVisible = true
	blueWall72.isEven = true
	physics.addBody( blueWall72, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall72.isAwake = false
	blueWall72.gravityScale = -0.14
	sceneGroup:insert( blueWall72)
	
	blueWall73 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall73.x, blueWall73.y = 175, 920
	blueWall73.direction = "Up"
	blueWall73.myName = "blueWall73"
	blueWall73.isVisible = true
	physics.addBody( blueWall73, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall73.isAwake = false
	blueWall73.gravityScale = -0.14
	sceneGroup:insert( blueWall73)
	
	blueWall74 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall74.x, blueWall74.y = 195, 950
	blueWall74.direction = "Up"
	blueWall74.myName = "blueWall74"
	blueWall74.isVisible = true
	blueWall74.isEven = true
	physics.addBody( blueWall74, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall74.isAwake = false
	blueWall74.gravityScale = -0.14
	sceneGroup:insert( blueWall74)
	
	blueWall75 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall75.x, blueWall75.y = 215, 980
	blueWall75.direction = "Up"
	blueWall75.myName = "blueWall75"
	blueWall75.isVisible = true
	physics.addBody( blueWall75, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall75.isAwake = false
	blueWall75.gravityScale = -0.14
	sceneGroup:insert( blueWall75)
	
	blueWall76 = display.newImageRect( "blueWall.png", 195, 25 )
	blueWall76.x, blueWall76.y = 235, 1010
	blueWall76.direction = "Up"
	blueWall76.myName = "blueWall76"
	blueWall76.isVisible = true
	blueWall76.isEven = true
	physics.addBody( blueWall76, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall76.isAwake = false
	blueWall76.gravityScale = -0.14
	sceneGroup:insert( blueWall76)

		blueWall77 = display.newImageRect( "blueWall.png", 95, 25 )
	blueWall77.x, blueWall77.y = 387, 310
	blueWall77.direction = "Up"
	blueWall77.myName = "blueWall77"
	blueWall77.isVisible = false
	physics.addBody( blueWall77, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall77.isAwake = false
	blueWall77.gravityScale = -0.14
	sceneGroup:insert( blueWall77)
	
	blueWall78 = display.newImageRect( "blueWall.png", 65, 25 )
	blueWall78.x, blueWall78.y = 270, 460
	blueWall78.direction = "Up"
	blueWall78.myName = "blueWall78"
	blueWall78.isVisible = false
	blueWall78.isEven = true
	physics.addBody( blueWall78, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall78.isAwake = false
	blueWall78.gravityScale = -0.14
	sceneGroup:insert( blueWall78)
	
	blueWall79 = display.newImageRect( "blueWall.png", 75, 25 )
	blueWall79.x, blueWall79.y = 387, 610
	blueWall79.direction = "Up"
	blueWall79.myName = "blueWall79"
	blueWall79.isVisible = false
	physics.addBody( blueWall79, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall79.isAwake = false
	blueWall79.gravityScale = -0.14
	sceneGroup:insert( blueWall79)
	
	blueWall80 = display.newImageRect( "blueWall.png", 175, 25 )
	blueWall80.x, blueWall80.y = 330, 760
	blueWall80.direction = "Up"
	blueWall80.myName = "blueWall80"
	blueWall80.isVisible = false
	blueWall80.isEven = true
	physics.addBody( blueWall80, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall80.isAwake = false
	blueWall80.gravityScale = -0.14
	sceneGroup:insert( blueWall80)
	
		blueWall81 = display.newImageRect( "blueWall.png", 400, 25 )
	blueWall81.x, blueWall81.y = 235, 460
	blueWall81.rotation = 90
	blueWall81.direction = "Up"
	blueWall81.myName = "blueWall81"
	blueWall81.isVisible = false
	physics.addBody( blueWall81, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall81.isAwake = false
	blueWall81.gravityScale = -0.14
	sceneGroup:insert( blueWall81)
	
		blueWall82 = display.newImageRect( "blueWall.png", 400, 25 )
	blueWall82.x, blueWall82.y = 200, 660
	blueWall82.rotation = 90
	blueWall82.direction = "Up"
	blueWall82.myName = "blueWall82"
	blueWall82.isVisible = false
	blueWall82.isEven = true
	physics.addBody( blueWall82, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall82.isAwake = false
	blueWall82.gravityScale = -0.14
	sceneGroup:insert( blueWall82)
	
		blueWall83 = display.newImageRect( "blueWall.png", 115, 25 )
	blueWall83.x, blueWall83.y = 110, 275
	blueWall83.rotation = 0
	blueWall83.direction = "Up"
	blueWall83.myName = "blueWall83"
	blueWall83.isVisible = false
	physics.addBody( blueWall83, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall83.isAwake = false
	blueWall83.gravityScale = -0.04
	sceneGroup:insert( blueWall83)
	
	blueWall84 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall84.x, blueWall84.y = 230, -65
	blueWall84.rotation = 0
	blueWall84.direction = "Down"
	blueWall84.myName = "blueWall84"
	blueWall84.isVisible = true
	blueWall84.isEven = true
	physics.addBody( blueWall84, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall84.isAwake = false
	blueWall84.gravityScale = 0.03
	sceneGroup:insert( blueWall84)
	
		orangeTriangle31 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle31.x, orangeTriangle31.y = 295, -95
	orangeTriangle31.direction = "Down"
	orangeTriangle31.isVisible = true
	orangeTriangle31.rotation = 0
	orangeTriangle31Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle31, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle31Shape } )
	orangeTriangle31.gravityScale = 0.03
	orangeTriangle31.isAwake = false
	orangeTriangle31.isBodyActive = false
	orangeTriangle31:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle31 )
	
	blueWall85 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall85.x, blueWall85.y = 310, -140
	blueWall85.rotation = 0
	blueWall85.direction = "Down"
	blueWall85.myName = "blueWall85"
	blueWall85.isVisible = true
	physics.addBody( blueWall85, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall85.isAwake = false
	blueWall85.gravityScale = 0.03
	sceneGroup:insert( blueWall85)
	
	orangeTriangle32 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle32.x, orangeTriangle32.y = 365, -155
	orangeTriangle32.direction = "Down"
	orangeTriangle32.isVisible = true
	orangeTriangle32.rotation = 0
	orangeTriangle32Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle32, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle32Shape } )
	orangeTriangle32.gravityScale = 0.03
	orangeTriangle32.isAwake = false
	orangeTriangle32.isBodyActive = false
	orangeTriangle32:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle32 )
	
		blueWall86 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall86.x, blueWall86.y = 390, -215
	blueWall86.rotation = 0
	blueWall86.direction = "Down"
	blueWall86.myName = "blueWall86"
	blueWall86.isVisible = true
	blueWall86.isEven = true
	physics.addBody( blueWall86, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall86.isAwake = false
	blueWall86.gravityScale = 0.03
	sceneGroup:insert( blueWall86)
	
		blueWall87 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall87.x, blueWall87.y = 290, -280
	blueWall87.rotation = 0
	blueWall87.direction = "Down"
	blueWall87.myName = "blueWall87"
	blueWall87.isVisible = true
	physics.addBody( blueWall87, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall87.isAwake = false
	blueWall87.gravityScale = 0.03
	sceneGroup:insert( blueWall87)
	
	orangeTriangle33 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle33.x, orangeTriangle33.y = 250, -312
	orangeTriangle33.direction = "Down"
	orangeTriangle33.isVisible = true
	orangeTriangle33.rotation = 0
	orangeTriangle33Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle33, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle33Shape } )
	orangeTriangle33.gravityScale = 0.03
	orangeTriangle33.isAwake = false
	orangeTriangle33.isBodyActive = false
	orangeTriangle33:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle33 )
	
	blueWall88 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall88.x, blueWall88.y = 220, -355
	blueWall88.rotation = 0
	blueWall88.direction = "Down"
	blueWall88.myName = "blueWall88"
	blueWall88.isVisible = true
	blueWall88.isEven = true
	physics.addBody( blueWall88, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall88.isAwake = false
	blueWall88.gravityScale = 0.03
	sceneGroup:insert( blueWall88)
	
	orangeTriangle34 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle34.x, orangeTriangle34.y = 170, -387
	orangeTriangle34.direction = "Down"
	orangeTriangle34.isVisible = true
	orangeTriangle34.rotation = 0
	orangeTriangle34Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle34, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle34Shape } )
	orangeTriangle34.gravityScale = 0.03
	orangeTriangle34.isAwake = false
	orangeTriangle34.isBodyActive = false
	orangeTriangle34:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle34 )
	
	blueWall89 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall89.x, blueWall89.y = 140, -430
	blueWall89.rotation = 0
	blueWall89.direction = "Down"
	blueWall89.myName = "blueWall89"
	blueWall89.isVisible = true
	physics.addBody( blueWall89, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall89.isAwake = false
	blueWall89.gravityScale = 0.03
	sceneGroup:insert( blueWall89)
	
		blueWall90 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall90.x, blueWall90.y = 80, -485
	blueWall90.rotation = 0
	blueWall90.direction = "Down"
	blueWall90.myName = "blueWall90"
	blueWall90.isVisible = true
	blueWall90.isEven = true
	physics.addBody( blueWall90, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall90.isAwake = false
	blueWall90.gravityScale = 0.03
	sceneGroup:insert( blueWall90)
	
	blueWall91 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall91.x, blueWall91.y = 160, 260
	blueWall91.rotation = 0
	blueWall91.direction = "Down"
	blueWall91.myName = "blueWall91"
	blueWall91.isVisible = false
	physics.addBody( blueWall91, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall91.isAwake = false
	blueWall91.gravityScale = 0.03
	sceneGroup:insert( blueWall91)
	
		blueWall92 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall92.x, blueWall92.y = 230, 205
	blueWall92.rotation = 0
	blueWall92.direction = "Down"
	blueWall92.myName = "blueWall92"
	blueWall92.isVisible = false
	blueWall92.isEven = true
	physics.addBody( blueWall92, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall92.isAwake = false
	blueWall92.gravityScale = 0.03
	sceneGroup:insert( blueWall92)
	
	blueWall93 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall93.x, blueWall93.y = 305, 145
	blueWall93.rotation = 0
	blueWall93.direction = "Down"
	blueWall93.myName = "blueWall93"
	blueWall93.isVisible = false
	physics.addBody( blueWall93, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall93.isAwake = false
	blueWall93.gravityScale = 0.03
	sceneGroup:insert( blueWall93)
	
	blueWall94 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall94.x, blueWall94.y = 390, 75
	blueWall94.rotation = 0
	blueWall94.direction = "Down"
	blueWall94.myName = "blueWall94"
	blueWall94.isVisible = false
	blueWall94.isEven = true
	physics.addBody( blueWall94, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall94.isAwake = false
	blueWall94.gravityScale = 0.03
	sceneGroup:insert( blueWall94)
	
	blueWall95 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall95.x, blueWall95.y = 285, 10
	blueWall95.rotation = 0
	blueWall95.direction = "Down"
	blueWall95.myName = "blueWall95"
	blueWall95.isVisible = false
	physics.addBody( blueWall95, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall95.isAwake = false
	blueWall95.gravityScale = 0.03
	sceneGroup:insert( blueWall95)
	
	blueWall96 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall96.x, blueWall96.y = 205, -60
	blueWall96.rotation = 0
	blueWall96.direction = "Down"
	blueWall96.myName = "blueWall96"
	blueWall96.isVisible = false
	blueWall96.isEven = true
	physics.addBody( blueWall96, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall96.isAwake = false
	blueWall96.gravityScale = 0.03
	sceneGroup:insert( blueWall96)
	
		blueWall97 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall97.x, blueWall97.y = 130, -130
	blueWall97.rotation = 0
	blueWall97.direction = "Down"
	blueWall97.myName = "blueWall97"
	blueWall97.isVisible = false
	physics.addBody( blueWall97, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall97.isAwake = false
	blueWall97.gravityScale = 0.03
	sceneGroup:insert( blueWall97)
	
		blueWall98 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall98.x, blueWall98.y = 60, -200
	blueWall98.rotation = 0
	blueWall98.direction = "Down"
	blueWall98.myName = "blueWall98"
	blueWall98.isVisible = false
	blueWall98.isEven = true
	physics.addBody( blueWall98, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall98.isAwake = false
	blueWall98.gravityScale = 0.03
	sceneGroup:insert( blueWall98)
	
		orangeTriangle35 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle35.x, orangeTriangle35.y = 340, -250
	orangeTriangle35.direction = "Down"
	orangeTriangle35.isVisible = true
	orangeTriangle35.rotation = 180
	orangeTriangle35Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle35, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle35Shape } )
	orangeTriangle35.gravityScale = 0.05
	orangeTriangle35.isAwake = false
	orangeTriangle35.isBodyActive = false
	orangeTriangle35:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle35 )
	
	orangeTriangle36 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle36.x, orangeTriangle36.y = 220, -400
	orangeTriangle36.direction = "Down"
	orangeTriangle36.isVisible = true
	orangeTriangle36.rotation = 180
	orangeTriangle36Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle36, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle36Shape } )
	orangeTriangle36.gravityScale = 0.05
	orangeTriangle36.isAwake = false
	orangeTriangle36.isBodyActive = false
	orangeTriangle36:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle36 )
	
	orangeTriangle37 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle37.x, orangeTriangle37.y = 100, -550
	orangeTriangle37.direction = "Down"
	orangeTriangle37.isVisible = true
	orangeTriangle37.rotation = 180
	orangeTriangle37Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle37, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle37Shape } )
	orangeTriangle37.gravityScale = 0.05
	orangeTriangle37.isAwake = false
	orangeTriangle37.isBodyActive = false
	orangeTriangle37:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle37 )
	
	blueWall99 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall99.x, blueWall99.y = 160, 260
	blueWall99.rotation = 0
	blueWall99.direction = "Down"
	blueWall99.myName = "blueWall99"
	blueWall99.isVisible = false
	physics.addBody( blueWall99, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall99.isAwake = false
	blueWall99.gravityScale = 0.03
	sceneGroup:insert( blueWall99)
	
		blueWall100 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall100.x, blueWall100.y = 230, 205
	blueWall100.rotation = 0
	blueWall100.direction = "Down"
	blueWall100.myName = "blueWall100"
	blueWall100.isVisible = false
	blueWall100.isEven = true
	physics.addBody( blueWall100, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall100.isAwake = false
	blueWall100.gravityScale = 0.03
	sceneGroup:insert( blueWall100)
	
	blueWall101 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall101.x, blueWall101.y = 305, 145
	blueWall101.rotation = 0
	blueWall101.direction = "Down"
	blueWall101.myName = "blueWall101"
	blueWall101.isVisible = false
	physics.addBody( blueWall101, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall101.isAwake = false
	blueWall101.gravityScale = 0.03
	sceneGroup:insert( blueWall101)
	
	blueWall102 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall102.x, blueWall102.y = 390, 75
	blueWall102.rotation = 0
	blueWall102.direction = "Down"
	blueWall102.myName = "blueWall102"
	blueWall102.isVisible = false
	blueWall102.isEven = true
	physics.addBody( blueWall102, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall102.isAwake = false
	blueWall102.gravityScale = 0.03
	sceneGroup:insert( blueWall102)
	
	blueWall103 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall103.x, blueWall103.y = 285, 10
	blueWall103.rotation = 0
	blueWall103.direction = "Down"
	blueWall103.myName = "blueWall103"
	blueWall103.isVisible = false
	physics.addBody( blueWall103, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall103.isAwake = false
	blueWall103.gravityScale = 0.03
	sceneGroup:insert( blueWall103)
	
	blueWall104 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall104.x, blueWall104.y = 205, -60
	blueWall104.rotation = 0
	blueWall104.direction = "Down"
	blueWall104.myName = "blueWall104"
	blueWall104.isVisible = false
	blueWall104.isEven = true
	physics.addBody( blueWall104, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall104.isAwake = false
	blueWall104.gravityScale = 0.03
	sceneGroup:insert( blueWall104)
	
		blueWall105 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall105.x, blueWall105.y = 130, -130
	blueWall105.rotation = 0
	blueWall105.direction = "Down"
	blueWall105.myName = "blueWall105"
	blueWall105.isVisible = false
	physics.addBody( blueWall105, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall105.isAwake = false
	blueWall105.gravityScale = 0.03
	sceneGroup:insert( blueWall105)
	
		blueWall106 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall106.x, blueWall106.y = 60, -200
	blueWall106.rotation = 0
	blueWall106.direction = "Down"
	blueWall106.myName = "blueWall106"
	blueWall106.isVisible = false
	blueWall106.isEven = true
	physics.addBody( blueWall106, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall106.isAwake = false
	blueWall106.gravityScale = 0.03
	sceneGroup:insert( blueWall106)
	
		orangeTriangle38 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle38.x, orangeTriangle38.y = 340, -250
	orangeTriangle38.direction = "Down"
	orangeTriangle38.isVisible = true
	orangeTriangle38.rotation = 180
	orangeTriangle38Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle38, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle38Shape } )
	orangeTriangle38.gravityScale = 0.05
	orangeTriangle38.isAwake = false
	orangeTriangle38:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle38 )
	
	orangeTriangle39 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle39.x, orangeTriangle39.y = 220, -400
	orangeTriangle39.direction = "Down"
	orangeTriangle39.isVisible = true
	orangeTriangle39.rotation = 180
	orangeTriangle39Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle39, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle39Shape } )
	orangeTriangle39.gravityScale = 0.05
	orangeTriangle39.isAwake = false
	orangeTriangle39:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle39 )
	
	orangeTriangle40 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle40.x, orangeTriangle40.y = 100, -550
	orangeTriangle40.direction = "Down"
	orangeTriangle40.isVisible = true
	orangeTriangle40.rotation = 180
	orangeTriangle40Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle40, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle40Shape } )
	orangeTriangle40.gravityScale = 0.05
	orangeTriangle40.isAwake = false
	orangeTriangle40:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle40 )

	blueWall107 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall107.x, blueWall107.y = 160, 260
	blueWall107.rotation = 0
	blueWall107.direction = "Down"
	blueWall107.myName = "blueWall107"
	blueWall107.isVisible = false
	physics.addBody( blueWall107, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall107.isAwake = false
	blueWall107.gravityScale = 0.03
	sceneGroup:insert( blueWall107)
	
		blueWall108 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall108.x, blueWall108.y = 230, 205
	blueWall108.rotation = 0
	blueWall108.direction = "Down"
	blueWall108.myName = "blueWall108"
	blueWall108.isVisible = false
	blueWall108.isEven = true
	physics.addBody( blueWall108, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall108.isAwake = false
	blueWall108.gravityScale = 0.03
	sceneGroup:insert( blueWall108)
	
	blueWall109 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall109.x, blueWall109.y = 305, 145
	blueWall109.rotation = 0
	blueWall109.direction = "Down"
	blueWall109.myName = "blueWall109"
	blueWall109.isVisible = false
	physics.addBody( blueWall109, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall109.isAwake = false
	blueWall109.gravityScale = 0.03
	sceneGroup:insert( blueWall109)
	
	blueWall110 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall110.x, blueWall110.y = 390, 75
	blueWall110.rotation = 0
	blueWall110.direction = "Down"
	blueWall110.myName = "blueWall110"
	blueWall110.isVisible = false
	blueWall110.isEven = true
	physics.addBody( blueWall110, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall110.isAwake = false
	blueWall110.gravityScale = 0.03
	sceneGroup:insert( blueWall110)
	
	blueWall111 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall111.x, blueWall111.y = 285, 10
	blueWall111.rotation = 0
	blueWall111.direction = "Down"
	blueWall111.myName = "blueWall111"
	blueWall111.isVisible = false
	physics.addBody( blueWall111, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall111.isAwake = false
	blueWall111.gravityScale = 0.03
	sceneGroup:insert( blueWall111)
	
	blueWall112 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall112.x, blueWall112.y = 205, -60
	blueWall112.rotation = 0
	blueWall112.direction = "Down"
	blueWall112.myName = "blueWall112"
	blueWall112.isVisible = false
	blueWall112.isEven = true
	physics.addBody( blueWall112, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall112.isAwake = false
	blueWall112.gravityScale = 0.03
	sceneGroup:insert( blueWall112)
	
		blueWall113 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall113.x, blueWall113.y = 130, -130
	blueWall113.rotation = 0
	blueWall113.direction = "Down"
	blueWall113.myName = "blueWall113"
	blueWall113.isVisible = false
	physics.addBody( blueWall113, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall113.isAwake = false
	blueWall113.gravityScale = 0.03
	sceneGroup:insert( blueWall113)
	
		blueWall114 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall114.x, blueWall114.y = 60, -200
	blueWall114.rotation = 0
	blueWall114.direction = "Down"
	blueWall114.myName = "blueWall114"
	blueWall114.isVisible = false
	blueWall114.isEven = true
	physics.addBody( blueWall114, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall114.isAwake = false
	blueWall114.gravityScale = 0.03
	sceneGroup:insert( blueWall114)
	
		orangeTriangle41 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle41.x, orangeTriangle41.y = 340, -250
	orangeTriangle41.direction = "Down"
	orangeTriangle41.isVisible = true
	orangeTriangle41.rotation = 180
	orangeTriangle41Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle41, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle41Shape } )
	orangeTriangle41.gravityScale = 0.05
	orangeTriangle41.isAwake = false
	orangeTriangle41.isBodyActive = false
	orangeTriangle41:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle41 )
	
	orangeTriangle42 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle42.x, orangeTriangle42.y = 220, -400
	orangeTriangle42.direction = "Down"
	orangeTriangle42.isVisible = true
	orangeTriangle42.rotation = 180
	orangeTriangle42Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle42, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle42Shape } )
	orangeTriangle42.gravityScale = 0.05
	orangeTriangle42.isAwake = false
	orangeTriangle42.isBodyActive = false
	orangeTriangle42:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle42 )
	
	orangeTriangle43 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle43.x, orangeTriangle43.y = 100, -550
	orangeTriangle43.direction = "Down"
	orangeTriangle43.isVisible = true
	orangeTriangle43.rotation = 180
	orangeTriangle43Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle43, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle43Shape } )
	orangeTriangle43.gravityScale = 0.05
	orangeTriangle43.isAwake = false
	orangeTriangle43.isBodyActive = false
	orangeTriangle43:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( orangeTriangle43 )
	
	blueWall115 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall115.x, blueWall115.y = 220, 280
	blueWall115.rotation = 195
	blueWall115.direction = "Up"
	blueWall115.myName = "blueWall115"
	blueWall115.isVisible = false
	physics.addBody( blueWall115, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall115.isAwake = false
	blueWall115.gravityScale = -0.06
	sceneGroup:insert( blueWall115)
	
	blueWall116 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall116.x, blueWall116.y = 360, 480
	blueWall116.rotation = 125
	blueWall116.direction = "Up"
	blueWall116.myName = "blueWall116"
	blueWall116.isVisible = false
	blueWall116.isEven = true
	physics.addBody( blueWall116, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall116.isAwake = false
	blueWall116.gravityScale = -0.06
	sceneGroup:insert( blueWall116)
	
		blueWall117 = display.newImageRect( "blueWall.png", 130, 25 )
	blueWall117.x, blueWall117.y = 220, 660
	blueWall117.rotation = 190
	blueWall117.direction = "Up"
	blueWall117.myName = "blueWall117"
	blueWall117.isVisible = false
	physics.addBody( blueWall117, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall117.isAwake = false
	blueWall117.gravityScale = -0.06
	sceneGroup:insert( blueWall117)
	
	blueWall118 = display.newImageRect( "blueWall.png", 105, 25 )
	blueWall118.x, blueWall118.y = 110, 900
	blueWall118.rotation = 190
	blueWall118.direction = "Up"
	blueWall118.myName = "blueWall118"
	blueWall118.isVisible = true
	blueWall118.isEven = true
	physics.addBody( blueWall118, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall118.isAwake = false
	blueWall118.gravityScale = -0.06
	sceneGroup:insert( blueWall118)
	
		
	--NEW SCENE 119!!!
	
	blueWall119 = display.newImageRect( "blueWall.png", 140, 25 )
	blueWall119.x, blueWall119.y = 360, 280
	blueWall119.rotation = 0
	blueWall119.direction = "Up"
	blueWall119.myName = "blueWall119"
	blueWall119.isVisible = false
	physics.addBody( blueWall119, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall119.isAwake = false
	blueWall119.gravityScale = -0.06
	sceneGroup:insert( blueWall119)
	
		orangeTriangle44 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle44.x, orangeTriangle44.y = 200, 360
	orangeTriangle44.direction = "Up"
	orangeTriangle44.isVisible = true
	orangeTriangle44.rotation = 90
	orangeTriangle44Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle44, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle44Shape } )
	orangeTriangle44.gravityScale = -0.06
	orangeTriangle44.isAwake = false
	orangeTriangle44.isBodyActive = false
	orangeTriangle44:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle44 )
	
	blueWall120 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall120.x, blueWall120.y = 250, 400
	blueWall120.rotation = 0
	blueWall120.direction = "Up"
	blueWall120.myName = "blueWall120"
	blueWall120.isVisible = false
	blueWall120.isEven = true
	physics.addBody( blueWall120, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall120.isAwake = false
	blueWall120.gravityScale = -0.06
	sceneGroup:insert( blueWall120)
	
	orangeTriangle45 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle45.x, orangeTriangle45.y = 265, 425
	orangeTriangle45.direction = "Up"
	orangeTriangle45.isVisible = true
	orangeTriangle45.rotation = 90
	orangeTriangle45Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle45, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle45Shape } )
	orangeTriangle45.gravityScale = -0.06
	orangeTriangle45.isAwake = false
	orangeTriangle45.isBodyActive = false
	orangeTriangle45:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle45 )
	
	orangeTriangle46 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle46.x, orangeTriangle46.y = 280, 467
	orangeTriangle46.direction = "Up"
	orangeTriangle46.isVisible = true
	orangeTriangle46.rotation = 90
	orangeTriangle46Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle46, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle46Shape } )
	orangeTriangle46.gravityScale = -0.06
	orangeTriangle46.isAwake = false
	orangeTriangle46.isBodyActive = false
	orangeTriangle46:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle46 )
	
	orangeTriangle47 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle47.x, orangeTriangle47.y = 290, 510
	orangeTriangle47.direction = "Up"
	orangeTriangle47.isVisible = true
	orangeTriangle47.rotation = 90
	orangeTriangle47Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle47, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle47Shape } )
	orangeTriangle47.gravityScale = -0.06
	orangeTriangle47.isAwake = false
	orangeTriangle47.isBodyActive = false
	orangeTriangle47:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle47 )
	
		blueWall121 = display.newImageRect( "blueWall.png", 110, 25 )
	blueWall121.x, blueWall121.y = 350, 550
	blueWall121.rotation = 0
	blueWall121.direction = "Up"
	blueWall121.myName = "blueWall121"
	blueWall121.isVisible = false
	physics.addBody( blueWall121, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall121.isAwake = false
	blueWall121.gravityScale = -0.06
	sceneGroup:insert( blueWall121)
	
	--END SCENE 119!!!
	
	--NEW SCENE 122!!!
	
	blueWall122 = display.newImageRect( "blueWall.png", 110, 25 )
	blueWall122.x, blueWall122.y = 375,  320
	blueWall122.rotation = 0
	blueWall122.direction = "Up"
	blueWall122.myName = "blueWall122"
	blueWall122.isVisible = false
	blueWall122.isEven = true
	physics.addBody( blueWall122, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall122.isAwake = false
	blueWall122.gravityScale = -0.02
	sceneGroup:insert( blueWall122)
	
	blueWall123 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall123.x, blueWall123.y = 260,  320
	blueWall123.rotation = 0
	blueWall123.direction = "Up"
	blueWall123.myName = "blueWall123"
	blueWall123.isVisible = false
	physics.addBody( blueWall123, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall123.isAwake = false
	blueWall123.gravityScale = -0.02
	sceneGroup:insert( blueWall123)
	
		blueWall124 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall124.x, blueWall124.y = 160,  320
	blueWall124.rotation = 0
	blueWall124.direction = "Up"
	blueWall124.myName = "blueWall124"
	blueWall124.isVisible = false
	blueWall124.isEven = true
	physics.addBody( blueWall124, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall124.isAwake = false
	blueWall124.gravityScale = -0.02
	sceneGroup:insert( blueWall124)
	
		blueWall125 = display.newImageRect( "blueWall.png", 90, 25 )
	blueWall125.x, blueWall125.y = 75,  530
	blueWall125.rotation = 0
	blueWall125.direction = "Up"
	blueWall125.myName = "blueWall125"
	blueWall125.isVisible = false
	physics.addBody( blueWall125, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall125.isAwake = false
	blueWall125.gravityScale = -0.02
	sceneGroup:insert( blueWall125)
	
	blueWall126 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall126.x, blueWall126.y = 210,  600
	blueWall126.rotation = 0
	blueWall126.direction = "Up"
	blueWall126.myName = "blueWall126"
	blueWall126.isVisible = false
	blueWall126.isEven = true
	physics.addBody( blueWall126, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall126.isAwake = false
	blueWall126.gravityScale = -0.02
	sceneGroup:insert( blueWall126)
	
		blueWall127 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall127.x, blueWall127.y = 320,  680
	blueWall127.rotation = 0
	blueWall127.direction = "Up"
	blueWall127.myName = "blueWall127"
	blueWall127.isVisible = false
	physics.addBody( blueWall127, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall127.isAwake = false
	blueWall127.gravityScale = -0.02
	sceneGroup:insert( blueWall127)
	
			blueWall128 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall128.x, blueWall128.y = 395,  790
	blueWall128.rotation = 0
	blueWall128.direction = "Up"
	blueWall128.myName = "blueWall128"
	blueWall128.isVisible = false
	blueWall128.isEven = true
	physics.addBody( blueWall128, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall128.isAwake = false
	blueWall128.gravityScale = -0.02
	sceneGroup:insert( blueWall128)
	
	blueWall129 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall129.x, blueWall129.y = 395,  1400
	blueWall129.rotation = 0
	blueWall129.direction = "Up"
	blueWall129.myName = "blueWall129"
	blueWall129.isVisible = false
	physics.addBody( blueWall129, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall129.isAwake = false
	blueWall129.gravityScale = -0.02
	sceneGroup:insert( blueWall129)
	
	blueCircle2 = display.newImageRect( "blueCircle.png", 120, 120)
	blueCircle2.x, blueCircle2.y = 360,  880
	blueCircle2.direction = "Up"
	blueCircle2.myName = "blueCircle2"
	blueCircle2.isVisible = false
	physics.addBody( blueCircle2, { isSensor = true, density= 400, friction=10, bounce=0, radius = 60 } )
	blueCircle2.isAwake = false
	blueCircle2.gravityScale = -0.02
	sceneGroup:insert( blueCircle2)
	
	blueCircle3 = display.newImageRect( "blueCircle.png", 120, 120)
	blueCircle3.x, blueCircle3.y = 255,  950
	blueCircle3.direction = "Up"
	blueCircle3.myName = "blueCircle3"
	blueCircle3.isVisible = false
	physics.addBody( blueCircle3, { isSensor = true, density= 400, friction=10, bounce=0, radius = 60 } )
	blueCircle3.isAwake = false
	blueCircle3.gravityScale = -0.02
	sceneGroup:insert( blueCircle3)
	
		blueCircle4 = display.newImageRect( "blueCircle.png", 120, 120)
	blueCircle4.x, blueCircle4.y = 110,  1030
	blueCircle4.direction = "Up"
	blueCircle4.myName = "blueCircle4"
	blueCircle4.isVisible = false
	physics.addBody( blueCircle4, { isSensor = true, density= 400, friction=10, bounce=0, radius = 60 } )
	blueCircle4.isAwake = false
	blueCircle4.gravityScale = -0.02
	sceneGroup:insert( blueCircle4)
	
	blueCircle5 = display.newImageRect( "blueCircle.png", 240, 240)
	blueCircle5.x, blueCircle5.y = 240,  1230
	blueCircle5.direction = "Up"
	blueCircle5.myName = "blueCircle5"
	blueCircle5.isVisible = false
	physics.addBody( blueCircle5, { isSensor = true, density= 400, friction=10, bounce=0, radius = 120 } )
	blueCircle5.isAwake = false
	blueCircle5.gravityScale = -0.02
	sceneGroup:insert( blueCircle5)
	
	--END SCENE 122!!!

	--NEW SCENE 130!!!
	
		blueWall130 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall130.x, blueWall130.y = 270,  300
	blueWall130.rotation = 0
	blueWall130.direction = "Up"
	blueWall130.myName = "blueWall130"
	blueWall130.isVisible = false
	blueWall130.isEven = true
	physics.addBody( blueWall130, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall130.isAwake = false
	blueWall130.gravityScale = -0.06
	sceneGroup:insert( blueWall130)
	
	blueWall131 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall131.x, blueWall131.y = 190,  -20
	blueWall131.rotation = 0
	blueWall131.direction = "Down"
	blueWall131.myName = "blueWall131"
	blueWall131.isVisible = false
	physics.addBody( blueWall131, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall131.isAwake = false
	blueWall131.gravityScale = 0.07
	sceneGroup:insert( blueWall131)
	
		blueCircle6 = display.newImageRect( "blueCircle.png", 110, 110)
	blueCircle6.x, blueCircle6.y = 100,  550
	blueCircle6.direction = "Up"
	blueCircle6.myName = "blueCircle5"
	blueCircle6.isVisible = false
	physics.addBody( blueCircle6, { isSensor = true, density= 400, friction=10, bounce=0, radius = 55 } )
	blueCircle6.isAwake = false
	blueCircle6.gravityScale = -0.06
	sceneGroup:insert( blueCircle6)
	
	blueCircle7 = display.newImageRect( "blueCircle.png", 110, 110)
	blueCircle7.x, blueCircle7.y = 180,  700
	blueCircle7.direction = "Up"
	blueCircle7.myName = "blueCircle7"
	blueCircle7.isVisible = false
	physics.addBody( blueCircle7, { isSensor = true, density= 400, friction=10, bounce=0, radius = 55 } )
	blueCircle7.isAwake = false
	blueCircle7.gravityScale = -0.06
	sceneGroup:insert( blueCircle7)
	
	blueCircle8 = display.newImageRect( "blueCircle.png", 110, 110)
	blueCircle8.x, blueCircle8.y = 260,  800
	blueCircle8.direction = "Up"
	blueCircle8.myName = "blueCircle8"
	blueCircle8.isVisible = false
	physics.addBody( blueCircle8, { isSensor = true, density= 400, friction=10, bounce=0, radius = 55 } )
	blueCircle8.isAwake = false
	blueCircle8.gravityScale = -0.06
	sceneGroup:insert( blueCircle8)
	
	blueWall132 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall132.x, blueWall132.y = 390,  900
	blueWall132.rotation = 0
	blueWall132.direction = "Up"
	blueWall132.myName = "blueWall132"
	blueWall132.isVisible = false
	blueWall132.isEven = true
	physics.addBody( blueWall132, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall132.isAwake = false
	blueWall132.gravityScale = -0.06
	sceneGroup:insert( blueWall132)
	
	blueWall133 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall133.x, blueWall133.y = 255,  1100
	blueWall133.rotation = 0
	blueWall133.direction = "Up"
	blueWall133.myName = "blueWall133"
	blueWall133.isVisible = false
	physics.addBody( blueWall133, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall133.isAwake = false
	blueWall133.gravityScale = -0.06
	sceneGroup:insert( blueWall133)
	
	--END SCENE 130!!!
	
	--NEW SCENE 134!!!
	
	blueWall134 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall134.x, blueWall134.y = 100,  180
	blueWall134.rotation = 0
	blueWall134.direction = "Down"
	blueWall134.myName = "blueWall134"
	blueWall134.isVisible = false
	blueWall134.isEven = true
	physics.addBody( blueWall134, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall134.isAwake = false
	blueWall134.gravityScale = 0.01
	sceneGroup:insert( blueWall134)
	
	blueWall135 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall135.x, blueWall135.y = 210,  380
	blueWall135.rotation = 0
	blueWall135.direction = "Up"
	blueWall135.myName = "blueWall135"
	blueWall135.isVisible = false
	physics.addBody( blueWall135, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall135.isAwake = false
	blueWall135.gravityScale = -0.02
	sceneGroup:insert( blueWall135)
	
	blueWall136 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall136.x, blueWall136.y = 100,  -80
	blueWall136.rotation = 0
	blueWall136.direction = "Down"
	blueWall136.myName = "blueWall136"
	blueWall136.isVisible = false
	blueWall136.isEven = true
	physics.addBody( blueWall136, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall136.isAwake = false
	blueWall136.gravityScale = 0.01
	sceneGroup:insert( blueWall136)
	
	blueWall137 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall137.x, blueWall137.y = 210,  830
	blueWall137.rotation = 0
	blueWall137.direction = "Up"
	blueWall137.myName = "blueWall137"
	blueWall137.isVisible = false
	physics.addBody( blueWall137, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall137.isAwake = false
	blueWall137.gravityScale = -0.02
	sceneGroup:insert( blueWall137)
	
	blueWall138 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall138.x, blueWall138.y = 100,  -280
	blueWall138.rotation = 0
	blueWall138.direction = "Down"
	blueWall138.myName = "blueWall138"
	blueWall138.isVisible = false
	blueWall138.isEven = true
	physics.addBody( blueWall138, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall138.isAwake = false
	blueWall138.gravityScale = 0.01
	sceneGroup:insert( blueWall138)
	
	blueWall139 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall139.x, blueWall139.y = 210,  1190
	blueWall139.rotation = 0
	blueWall139.direction = "Up"
	blueWall139.myName = "blueWall139"
	blueWall139.isVisible = false
	physics.addBody( blueWall139, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall139.isAwake = false
	blueWall139.gravityScale = -0.02
	sceneGroup:insert( blueWall139)
	
	blueWall140 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall140.x, blueWall140.y = 100,  -480
	blueWall140.rotation = 0
	blueWall140.direction = "Down"
	blueWall140.myName = "blueWall140"
	blueWall140.isVisible = false
	blueWall140.isEven = true
	physics.addBody( blueWall140, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall140.isAwake = false
	blueWall140.gravityScale = 0.01
	sceneGroup:insert( blueWall140)
	
		blueWall141 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall141.x, blueWall141.y = 210,  1550
	blueWall141.rotation = 0
	blueWall141.direction = "Up"
	blueWall141.myName = "blueWall141"
	blueWall141.isVisible = false
	physics.addBody( blueWall141, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall141.isAwake = false
	blueWall141.gravityScale = -0.02
	sceneGroup:insert( blueWall141)
	
	--END SCENE 134!!!
	
	--NEW SCENE 142!!!
	
	blueWall142 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall142.x, blueWall142.y = 350,  400
	blueWall142.rotation = 130
	blueWall142.direction = "Up"
	blueWall142.myName = "blueWall142"
	blueWall142.isVisible = false
	blueWall142.isEven = true
	physics.addBody( blueWall142, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall142.isAwake = false
	blueWall142.gravityScale = -0.13
	sceneGroup:insert( blueWall142)
	
		blueWall143 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall143.x, blueWall143.y = 215,  700
	blueWall143.rotation = 50
	blueWall143.direction = "Up"
	blueWall143.myName = "blueWall143"
	blueWall143.isVisible = false
	physics.addBody( blueWall143, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall143.isAwake = false
	blueWall143.gravityScale = -0.13
	sceneGroup:insert( blueWall143)
	
	blueWall144 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall144.x, blueWall144.y = 350,  1000
	blueWall144.rotation = 130
	blueWall144.direction = "Up"
	blueWall144.myName = "blueWall144"
	blueWall144.isVisible = false
	blueWall144.isEven = true
	physics.addBody( blueWall144, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall144.isAwake = false
	blueWall144.gravityScale = -0.13
	sceneGroup:insert( blueWall144)
	
		blueWall145 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall145.x, blueWall145.y = 215,  1300
	blueWall145.rotation = 50
	blueWall145.direction = "Up"
	blueWall145.myName = "blueWall145"
	blueWall145.isVisible = false
	physics.addBody( blueWall145, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall145.isAwake = false
	blueWall145.gravityScale = -0.13
	sceneGroup:insert( blueWall145)
	
		blueWall146 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall146.x, blueWall146.y = 350,  1600
	blueWall146.rotation = 130
	blueWall146.direction = "Up"
	blueWall146.myName = "blueWall146"
	blueWall146.isVisible = false
	blueWall146.isEven = true
	physics.addBody( blueWall146, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall146.isAwake = false
	blueWall146.gravityScale = -0.13
	sceneGroup:insert( blueWall146)
	
		blueWall147 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall147.x, blueWall147.y = 215,  1900
	blueWall147.rotation = 50
	blueWall147.direction = "Up"
	blueWall147.myName = "blueWall147"
	blueWall147.isVisible = false
	physics.addBody( blueWall147, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall147.isAwake = false
	blueWall147.gravityScale = -0.13
	sceneGroup:insert( blueWall147)
	
		blueWall148 = display.newImageRect( "blueWall.png", 200, 25 )
	blueWall148.x, blueWall148.y = 350,  2200
	blueWall148.rotation = 130
	blueWall148.direction = "Up"
	blueWall148.myName = "blueWall148"
	blueWall148.isVisible = false
	blueWall148.isEven = true
	physics.addBody( blueWall148, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall148.isAwake = false
	blueWall148.gravityScale = -0.13
	sceneGroup:insert( blueWall148)
	
		blueCircle9 = display.newImageRect( "blueCircle.png", 130, 130)
	blueCircle9.x, blueCircle9.y = 110,  2800
	blueCircle9.direction = "Up"
	blueCircle9.myName = "blueCircle9"
	blueCircle9.isVisible = false
	physics.addBody( blueCircle9, { isSensor = true, density= 400, friction=10, bounce=0, radius = 65 } )
	blueCircle9.isAwake = false
	blueCircle9.gravityScale = -0.13
	sceneGroup:insert( blueCircle9)
	
		blueCircle10 = display.newImageRect( "blueCircle.png", 130, 130)
	blueCircle10.x, blueCircle10.y = 350,  3500
	blueCircle10.direction = "Up"
	blueCircle10.myName = "blueCircle10"
	blueCircle10.isVisible = false
	physics.addBody( blueCircle10, { isSensor = true, density= 400, friction=10, bounce=0, radius = 65 } )
	blueCircle10.isAwake = false
	blueCircle10.gravityScale = -0.13
	sceneGroup:insert( blueCircle10)
	
	blueCircle11 = display.newImageRect( "blueCircle.png", 130, 130)
	blueCircle11.x, blueCircle11.y = 110,  4200
	blueCircle11.direction = "Up"
	blueCircle11.myName = "blueCircle11"
	blueCircle11.isVisible = false
	physics.addBody( blueCircle11, { isSensor = true, density= 400, friction=10, bounce=0, radius = 65 } )
	blueCircle11.isAwake = false
	blueCircle11.gravityScale = -0.13
	sceneGroup:insert( blueCircle11)
	
			blueCircle12 = display.newImageRect( "blueCircle.png", 130, 130)
	blueCircle12.x, blueCircle12.y = 350,  4900
	blueCircle12.direction = "Up"
	blueCircle12.myName = "blueCircle12"
	blueCircle12.isVisible = false
	physics.addBody( blueCircle12, { isSensor = true, density= 400, friction=10, bounce=0, radius = 65 } )
	blueCircle12.isAwake = false
	blueCircle12.gravityScale = -0.13
	sceneGroup:insert( blueCircle12)
	
		blueCircle13 = display.newImageRect( "blueCircle.png", 130, 130)
	blueCircle13.x, blueCircle13.y = 110,  5600
	blueCircle13.direction = "Up"
	blueCircle13.myName = "blueCircle13"
	blueCircle13.isVisible = false
	physics.addBody( blueCircle13, { isSensor = true, density= 400, friction=10, bounce=0, radius = 65 } )
	blueCircle13.isAwake = false
	blueCircle13.gravityScale = -0.13
	sceneGroup:insert( blueCircle13)
	
	blueCircle14 = display.newImageRect( "blueCircle.png", 130, 130)
	blueCircle14.x, blueCircle14.y = 350,  6300
	blueCircle14.direction = "Up"
	blueCircle14.myName = "blueCircle14"
	blueCircle14.isVisible = false
	physics.addBody( blueCircle14, { isSensor = true, density= 400, friction=10, bounce=0, radius = 65 } )
	blueCircle14.isAwake = false
	blueCircle14.gravityScale = -0.13
	sceneGroup:insert( blueCircle14)
	
	--END SCENE 142!!

	--NEW SCENE 149!!!
	
	blueWall149 = display.newImageRect( "blueWall.png", 150, 25 )
	blueWall149.x, blueWall149.y = 240,  290
	blueWall149.rotation = 0
	blueWall149.direction = "Up"
	blueWall149.myName = "blueWall149"
	blueWall149.isVisible = false
	physics.addBody( blueWall149, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall149.isAwake = false
	blueWall149.gravityScale = -0.05
	sceneGroup:insert( blueWall149)
	
	blueWall150 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall150.x, blueWall150.y = 100,  440
	blueWall150.rotation = 0
	blueWall150.direction = "Up"
	blueWall150.myName = "blueWall150"
	blueWall150.isVisible = false
	blueWall150.isEven = true
	physics.addBody( blueWall150, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall150.isAwake = false
	blueWall150.gravityScale = -0.05
	sceneGroup:insert( blueWall150)
	
	blueWall151 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall151.x, blueWall151.y = 380,  440
	blueWall151.rotation = 0
	blueWall151.direction = "Up"
	blueWall151.myName = "blueWall151"
	blueWall151.isVisible = false
	physics.addBody( blueWall151, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall151.isAwake = false
	blueWall151.gravityScale = -0.05
	sceneGroup:insert( blueWall151)
	
	blueWall152 = display.newImageRect( "blueWall.png", 150, 25 )
	blueWall152.x, blueWall152.y = 240,  510
	blueWall152.rotation = 0
	blueWall152.direction = "Up"
	blueWall152.myName = "blueWall152"
	blueWall152.isVisible = false
	blueWall152.isEven = true
	physics.addBody( blueWall152, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall152.isAwake = false
	blueWall152.gravityScale = -0.05
	sceneGroup:insert( blueWall152)
	
		blueWall153 = display.newImageRect( "blueWall.png", 120, 25 )
	blueWall153.x, blueWall153.y = 130,  740
	blueWall153.rotation = 0
	blueWall153.direction = "Up"
	blueWall153.myName = "blueWall153"
	blueWall153.isVisible = false
	physics.addBody( blueWall153, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall153.isAwake = false
	blueWall153.gravityScale = -0.05
	sceneGroup:insert( blueWall153)
	
	blueWall154 = display.newImageRect( "blueWall.png",120, 25 )
	blueWall154.x, blueWall154.y = 350,  740
	blueWall154.rotation = 0
	blueWall154.direction = "Up"
	blueWall154.myName = "blueWall154"
	blueWall154.isVisible = false
	blueWall154.isEven = true
	physics.addBody( blueWall154, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall154.isAwake = false
	blueWall154.gravityScale = -0.05
	sceneGroup:insert( blueWall154)
	
	blueWall155 = display.newImageRect( "blueWall.png", 150, 25 )
	blueWall155.x, blueWall155.y = 240,  910
	blueWall155.rotation = 0
	blueWall155.direction = "Up"
	blueWall155.myName = "blueWall155"
	blueWall155.isVisible = false
	physics.addBody( blueWall155, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall155.isAwake = false
	blueWall155.gravityScale = -0.05
	sceneGroup:insert( blueWall155)
	
			blueWall156 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall156.x, blueWall156.y = 130,  1040
	blueWall156.rotation = 0
	blueWall156.direction = "Up"
	blueWall156.myName = "blueWall156"
	blueWall156.isVisible = false
	blueWall156.isEven = true
	physics.addBody( blueWall156, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall156.isAwake = false
	blueWall156.gravityScale = -0.05
	sceneGroup:insert( blueWall156)
	
	blueWall157 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall157.x, blueWall157.y = 350,  1040
	blueWall157.rotation = 0
	blueWall157.direction = "Up"
	blueWall157.myName = "blueWall157"
	blueWall157.isVisible = false
	physics.addBody( blueWall157, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall157.isAwake = false
	blueWall157.gravityScale = -0.05
	sceneGroup:insert( blueWall157)
	
	blueWall158 = display.newImageRect( "blueWall.png", 240, 25 )
	blueWall158.x, blueWall158.y = 190,  1580
	blueWall158.rotation = 0
	blueWall158.direction = "Up"
	blueWall158.myName = "blueWall158"
	blueWall158.isVisible = false
	blueWall158.isEven = true
	physics.addBody( blueWall158, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall158.isAwake = false
	blueWall158.gravityScale = -0.05
	sceneGroup:insert( blueWall158)


	blueWall159 = display.newImageRect( "blueWall.png", 150, 25 )
	blueWall159.x, blueWall159.y = 130,  1340
	blueWall159.rotation = 0
	blueWall159.direction = "Up"
	blueWall159.myName = "blueWall159"
	blueWall159.isVisible = false
	physics.addBody( blueWall159, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall159.isAwake = false
	blueWall159.gravityScale = -0.05
	sceneGroup:insert( blueWall159)
	
	blueWall160 = display.newImageRect( "blueWall.png", 150, 25 )
	blueWall160.x, blueWall160.y = 350,  1340
	blueWall160.rotation = 0
	blueWall160.direction = "Up"
	blueWall160.myName = "blueWall160"
	blueWall160.isVisible = false
	blueWall160.isEven = true
	physics.addBody( blueWall160, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall160.isAwake = false
	blueWall160.gravityScale = -0.05
	sceneGroup:insert( blueWall160)
	
		blueWall161 = display.newImageRect( "blueWall.png", 240, 25 )
	blueWall161.x, blueWall161.y = 320,  1830
	blueWall161.rotation = 330
	blueWall161.direction = "Up"
	blueWall161.myName = "blueWall161"
	blueWall161.isVisible = false
	physics.addBody( blueWall161, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall161.isAwake = false
	blueWall161.gravityScale = -0.05
	sceneGroup:insert( blueWall161)
	
		orangeTriangle48 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle48.x, orangeTriangle48.y = 100, 600
	orangeTriangle48.direction = "Up"
	orangeTriangle48.isVisible = true
	orangeTriangle48.rotation = 0
	orangeTriangle48Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle48, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle48Shape } )
	orangeTriangle48.gravityScale = -0.15
	orangeTriangle48.isAwake = false
	orangeTriangle48.isBodyActive = false
	orangeTriangle48:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle48 )
	
	orangeTriangle49 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle49.x, orangeTriangle49.y = 230, 1050
	orangeTriangle49.direction = "Up"
	orangeTriangle49.isVisible = true
	orangeTriangle49.rotation = 0
	orangeTriangle49Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle49, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle49Shape } )
	orangeTriangle49.gravityScale = -0.15
	orangeTriangle49.isAwake = false
	orangeTriangle49.isBodyActive = false
	orangeTriangle49:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle49 )
	
		orangeTriangle50 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle50.x, orangeTriangle50.y = 340, 1550
	orangeTriangle50.direction = "Up"
	orangeTriangle50.isVisible = true
	orangeTriangle50.rotation = 0
	orangeTriangle50Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle50, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle50Shape } )
	orangeTriangle50.gravityScale = -0.15
	orangeTriangle50.isAwake = false
	orangeTriangle50.isBodyActive = false
	orangeTriangle50:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle50 )
	
		orangeTriangle51 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle51.x, orangeTriangle51.y = 100, 2150
	orangeTriangle51.direction = "Up"
	orangeTriangle51.isVisible = true
	orangeTriangle51.rotation = 0
	orangeTriangle51Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle51, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle51Shape } )
	orangeTriangle51.gravityScale = -0.15
	orangeTriangle51.isAwake = false
	orangeTriangle51.isBodyActive = false
	orangeTriangle51:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle51 )
	
		orangeTriangle52 = display.newImageRect( "blueTriangle.png", 15, 15)
	orangeTriangle52.x, orangeTriangle52.y = 230, 2750
	orangeTriangle52.direction = "Up"
	orangeTriangle52.isVisible = true
	orangeTriangle52.rotation = 0
	orangeTriangle52Shape = { 0,-8, 8,8, -8,8 }
	physics.addBody( orangeTriangle52, { isSensor = true, density= 10, friction=0.1, bounce=0.5, shape=orangeTriangle52Shape } )
	orangeTriangle52.gravityScale = -0.15
	orangeTriangle52.isAwake = false
	orangeTriangle52.isBodyActive = false
	orangeTriangle52:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( orangeTriangle52 )
	
	
	--END SCENE 149!!
	
	--NEW SCENE 162!!
	

	
	blueWall162 = display.newImageRect( "blueWall.png", 140, 25 )
	blueWall162.x, blueWall162.y = 130,  200
	blueWall162.rotation = 0
	blueWall162.direction = "Down"
	blueWall162.myName = "blueWall162"
	blueWall162.isVisible = false
	blueWall162.isEven = true
	physics.addBody( blueWall162, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall162.isAwake = false
	blueWall162.gravityScale = 0.009
	sceneGroup:insert( blueWall162)
	
	blueWall163 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall163.x, blueWall163.y = 80,  130
	blueWall163.rotation = 0
	blueWall163.direction = "Down"
	blueWall163.myName = "blueWall163"
	blueWall163.isVisible = false
	physics.addBody( blueWall163, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall163.isAwake = false
	blueWall163.gravityScale = 0.009
	sceneGroup:insert( blueWall163)
	
	blueWall164 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall164.x, blueWall164.y = 150,  60
	blueWall164.rotation = 0
	blueWall164.direction = "Down"
	blueWall164.myName = "blueWall164"
	blueWall164.isVisible = false
	blueWall164.isEven = true
	physics.addBody( blueWall164, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall164.isAwake = false
	blueWall164.gravityScale = 0.009
	sceneGroup:insert( blueWall164)
	
		blueWall165 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall165.x, blueWall165.y = 80,  -10
	blueWall165.rotation = 0
	blueWall165.direction = "Down"
	blueWall165.myName = "blueWall165"
	blueWall165.isVisible = false
	physics.addBody( blueWall165, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall165.isAwake = false
	blueWall165.gravityScale = 0.009
	sceneGroup:insert( blueWall165)
	
		blueWall166 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall166.x, blueWall166.y = 150,  -80
	blueWall166.rotation = 0
	blueWall166.direction = "Down"
	blueWall166.myName = "blueWall166"
	blueWall166.isVisible = false
	blueWall166.isEven = true
	physics.addBody( blueWall166, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall166.isAwake = false
	blueWall166.gravityScale = 0.009
	sceneGroup:insert( blueWall166)
	
		blueWall167 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall167.x, blueWall167.y = 230,  -150
	blueWall167.rotation = 0
	blueWall167.direction = "Down"
	blueWall167.myName = "blueWall167"
	blueWall167.isVisible = false
	physics.addBody( blueWall167, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall167.isAwake = false
	blueWall167.gravityScale = 0.009
	sceneGroup:insert( blueWall167)
	
	blueWall168 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall168.x, blueWall168.y = 150,  -220
	blueWall168.rotation = 0
	blueWall168.direction = "Down"
	blueWall168.myName = "blueWall168"
	blueWall168.isVisible = false
	blueWall168.isEven = true
	physics.addBody( blueWall168, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall168.isAwake = false
	blueWall168.gravityScale = 0.009
	sceneGroup:insert( blueWall168)
	
		blueWall169 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall169.x, blueWall169.y = 230,  -290
	blueWall169.rotation = 0
	blueWall169.direction = "Down"
	blueWall169.myName = "blueWall169"
	blueWall169.isVisible = false
	physics.addBody( blueWall169, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall169.isAwake = false
	blueWall169.gravityScale = 0.009
	sceneGroup:insert( blueWall169)
	
		blueWall170 = display.newImageRect( "blueWall.png", 100, 25 )
	blueWall170.x, blueWall170.y = 120,  -360
	blueWall170.rotation = 0
	blueWall170.direction = "Down"
	blueWall170.myName = "blueWall170"
	blueWall170.isVisible = false
	blueWall170.isEven = true
	physics.addBody( blueWall170, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall170.isAwake = false
	blueWall170.gravityScale = 0.009
	sceneGroup:insert( blueWall170)
	
			blueWall171 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall171.x, blueWall171.y = 180,  -430
	blueWall171.rotation = 0
	blueWall171.direction = "Down"
	blueWall171.myName = "blueWall171"
	blueWall171.isVisible = false
	physics.addBody( blueWall171, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall171.isAwake = false
	blueWall171.gravityScale = 0.009
	sceneGroup:insert( blueWall171)
	
	blueWall172 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall172.x, blueWall172.y = 250,  -480
	blueWall172.rotation = 0
	blueWall172.direction = "Down"
	blueWall172.myName = "blueWall172"
	blueWall172.isVisible = false
	blueWall172.isEven = true
	physics.addBody( blueWall172, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall172.isAwake = false
	blueWall172.gravityScale = 0.009
	sceneGroup:insert( blueWall172)
	
		blueWall173 = display.newImageRect( "blueWall.png", 70, 25 )
	blueWall173.x, blueWall173.y = 320,  -530
	blueWall173.rotation = 0
	blueWall173.direction = "Down"
	blueWall173.myName = "blueWall173"
	blueWall173.isVisible = false
	physics.addBody( blueWall173, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall173.isAwake = false
	blueWall173.gravityScale = 0.009
	sceneGroup:insert( blueWall173)
	
		blueWall174 = display.newImageRect( "blueWall.png", 40, 25 )
	blueWall174.x, blueWall174.y = 405,  -580
	blueWall174.rotation = 0
	blueWall174.direction = "Down"
	blueWall174.myName = "blueWall174"
	blueWall174.isVisible = false
	blueWall174.isEven = true
	physics.addBody( blueWall174, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall174.isAwake = false
	blueWall174.gravityScale = 0.009
	sceneGroup:insert( blueWall174)
	
				blueWall175 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall175.x, blueWall175.y = 320,  -650
	blueWall175.rotation = 0
	blueWall175.direction = "Down"
	blueWall175.myName = "blueWall175"
	blueWall175.isVisible = false
	physics.addBody( blueWall175, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall175.isAwake = false
	blueWall175.gravityScale = 0.009
	sceneGroup:insert( blueWall175)
	
	blueWall176 = display.newImageRect( "blueWall.png", 50, 25 )
	blueWall176.x, blueWall176.y = 230,  -720
	blueWall176.rotation = 0
	blueWall176.direction = "Down"
	blueWall176.myName = "blueWall176"
	blueWall176.isVisible = false
	blueWall176.isEven = true
	physics.addBody( blueWall176, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall176.isAwake = false
	blueWall176.gravityScale = 0.009
	sceneGroup:insert( blueWall176)

	
	blueWall184 = display.newImageRect( "blueWall.png", 10, 10 )
	blueWall184.x, blueWall184.y = 230,  -1280
	blueWall184.rotation = 0
	blueWall184.direction = "Down"
	blueWall184.myName = "blueWall184"
	blueWall184.isVisible = false
	blueWall184.isEven = true
	physics.addBody( blueWall184, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall184.isAwake = false
	blueWall184.gravityScale = 0.009
	sceneGroup:insert( blueWall184)
	
	
--]]	

		--[[
			blueWallTest = display.newImageRect( "blueWall.png", 170, 25 )
	blueWallTest.x, blueWallTest.y = 280, 300
	blueWallTest.direction = "Down"
	blueWallTest.myName = "blueWallTest"
	blueWallTest.isVisible = true
	physics.addBody( blueWallTest, { isSensor = false, density= 400, friction=10, bounce=0 } )
	blueWallTest.isAwake = true
	blueWallTest.gravityScale = 0.04
	sceneGroup:insert( blueWallTest) 
	--]]	

	
		blueWall199 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall199.x, blueWall199.y = 90,  180
	blueWall199.rotation = 0
	blueWall199.direction = "Down"
	blueWall199.myName = "blueWall199"
	blueWall199.isVisible = false
	blueWall199.isEven = true
	physics.addBody( blueWall199, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall199.isAwake = false
	blueWall199.gravityScale = 0.008
	sceneGroup:insert( blueWall199)
	
		blueWall200 = display.newImageRect( "blueWall.png", 60, 25 )
	blueWall200.x, blueWall200.y = 150,  110
	blueWall200.rotation = 0
	blueWall200.direction = "Down"
	blueWall200.myName = "blueWall200"
	blueWall200.isVisible = false
	blueWall200.isEven = true
	physics.addBody( blueWall200, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall200.isAwake = false
	blueWall200.gravityScale = 0.008
	sceneGroup:insert( blueWall200)
	
	blueWall201 = display.newImageRect( "blueWall.png", 230, 25 )
	blueWall201.x, blueWall201.y = 310,  40
	blueWall201.rotation = 0
	blueWall201.direction = "Down"
	blueWall201.myName = "blueWall201"
	blueWall201.isVisible = false
	blueWall201.isEven = true
	physics.addBody( blueWall201, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall201.isAwake = false
	blueWall201.gravityScale = 0.008
	sceneGroup:insert( blueWall201)
	
	blueWall202 = display.newImageRect( "blueWall.png", 210, 25 )
	blueWall202.x, blueWall202.y = 160,  -30
	blueWall202.rotation = 0
	blueWall202.direction = "Down"
	blueWall202.myName = "blueWall202"
	blueWall202.isVisible = false
	blueWall202.isEven = true
	physics.addBody( blueWall202, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall202.isAwake = false
	blueWall202.gravityScale = 0.008
	sceneGroup:insert( blueWall202)
	
		blueWall203 = display.newImageRect( "blueWall.png", 230, 25 )
	blueWall203.x, blueWall203.y = 310,  -100
	blueWall203.rotation = 0
	blueWall203.direction = "Down"
	blueWall203.myName = "blueWall203"
	blueWall203.isVisible = false
	blueWall203.isEven = true
	physics.addBody( blueWall203, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall203.isAwake = false
	blueWall203.gravityScale = 0.008
	sceneGroup:insert( blueWall203)
	
		blueWall204 = display.newImageRect( "blueWall.png", 210, 25 )
	blueWall204.x, blueWall204.y = 160,  -170
	blueWall204.rotation = 0
	blueWall204.direction = "Down"
	blueWall204.myName = "blueWall204"
	blueWall204.isVisible = false
	blueWall204.isEven = true
	physics.addBody( blueWall204, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall204.isAwake = false
	blueWall204.gravityScale = 0.008
	sceneGroup:insert( blueWall204)
	
	blueWall205 = display.newImageRect( "blueWall.png", 230, 25 )
	blueWall205.x, blueWall205.y = 310,  -240
	blueWall205.rotation = 0
	blueWall205.direction = "Down"
	blueWall205.myName = "blueWall205"
	blueWall205.isVisible = false
	blueWall205.isEven = true
	physics.addBody( blueWall205, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall205.isAwake = false
	blueWall205.gravityScale = 0.008
	sceneGroup:insert( blueWall205)
	
		blueWall206 = display.newImageRect( "blueWall.png", 210, 25 )
	blueWall206.x, blueWall206.y = 160,  -310
	blueWall206.rotation = 0
	blueWall206.direction = "Down"
	blueWall206.myName = "blueWall206"
	blueWall206.isVisible = false
	blueWall206.isEven = true
	physics.addBody( blueWall206, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall206.isAwake = false
	blueWall206.gravityScale = 0.008
	sceneGroup:insert( blueWall206)
	
		blueWall207 = display.newImageRect( "blueWall.png", 230, 25 )
	blueWall207.x, blueWall207.y = 310,  -380
	blueWall207.rotation = 0
	blueWall207.direction = "Down"
	blueWall207.myName = "blueWall207"
	blueWall207.isVisible = false
	blueWall207.isEven = true
	physics.addBody( blueWall207, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall207.isAwake = false
	blueWall207.gravityScale = 0.008
	sceneGroup:insert( blueWall207)
	
		blueWall208 = display.newImageRect( "blueWall.png", 210, 25 )
	blueWall208.x, blueWall208.y = 160,  -450
	blueWall208.rotation = 0
	blueWall208.direction = "Down"
	blueWall208.myName = "blueWall208"
	blueWall208.isVisible = false
	blueWall208.isEven = true
	physics.addBody( blueWall208, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall208.isAwake = false
	blueWall208.gravityScale = 0.008
	sceneGroup:insert( blueWall208)
	
	blueWall209 = display.newImageRect( "blueWall.png", 230, 25 )
	blueWall209.x, blueWall209.y = 310,  -520
	blueWall209.rotation = 0
	blueWall209.direction = "Down"
	blueWall209.myName = "blueWall209"
	blueWall209.isVisible = false
	blueWall209.isEven = true
	physics.addBody( blueWall209, { isSensor = true, density= 400, friction=10, bounce=0 } )
	blueWall209.isAwake = false
	blueWall209.gravityScale = 0.008
	sceneGroup:insert( blueWall209)
	
	
	--END SCENE 162!!
	cheaterBlock6 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock6.x, cheaterBlock6.y = 160, 360
	cheaterBlock6.direction = "Up"
	cheaterBlock6.rotation = 0
	cheaterBlock6.isVisible = true
	physics.addBody( cheaterBlock6, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock6.gravityScale = -0.02
	cheaterBlock6.isAwake = false
	cheaterBlock6.isBodyActive = false
	cheaterBlock6:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock6)
	
	cheaterBlock7 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock7.x, cheaterBlock7.y = 160, 500
	cheaterBlock7.direction = "Up"
	cheaterBlock7.rotation = 0
	cheaterBlock7.isVisible = true
	physics.addBody( cheaterBlock7, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock7.gravityScale = -0.02
	cheaterBlock7.isAwake = false
	cheaterBlock7.isBodyActive = false
	cheaterBlock7:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock7)
	
	cheaterBlock8 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock8.x, cheaterBlock8.y = 160, 640
	cheaterBlock8.direction = "Up"
	cheaterBlock8.rotation = 0
	cheaterBlock8.isVisible = true
	physics.addBody( cheaterBlock8, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock8.gravityScale = -0.02
	cheaterBlock8.isAwake = false
	cheaterBlock8.isBodyActive = false
	cheaterBlock8:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock8)
	
	cheaterBlock9 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock9.x, cheaterBlock9.y = 350, 480
	cheaterBlock9.direction = "Up"
	cheaterBlock9.rotation = 0
	cheaterBlock9.isVisible = true
	physics.addBody( cheaterBlock9, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock9.gravityScale = -0.015
	cheaterBlock9.isAwake = false
	cheaterBlock9.isBodyActive = false
	cheaterBlock9:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock9)
	
	cheaterBlock10 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock10.x, cheaterBlock10.y = 350, 710
	cheaterBlock10.direction = "Up"
	cheaterBlock10.rotation = 0
	cheaterBlock10.isVisible = true
	physics.addBody( cheaterBlock10, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock10.gravityScale = -0.015
	cheaterBlock10.isAwake = false
	cheaterBlock10.isBodyActive = false
	cheaterBlock10:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock10)
	
	cheaterBlock11 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock11.x, cheaterBlock11.y = 350, 880
	cheaterBlock11.direction = "Up"
	cheaterBlock11.rotation = 0
	cheaterBlock11.isVisible = true
	physics.addBody( cheaterBlock11, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock11.gravityScale = -0.015
	cheaterBlock11.isAwake = false
	cheaterBlock11.isBodyActive = false
	cheaterBlock11:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock11)
	
	cheaterBlock12 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock12.x, cheaterBlock12.y = 120, 880
	cheaterBlock12.direction = "Up"
	cheaterBlock12.rotation = 0
	cheaterBlock12.isVisible = true
	physics.addBody( cheaterBlock12, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock12.gravityScale = -0.04
	cheaterBlock12.isAwake = false
	cheaterBlock12.isBodyActive = false
	cheaterBlock12:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock12)
	
	cheaterBlock13 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock13.x, cheaterBlock13.y = 340, 425
	cheaterBlock13.direction = "Up"
	cheaterBlock13.rotation = 0
	cheaterBlock13.isVisible = true
	physics.addBody( cheaterBlock13, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock13.gravityScale = -0.04
	cheaterBlock13.isAwake = false
	cheaterBlock13.isBodyActive = false
	cheaterBlock13:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock13)
	
	cheaterBlock14 = display.newImageRect( "cheaterBlock.png", 200, 50 )
	cheaterBlock14.x, cheaterBlock14.y = 285, 575
	cheaterBlock14.direction = "Up"
	cheaterBlock14.rotation = 0
	cheaterBlock14.isVisible = true
	physics.addBody( cheaterBlock14, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock14.gravityScale = -0.04
	cheaterBlock14.isAwake = false
	cheaterBlock14.isBodyActive = false
	cheaterBlock14:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock14)
	
	cheaterBlock15 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock15.x, cheaterBlock15.y = 350, 390
	cheaterBlock15.direction = "Up"
	cheaterBlock15.rotation = 0
	cheaterBlock15.isVisible = true
	physics.addBody( cheaterBlock15, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock15.gravityScale = -0.04
	cheaterBlock15.isAwake = false
	cheaterBlock15.isBodyActive = false
	cheaterBlock15:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock15)
	
	cheaterBlock16 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock16.x, cheaterBlock16.y = 350, 590
	cheaterBlock16.direction = "Up"
	cheaterBlock16.rotation = 0
	cheaterBlock16.isVisible = true
	physics.addBody( cheaterBlock16, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock16.gravityScale = -0.04
	cheaterBlock16.isAwake = false
	cheaterBlock16.isBodyActive = false
	cheaterBlock16:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock16)
	
	cheaterBlock17 = display.newImageRect( "cheaterBlock.png", 150, 50 )
	cheaterBlock17.x, cheaterBlock17.y = 350, 790
	cheaterBlock17.direction = "Up"
	cheaterBlock17.rotation = 0
	cheaterBlock17.isVisible = true
	physics.addBody( cheaterBlock17, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock17.gravityScale = -0.04
	cheaterBlock17.isAwake = false
	cheaterBlock17.isBodyActive = false
	cheaterBlock17:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock17)
	
	cheaterBlock18 = display.newImageRect( "cheaterBlock.png", 100, 50 )
	cheaterBlock18.x, cheaterBlock18.y = 120, 360
	cheaterBlock18.direction = "Up"
	cheaterBlock18.rotation = 0
	cheaterBlock18.isVisible = true
	physics.addBody( cheaterBlock18, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock18.gravityScale = -0.14
	cheaterBlock18.isAwake = false
	cheaterBlock18.isBodyActive = false
	cheaterBlock18:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock18)
	
	cheaterBlock19 = display.newImageRect( "cheaterBlock.png", 100, 50 )
	cheaterBlock19.x, cheaterBlock19.y = 120, 460
	cheaterBlock19.direction = "Up"
	cheaterBlock19.rotation = 0
	cheaterBlock19.isVisible = true
	physics.addBody( cheaterBlock19, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock19.gravityScale = -0.14
	cheaterBlock19.isAwake = false
	cheaterBlock19.isBodyActive = false
	cheaterBlock19:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock19)
	
	cheaterBlock20 = display.newImageRect( "cheaterBlock.png", 160, 50 )
	cheaterBlock20.x, cheaterBlock20.y = 260, 900
	cheaterBlock20.direction = "Up"
	cheaterBlock20.rotation = 315
	cheaterBlock20.isVisible = true
	physics.addBody( cheaterBlock20, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock20.gravityScale = -0.14
	cheaterBlock20.isAwake = false
	cheaterBlock20.isBodyActive = false
	cheaterBlock20:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock20)
	
		cheaterBlock21 = display.newImageRect( "cheaterBlock.png", 200, 50 )
	cheaterBlock21.x, cheaterBlock21.y = 300, 1000
	cheaterBlock21.direction = "Up"
	cheaterBlock21.rotation = 315
	cheaterBlock21.isVisible = true
	physics.addBody( cheaterBlock21, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock21.gravityScale = -0.14
	cheaterBlock21.isAwake = false
	cheaterBlock21.isBodyActive = false
	cheaterBlock21:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock21)
	
		cheaterBlock22 = display.newImageRect( "cheaterBlock.png", 200, 50 )
	cheaterBlock22.x, cheaterBlock22.y = 300, 1100
	cheaterBlock22.direction = "Up"
	cheaterBlock22.rotation = 315
	cheaterBlock22.isVisible = true
	physics.addBody( cheaterBlock22, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock22.gravityScale = -0.14
	cheaterBlock22.isAwake = false
	cheaterBlock22.isBodyActive = false
	cheaterBlock22:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock22)
	
		cheaterBlock23 = display.newImageRect( "cheaterBlock.png", 130, 50 )
	cheaterBlock23.x, cheaterBlock23.y = 110, 375
	cheaterBlock23.direction = "Up"
	cheaterBlock23.rotation = 0
	cheaterBlock23.isVisible = true
	physics.addBody( cheaterBlock23, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock23.gravityScale = -0.04
	cheaterBlock23.isAwake = false
	cheaterBlock23.isBodyActive = false
	cheaterBlock23:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock23)
	
	cheaterBlock24 = display.newImageRect( "cheaterBlock.png", 130, 50 )
	cheaterBlock24.x, cheaterBlock24.y = 110, 500
	cheaterBlock24.direction = "Up"
	cheaterBlock24.rotation = 0
	cheaterBlock24.isVisible = true
	physics.addBody( cheaterBlock24, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock24.gravityScale = -0.04
	cheaterBlock24.isAwake = false
	cheaterBlock24.isBodyActive = false
	cheaterBlock24:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock24)
	
	cheaterBlock25 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock25.x, cheaterBlock25.y = 300, -485
	cheaterBlock25.direction = "Down"
	cheaterBlock25.rotation = 225
	cheaterBlock25.isVisible = true
	physics.addBody( cheaterBlock25, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock25.gravityScale = 0.03
	cheaterBlock25.isAwake = false
	cheaterBlock25.isBodyActive = false
	cheaterBlock25:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock25)
	
	cheaterBlock26 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock26.x, cheaterBlock26.y = 180, -1155
	cheaterBlock26.direction = "Down"
	cheaterBlock26.rotation = 135
	cheaterBlock26.isVisible = true
	physics.addBody( cheaterBlock26, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock26.gravityScale = 0.03
	cheaterBlock26.isAwake = false
	cheaterBlock26.isBodyActive = false
	cheaterBlock26:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock26)
	
		cheaterBlock27 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock27.x, cheaterBlock27.y = 300, -170
	cheaterBlock27.direction = "Down"
	cheaterBlock27.rotation = 225
	cheaterBlock27.isVisible = true
	physics.addBody( cheaterBlock27, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock27.gravityScale = 0.03
	cheaterBlock27.isAwake = false
	cheaterBlock27.isBodyActive = false
	cheaterBlock27:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock27)
	
	cheaterBlock28 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock28.x, cheaterBlock28.y = 300, -170
	cheaterBlock28.direction = "Down"
	cheaterBlock28.rotation = 225
	cheaterBlock28.isVisible = true
	physics.addBody( cheaterBlock28, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock28.gravityScale = 0.03
	cheaterBlock28.isAwake = false
	cheaterBlock28.isBodyActive = false
	cheaterBlock28:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock28)
	
	cheaterBlock29 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock29.x, cheaterBlock29.y = 180, -400
	cheaterBlock29.direction = "Down"
	cheaterBlock29.rotation = 135
	cheaterBlock29.isVisible = true
	physics.addBody( cheaterBlock29, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock29.gravityScale = 0.19
	cheaterBlock29.isAwake = false
	cheaterBlock29.isBodyActive = false
	cheaterBlock29:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock29)
	
		cheaterBlock30 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock30.x, cheaterBlock30.y = 300, -170
	cheaterBlock30.direction = "Down"
	cheaterBlock30.rotation = 225
	cheaterBlock30.isVisible = true
	physics.addBody( cheaterBlock30, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock30.gravityScale = 0.03
	cheaterBlock30.isAwake = false
	cheaterBlock30.isBodyActive = false
	cheaterBlock30:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock30)
	
	cheaterBlock31 = display.newImageRect( "cheaterBlock.png", 300, 75 )
	cheaterBlock31.x, cheaterBlock31.y = 180, -400
	cheaterBlock31.direction = "Down"
	cheaterBlock31.rotation = 135
	cheaterBlock31.isVisible = true
	physics.addBody( cheaterBlock31, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock31.gravityScale = 0.19
	cheaterBlock31.isAwake = false
	cheaterBlock31.isBodyActive = false
	cheaterBlock31:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock31)
	
	cheaterBlock32 = display.newImageRect( "cheaterBlock.png", 60, 45 )
	cheaterBlock32.x, cheaterBlock32.y = 80, -100
	cheaterBlock32.direction = "Down"
	cheaterBlock32.rotation = 180
	cheaterBlock32.isVisible = true
	physics.addBody( cheaterBlock32, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock32.gravityScale = 0.19
	cheaterBlock32.isAwake = false
	cheaterBlock32.isBodyActive = false
	cheaterBlock32:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock32)
	
	cheaterBlock33 = display.newImageRect( "cheaterBlock.png", 200, 45 )
	cheaterBlock33.x, cheaterBlock33.y = 180, 450
	cheaterBlock33.direction = "Up"
	cheaterBlock33.rotation = 15
	cheaterBlock33.isVisible = true
	physics.addBody( cheaterBlock33, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock33.gravityScale = -0.06
	cheaterBlock33.isAwake = false
	cheaterBlock33.isBodyActive = false
	cheaterBlock33:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock33)
	
	cheaterBlock34 = display.newImageRect( "cheaterBlock.png", 200, 45 )
	cheaterBlock34.x, cheaterBlock34.y = 330, 650
	cheaterBlock34.direction = "Up"
	cheaterBlock34.rotation = 305
	cheaterBlock34.isVisible = true
	physics.addBody( cheaterBlock34, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock34.gravityScale = -0.06
	cheaterBlock34.isAwake = false
	cheaterBlock34.isBodyActive = false
	cheaterBlock34:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock34)
	
	cheaterBlock35 = display.newImageRect( "cheaterBlock.png", 200, 45 )
	cheaterBlock35.x, cheaterBlock35.y = 300, 80
	cheaterBlock35.direction = "Up"
	cheaterBlock35.rotation = 195
	cheaterBlock35.isVisible = false
	physics.addBody( cheaterBlock35, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock35.gravityScale = -0.06
	cheaterBlock35.isAwake = false
	cheaterBlock35.isBodyActive = false
	cheaterBlock35:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock35)
	
	cheaterBlock36 = display.newImageRect( "cheaterBlock.png", 140, 45 )
	cheaterBlock36.x, cheaterBlock36.y = 160, 290
	cheaterBlock36.direction = "Up"
	cheaterBlock36.rotation = 15
	cheaterBlock36.isVisible = false
	physics.addBody( cheaterBlock36, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock36.gravityScale = -0.06
	cheaterBlock36.isAwake = false
	cheaterBlock36.isBodyActive = false
	cheaterBlock36:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock36)
	
	cheaterBlock37 = display.newImageRect( "cheaterBlock.png", 40, 25 )
	cheaterBlock37.x, cheaterBlock37.y = 210, 320
	cheaterBlock37.direction = "Up"
	cheaterBlock37.rotation = 0
	cheaterBlock37.isVisible = false
	physics.addBody( cheaterBlock37, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock37.gravityScale = -0.02
	cheaterBlock37.isAwake = false
	cheaterBlock37.isBodyActive = false
	cheaterBlock37:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock37)
	
	cheaterBlock38 = display.newImageRect( "cheaterBlock.png", 25, 25 )
	cheaterBlock38.x, cheaterBlock38.y = 305, 320
	cheaterBlock38.direction = "Up"
	cheaterBlock38.rotation = 0
	cheaterBlock38.isVisible = false
	physics.addBody( cheaterBlock38, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock38.gravityScale = -0.02
	cheaterBlock38.isAwake = false
	cheaterBlock38.isBodyActive = false
	cheaterBlock38:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock38)
	
	cheaterBlock39 = display.newImageRect( "cheaterBlock.png", 225, 50)
	cheaterBlock39.x, cheaterBlock39.y = 160, 680
	cheaterBlock39.direction = "Up"
	cheaterBlock39.rotation = 0
	cheaterBlock39.isVisible = false
	physics.addBody( cheaterBlock39, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock39.gravityScale = -0.02
	cheaterBlock39.isAwake = false
	cheaterBlock39.isBodyActive = false
	cheaterBlock39:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock39)
	
		cheaterBlock40 = display.newImageRect( "cheaterBlock.png", 185, 30)
	cheaterBlock40.x, cheaterBlock40.y = 260, 380
	cheaterBlock40.direction = "Up"
	cheaterBlock40.rotation = 0
	cheaterBlock40.isVisible = false
	physics.addBody( cheaterBlock40, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock40.gravityScale = -0.02
	cheaterBlock40.isAwake = false
	cheaterBlock40.isBodyActive = false
	cheaterBlock40:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock40)
	
		cheaterBlock41 = display.newImageRect( "cheaterBlock.png", 180, 20)
	cheaterBlock41.x, cheaterBlock41.y = 340, 1015
	cheaterBlock41.direction = "Up"
	cheaterBlock41.rotation = 0
	cheaterBlock41.isVisible = false
	physics.addBody( cheaterBlock41, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock41.gravityScale = -0.02
	cheaterBlock41.isAwake = false
	cheaterBlock41.isBodyActive = false
	cheaterBlock41:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock41)
	
	cheaterBlock42 = display.newImageRect( "cheaterBlock.png", 270, 75)
	cheaterBlock42.x, cheaterBlock42.y = 195, 1300
	cheaterBlock42.direction = "Up"
	cheaterBlock42.rotation = 0
	cheaterBlock42.isVisible = false
	physics.addBody( cheaterBlock42, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock42.gravityScale = -0.02
	cheaterBlock42.isAwake = false
	cheaterBlock42.isBodyActive = false
	cheaterBlock42:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock42)
	
		cheaterBlock43 = display.newImageRect( "cheaterBlock.png", 100, 25)
	cheaterBlock43.x, cheaterBlock43.y = 370, 300
	cheaterBlock43.direction = "Up"
	cheaterBlock43.rotation = 0
	cheaterBlock43.isVisible = false
	physics.addBody( cheaterBlock43, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock43.gravityScale = -0.06
	cheaterBlock43.isAwake = false
	cheaterBlock43.isBodyActive = false
	cheaterBlock43:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock43)
	
	cheaterBlock44 = display.newImageRect( "cheaterBlock.png", 235, 100)
	cheaterBlock44.x, cheaterBlock44.y = 180, 825
	cheaterBlock44.direction = "Up"
	cheaterBlock44.rotation = 0
	cheaterBlock44.isVisible = false
	physics.addBody( cheaterBlock44, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock44.gravityScale = -0.06
	cheaterBlock44.isAwake = false
	cheaterBlock44.isBodyActive = false
	cheaterBlock44:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock44)
	
	cheaterBlock45 = display.newImageRect( "cheaterBlock.png", 100, 25)
	cheaterBlock45.x, cheaterBlock45.y = 370, 1100
	cheaterBlock45.direction = "Up"
	cheaterBlock45.rotation = 0
	cheaterBlock45.isVisible = false
	physics.addBody( cheaterBlock45, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock45.gravityScale = -0.06
	cheaterBlock45.isAwake = false
	cheaterBlock45.isBodyActive = false
	cheaterBlock45:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock45)
	
		cheaterBlock46 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock46.x, cheaterBlock46.y = 330, 290
	cheaterBlock46.direction = "Up"
	cheaterBlock46.rotation = 0
	cheaterBlock46.isVisible = false
	physics.addBody( cheaterBlock46, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock46.gravityScale = -0.06
	cheaterBlock46.isAwake = false
	cheaterBlock46.isBodyActive = false
	cheaterBlock46:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock46)
	
		cheaterBlock47 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock47.x, cheaterBlock47.y = 330, 590
	cheaterBlock47.direction = "Up"
	cheaterBlock47.rotation = 0
	cheaterBlock47.isVisible = false
	physics.addBody( cheaterBlock47, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock47.gravityScale = -0.06
	cheaterBlock47.isAwake = false
	cheaterBlock47.isBodyActive = false
	cheaterBlock47:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock47)
	
			cheaterBlock48 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock48.x, cheaterBlock48.y = 330, 890
	cheaterBlock48.direction = "Up"
	cheaterBlock48.rotation = 0
	cheaterBlock48.isVisible = false
	physics.addBody( cheaterBlock48, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock48.gravityScale = -0.06
	cheaterBlock48.isAwake = false
	cheaterBlock48.isBodyActive = false
	cheaterBlock48:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock48)
	
		cheaterBlock49 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock49.x, cheaterBlock49.y = 330, 1190
	cheaterBlock49.direction = "Up"
	cheaterBlock49.rotation = 0
	cheaterBlock49.isVisible = false
	physics.addBody( cheaterBlock49, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock49.gravityScale = -0.06
	cheaterBlock49.isAwake = false
	cheaterBlock49.isBodyActive = false
	cheaterBlock49:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock49)
	
	cheaterBlock50 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock50.x, cheaterBlock50.y = 330, 1490
	cheaterBlock50.direction = "Up"
	cheaterBlock50.rotation = 0
	cheaterBlock50.isVisible = false
	physics.addBody( cheaterBlock50, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock50.gravityScale = -0.06
	cheaterBlock50.isAwake = false
	cheaterBlock50.isBodyActive = false
	cheaterBlock50:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock50)
	
		cheaterBlock51 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock51.x, cheaterBlock51.y = 330, 1790
	cheaterBlock51.direction = "Up"
	cheaterBlock51.rotation = 0
	cheaterBlock51.isVisible = false
	physics.addBody( cheaterBlock51, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock51.gravityScale = -0.06
	cheaterBlock51.isAwake = false
	cheaterBlock51.isBodyActive = false
	cheaterBlock51:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock51)
	
		cheaterBlock52 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock52.x, cheaterBlock52.y = 330, 2090
	cheaterBlock52.direction = "Up"
	cheaterBlock52.rotation = 0
	cheaterBlock52.isVisible = false
	physics.addBody( cheaterBlock52, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock52.gravityScale = -0.06
	cheaterBlock52.isAwake = false
	cheaterBlock52.isBodyActive = false
	cheaterBlock52:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock52)
	
		cheaterBlock53 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock53.x, cheaterBlock53.y = 330, 2390
	cheaterBlock53.direction = "Up"
	cheaterBlock53.rotation = 0
	cheaterBlock53.isVisible = false
	physics.addBody( cheaterBlock53, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock53.gravityScale = -0.06
	cheaterBlock53.isAwake = false
	cheaterBlock53.isBodyActive = false
	cheaterBlock53:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock53)
	
	cheaterBlock54 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock54.x, cheaterBlock54.y = 330, 2690
	cheaterBlock54.direction = "Up"
	cheaterBlock54.rotation = 0
	cheaterBlock54.isVisible = false
	physics.addBody( cheaterBlock54, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock54.gravityScale = -0.06
	cheaterBlock54.isAwake = false
	cheaterBlock54.isBodyActive = false
	cheaterBlock54:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock54)
	
	cheaterBlock55 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock55.x, cheaterBlock55.y = 330, 2990
	cheaterBlock55.direction = "Up"
	cheaterBlock55.rotation = 0
	cheaterBlock55.isVisible = false
	physics.addBody( cheaterBlock55, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock55.gravityScale = -0.06
	cheaterBlock55.isAwake = false
	cheaterBlock55.isBodyActive = false
	cheaterBlock55:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock55)
	
		cheaterBlock56 = display.newImageRect( "cheaterBlock.png", 200, 50)
	cheaterBlock56.x, cheaterBlock56.y = 330, -120
	cheaterBlock56.direction = "Down"
	cheaterBlock56.rotation = 180
	cheaterBlock56.isVisible = false
	physics.addBody( cheaterBlock56, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock56.gravityScale = 0.06
	cheaterBlock56.isAwake = false
	cheaterBlock56.isBodyActive = false
	cheaterBlock56:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock56)
	
	cheaterBlock57 = display.newImageRect( "cheaterBlock.png", 300, 100)
	cheaterBlock57.x, cheaterBlock57.y = 100, 1830
	cheaterBlock57.direction = "Up"
	cheaterBlock57.rotation = 270
	cheaterBlock57.isVisible = false
	physics.addBody( cheaterBlock57, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock57.gravityScale = -0.02
	cheaterBlock57.isAwake = false
	cheaterBlock57.isBodyActive = false
	cheaterBlock57:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock57)
	
		cheaterBlock58 = display.newImageRect( "cheaterBlock.png", 300, 100)
	cheaterBlock58.x, cheaterBlock58.y = 280, 1300
	cheaterBlock58.direction = "Up"
	cheaterBlock58.rotation = 270
	cheaterBlock58.isVisible = false
	physics.addBody( cheaterBlock58, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock58.gravityScale = -0.02
	cheaterBlock58.isAwake = false
	cheaterBlock58.isBodyActive = false
	cheaterBlock58:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock58)
	
		cheaterBlock59 = display.newImageRect( "cheaterBlock.png", 300, 100)
	cheaterBlock59.x, cheaterBlock59.y = 190, 1730
	cheaterBlock59.direction = "Up"
	cheaterBlock59.rotation = 270
	cheaterBlock59.isVisible = false
	physics.addBody( cheaterBlock59, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock59.gravityScale = -0.02
	cheaterBlock59.isAwake = false
	cheaterBlock59.isBodyActive = false
	cheaterBlock59:addEventListener("collision", onUpTriangleCollision)
	sceneGroup:insert( cheaterBlock59)
	
	cheaterBlock60 = display.newImageRect( "cheaterBlock.png", 200, 70)
	cheaterBlock60.x, cheaterBlock60.y = 330, 150
	cheaterBlock60.direction = "Down"
	cheaterBlock60.rotation = 0
	cheaterBlock60.isVisible = false
	physics.addBody( cheaterBlock60, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock60.gravityScale = 0.009
	cheaterBlock60.isAwake = false
	cheaterBlock60.isBodyActive = false
	cheaterBlock60:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock60)
	
	cheaterBlock61 = display.newImageRect( "cheaterBlock.png", 200, 70)
	cheaterBlock61.x, cheaterBlock61.y = 330, -40
	cheaterBlock61.direction = "Down"
	cheaterBlock61.rotation = 0
	cheaterBlock61.isVisible = false
	physics.addBody( cheaterBlock61, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock61.gravityScale = 0.009
	cheaterBlock61.isAwake = false
	cheaterBlock61.isBodyActive = false
	cheaterBlock61:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock61)
	
	cheaterBlock62 = display.newImageRect( "cheaterBlock.png", 100, 40)
	cheaterBlock62.x, cheaterBlock62.y = 330, -800
	cheaterBlock62.direction = "Down"
	cheaterBlock62.rotation = 180
	cheaterBlock62.isVisible = false
	cheaterBlock62.isEven = true
	physics.addBody( cheaterBlock62, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock62.gravityScale = 0.02
	cheaterBlock62.isAwake = false
	cheaterBlock62.isBodyActive = false
	cheaterBlock62:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock62)
	
	cheaterBlock63 = display.newImageRect( "cheaterBlock.png", 100, 40)
	cheaterBlock63.x, cheaterBlock63.y = 130, -1350
	cheaterBlock63.direction = "Down"
	cheaterBlock63.rotation = 180
	cheaterBlock63.isVisible = false
	cheaterBlock63.isEven = true
	physics.addBody( cheaterBlock63, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock63.gravityScale = 0.02
	cheaterBlock63.isAwake = false
	cheaterBlock63.isBodyActive = false
	cheaterBlock63:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock63)
	
		cheaterBlock64 = display.newImageRect( "cheaterBlock.png", 100, 40)
	cheaterBlock64.x, cheaterBlock64.y = 330, -1850
	cheaterBlock64.direction = "Down"
	cheaterBlock64.rotation = 180
	cheaterBlock64.isVisible = false
	cheaterBlock64.isEven = true
	physics.addBody( cheaterBlock64, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock64.gravityScale = 0.02
	cheaterBlock64.isAwake = false
	cheaterBlock64.isBodyActive = false
	cheaterBlock64:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock64)
	
	cheaterBlock65 = display.newImageRect( "cheaterBlock.png", 100, 40)
	cheaterBlock65.x, cheaterBlock65.y = 130, -2350
	cheaterBlock65.direction = "Down"
	cheaterBlock65.rotation = 180
	cheaterBlock65.isVisible = false
	cheaterBlock65.isEven = true
	physics.addBody( cheaterBlock65, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock65.gravityScale = 0.02
	cheaterBlock65.isAwake = false
	cheaterBlock65.isBodyActive = false
	cheaterBlock65:addEventListener("collision", onTriangleCollision)
	sceneGroup:insert( cheaterBlock65)
	
	cheaterBlock66 = display.newImageRect( "cheaterBlock.png", 100, 40)
	cheaterBlock66.x, cheaterBlock66.y = 330, -2850
	cheaterBlock66.direction = "Down"
	cheaterBlock66.rotation = 180
	cheaterBlock66.isVisible = false
	cheaterBlock66.isEven = true
	physics.addBody( cheaterBlock66, { isSensor = true, density= 200, friction=10, bounce=0 } )
	cheaterBlock66.gravityScale = 0.02
	cheaterBlock66.isAwake = false
	cheaterBlock66.isBodyActive = false
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
	
	spikeWall5 = display.newImageRect( "spikeWall2.png", 390, 20 )
	spikeWall5.x, spikeWall5.y = 240, -220
	spikeWall5.rotation = 180
	spikeWall5.isVisible = false
	spikeWall5.myName = "spikeWall5"
	physics.addBody( spikeWall5, "static", { isSensor = true, density= 30, friction=0.1, bounce=0 } )
	spikeWall5:addEventListener("collision", spikeWall5Collision)
	sceneGroup:insert( spikeWall5 )
	
	
	greenBlock = display.newImageRect( "greenBlock.png", 20, 20 )
	greenBlock.x, greenBlock.y = 150, 70
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
		
		if isAudioPlaying then
			if audioRewind then
				audio.resume()
				else
				audio.play(backgroundMusic)
			end
		end
		
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
	
	if savedCurrentPercent ~= 100 then
	
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

	--savetoCurrentPercentFile(currentPercent)	
	
	savedCurrentPercent = loadTextFile("currentPercent.txt")
	savedBestPercent = loadTextFile("bestPercent.txt")
	
		if savedCurrentPercent > savedBestPercent then
		savetoBestPercentFile(savedCurrentPercent)
	end
	
	end
	
	totalPercent = savedCurrentPercent + savedTotalPercent
	savetoTotalPercentFile(totalPercent)
	
		audio.stop()
		audio.rewind()
		audioRewind = audio.rewind()
		
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