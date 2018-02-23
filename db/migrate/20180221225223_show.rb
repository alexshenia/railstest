class Show < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.belongs_to :movie
      t.belongs_to :hall
      t.datetime :start_at

      t.timestamps
    end
  end
end
