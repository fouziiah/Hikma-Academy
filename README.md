# Hikma Academy 

## Introduction

Hikma Academy is a platform committed to fostering a deeper understanding of spiritual teachings, providing individuals with the tools to embark on a transformative journey towards enlightenment and personal growth.

## Project Scope

This project aimed to revamp the existing website for Hikma Academy, elevating its online presence and functionality. Our goal was to integrate new features and enhancements to the website, enriching the user experience and providing a more intuitive platform for visitors to engage with the wealth of resources and teachings offered by Hikma Academy.

## Technologies Used

- Ruby on Rails
- JavaScript
- Stripe API
- Active Admin
- PostgreSQL
- Heroku
- HTML5
- CSS3

## Features

- Enhanced User Experience
- New Feature Integration
- Optimized Performance
- Secure Payment Processing
- Content Management System (CMS)
- User Authentication and Authorization
- One-Time Checkout
- Multiple Item Checkout
- Interactive Learning Tools
- Responsive Design

## Installation

Follow these steps to set up the project on your local machine:

1. **Clone the Repository:**

Replace `<repository_url>` with the actual URL of your project's repository.

2. **Navigate to the Project Directory:**

Change directory to the root folder of your project.

3. **Install Dependencies:**
- **Ruby Dependencies:**
  Ensure you have Ruby installed on your system.
  ```
  gem install bundler
  bundle install
  ```
- **JavaScript Dependencies:**
  Ensure you have Node.js and Yarn installed on your system.
  ```
  yarn install
  ```

4. **Database Setup:**
rails db:create
rails db:migrate

This will create the necessary databases and run migrations to set up the database schema.

5. **Set Environment Variables:**
Create a `.env` file in the root directory of your project and add the necessary environment variables. For example:

- STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
- STRIPE_SECRET_KEY=your_stripe_secret_key

Replace `your_stripe_publishable_key` and `your_stripe_secret_key` with your actual Stripe API keys.

6. **Start the Server:**
- This will start the Rails server locally.

7. **Access the Application:**
- Open your web browser and navigate to `http://localhost:3000` to access the Hikma Academy website.
