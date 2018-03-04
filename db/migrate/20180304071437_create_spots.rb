class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.references :station ,foreign_key: true
      t.text :description
      t.string :image_url
      t.string :link_url

      t.timestamps
    end
  end
end
