# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Chat.insert_all([
  { name: "u1_u2" },
  { name: "u2_u3" },
  { name: "u1_u3" },
])

chat_ids = Chat.all.pluck(:id)

[
  { email: 'user1@email.com', full_name: "Jese Leos", password: "admin@123" },
  { email: 'user2@email.com', full_name: "Bonnie Green", password: "admin@123" },
  { email: 'user3@email.com', full_name: "Lana Byrd", password: "admin@123" }
].each { |params| User.create(params) }


user_ids = User.all.pluck(:id)

Message.insert_all([
  { content: "Message 1", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 2", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 3", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 4", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 5", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 6", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 7", user_id: user_ids.sample, chat_id: chat_ids.sample },
  { content: "Message 8", user_id: user_ids.sample, chat_id: chat_ids.sample },
])

(1..50).each do |i|
  Seat.create(id: i, name: "C#{i.to_s.rjust(3, '0')}")
end
# Create some sample bookings
Booking.create(id: 1, user_id: 1, seat_id: 1, from_date: 2.days.ago, to_date: 1.day.ago, check_in: true)
Booking.create(id: 2, user_id: 1, seat_id: 1, from_date: 1.day.ago, to_date: Time.now, check_in: false)
Booking.create(id: 3, user_id: 1, seat_id: 10, from_date: Time.current.tomorrow, to_date: Time.current.tomorrow.end_of_day, check_in: false)
Booking.create(id: 4, user_id: 1, seat_id: 10, from_date: Time.now, to_date: Time.current.end_of_day, check_in: false)
Booking.create(id: 5, user_id: 1, seat_id: 8, from_date: Time.now, to_date: Time.current.end_of_day, check_in: false)
