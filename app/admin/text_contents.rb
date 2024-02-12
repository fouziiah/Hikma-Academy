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
    actions defaults: false do |text_content|
      link_to 'View', admin_text_content_path(text_content)
    end
    actions defaults: false do |text_content|
      link_to 'Edit', edit_admin_text_content_path(text_content)
    end
  end

  form do |f|
    f.inputs do
      f.input :title, input_html: { readonly: true, disabled: true }
      f.input :body
    end
    f.actions
  end
end
