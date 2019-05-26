-----------------------------------------------------------------------------------------
--
-- Iqtina Jaber
--
-----------------------------------------------------------------------------------------

-- Background
local background = display.newImageRect("assets/background.jpg", 350, 600)
background.x = display.contentCenterX
background.y = display.contentCenterY
background.id = "background"

------picture of pi symbol for fun 
local piImage = display.newImageRect("assets/pi.png", 150, 100)
piImage.x = display.contentCenterX
piImage.y = display.contentCenterY - 50
piImage.id = "pi image"

--Calculate button
local calculateButton = display.newImageRect("assets/calculate.png", 150, 70)
calculateButton.x = display.contentCenterX
calculateButton.y = display.contentCenterY + 200
calculateButton.id = "calculate button"

---textfield for entering a number
local numberTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 125, 300, 50 )
numberTextField.id = "number textField"

-- Answer display text
local answerText = display.newText( "Value of pi", display.contentCenterX, display.contentCenterY - 200, native.labelFont, 20 )
answerText.id = "answer text"
answerText:setFillColor( 255, 255, 255 )

---Text that tells that user to enter a number
local enterNumberLabel = display.newText( "Enter a positive number", display.contentCenterX, display.contentCenterY + 80, native.labelFont, 30 )
enterNumberLabel.id = "answer text"
enterNumberLabel:setFillColor( 255, 255, 255 )

-----------------------------------------------------------------
----Calculate funtion to calculate answer
local function calculateButtonTouch( event )
	
	local numberOfIterations = tonumber(numberTextField.text) --how many times it will iterate through the series
	local answer = 0 --final answers(starts at 0, changes with each iterarion)
	local sign = -1 --determines if the integer will be added or subtracted from the answer(changes from - to positive every next time)

	---loop for iterations
	for i = 1, numberOfIterations, 1 do
	sign = sign*-1  --changes negative to postive, positive to negative
	answer = answer + 4/((2*i)-1)*sign
	answerText.text = ("Answer =".. answer)
	end

	---text for if the user enters a negative number
	if numberOfIterations < 0 then
		answerText.text = ("Please enter a positive number")
	end
end

------event listener
calculateButton:addEventListener( "touch", calculateButtonTouch )

