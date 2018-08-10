# if Rails.env.development?
#   Note.destroy_all
#   notes = []
#   1000.times do
#     notes << {
#       title: Faker::Lorem.sentence,
#       created_at: Faker::Date.backward(365),
#       body: Faker::Markdown.sandwich(10, 3)
#     }
#   end
#   Note.all.create(notes)
# end