class Player
    attr_reader :name, :deflect_chance

    def initialize(name, hitpoint, attack_damage, deflect_chance = 0.0)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
        @deflect_chance = deflect_chance
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage\n\n"
    end

    def show_status
        puts self
    end

    def attack(other_player)
        puts "#{@name} attacks #{other_player.name} with #{@attack_damage}"

        if is_able_to_attack?(other_player.deflect_chance)
            other_player.take_damage(@attack_damage)
        else
            puts "#{other_player.name} deflects the attack."
        end
    end

    def is_able_to_attack?(deflect_chance)
        attack_probability = rand()
        if attack_probability > deflect_chance
            return true
        end

        return false
    end

    def take_damage(damage)
        @hitpoint -= damage
    end

    def is_dead?
        if @hitpoint <= 0
            puts "#{@name} dies."
            return true
        end

        return false
    end
end