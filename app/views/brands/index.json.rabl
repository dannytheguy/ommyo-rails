Rabl.configure { |config| config.include_json_root = false }

collection @brands
node do |b|
  { b.id => b.name }
end
