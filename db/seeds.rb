# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# seeds.rb
Category.destroy_all
Product.destroy_all

# Define the categories for the grocery store
grocery_categories = [
  "Dairy",
  "Snacks",
  "Spices",
  "Grains"
]

# Define products for each category
products_data = {
  "Dairy" => [
    { name: "Whole Milk", description: "Fresh whole milk", price: 3.99, quantity: 50 },
    { name: "Cheddar Cheese", description: "Sharp cheddar cheese block", price: 5.49, quantity: 30 },
    { name: "Greek Yogurt", description: "Creamy Greek yogurt", price: 2.99, quantity: 40 },
    { name: "Butter", description: "Unsalted butter", price: 4.49, quantity: 60 },
    { name: "Heavy Cream", description: "Rich heavy cream", price: 6.99, quantity: 45 },
    # Add more dairy products here
  ],
  "Snacks" => [
    { name: "Potato Chips", description: "Classic salted potato chips", price: 1.99, quantity: 60 },
    { name: "Peanuts", description: "Roasted and salted peanuts", price: 2.49, quantity: 50 },
    { name: "Chocolate Bar", description: "Smooth milk chocolate bar", price: 1.49, quantity: 70 },
    { name: "Trail Mix", description: "Assorted nuts and dried fruits", price: 3.99, quantity: 40 },
    { name: "Popcorn", description: "Buttery microwave popcorn", price: 2.29, quantity: 55 },
    # Add more snack products here
  ],
  "Spices" => [
    { name: "Cinnamon Powder", description: "Ground cinnamon spice", price: 2.29, quantity: 40 },
    { name: "Black Pepper", description: "Whole black peppercorns", price: 3.49, quantity: 30 },
    { name: "Turmeric Powder", description: "Ground turmeric spice", price: 1.99, quantity: 50 },
    { name: "Cumin Seeds", description: "Whole cumin seeds", price: 2.99, quantity: 35 },
    { name: "Coriander Powder", description: "Ground coriander spice", price: 2.49, quantity: 45 },
    # Add more spice products here
  ],
  "Grains" => [
    { name: "Basmati Rice", description: "Long-grain Basmati rice", price: 4.99, quantity: 80 },
    { name: "Organic Quinoa", description: "Premium organic quinoa", price: 6.99, quantity: 60 },
    { name: "Steel-cut Oats", description: "Nutritious steel-cut oats", price: 3.49, quantity: 70 },
    { name: "Whole Wheat Flour", description: "Nutty whole wheat flour", price: 4.49, quantity: 65 },
    { name: "Brown Rice", description: "Healthy brown rice grains", price: 5.99, quantity: 75 },
    # Add more grain products here
  ]
}

# Create categories and products
grocery_categories.each do |category_name|
  category = Category.create(category_name: category_name)
  products_data[category_name].each do |product_data|
    Product.create(
      product_name: product_data[:name],
      product_description: product_data[:description],
      product_price: product_data[:price],
      quantity_available: product_data[:quantity],
      category: category
    )
  end
end

puts "Seed data generated successfully!"
