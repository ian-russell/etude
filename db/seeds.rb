subjects = ['Spanish', 'Guitar', 'French', 'Drums', 'Recorder', 'Samba', 'Welding',
  'Woodworking', 'Scrapbooking', 'Knitting', 'Korean', 'Cooking', 'Karate', 'Bridge',
  'Fishing', 'Waterskiing', 'Kiteboarding', 'Trombone', 'Trumpet', 'Boxing'
]

firstnames = [
  'Dinorah', 'Aleta', 'Carola', 'Chiquita', 'Kia', 'Tawny', 'Su', 'Kristan', 'Katia', 'Ha',
  'Claris', 'Lisabeth', 'Latoya', 'Krystin', 'Alexandria', 'Anya', 'Betty', 'Verena', 'Jada',
  'Nydia', 'Cordelia', 'Halley', 'Stephany', 'Bunny', 'Alta', 'Laci', 'Leah', 'Yanira',
  'Bobette', 'Shellie', 'Geraldine', 'Ozie', 'Theda', 'Jacquiline', 'Yoshiko', 'Miranda',
  'Filomena', 'Agripina', 'Jaimie', 'Susanna', 'Karey', 'Allene', 'Effie', 'Bee', 'Debi',
  'Dominic', 'Allen', 'Mohammed', 'Gino', 'Ervin', 'Berry', 'Pedro', 'Lawerence', 'Junior',
  'Kareem', 'Beau', 'Chester', 'Guillermo', 'Ismael', 'Mose', 'Royce', 'Jimmie', 'Hiram',
  'Jamar', 'Ian', 'Winston', 'Kelley', 'Jimmy', 'Lionel', 'Josue', 'Reid', 'Colby', 'Hank',
  'Rufus', 'Winfred', 'Kieth', 'Ezequiel', 'Steven', 'Miles', 'John', 'Leonard', 'Rusty',
  'Quinton', 'Darnell', 'Woodrow', 'Forest', 'Oscar', 'Alfredo', 'Dante', 'Donovan', 'Rickie',
  'Lane', 'Mauricio', 'Luke', 'Lawrence', 'Elia', 'Tama', 'Tessie', 'Fiona', 'Aimee'
]

lastnames = [
  'Lemon', 'Shaffer', 'Jurek', 'Deering', 'Hyre', 'Kuck', 'Mitchem', 'Sybert', 'Santelli',
  'Riendeau', 'Lomanto', 'Devens', 'Rancourt', 'Trudel', 'Pape', 'Autin', 'Pascucci',
  'Graydon', 'Topper', 'Schley', 'Darbonne', 'Cosper', 'Minchew', 'Jaynes', 'Phares',
  'Laford', 'Dreyer', 'Larin', 'Hanus', 'Woodham', 'Lehmann', 'Brito', 'Standard',
  'Delapena', 'Sires', 'Samford', 'Bagley', 'Charon', 'Claflin', 'Camilleri', 'Fitting',
  'Vassar', 'Durling', 'Lasso', 'Letcher', 'Deems', 'Shrock', 'Yeldell', 'Clampitt', 'Eaves',
  'Zoigbert', 'Cumberbatch', 'Straussenbaum', 'Grundenbladt', 'Stoigenfeldt'
]

formats = ["online", "offline"]

# Create teacher users
teacherusers = [
  { first_name: "Eric", last_name: "Hartman", picture: "https://pbs.twimg.com/profile_images/688899010690600960/pMBbknbg.jpg" },
  { first_name: "Luke", last_name: "Plourde", picture: "https://avatars3.githubusercontent.com/u/20364812?v=3&s=400" },
  { first_name: "Ian", last_name: "Russell", picture: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/6/005/042/255/0617fe3.jpg" },
  { first_name: "Mike", last_name: "Schwartze", picture: "http://www.batmangamesonly.com/images/wallpapers/batman-1-1024x768.jpg" }
]

x = 0
teacherusers.each do
  User.create(
    first_name: teacherusers[x][:first_name],
    last_name: teacherusers[x][:last_name],
    email: "#{teacherusers[x][:first_name]}@#{teacherusers[x][:first_name]}.com",
    password: "123",
    password_confirmation: "123"
  )
  subject = subjects[rand(0..subjects.count)]
  Teacher.create(
    price: rand(20..50),
    subject: subject,
    postal_code: "M5H 1K5",
    user_id: x + 1,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    picture: teacherusers[x][:picture],
    teaching_since: (Time.now - rand(3..7).years),
    street_address: "220 King Street W",
    city: "Toronto",
    province: "ON"
  )
  x = x + 1
end

# Create Student users
15.times do |x|
  User.create(
    first_name: "#{firstnames[rand(0..firstnames.count)]}",
    last_name: "#{lastnames[rand(0..lastnames.count)]}",
    email: "user#{x}@user.com",
    password: "123",
    password_confirmation: "123",
  )
  user = User.last
  Student.create(
    user_id: user.id,
    street_address: "1 Bloor Ave W",
    city: "Toronto",
    postal_code: "M6H 1M9"
  )
end


# Create random availability ranges for all teachers
teachers = Array (1..Teacher.all.count)
teachers.each do |t|
  x = 0
  rand(1..6).times do
    start_time = rand(7..19)
    end_time = rand((start_time + 2)..23)
    AvailabilityRange.create(
    teacher_id: t,
    start_time: start_time,
    end_time: end_time,
    weekday: x
    )
    # Create a bunch of random lesons
    100.times do
      Lesson.create(
      time: Time.new(rand(2016..2017), rand(2..12), (rand(1..28)), (start_time + 1), 0, 0),
      student_id: rand(1..Student.all.count),
      teacher_id: t,
      format: "#{formats[rand(0..1)]}"
      )
    end
    x = x + 1
  end
end

# Create a bunch of other teachers
x = 0
id = Teacher.last.id + 1
30.times do
  User.create(
  first_name: "#{firstnames[rand(0..firstnames.count)]}",
  last_name: "#{lastnames[rand(0..lastnames.count)]}",
    email: "teacher#{x}@teacher.com",
    password: "123",
    password_confirmation: "123"
  )
  subject = subjects[rand(0..subjects.count)]
  id = Teacher.last.id
  Teacher.create(
    price: rand(20..50),
    subject: subject,
    postal_code: "M5H 1K5",
    user_id: id,
    bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    picture: "https://randomuser.me/api/portraits/men/#{id}.jpg",
    teaching_since: Time.now,
    street_address: "220 King St W",
    city: "Toronto",
    province: "ON"
  )
  id = id + 1
  x = x + 1
  teacher = Teacher.last
  y = 0
  rand(1..6).times do
    start_time = rand(7..19)
    end_time = rand((start_time + 2)..23)
    AvailabilityRange.create(
    teacher_id: teacher.id,
    start_time: start_time,
    end_time: end_time,
    weekday: y
    )
    y = y + 1
  end

end
