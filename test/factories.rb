Factory.define :post do |p|
  p.title "Title"
  p.body "Body_post"
  p.date Date.new(2009,6,25)
end
Factory.define :album do |p|
  p.title "Title"
end
Factory.define :lyric do |p|
  p.title "Title"
  p.text_song "text_song"
end