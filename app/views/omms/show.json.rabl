Rabl.configure { |config| config.include_json_root = false }

collection @messages
node do |message|
  { author: message.author.name,
    text: message.text,
    age: time_ago_in_words(message.created_at) + ' ago' }
end
