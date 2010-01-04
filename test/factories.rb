Factory.define :post do |p|
  p.title "Title"
  p.body "Body_post"
  p.published_at Date.new(2009,6,25)
end
Factory.define :album do |p|
  p.title "Title"
  p.description "description"
end
Factory.define :lyric do |p|
  p.title "Title"
  p.text_song "text_song"
  p.track {Factory(:track)}
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
Factory.sequence :name do |n|
  "Rusya#{n}"
end
Factory.sequence :password do |n|
  "123#{n}"
end
Factory.sequence :password_confirmation do |n|
  "123#{n}"
end
Factory.define :user do |p|
  p.name {Factory.next(:name)}
  p.password {Factory.next(:password)}
  p.password_confirmation {Factory.next(:password_confirmation)}
end
Factory.define :track do |p|
  p.price "3"
  p.time "2"
  p.title_full_file "bla"
  p.title_cut_file "blu"
  p.full_version_audio_id "1"
  p.preview_id "2"
end
Factory.define :order do |p|
  p.email "rusya@mail.ru"
end
Factory.define :uploaded_file do |p|
  p.music_file_name "music_name"
  p.music_file_size "123"
  p.music_content_type "audio/mpeg"
  p.music_updated_at "2009-12-23 17:59:48"
  p.track_id "1"
end