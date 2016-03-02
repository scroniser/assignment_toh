
def start
  towers = [[1, 2, 3, 4], [], []]
  puts "Welcome to the game Tower of Hanoi!"
  puts "In order to play, you must follow the rules:"
  puts "1. You can only move one disk at a time"
  puts "2. You can only move the top disk on any column"
  puts "3. No disk may be placed on a smaller disk"
  puts "Let's play!"
  quit_time = false
  until win?(towers) == true or quit_time == true do
    selected_tower = take_from_tower(towers)
    if user_quit?(selected_tower) == true
      quit_time = user_quit?(selected_tower)
      break
    else
      quit_time = put_on_tower(towers, selected_tower)
    end
  end
end

def print_towers(towers)
  puts "\n #{"-"*8}"
  puts "Here are the towers:"
  towers.each_with_index do |tower, index|
    print "Tower #{index}: #{tower}"
  end
  puts "\n #{"-"*8}"
end

def take_from_tower(towers)
  has_disks = false
  while has_disks == false do
    print_towers(towers)
    puts "Select the tower from where you'd like to take the disk"
    print ">"
    selected_tower = gets.chomp
    if user_quit?(selected_tower) == true
      return selected_tower
      break
    elsif (selected_tower.to_i.is_a?(Integer) == false && selected_tower != "0") || selected_tower.to_i > 2 || selected_tower.to_i < 0
      puts "sorry, you need to enter 0, 1, or 2. Please try again"
    elsif towers[selected_tower.to_i].first == nil
      puts "sorry, this tower doesn't have any disks. Try a tower that has disks."
    else
      puts "You've selected tower #{selected_tower}. You are moving disk #{towers[selected_tower.to_i].first}"
      has_disks = true
    end
  end
  return selected_tower
end

def put_on_tower(towers, selected_tower)
  disk_smaller = false
  while disk_smaller == false do
    puts "Which tower would you like to move the disk to?"
    print ">"
    move_to_this_tower = gets.chomp
    if user_quit?(move_to_this_tower) == true
      return user_quit?(move_to_this_tower)
      break
    elsif (move_to_this_tower.to_i.is_a?(Integer) == false && move_to_this_tower != "0") || move_to_this_tower.to_i > 2 || move_to_this_tower.to_i < 0
      puts "sorry, you need to enter 0, 1, or 2. Please try again"
    elsif towers[selected_tower.to_i] == towers[move_to_this_tower.to_i]
      puts "you can't select the same tower! Please try again"
    elsif towers[move_to_this_tower.to_i].first != nil && towers[selected_tower.to_i].first > towers[move_to_this_tower.to_i].first
      puts "sorry, that breaks the rules! try selecting a different disk or tower"
    else
      towers[move_to_this_tower.to_i].unshift(towers[selected_tower.to_i].first)
      (towers[selected_tower.to_i]).shift
      puts "You've selected tower #{move_to_this_tower}. The disk was successfully moved"
      print_towers(towers)
      disk_smaller = true
    end
  end
  return move_to_this_tower
end

def win?(towers)
  if towers[2] == [1, 2, 3, 4]
    puts "You win!"
    return true
  else
    return false
  end
end

def user_quit?(user_quit)
  if user_quit == "quit"
    return true
  else
    return false
  end
end
start


