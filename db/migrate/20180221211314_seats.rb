class Seats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :number
      t.belongs_to :hall

      t.timestamps
    end
  end
end
