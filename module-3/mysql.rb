require 'mysql2'

client = Mysql2::Client.new(
    :host => "localhost", 
    :username => "fandykun", 
    :password => 'F4ndykun!',
    :database => 'gigih', 
)

puts client