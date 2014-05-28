class Game
  attr_reader :frames
  
  def initialize
    @frames = [[]]
  end
  
  def roll(pins)
    if (current_frame.length == 2)
      @frames.last << [pins]
    else 
      @frams.last << pins
    end
    
    
  end
  

  
  def score
    score = 0
    (0..18).step(2) do |n|
      ball1 = @rolls[n]
      ball2 = @rolls[n + 1]
      
      begin
        if ball1 + ball2 == 10
          # spare
         score += ball1 + ball2 + @rolls[n + 2] 
        else
          score += ball1 + ball2
        end
      rescue
        puts "n = #{n}  ball1: #{ball1}  ball2: #{ball2} rolls: #{@rolls.inspect}"
      end
    end
    score
  end
  
  def reset
    @frames = []
  end
  
  
end
