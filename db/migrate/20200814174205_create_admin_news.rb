class CreateAdminNews < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_news do |t|
      t.string :name
      t.string :brewery_type
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.float :longitude
      t.float :latitude
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
