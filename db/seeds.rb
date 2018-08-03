require "faker"

admin = User.create(email: 'admin@crm.com', password: 'admin321', password_confirmation: 'admin321', role: :super_admin)


10.times do
  company = Company.create(name: Faker::Company.name,
                           office_location: Faker::Address.street_address,
                           phone_number: Faker::PhoneNumber.cell_phone,
                           user_id: admin.id)
end

20.times do
  person = Person.create(first_name: Faker::Name.first_name,
                         last_name: Faker::Name.last_name,
                         email: Faker::Internet.email,
                         phone_number: Faker::PhoneNumber.cell_phone,
                         company_id: Company.all.first.id,
                         user_id: admin.id)
end


8.times do
  product = Product.create(title: Faker::SiliconValley.app,
                           hourly_rate: Faker::Number.decimal(2),
                           user_id: admin.id)
end


Stage.create(title: 'Contacted', description: 'Contacted')
Stage.create(title: 'Proposal Sent', description: 'Proposal Sent')
Stage.create(title: 'Follow up', description: 'Follow up')
Stage.create(title: 'Closed', description: 'Closed')

# 10.times do
#   offset = rand(Stage.count)
#   deal = Deal.create!(total_hours: Faker::Number.between(1, 10),
#               total_price: Faker::Number.between(1, 10),
#               title: Faker::Cat.name,
#               user_id: admin.id,
#               stage_id: Stage.offset(offset).first.id)
# end
