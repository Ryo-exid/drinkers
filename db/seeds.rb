# エンドユーザ(本番用)
User.create!(
  name: "Ryo",
  birth_date: "1996-1-1",
  email: "Ryo@ryo.com",
  postcode: 1510061,
  address_city: "渋谷区初台",
  address_street: "1-4-7",
  address_building: "AAA",
  password: "111111",
  password_confirmation: "111111"
)

# 管理者権限を持たせたユーザ（管理人）
User.create!(
  name: ENV["ADMIN_NAME"],
  birth_date: "1996-10-1",
  email: ENV["ADMIN_EMAIL"],
  postcode: 3333333,
  address_city: "埼玉県川口市",
  address_street: "1-5-9",
  address_building: "drinker",
  password: ENV["ADMIN_PASSWORD"],
  password_confirmation: ENV["ADMIN_PASSWORD"],
  admin: true
)

# 管理者権限を持たせたユーザ（サブ）
User.create!(
  name: ENV["ADMIN_SUB_NAME"],
  birth_date: "1996-10-1",
  email: ENV["ADMIN_SUB_EMAIL"],
  postcode: 3333333,
  address_city: "埼玉県川口市",
  address_street: "1-5-9",
  address_building: "drinker",
  password: ENV["ADMIN_SUB_PASSWORD"],
  password_confirmation: ENV["ADMIN_SUB_PASSWORD"],
  admin: true
)

# 投稿サンプル（本番用）
Post.create!(
  user_id: 1,
  title: "やっぱりビール！！",
  post_image: File.open("./app/assets/images/alcohol5.jpg"),
  caption: "居酒屋限定のKIRINプレミアムビール！こんなにフルーティーで美味しいビール初めて飲みました！最っっ高です！！！",
  rate: 5,
  location: "赤坂",
)