class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.string :name

      t.timestamps
    end
  end
end
