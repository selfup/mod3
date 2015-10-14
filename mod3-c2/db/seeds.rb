class Seed
  def initialize
    generate_instructors_accounts
    generate_stores
    generate_users
    generate_items
    generate_orders
  end

  def generate_instructors_accounts
    %w(jorge jeff steve josh rachel horace).each do |name|
      User.create(
        name:     name.titleize,
        email:    "#{name}@turing.io",
        password: "password"
      )
    end
  end

  def generate_stores
    10.times do |i|
      store = Store.create!(
        name: "#{Faker::Company.name} #{Faker::Company.suffix}"
        )
      puts "Store #{i}: #{store.name} created!"
    end
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        name:     Faker::Name.name,
        email:    Faker::Internet.email,
        password: "password",
        store:    Store.find(Random.new.rand(1..10))
        )
      puts "User #{i}: #{user.name} - #{user.email} created!"
    end
  end

  def generate_items
    500.times do |i|
      item = Item.create!(
        name:        Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url:   "http://robohash.org/#{i}.png?set=set1&size=200x200",
        store:       Store.find(Random.new.rand(1..10))
        )
      puts "Item #{i}: #{item.name} created!"
    end
  end

  def generate_orders
    100.times do |i|
      user  = User.find(Random.new.rand(1..50))
      store = Store.find(Random.new.rand(1..10))
      order = Order.create!(user_id: user.id, store_id: store.id)
      add_items(order)
      puts "Order #{i}: Order for #{user.name} created!"
    end
  end

  private

  def add_items(order)
    10.times do |i|
      item = Item.find(Random.new.rand(1..500))
      order.items << item
      puts "#{i}: Added item #{item.name} to order #{order.id}."
    end
  end
end

Seed.new
