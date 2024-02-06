class CreateTextContents < ActiveRecord::Migration[7.1]
  def change
    create_table :text_contents do |t|
      t.string :location
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
