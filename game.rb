class Game
  def initialize
    # @score = 0
    @frames = []
    # [
    #   [roll 1, roll 2]
    # ]

  end

  def roll(pins)
    frame = @frames.last || []
    if frame.length == 0
      if @frames.empty?
        @frames << [ pins ]
      else
        @frames[-1] = [ pins ]
      end
      if pins == 10
        @frames[-1] << 0
      end
    elsif frame.length == 1
      @frames[-1] = [ frame.first, pins ]
    else # probably 2
      @frames << [ pins ]
    end
    # puts @frames.inspect
  end

  def score
    total = 0
    @frames.each_with_index do |rolls, index|
      if rolls.include?(10) #strike
        total += (rolls[0] + rolls[1].to_i)
        total += (@frames[index+1][0] + @frames[index+1][1].to_i)
        total += (@frames[index+2][0] + @frames[index+1][1].to_i)
      elsif (rolls[0] + rolls[1].to_i) == 10 #spare
        total += (rolls[0] + rolls[1].to_i)
        total += @frames[index+1][0]
      else
        total += (rolls[0] + rolls[1].to_i)
      end
    end
    total
  end
end