Rabl.configure { |config| config.include_json_root = false }

collection @omms
node do |omm|
  { logo: omm.brand.logo.url(:w88h88),
    author: omm.messages.first.author.name,
    text: truncate(omm.messages.first.text, :length => 150),
    age: time_ago_in_words(omm.messages.first.created_at) + ' ago' }
end
