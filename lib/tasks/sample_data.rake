namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do

		make_users
		make_tours
		
	end

	task base_data: :environment do
		if (User.count == 0) then make_users end
	end

end


def make_users
	User.create(name: "testUser")
end

def make_tours
	15.times do |n|
		tour = Tour.create!(
			name: Faker::Lorem.words(rand(2..5)).join(' '),
			content: Faker::Lorem.sentence(50),
			user_id: User.first.id)
	end
end