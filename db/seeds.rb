[
  { text: 'McDonald’s coffee is slacking today. I want to have something more...',
    user: 'pdiddy',
    brand: 'McDonalds' },
  { text: "I've been waiting in this line for what seems like forever. Starbucks...",
    user: 'matt543',
    brand: 'Starbucks' },
  { text: 'I love the whopper at Burger King...',
    user: 'johnboy12',
    brand: 'Burger King' },
  { text: 'The dealer in Charlotte was rude and not helpful. It...',
    user: 'rainbowwarrior',
    brand: 'Chevrolet' },
  { text: 'Iced coffee at Starbucks gets the people going...',
    user: 'matt543',
    brand: 'Starbucks' },
  { text: 'These delays are killing me. Would it be too much to ask if a real...',
    user: 'mary-beth',
    brand: 'American Airlines' }
].each do |omm|
  user = User.where(email: "#{omm[:user]}@gmail.com").first_or_create(password: 'password')

  brand = Brand.where(name: omm[:brand]).first_or_create(logo: File.new("#{Rails.root}/db/seeds/#{omm[:brand].parameterize}.png", 'rb'))

  text = omm[:text].sub(/\.{3}\z/, ' lorem ipsum dolor sit amet, consectetur adipisicing elit,
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
    irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
    mollit anim id est laborum.')
  omm = user.omms.build(brand_id: brand.id)
  omm.messages.build(text: text, author_id: omm.user_id, author_type: 'User')
  omm.save
end

User.create(email: 'drew@ommyo.com', password: 'password')
AdminUser.create(email: 'drew@ommyo.com', password: 'password')
