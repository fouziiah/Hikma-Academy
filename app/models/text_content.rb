class TextContent < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "id_value", "location", "title", "updated_at"]
      end
end
