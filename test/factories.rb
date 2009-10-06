Factory.define :post do |p|
  p.title "Title"
  p.body "Body_post"
  p.date Date.new(2009,6,25)
end
Factory.define :album do |p|
  p.title "Title"
  p.description "description"
end
Factory.define :lyric do |p|
  p.title "Title"
  p.text_song "text_song"
end
Factory.define :review do |p|
  p.title "Title"
  p.date Date.new(2009,7,7)
  p.author "Thomas"
  p.body "text"
end
Factory.define :participant do |p|
  p.name "joy"
  p.bio "bio"
end
Factory.define :contact do |p|
  p.some_contact "contact"
end
Factory.define :message do |p|
  p.your_name "name"
  p.your_email "email"
  p.your_message "message"
end
Factory.define :user do |p|
  p.name "name"
  p.hashed_password "bla"
  p.salt "salt"
end
Factory.define :upload do |p|
  p.file_name "file_name"
end
