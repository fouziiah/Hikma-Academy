# frozen_string_literal: true

ActiveAdmin.register TextContent do
  permit_params :title, :body, :location
end
