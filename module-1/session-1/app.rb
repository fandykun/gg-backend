require_relative 'player'

jin = Player.new("Jin Sakai", 100, 50, 0.8)
puts jin

khotun = Player.new("Khotun Khan", 500, 50)
puts khotun

is_jin_turn = true

loop do
    if is_jin_turn
        jin.attack(khotun)
        khotun.show_status
    else
        khotun.attack(jin)
        jin.show_status
    end
    is_jin_turn = !is_jin_turn
    
    break if jin.is_dead? or khotun.is_dead?
end
