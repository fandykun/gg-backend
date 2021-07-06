class Player
    attr_reader :name, :deflect_chance

    def initialize(name, hitpoint, attack_damage, deflect_chance = 0.0)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
        @deflect_chance = deflect_chance
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end

    def show_status
        puts self
    end

    def attack(other_player)
        puts "#{@name} attacks #{other_player.name} with #{@attack_damage}"

        probability = rand()
        if probability < other_player.deflect_chance
            puts "#{other_player.name} deflects the attack."
        else
            other_player.take_damage(@attack_damage)
        end
    end

    def take_damage(damage)
        @hitpoint -= damage
    end

    def is_dies?
        if @hitpoint <= 0
            puts "\n#{@name} dies."
            return true
        end

        return false
    end
end