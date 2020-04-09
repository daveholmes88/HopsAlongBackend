class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :breweries, :descriptions, table_name: :tags do |t|
      t.index :brewery_id
      t.index :description_id
      
      t.timestamps
    end
  end
end
