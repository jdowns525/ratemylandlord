require 'faker'

namespace :db do
  desc "Fill the database with sample data"
  task populate: :environment do
    # Create Landlords
    10.times do
      landlord = Landlord.create!(
        name: Faker::Name.name,
        neighborhood: Faker::Address.community,
        address: Faker::Address.street_address,
        state: Faker::Address.state_abbr,
        postal_code: Faker::Address.zip_code,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        stars: rand(1.0..5.0).round(1),
        review_count: Faker::Number.number(digits: 2),
        reviews_count: Faker::Number.number(digits: 2),
        city: Faker::Address.city,
        caption: Faker::Lorem.sentence
      )

      # Create Categories for Landlords
      3.times do
        Category.create!(
          landlord_id: landlord.id,
          category: Faker::House.room,
          created_at: Time.now,
          updated_at: Time.now
        )
      end

      # Create Users
      5.times do
        user = User.create!(
          email: Faker::Internet.email,
          password_digest: Faker::Internet.password,
          name: Faker::Name.name,
          review_count: Faker::Number.number(digits: 2),
          average_stars: rand(1.0..5.0).round(1),
          created_at: Time.now,
          updated_at: Time.now
        )

        # Create Reviews
        2.times do
          Review.create!(
            stars: rand(1..5),
            text: Faker::Lorem.paragraph,
            useful: Faker::Number.number(digits: 1),
            cool: Faker::Number.number(digits: 1),
            landlord_id: landlord.id,
            user_id: user.id,
            city: Faker::Address.city,
            created_at: Time.now,
            updated_at: Time.now,
            date_occupancy: Faker::Date.between(from: 3.years.ago, to: 1.year.ago),
            date_vacancy: Faker::Date.between(from: 1.year.ago, to: Date.today)
          )
        end
      end
    end
  end
end
