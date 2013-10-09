[
  [
    'pdiddy',
    'McDonalds',
    'McDonald’s coffee is slacking today. I want to have something more...'
  ],
  [
    'matt543',
    'Starbucks',
    "I've been waiting in this line for what seems like forever. Starbucks..."
  ],
  [
    'johnboy12',
    'Burger King',
    'I love the whopper at Burger King...'
  ],
  [
    'rainbowwarrior',
    'Chevrolet',
    'The dealer in Charlotte was rude and not helpful. It...'
  ],
  [
    'matt543',
    'Starbucks',
    'Iced coffee at Starbucks gets the people going...'
  ],
  [
    'mary-beth',
    'American Airlines',
    'These delays are killing me. Would it be too much to ask if a real...'
  ]
].each do |user_name, brand_name, text|
  user = User.where(email: "#{user_name}@gmail.com").first_or_create(password: 'password')

  brand = Brand.where(name: brand_name).first_or_create(logo: File.new("#{Rails.root}/db/seeds/#{brand_name.parameterize}.png", 'rb'))

  text.sub!(/\.{3}\z/, ' lorem ipsum dolor sit amet, consectetur adipisicing elit,'\
    ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,'\
    ' quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute'\
    ' irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'\
    ' Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt'\
    ' mollit anim id est laborum.')

  omm = user.omms.build(brand_id: brand.id)
  omm.messages.build(text: text, author_id: omm.user_id, author_type: 'User')
  omm.save
end

User.create(email: 'drew@ommyo.com', password: 'password')
AdminUser.create(email: 'drew@ommyo.com', password: 'password')

Brand.create(name: 'Email_Test', email: 'drew@ommyo.com', logo: File.new("#{Rails.root}/db/seeds/email_test.png", 'rb'))
Brand.create(name: 'IIM_Test', logo: File.new("#{Rails.root}/db/seeds/iim_test.png", 'rb'))
