<<<<<<< HEAD

User.destroy_all
Person.delete_all
Debt.delete_all
=======
puts "Destroying existing records..."
User.destroy_all
Debt.destroy_all
Person.destroy_all
>>>>>>> fdd29ce70334969cceb5fe495e28604c0264a6a4

User.create email: 'admin@admin.com', password: '111111'

puts "Usuário criado:"
puts "login admin@admin.com"
puts "111111"

<<<<<<< HEAD

# - Criar script para gerar 50 users, 100 people e 500 debts de maneira
# randômica com dados fake

50.times do
   User.create email: Faker::Internet.email, password: Faker::Internet.password
end
puts "50 Usuários criados"

1000.times do
  Person.create(
    name: Faker::Name.name,
    active: true,
    national_id: Faker::IDNumber.brazilian_citizen_number(formatted: true),
    user_id: User.order("RANDOM()").first.id,
    phone_number: Faker::PhoneNumber.phone_number
  )
end


5000.times do
  Debt.create(
    observation: Faker::String.random(length: [0,40]),
    amount: Faker::Number.positive,
    person_id: Person.order("RANDOM()").first.id,
  )
end
puts "500 Contas criadas"
=======
1000.times do |counter|
  puts "Creating user #{counter}"
  User.create email: Faker::Internet.email, password: '111111'
end

3000.times do |counter|
  puts "Inserting Person #{counter}"

  attrs = {
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    national_id: CPF.generate,
    active: [true, false].sample,
    user: User.order('random()').first
  }
  person = Person.create(attrs)

  5.times do |debt_counter|
    puts "Inserting Debt #{debt_counter}"
    person.debts.create(
      amount: Faker::Number.between(from: 1, to: 200),
      observation: Faker::Lorem.paragraph
    )
  end
end
>>>>>>> fdd29ce70334969cceb5fe495e28604c0264a6a4
