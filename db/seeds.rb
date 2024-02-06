# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# Create the student role


# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# Create footer content
TextContent.find_or_create_by(location: "footer_address", title: "Footer Address") do |content|
    content.body = "5995 Timber Trail SE, Prior Lake, MN 55372, United States"
end
  
TextContent.find_or_create_by(location: "footer_contact", title: "Footer Contact") do |content|
    content.body = "952-447-7786 | hikmaacademy.mn@gmail.com"
end
  
TextContent.find_or_create_by(location: "footer_copyright", title: "Footer Copyright") do |content|
    content.body = "Copyright © 2024 Hikma Academy"
end
  


# Create Welcome Message TextContent record
TextContent.find_or_create_by(location: "welcome_message_title", title: "Welcome Title") do |content|
    content.body = "Welcome To Hikma Academy"
end
  
TextContent.find_or_create_by(location: "welcome_message_quote", title: "Welcome Quote") do |content|
    content.body = "“Glad tidings to that individual who becomes a Miftaah (key) towards good and a lock towards evil.” (Sunan Ibn Majah)"
end
  
TextContent.find_or_create_by(location: "welcome_message_prophet", title: "Welcome Prophet") do |content|
    content.body = "— Prophet Muhammad ﷺ"
end
  

# Create Contact section
TextContent.find_or_create_by(location: "contact_header", title: "Contact Header") do |content|
    content.body = "Contact Us"
end
  
TextContent.find_or_create_by(location: "contact_address", title: "Contact Address") do |content|
    content.body = "5995 Timber Trail SE, Prior Lake, MN 55372, United States"
end
  
TextContent.find_or_create_by(location: "contact_email", title: "Contact Email") do |content|
    content.body = "hikmaacademy.mn@gmail.com"
end
  
TextContent.find_or_create_by(location: "contact_phone", title: "Contact Phone") do |content|
    content.body = "952-447-7786"
end
  