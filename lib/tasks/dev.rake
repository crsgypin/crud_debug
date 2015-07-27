namespace :dev do 
	task :data => :environment do
		
		Product.destroy_all
		Comment.destroy_all
		User.destroy_all

		User.create(:id => 1,
								:email=> 'derek@gmail.com',
								:username=> 'derek',
								:password=>'qwerty1234')

		10.times do |index|
			User.create(:id => index+2,
									:email=>Faker::Internet.email,
									:username=>Faker::Name.name,
									:password=>'qwerty1234'
									)
		end

		10.times do |t|
			p = Product.create(:id=>t, 
											 :name=>Faker::Commerce.product_name,
											 :desc=>Faker::Lorem.paragraph,
											 :price=>Faker::Number.between(10, 200),
											 :category_id=>rand(4)+1,
											 :user_id => rand(10)+1)
			rand(4).times do |r|
				p.comments.create(:content=>Faker::Lorem.paragraph, :user_id=>rand(10)+1)
			end
		end

	end
end