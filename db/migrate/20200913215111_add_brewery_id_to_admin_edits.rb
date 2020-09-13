class AddBreweryIdToAdminEdits < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_edits, :brewery_id, :integer
  end
end
