Rabl.configure { |config| config.include_json_root = false }

collection @omms
node do |omm|
  { id: omm.id,
    logo: omm.brand.logo.url(:w88h88),
    author: omm.messages.first.author.name,
    text: omm.messages.first.text,
    age: time_ago_in_words(omm.messages.first.created_at) + ' ago' }
end
