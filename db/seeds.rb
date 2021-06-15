3.times do |n|
  User.create!(
    name: "ユーザ#{n + 1}",
    birth_date: "1996-1-1",
    email: "test#{n + 1}@test.com",
    postcode: 111111,
    address_city: "台東区",
    address_street: "1-1-1",
    address_building: "111",
    password: "111111"
  )
end

2.times do |n|
  Post.create!(
    user_id: 1,
    title: "焼き芋焼酎#{n + 1}",
    post_image: File.open("./app/assets/images/alcohol4.jpg"),
    caption: "焼酎好きに教えてもらいましたー！香ばしくて美味しい！",
    rate: 4.5,
    location: "渋谷",
  )
end

3.times do |n|
  Post.create!(
    user_id: 2,
    title: "Barで飲んでます#{n + 1}",
    post_image: File.open("./app/assets/images/alcohol6.jpg"),
    caption: "おいしい",
    rate: 3.5,
    location: "新宿",
  )
end

3.times do |n|
  Post.create!(
    user_id: 1,
    title: "GODIVA！#{n + 1}",
    post_image: File.open("./app/assets/images/alcohol1.jpg"),
    caption: "GODIVAのリキュール飲んでみました！",
    rate: 3,
    location: "渋谷",
  )
end

4.times do |n|
  Post.create!(
    user_id: 2,
    title: "魔王！！#{n + 1}",
    post_image: File.open("./app/assets/images/alcohol2.jpg"),
    caption: "最高級焼酎！美味い！！！",
    rate: 5,
    location: "新宿",
  )
end

3.times do |n|
  Post.create!(
    user_id: 3,
    title: "十四代！！#{n + 1}",
    post_image: File.open("./app/assets/images/alcohol3.jpg"),
    caption: "1杯で1500円！",
    rate: 4,
    location: "新宿",
  )
end

2.times do |n|
  Post.create!(
    user_id: 1,
    title: "やっぱりビール！！#{n + 1}",
    post_image: File.open("./app/assets/images/alcohol5.jpg"),
    caption: "仕事終わりキンキンに冷えたビール！最高です！！！",
    rate: 5,
    location: "渋谷",
  )
end