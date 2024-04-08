GameState = {
   is_start_menu = true,
   is_started = false,
   is_multiplayer = false,
   score_left = 0,
   score_right = 0
}

-- Helper functions

-- TODO Check only for the player who serves the ball
-- TODO Make the ball go toward the serving player

function GameState:checkStartOfGame(player_1, player_2)
   if not self.is_started then
      if player_1:checkPlayerInput() or player_2:checkPlayerInput() then
         self.is_started = true
         Ball:startMoving(-1)
      end
   end
end

--- Increment either GameState.score_left or score_right based on the given string "left" or "right"
function GameState:incrementScore(goal)
   if goal == "left" then
      self.score_right = self.score_right + 1
   elseif goal == "right" then
      self.score_left = self.score_left + 1
   end
end

-- TODO Lock the controls (player & ai) for a certain amount of time after reseting to prevent accidentaly relaunching the ball
-- TODO Check if there is a need to reset player_2 (are we VS the AI ?)

--- Resets the game back to its initial state (keeping the score)
function GameState:resetState(player_1, player_2)
   self:setIsStarted(false)
   player_1:reset()
   player_2:reset()
   Ai:reset()
   Ball:reset()
end

--- Score a goal by adjusting the score and resetting the state of Player classes
--- @param goal string
--- @param player_1 table
--- @param player_2 table
function GameState:scoreGoal(goal, player_1, player_2)
   self:incrementScore(goal)
   self:resetState(player_1, player_2)
end

--- Sets GameState.is_started to true or false
--- @param b boolean
function GameState:setIsStarted(b)
   self.is_started = b
end

--- Sets GameState.is_start_menu to true or false
--- @param b boolean
function GameState:setIsStartMenu(b)
   self.is_start_menu = b
end

--- Sets GameState.is_start_menu to true or false
--- @param b boolean
function GameState:setIsMultiplayer(b)
   self.is_multiplayer = b
end

-- Core functions

function GameState:load()
end

function GameState:update()
end

function GameState:draw()
end
