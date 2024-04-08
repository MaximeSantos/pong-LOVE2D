GameState = {
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

function GameState:incrementScore(goal) -- Increment either GameState.score_left or score_right based on the given string "left" or "right"
   if goal == "left" then
      GameState.score_right = GameState.score_right + 1
   elseif goal == "right" then
      GameState.score_left = GameState.score_left + 1
   end
end

-- TODO Lock the controls (player & ai) for a certain amount of time after reseting to prevent accidentaly relaunching the ball
-- TODO Check if there is a need to reset player_2 (are we VS the AI ?)
function GameState:resetState(player_1, player_2) -- Resets the game back to its initial state (keeping the score)
   GameState.is_started = false
   player_1:reset()
   player_2:reset()
   Ai:reset()
   Ball:reset()
end

function GameState:scoreGoal(goal, player_1, player_2) -- Score a goal by adjusting the score and resetting the state
   GameState:incrementScore(goal)
   GameState:resetState(player_1, player_2)
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
