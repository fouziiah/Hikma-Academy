# frozen_string_literal: true

ActiveAdmin.register TextContent do
  permit_params :title, :body, :location

  index do
    selectable_column
    id_column
    column :title
    column 'Body' do |text_content|
      shortened_body = text_content.body.truncate(50, separator: ' ', omission: '...')
      span shortened_body, title: text_content.body
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
    end
    f.actions
  end
end
