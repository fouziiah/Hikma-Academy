# frozen_string_literal: true

class TextContent < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at id id_value location title updated_at]
  end
end
