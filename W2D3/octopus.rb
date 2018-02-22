fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  largest = ''
  i = 0
  while i < fish.length
    j = i + 1
    while j < fish.length
      if fish[j].length > fish[i].length
        largest = fish[j]
      elsif fish[j].length < fish[i].length
        largest = fish[i]
      end
      j += 1
    end
    i += 1
  end
  largest
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { x <=> y }
    return if count <= 1

    mid = count / 2
    left = [0...mid].merge_sort(&prc)
    right = [mid..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private

  def self.merge(left, right, &prc)
    merged = []

    until right.empty? || left.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
  end

  merged.concat(left)
  merged.concat(right)
  merged
end

def dominant_octopus(fish)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fish.merge_sort(&prc)[0]
end


def clever_octopus(fish)
  largest = 0
  result = ''
  fish.each do |f|
    result = f if f.length > largest
  end
  result
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(move, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if move == tile
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
