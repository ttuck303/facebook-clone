User.create!([
  {email: "mallory@isis.info", encrypted_password: "$2a$10$Ly4qdno0e/bfJYAUqvQRKOwu9q1IqDVovZ.qOLdB71qmnGrNEX.SG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-19 18:21:07", last_sign_in_at: "2015-11-19 18:21:07", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "mallory.jpg"},
  {email: "pam@spam.org", encrypted_password: "$2a$10$CCi3dHXSoqswQhGtTIP1DuwKw3rL1yrTyI5zKenI6OWEZOlBr12M6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-11-23 02:46:11", last_sign_in_at: "2015-11-19 18:24:27", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "pam.jpg"},
  {email: "t.tuck303@gmail.com", encrypted_password: "$2a$10$TBUvJ/vcUem/Up.z0aUuYe4786RDSWpcUrlxQnfQnCPRWOqxonOAi", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-12-02 15:19:04", last_sign_in_at: "2015-12-02 15:19:04", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: "facebook", uid: "10153264205838424", picture: nil},
  {email: "lana@isis.net", encrypted_password: "$2a$10$iVle0Y4.XXxnaI3a2Vgx4ezeG1iGcTtH7gbIAVmwk1e6v0myr38C.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2016-01-12 02:43:55", last_sign_in_at: "2015-11-19 18:52:51", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "Lana_kane.jpg"},
  {email: "marsh@yahoo.com", encrypted_password: "$2a$10$MMZPvhsrLD3jzs7gt2EjvOUuscPagcnUJV78GQJzGrfhRx4SzM9Ee", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-01-12 02:44:33", last_sign_in_at: "2016-01-12 02:42:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: nil},
  {email: "archer@isis.com", encrypted_password: "$2a$10$Tq1ZrBxsNrsDaGcsYEiu5O4vwyxbxrKdy7v1MIaSOVT74FM1LLRA2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2016-02-22 21:42:25", last_sign_in_at: "2016-01-12 02:43:09", current_sign_in_ip: "::1", last_sign_in_ip: "::1", provider: nil, uid: nil, picture: "archer.jpg"}
])
Comment.create!([
  {user_id: 2, commentable_id: 4, commentable_type: "Post", body: "good god pam"},
  {user_id: 1, commentable_id: 4, commentable_type: "Post", body: "seriously Pam! "},
  {user_id: 2, commentable_id: 1, commentable_type: "Post", body: "asdfasdf"},
  {user_id: 2, commentable_id: 1, commentable_type: "Post", body: "asdfasdf"}
])
Friendship.create!([
  {user_id: 2, friend_id: 1, accepted: true},
  {user_id: 3, friend_id: 1, accepted: true},
  {user_id: 3, friend_id: 2, accepted: true},
  {user_id: 4, friend_id: 3, accepted: false},
  {user_id: 4, friend_id: 1, accepted: true},
  {user_id: 4, friend_id: 2, accepted: true},
  {user_id: 6, friend_id: 3, accepted: false},
  {user_id: 6, friend_id: 4, accepted: false},
  {user_id: 6, friend_id: 5, accepted: false},
  {user_id: 6, friend_id: 2, accepted: true}
])
Like.create!([
  {likeable_id: 1, likeable_type: "Post", user_id: 2},
  {likeable_id: 2, likeable_type: "Post", user_id: 2},
  {likeable_id: 1, likeable_type: "Comment", user_id: 1},
  {likeable_id: 3, likeable_type: "Comment", user_id: 2}
])
Post.create!([
  {title: nil, body: "WHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT?!?!", user_id: 2, picture: nil},
  {title: nil, body: "laks;djfaslkjd", user_id: 2, picture: nil},
  {title: nil, body: "Where's my martini?!\r\n", user_id: 3, picture: nil},
  {title: nil, body: "NOMNOMNOMNOMNOM", user_id: 4, picture: "pam_eating_bearclaw.png"},
  {title: nil, body: "aks;ldjfalks;djf", user_id: 1, picture: nil},
  {title: nil, body: "I think you're ready for an interview trav", user_id: 6, picture: nil}
])
