class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :brewery_id
      t.integer :user_id
      t.float :number
      t.text :notes

      t.timestamps
    end
  end
end
