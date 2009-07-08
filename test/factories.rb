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
  p.title_photo_small "photochka"
  p.title_photo_big "photisha"
end
