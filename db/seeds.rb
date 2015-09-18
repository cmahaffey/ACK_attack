# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([{username: 'Ron_Von_Crosler', password: 'hello', email: 'ron@ron.com', pic_url: 'https://www.codeforamerica.org/media/images/people/ryan-closner.jpg', bio: 'I am Lord of the Web', location: 'New York, NY'},
   {username: 'teddy.R', password: 'hello', email: 'teddy@teddy.com', pic_url: 'https://pbs.twimg.com/profile_images/2993216342/59af79ad11eb3241d9d495b007b62a57.jpeg', bio: "Believe you can and you're halfway there.", location: 'Washington, D.C.'},
   {username: 'Diane', password: 'hello', email: 'diane@diane.com', pic_url: 'https://s-media-cache-ak0.pinimg.com/736x/14/0a/b6/140ab64468f4f35fd74673c5f07e143d.jpg', bio: "Just have fun, smile, and keep putting on lipstick", location: 'Hollywood, CA'},
   {username: 'JackJ', password: 'hello', email: 'jack@johnson.com', pic_url: 'http://img1.coastalliving.timeinc.net/sites/default/files/styles/500xvariable/public/image/2013/12/currents/1213-christmas-trees-jack-m.jpg?itok=U7XrM2r1', bio: "Makin Banana Pancakes, all day, every day.", location: 'Hawaii, where else?'},
   {username: '_Burt', password: 'hello', email: 'turd@ferguson.com', pic_url: 'https://www.lifesizestandups.com.au/media/catalog/product/cache/2/image/650x650/9df78eab33525d08d6e5fb8d27136e95/b/u/burt-reynolds-053a.jpg', bio: "Marriage is about the most expensive way for the average man to get laundry done.", location: 'New York, NY'},
   {username: 'stevieB123', password: 'hello', email: 'steve@steve.com', pic_url: 'http://static.tumblr.com/3e16290961eee1fa2b661b23effc3576/fkrdwxg/3vemtcjab/tumblr_static_600full-steve-buscemi.jpg', bio: "You know who I am.", location: 'Brooklyn, NY'},
   {username: 'beastmode', password: 'hello', email: 'marshawn@seahawks.com', pic_url: 'http://static.nfl.com/static/content/public/static/img/fantasy/transparent/200x200/LYN442976.png', bio: "I'm just here so I don't get fined.", location: 'Oakland, CA/Seattle, WA'}])
