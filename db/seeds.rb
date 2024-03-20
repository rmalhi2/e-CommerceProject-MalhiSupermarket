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
    { name: "Fresh Milk", description: "Organic fresh milk from grass-fed cows", price: 3.99, quantity: 40 },
    { name: "Flavored Yogurt", description: "Fruit-flavored yogurt with real fruit chunks.", price: 1.99, quantity: 20 },
    { name: "Cottage Cheese", description: "Low-fat cottage cheese with a smooth texture.", price: 4.29, quantity: 20 },
    { name: "Almond Milk", description: "Dairy-free almond milk enriched with vitamins.", price: 3.49, quantity: 25 },
    { name: "Whipped Cream", description: "Light and fluffy whipped cream for desserts.", price: 2.29, quantity: 22 },
    { name: "Mozzarella Cheese", description: "Fresh mozzarella cheese perfect for pizzas.", price: 5.99, quantity: 15 },
    { name: "Butter", description: "Creamy and rich butter made from natural ingredients.", price: 4.79, quantity: 20 },
    { name: "Ghee", description: "Clarified butter with a nutty flavor.", price: 6.99, quantity: 20 },
    { name: "Cheddar Cheese", description: "Sharp cheddar cheese perfect for snacking.", price: 4.49, quantity: 25 },
    { name: "Paneer", description: "Fresh Indian cottage cheese used in various Indian dishes like palak paneer and paneer tikka.", price: 4.29, quantity: 20 },
    { name: "Rabri", description: "Sweet, creamy dessert made from condensed milk, sugar, and cardamom, often garnished with nuts.", price: 4.99, quantity: 10 },
    { name: "Dahi", description: "Indian-style yogurt, typically thicker and tangier than Western yogurt, used in curries, marinades, and as a side dish.", price: 2.99, quantity: 20 },
    { name: "Kulfi", description: "Creamy Indian ice cream flavored with cardamom, saffron, pistachios, or other ingredients, often served on a stick.", price: 3.49, quantity: 30 },
    { name: "Khoya", description: "Thickened milk solids used in making sweets like gulab jamun, barfi, and peda.", price: 4.79, quantity: 23 }
    
  ],
  "Snacks" => [
    { name: "Potato Chips", description: "Classic salted potato chips", price: 1.99, quantity: 60 },
    { name: "Peanuts", description: "Roasted and salted peanuts", price: 2.49, quantity: 50 },
    { name: "Chocolate Bar", description: "Smooth milk chocolate bar", price: 1.49, quantity: 70 },
    { name: "Trail Mix", description: "Assorted nuts and dried fruits", price: 3.99, quantity: 40 },
    { name: "Popcorn", description: "Buttery microwave popcorn", price: 2.29, quantity: 55 },
    { name: "Aloo Bhujia", description: "Crunchy, savory snack made from mashed potatoes, chickpea flour, and spices.", price: 3.99, quantity: 50 },
    { name: "Mathri", description: "Crunchy, savory crackers made with flour, spices, and sometimes seeds.", price: 3.50, quantity: 50 },
    { name: "Poha", description: "Flattened rice cooked with onions, peanuts, curry leaves, and spices, a light and flavorful snack.", price: 5.29, quantity: 40 },
    { name: "Fafda", description: "Crispy, deep-fried gram flour strips, typically enjoyed with spicy green chutney.", price: 2.29, quantity: 30 },
    { name: "Masala Peanuts", description: "Peanuts coated in a spicy masala mixture and deep-fried until crunchy.", price: 3.99, quantity: 35 },
    { name: "Chivda", description: "Indian snack mix made with flattened rice, peanuts, spices, and dried fruits.", price: 4.50, quantity: 55 },
    { name: "Bhel Puri", description: "Indian street food made with puffed rice, vegetables, tangy tamarind sauce, and spices.", price: 2.00, quantity: 70 },
    { name: "Pani Puri", description: "Small, round, hollow puris filled with spicy tamarind water, chickpeas, potatoes, and spices.", price: 6.29, quantity: 25 },
    { name: "Parle-G", description: "India's favorite tea biscuit, known for its iconic taste and affordable price.", price: 1.99, quantity: 60 },
    { name: "Good Day", description: "Crispy, buttery biscuits with a hint of sweetness, perfect for tea time.", price: 2.49, quantity: 65 },
    { name: "Hide and Seek", description: "Chocolate-filled biscuits with a crunchy texture, loved by kids and adults alike.", price: 2.99, quantity: 65 },
    { name: "Kurkure Masala Munch", description: "Spicy and tangy corn puffs with a crunchy texture, bursting with flavor.", price: 1.75, quantity: 55 },
    { name: "Bingo Mad Angles", description: "Triangular corn chips with a unique texture and spicy flavor, an addictive snack.", price: 2.99, quantity: 65 },
    { name: "Uncle Chipps", description: "Classic potato chips with a rustic, homemade taste that's loved by all generations.", price: 2.25, quantity: 45 },
    { name: "Lays Magic Masala", description: "Potato chips with a spicy and tangy masala seasoning, a popular choice for snack time.", price: 3.25, quantity: 67 },
    { name: "Parle 20-20", description: "Crunchy biscuits with a mix of sweet and salty flavors, perfect for munching.", price: 1.99, quantity: 50 },
    { name: "Melody Toffees", description: "Creamy and smooth toffees with a delicious chocolate filling, a nostalgic favorite for many.", price: 1.25, quantity: 25 },
    { name: "Eclairs", description: "Cream-filled toffees with a smooth and creamy center, covered in a layer of caramel and chocolate.", price: 1.75, quantity: 35 },
    { name: "Cadbury Dairy Milk", description: "Creamy and indulgent milk chocolate bars with a rich and velvety texture, a classic favorite.", price: 2.49, quantity: 45 },
    { name: "Cadbury Gems", description: "Colorful candy-coated chocolate buttons, fun to eat and perfect for decorating desserts.", price: 1.49, quantity: 55 }

    
  ],
  "Spices" => [
    { name: "Cinnamon Powder", description: "Ground cinnamon spice", price: 2.29, quantity: 40 },
    { name: "Black Pepper", description: "Whole black peppercorns", price: 3.49, quantity: 30 },
    { name: "Turmeric Powder", description: "Ground turmeric spice", price: 1.99, quantity: 50 },
    { name: "Cumin Seeds", description: "Whole cumin seeds", price: 2.99, quantity: 35 },
    { name: "Coriander Powder", description: "Ground coriander spice", price: 2.49, quantity: 45 },
    { name: "Red Chili Powder", description: "Spicy and fiery red chili powder made from dried red chilies, adds heat and flavor to Indian dishes.", price: 1.75, quantity: 45 },
    { name: "Garam Masala", description: "A fragrant spice blend consisting of various ground spices like cardamom, cinnamon, cloves, and more, used to add depth of flavor to Indian dishes.", price: 3.49, quantity: 40 },
    { name: "Fenugreek Seeds", description: "Small, bitter fenugreek seeds with a distinctive maple-like aroma, commonly used in Indian pickles, curries, and spice blends.", price: 1.99, quantity: 45 },
    { name: "Mustard Seeds", description: "Tiny mustard seeds with a pungent and slightly bitter taste, used whole or ground in Indian cooking for their flavor and aroma.", price: 1.49, quantity: 45 },
    { name: "Asafoetida (Hing)", description: "A pungent and tangy spice powder derived from the resin of the asafoetida plant, used as a flavor enhancer in Indian vegetarian dishes.", price: 2.99, quantity: 45 },
    { name: "Curry Leaves", description: "Fragrant curry leaves with a citrusy aroma, used in Indian cooking to add a unique flavor and aroma to dishes like curries and rice.", price: 2.49, quantity: 45 },
    { name: "Fennel Seeds", description: "Sweet and aromatic fennel seeds with a licorice-like flavor, often used as a digestive aid and flavoring agent in Indian cuisine.", price: 1.99, quantity: 40 },
    { name: "Black Mustard Seeds", description: "Small, black mustard seeds with a bold and spicy flavor, used in Indian pickles, curries, and spice blends for their intense heat and aroma.", price: 1.99, quantity: 45 },
    { name: "Ajwain (Carom Seeds)", description: "Tiny, oval-shaped seeds with a strong and distinctive flavor reminiscent of thyme and oregano, commonly used in Indian bread and snack recipes.", price: 2.49, quantity: 45 },
    { name: "Bay Leaves", description: "Dried bay leaves with a subtle herbal flavor, used in Indian cooking to add depth of flavor to soups, stews, and curries.", price: 1.29, quantity: 40 },
    { name: "Tamarind Paste", description: "Tangy and sour tamarind paste made from the pulp of the tamarind fruit, used in Indian cooking to add acidity and flavor to dishes like chutneys, curries, and sauces.", price: 2.29, quantity: 25 },
    { name: "Jaggery", description: "Unrefined sugar made from concentrated sugarcane juice, used in Indian desserts, sweets, and beverages for its caramel-like flavor and natural sweetness.", price: 5.99, quantity: 35 },
    { name: "Curry Paste", description: "A flavorful paste made from a blend of spices, herbs, and aromatics, used as a base for Indian curries and stews for quick and convenient cooking.", price: 4.99, quantity: 40 },
    { name: "Chaat Masala", description: "A tangy and spicy spice blend used to season Indian street food snacks like chaat, bhel puri, and samosas, adding a burst of flavor to every bite.", price: 2.99, quantity: 40 },
    { name: "Mango Powder (Amchur)", description: "Tart and tangy mango powder made from dried unripe mangoes, used as a souring agent in Indian dishes like chutneys, marinades, and curries.", price: 2.49, quantity: 20 },
    { name: "Saffron", description: "Exotic saffron threads prized for their vibrant color and distinct flavor, used sparingly in Indian cooking to add a luxurious touch to dishes like biryanis, desserts, and drinks.", price: 9.99, quantity: 20 },
    { name: "Papadums", description: "Thin and crispy lentil or chickpea crackers, seasoned with spices and herbs, served as a crunchy accompaniment to Indian meals or as a snack on their own.", price: 1.99, quantity: 26 },
    { name: "Rose Water", description: "Fragrant rose water distilled from fresh rose petals, used in Indian sweets, desserts, and beverages for its delicate floral aroma and flavor.", price: 3.99, quantity: 32 },
    { name: "Cinnamon Sticks", description: "Fragrant cinnamon sticks made from the bark of the cinnamon tree, used in Indian cooking to add warmth and sweetness to both sweet and savory dishes.", price: 3.49, quantity: 45 },
    { name: "Cardamom Pods", description: " Aromatic cardamom pods with a sweet and floral flavor, used whole or ground in Indian desserts, chai tea, and spice blends.", price: 4.49, quantity: 15 },
    
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
