User.create!([
  {email: "mallory@defnotspies.info", password: "foooobar", password_confirmation: "foooobar", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-19 18:21:07", last_sign_in_at: "2015-11-19 18:21:07", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "mallory.jpg"},
  {email: "pam@spam.org", password: "foooobar", password_confirmation: "foooobar", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-11-23 02:46:11", last_sign_in_at: "2015-11-19 18:24:27", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "pam.jpg"},
  {email: "lana@defnotspies.net", password: "foooobar", password_confirmation: "foooobar", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2016-01-12 02:43:55", last_sign_in_at: "2015-11-19 18:52:51", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "Lana_kane.jpg"},
  {email: "marsh@yahoo.com", password: "foooobar", password_confirmation: "foooobar", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-01-12 02:44:33", last_sign_in_at: "2016-01-12 02:42:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: nil},
  {email: "archer@defnotspies.com", password: "foooobar", password_confirmation: "foooobar", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2016-02-22 21:42:25", last_sign_in_at: "2016-01-12 02:43:09", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "archer.jpg"}
  {email: "cyril@defnotspies.com", password: "foooobar", password_confirmation: "foooobar", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: "2016-02-22 21:42:25", last_sign_in_at: "2016-01-12 02:43:09", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: nil}

])
Friendship.create!([
  {user_id: 2, friend_id: 1, accepted: true},
  {user_id: 3, friend_id: 1, accepted: true},
  {user_id: 3, friend_id: 2, accepted: true},
  {user_id: 4, friend_id: 3, accepted: true},
  {user_id: 4, friend_id: 1, accepted: true},
  {user_id: 4, friend_id: 2, accepted: true},
  {user_id: 6, friend_id: 3, accepted: true},
  {user_id: 6, friend_id: 4, accepted: true},
  {user_id: 6, friend_id: 5, accepted: true},
  {user_id: 6, friend_id: 2, accepted: true}
])
Post.create!([
  {title: nil, body: "WHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT?!?!", user_id: 2, picture: nil},
  {title: nil, body: "heyheyheyheyheyheyhey", user_id: 2, picture: nil},
  {title: nil, body: "Where's my martini?!\r\n", user_id: 3, picture: nil},
  {title: nil, body: "NOMNOMNOMNOMNOM", user_id: 4, picture: "pam_eating_bearclaw.png"},
  {title: nil, body: "does this thing have live ammo?", user_id: 1, picture: nil},
  {title: nil, body: "I think you're ready for an interview", user_id: 6, picture: nil}
])
Comment.create!([
  {user_id: 2, commentable_id: 4, commentable_type: "Post", body: "good god pam"},
  {user_id: 1, commentable_id: 4, commentable_type: "Post", body: "seriously Pam! "},
  {user_id: 2, commentable_id: 1, commentable_type: "Post", body: "wow.... just wow..."},
  {user_id: 2, commentable_id: 1, commentable_type: "Post", body: "finally, a social network for cartoon characters!"}
])
Like.create!([
  {likeable_id: 1, likeable_type: "Post", user_id: 2},
  {likeable_id: 2, likeable_type: "Post", user_id: 2},
  {likeable_id: 1, likeable_type: "Comment", user_id: 1},
  {likeable_id: 3, likeable_type: "Comment", user_id: 2}
])

