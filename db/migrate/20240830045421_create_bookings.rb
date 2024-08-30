class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    # Create Booking table with the following columns:
    # - id: primary key
		# - user_id: uid
		# - seat_id: uid
		# - from_date: Date time
		# - to_date: Date time
		# - check_in: boolean (edited) 
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true
      t.datetime :from_date
      t.datetime :to_date
      t.boolean :check_in

      t.timestamps
    end
  end
end
