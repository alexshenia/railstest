class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :show
      t.belongs_to :user
      t.belongs_to :seat
      t.boolean :active

      t.timestamps
    end
  end
end
