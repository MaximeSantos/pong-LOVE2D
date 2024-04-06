GameState = {
   is_started,
   is_start_menu,
   score_left,
   score_right
}

-- Helper functions
function GameState:checkStartOfGame()
   if not self.is_started then
      if Player:checkPlayerInput() then
         self.is_started = true
         Ball:startMoving(-1)
      end
   end
end

function GameState:incrementScore(goal) -- Increment either GameState.score_left or score_right based on the given string "left" or "right"
   if goal == "left" then
      GameState.score_right = GameState.score_right + 1
   elseif goal == "right" then
      GameState.score_left = GameState.score_left + 1
   end
end

-- TODO Lock the controls (player & ai) for a certain amount of time after reseting to prevent accidentaly relaunching the ball
function GameState:resetState() -- Resets the game back to its initial state (keeping the score)
   GameState.is_started = false
   Player:reset()
   Ai:reset()
   Ball:reset()
end

function GameState:scoreGoal(goal) -- Score a goal by adjusting the score and resetting the state
   GameState:incrementScore(goal)
   GameState:resetState()
end

function GameState:setIsStarted(boolean)
   self.is_started = boolean
end

-- Core functions
function GameState:load()
   self.is_start_menu = true
   self.is_started = false
   self.score_left = 0
   self.score_right = 0
end

function GameState:update(dt)
end

function GameState:draw()
end
