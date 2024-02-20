# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

categories = [
  { name: "Sales", subcategories: ["Product A Sales", "Product B Sales", "Product C Sales", "Services"] },
  { name: "Cost of Goods Sold", subcategories: ["Inventory Cost", "Raw Materials", "Production Expenses", "Shipping Costs"] },
  { name: "Administrative Expenses", subcategories: ["Salaries", "Rent & Utilities", "Marketing & Advertising", "Office Supplies"] },
  { name: "Other Expenses", subcategories: ["Taxes", "Interest", "Depreciation"] },
  { name: "Income", subcategories: ["Investments", "Interest Income", "Other Income"] }
]
puts "seeding"


  User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.unique.name, # Ensure unique usernames
    password_digest: 'password' # Set password directly to 'password'
  )

  10.times do
    ProfitLossStatement.create(
      date: Faker::Date.between(from: 1.year.ago, to: Date.today),
      name: Faker::Lorem.word,
      amount: Faker::Number.decimal(l_digits: 5, r_digits: 2), # Example of generating a decimal number
      revenue: Faker::Number.decimal(l_digits: 5, r_digits: 2).to_d,  # Convert to decimal
      expenses: Faker::Number.decimal(l_digits: 5, r_digits: 2).to_d,  # Convert to decimal
      sales: Faker::Number.decimal(l_digits: 5, r_digits: 2).to_d,  # Convert to decimal
      accounts_receivable: Faker::Number.decimal(l_digits: 5, r_digits: 2).to_d,  # Convert to decimal
      accounts_payable: Faker::Number.decimal(l_digits: 5, r_digits: 2).to_d  # Convert to decimal
    )
  end
  
 

puts "done seeding"