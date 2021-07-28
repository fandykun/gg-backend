
class WLI
    attr_accessor :names

    def initialize
        @names = []
    end

    def likes
        count = names.count
        if count == 0 then "no one likes this"
        elsif count == 1 then "#{@names[0]} likes this"
        elsif count == 2 then "#{@names[0]} and #{@names[1]} like this"
        elsif count == 3 then "#{@names[0]}, #{@names[1]} and #{@names[2]} like this"
        else "#{@names[0]}, #{@names[1]} and #{count-2} others like this"
        end
        
    end
end