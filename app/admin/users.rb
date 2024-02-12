# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :first_name, :last_name, :username, :phone, :email, :password, :password_confirmation, :role_id

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :username
    column :phone
    column :email
    column :role
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :username
      f.input :phone
      f.input :email
      f.input :role_id, as: :select, collection: Role.where(name: ['student', 'teacher']).pluck(:name, :id)
    end
    f.actions
  end
  

  remove_filter :enrollments
  remove_filter :children
  remove_filter :courses
  remove_filter :teaching_courses
  remove_filter :enrolled_courses
  remove_filter :pay_customers
  remove_filter :charges
  remove_filter :subscriptions
  remove_filter :payment_processor
  remove_filter :image_attachment
  remove_filter :image_blob
  remove_filter :payments



  actions :all, except: [:destroy]
end
