require_relative 'player'

jin = Player.new("Jin Sakai", 100, 50, 0.8)
puts jin

khotun = Player.new("Khotun Khan", 500, 50)
puts khotun
puts

is_jin_turn = true

loop do
    if is_jin_turn
        jin.attack(khotun)
        jin.show_status
    else
        khotun.attack(jin)
        khotun.show_status
    end
    is_jin_turn = !is_jin_turn
    
    break if jin.is_dies? or khotun.is_dies?
    puts
end
