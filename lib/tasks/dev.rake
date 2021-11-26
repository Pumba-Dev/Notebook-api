namespace :dev do
  desc "TODO"
  task setup: :environment do
    puts "Setup faker contacts in Contact Model"
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
      )
    end
    puts "Sucessful!"
  end

end
