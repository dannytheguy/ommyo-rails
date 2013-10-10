Rabl.configure { |config| config.include_json_root = false }

collection @brands
node do |b|
  { id: b.id, keywords: [b.name].concat(b.terms_array), logo: b.logo.url(:w88h88) }
end
