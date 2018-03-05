class CreateMyTwitters < ActiveRecord::Migration[5.1]
  def change
    create_table :my_twitters do |t|

      t.timestamps
    end
  end
end
