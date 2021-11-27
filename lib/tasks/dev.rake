namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment  do
    
    if Rails.env.development?
      
      puts "Apagando Banco"
      %x(rails db:drop:_unsafe)
      puts "Criando Banco"
      %x(rails db:create)
      puts "Migrando Banco"
      %x(rails db:migrate)
      
      puts "Setup contacts type.."
      kinds = ["Personal", "Professional", "Studant"]
      kinds.each do |kind|
        Kind.create!(
          description: kind
        )
      end

      puts "Setup contacts.."
      100.times do
        Contact.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
          kind: Kind.all.sample
        )
      end

      puts "Setup phones.."
      Contact.all.each do |contact|
        Random.rand(1..3).times do |i|
          phone = Phone.create!( 
            number: Faker::PhoneNumber.cell_phone,
            contact: contact
          )
          contact.phones << phone
          contact.save!
        end
      end

      puts "Sucessful!"
    end
    
  end

end
