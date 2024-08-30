class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats, id: :biginit do |t|
      t.string :name

      t.timestamps
    end
  end
end
