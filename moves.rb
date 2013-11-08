class Moves

  Slice = 5

  Up    = 'u'
  Down  = 'd'
  Right = 'r'
  Left  = 'l'
  Done  = 'o'

  attr_accessor :current_level, :current_position
  Set = ('a'..'z').to_a.each_slice(Slice).to_a

  def initialize
    self.current_level    = 0
    self.current_position = 0
  end

  def draw
    Set[0].each {|x| print x + ' '}; puts ''
    Set[1].each {|x| print x + ' '}; puts ''
    Set[2].each {|x| print x + ' '}; puts ''
    Set[3].each {|x| print x + ' '}; puts ''
    Set[4].each {|x| print x + ' '}; puts ''
    Set[5].each {|x| print x + ' '}; puts ''
    puts ""
  end

  def find_letter letter
    level = 0
    Set.each do |row|
      if row.include?(letter)
        @l = level
        @p = row.index(letter)
      end
      level += 1
    end
    [@l,@p]
  end

  def step_to(level, position)
    new_row      = level.to_i - self.current_level.to_i
    new_position = position.to_i - self.current_position.to_i
    case
      when new_row > 0;  new_row.abs.times { print Down }
      when new_row < 0;  new_row.abs.times { print Up }
    end

    case
      when new_position > 0; new_position.abs.times { print Right }
      when new_position < 0; new_position.abs.times { print Left }
    end
    print Done
  end

  def find string
    puts "Finding #{string}"
    letters = string.chars.to_a
    letters.each do |letter|
      row, position = find_letter letter
      step_to row, position
      set_position row, position
    end
  end

  def set_position level, position
    self.current_level = level
    self.current_position = position
  end
end

moves = Moves.new
moves.draw
moves.find "test"
