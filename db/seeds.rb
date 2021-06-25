main_categories = [ "Pro", "Projets" ]
categories = [ "Hôtels", "Immobilier", "E-1", "R2000", "Micro-studio" ]
insect_links = []
e_1_links = []
r2000_links = []
hotel_links = []
immo_links = []

puts "\nSTART SEEDING"

  puts "\nCleaning DB"
    photo_count = Photo.count
    Photo.all.each_with_index do |photo, i|
      puts "Destroying pic n°#{i}/#{photo_count}"
      photo.destroy!
    end
    Category.destroy_all
    MainCategory.destroy_all
    User.destroy_all
  puts "DB Cleaned"

  puts "\nCreating user"
    if Rails.env.development? || Rails.env.test?
      User.create!(email: "test@test.com", password: 'azerty', password_confirmation: 'azerty')
    elsif Rails.env.production?
      User.create!(email: ENV['GMAIL_USER'], password: ENV['GMAIL_PASSWORD'], password_confirmation: ENV['GMAIL_PASSWORD'])
    end
  puts "#{User.count} user(s) created"

  puts "\nCreating Main categories"
    main_categories.each { |cat| MainCategory.create!(title: cat) }
  puts "Main categories created"

  puts "\nCreating categories"
    categories.each_with_index do |cat, i|
      i < 2 ? Category.create!(title: cat, main_category: MainCategory.find_by(title: "Pro")) : Category.create!(title: cat, main_category: MainCategory.find_by(title: "Projets"))
    end
  puts "Categories created"

  puts "\nCreating photos"
    nb_de_tours = 1
    tour = 1
    nb_de_tours.times do
      puts "\nTour n°#{tour} sur #{nb_de_tours}\n"

      puts "\nInsects photos creation (#{insect_links.length})"
        insect_links.first(3).each_with_index do |link, i|
          photo_insect = Photo.new(name: "Insecte#{i+1}", description: "Insecte n°#{i+1} super stylé", category: Category.find_by(title: "Micro-studio"))
          photo_insect.main_category_id = photo_insect.category.main_category_id
          photo_insect.image.attach(io: URI.open(link), filename: "Photo Insecte n°#{i+1}", content_type: "image/jpg")
          photo_insect.save!
          puts "Photo n°#{i+1} created"
        end
      puts "Insects photos created"

      puts "\nE_1 photos creation (#{e_1_links.length})"
        e_1_links.first(3).each_with_index do |link, i|
          photo_e1 = Photo.new(name: "E-1 - #{i+1}", description: "E-1 n°#{i+1} de ouf", category: Category.find_by(title: "E-1"))
          photo_e1.main_category_id = photo_e1.category.main_category_id
          photo_e1.image.attach(io: URI.open(link), filename: "Photo E-1 n°#{i+1}", content_type: "image/jpg")
          photo_e1.save!
          puts "Photo n°#{i+1} created"
        end
      puts "E-1 photos created"

      puts "\nR2000 photos creation (#{r2000_links.length})"
        r2000_links.first(3).each_with_index do |link, i|
          photo_r2000 = Photo.new(name: "R2000 - #{i+1}", description: "R2000 n°#{i+1} waou", category: Category.find_by(title: "R2000"))
          photo_r2000.main_category_id = photo_r2000.category.main_category_id
          photo_r2000.image.attach(io: URI.open(link), filename: "Photo R2000 n°#{i+1}", content_type: "image/jpg")
          photo_r2000.save!
          puts "Photo n°#{i+1} created"
        end
      puts "R2000 photos created"

      puts "\nHotel photos creation (#{hotel_links.length})"
        hotel_links.first(3).each_with_index do |link, i|
          photo_hotel = Photo.new(name: "Hotel - #{i+1}", description: "Hotel n°#{i+1} amazing", category: Category.find_by(title: "Hôtels"))
          photo_hotel.main_category_id = photo_hotel.category.main_category_id
          photo_hotel.image.attach(io: URI.open(link), filename: "Photo Hotel n°#{i+1}", content_type: "image/jpg")
          photo_hotel.save!
          puts "Photo n°#{i+1} created"
        end
      puts "Hotel photos created"

      puts "\nImmobilier photos creation (#{immo_links.length})"
        immo_links.first(3).each_with_index do |link, i|
          photo_immo = Photo.new(name: "Immo - #{i+1}", description: "Immo n°#{i+1} waou", category: Category.find_by(title: "Immobilier"))
          photo_immo.main_category_id = photo_immo.category.main_category_id
          photo_immo.image.attach(io: URI.open(link), filename: "Photo Immo n°#{i+1}", content_type: "image/jpg")
          photo_immo.save!
          puts "Photo n°#{i+1} created"
        end
      puts "Immobilier photos created"
      tour += 1
    end
  puts "\nCreating photos done"

puts "\nSEEDING DONE"
