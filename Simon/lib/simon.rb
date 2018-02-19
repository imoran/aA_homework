class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      puts round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.25
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    arr = []
    puts 'What color did Simon pick?'
    @seq.each do |color|
      guess = gets.chomp
      if color != guess
        puts game_over_message
        @game_over = true
        break
      end
    end
    sleep 1
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "GOOD JOB"
  end

  def game_over_message
    "GAME OVER"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
