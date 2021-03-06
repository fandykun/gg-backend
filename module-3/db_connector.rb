require 'mysql2'
require './item'
require './category'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost", 
        :username => "fandykun", 
        :password => 'F4ndykun!',
        :database => 'food_oms_db', 
    )

    client
end

def get_all_items
    client = create_db_client
    rawData = client.query("select * from items")
    items = Array.new

    rawData.each do | data |
        item = Item.new(data["name"], data["price"], data["id"])
        items.push(item)
    end

    items
end

def get_all_categories
    client = create_db_client
    categories = client.query("SELECT * FROM categories")
end

def get_all_item_with_categories
    client = create_db_client
    rawData = client.query("
        SELECT items.*, categories.name AS category_name, categories.id AS category_id
        FROM items
        JOIN item_categories ON items.id = item_categories.item_id
        JOIN categories ON item_categories.category_id = categories.id
    ")
    items = Array.new

    rawData.each do | data |
        category = Category.new(data["category_name"], data["category_id"])
        item = Item.new(data["name"], data["price"], data["id"], category)
        items.push(item)
    end

    items
end

def get_items_below_price(price)
    client = create_db_client
    items = client.query("SELECT * FROM items WHERE price < #{price}")
end

def create_new_item(name, price)
    client = create_db_client
    client.query("
        INSERT INTO items(name, price) 
        VALUES ('#{name}', #{price})")
end

# categories = get_all_categories
# puts categories.each
items = get_all_item_with_categories

items.each do |item|
    puts(item.name)
end
# items = get_items_below_price(20000)