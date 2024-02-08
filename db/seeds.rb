# frozen_string_literal: true

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
TextContent.find_or_create_by(location: 'footer_address', title: 'Footer Address') do |content|
  content.body = '5995 Timber Trail SE, Prior Lake, MN 55372, United States'
end

TextContent.find_or_create_by(location: 'footer_contact', title: 'Footer Contact') do |content|
  content.body = '952-447-7786 | hikmaacademy.mn@gmail.com'
end

TextContent.find_or_create_by(location: 'footer_copyright', title: 'Footer Copyright') do |content|
  content.body = 'Copyright © 2024 Hikma Academy'
end

# Create Welcome Message TextContent record
TextContent.find_or_create_by(location: 'welcome_message_title', title: 'Welcome Title') do |content|
  content.body = 'Welcome To Hikma Academy'
end

TextContent.find_or_create_by(location: 'welcome_message_quote', title: 'Welcome Quote') do |content|
  content.body = '“Glad tidings to that individual who becomes a Miftaah (key) towards good and a lock towards evil.” (Sunan Ibn Majah)'
end

TextContent.find_or_create_by(location: 'welcome_message_prophet', title: 'Welcome Prophet') do |content|
  content.body = '— Prophet Muhammad ﷺ'
end

# Create Contact section
TextContent.find_or_create_by(location: 'contact_header', title: 'Contact Header') do |content|
  content.body = 'Contact Us'
end

TextContent.find_or_create_by(location: 'contact_address', title: 'Contact Address') do |content|
  content.body = '5995 Timber Trail SE, Prior Lake, MN 55372, United States'
end

TextContent.find_or_create_by(location: 'contact_email', title: 'Contact Email') do |content|
  content.body = 'hikmaacademy.mn@gmail.com'
end

TextContent.find_or_create_by(location: 'contact_phone', title: 'Contact Phone') do |content|
  content.body = '952-447-7786'
end

# Seed text content for teacher names
TextContent.find_or_create_by(location: 'teacher_1_name', title: 'Teacher 1') do |content|
  content.body = 'Ustadha Kaltun Karani'
end

TextContent.find_or_create_by(location: 'teacher_2_name', title: 'Teacher 2') do |content|
  content.body = 'Fathiya Ahmed'
end

TextContent.find_or_create_by(location: 'teacher_3_name', title: 'Teacher 3') do |content|
  content.body = 'Roun Said'
end

# Seed text content for teachers' bios
TextContent.find_or_create_by(location: 'teacher_1_bio', title: 'Teacher 1 Bio') do |content|
  content.body = 'Ustadha Kaltun Karani is the founder of Hikma Academy, where she teaches tafsir and Islamic studies for spiritual growth and intentional living. She is a mental health psychotherapist and life coach and is the author of Intentionally Rising, a lifestyle design workbook utilizing Islamic principles of personal development. Kaltun has a bachelor’s of Business and Marketing from the Ohio State University and in Islamic Studies from AlMaghrib Institute. She has a master’s in School Counseling from the University of Wisconsin in River Falls. She received a diploma in Islamic Psychology from Cambridge Muslim College. Kaltun has been active in the community since 2007 teaching and mentoring women and girls in spiritual growth and development. She’s a 2022 Bush Foundation fellow exploring Dugsi reform and nurturing faith and well-being in the community.'
end

TextContent.find_or_create_by(location: 'teacher_2_bio', title: 'Teacher 2 Bio') do |content|
  content.body = 'Fathiya Ahmed memorized the Quran at 19 while completing a bachelor’s degree from the University of Minnesota in Family Social Science. After that, she pursued a 2-year Islamic studies degree from Abubakr As-Saddique Islamic Institute and local Minnesota scholars. Fathiya was eager to connect with and understand the Quran, so she also enrolled in Arabic courses online at Fajr Center in Egypt. She was blessed to move to Madinah and completed a 2-year Arabic and Islamic studies program. She’s also focusing on the sciences of the Quran and is a student at the Tafsir Center for Quranic Studies. Fathiya enjoys reading, writing, cooking, and spending time with family and friends. If you have any questions, email us at fathiya@hikmaacademy.org'
end

TextContent.find_or_create_by(location: 'teacher_3_bio', title: 'Teacher 3 Bio') do |content|
  content.body = 'Roun Said is a mental health therapist, doctoral candidate, and a community-engaged researcher. She received her bachelor’s degree in Human Development and Family Science from The Ohio State University and her master’s degree in Clinical Mental Health Counseling from University of Dayton. Currently, she is working on her PhD in Family Social Science at the University of Minnesota and is pursuing Islamic knowledge as a student through Jannah Institute and Ribaat Academic Institute. As a Level 1 trained TIIP (Traditional Islamically Integrated Psychotherapy) Therapist with additional trainings in Cognitive Behavioral Therapy, Acceptance and Commitment Therapy, and Dialectical Behavioral Therapy, Roun’s work blends Islamic practices and Western psychology into a holistic, strengths-based approach.'
end
