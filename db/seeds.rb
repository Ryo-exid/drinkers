# ユーザサンプル
4.times do |n|
  User.create!(
    name: "user#{n + 1}",
    postcode: 111111,
    address_street: "1-1-1",
    address_building: "building#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: 111111
  )
end

# 投稿サンプル
3.times do |n|
  n = n + 1
  Post = post.new(
    user_id: 1,
    title: "珍しいリキュール#{n}",
    caption: "Godivaのリキュールを試してみました#{n}",
    location: "渋谷",
  )
  File.open("./app/assets/images/alcohol1.jpg") do |file|
    post.image = file
  end
  post.post_image_id = post.image.id
  post.save
end

4.times do |n|
  n = n + 1
  Post = post.new(
    user_id: 2,
    title: "最高級焼酎飲みました#{n}",
    caption: "魔王！！絶品です！！#{n}",
    location: "新宿",
  )
  File.open("./app/assets/images/alcohol2.jpg") do |file|
    post.image = file
  end
  post.post_image_id = post.image.id
  post.save
end

3.times do |n|
  n = n + 1
  Post = post.new(
    user_id: 3,
    title: "十四代#{n}",
    caption: "一杯1500円くらいしますがとっても美味しいです。#{n}",
    location: "",
  )
  File.open("./app/assets/images/alcohol3.jpg") do |file|
    post.image = file
  end
  post.post_image_id = post.image.id
  post.save
end

2.times do |n|
  n = n + 1
  Post = post.new(
    user_id: 4,
    title: "知る人ぞ知る焼酎！#{n}",
    caption: "なんと焼き芋焼酎！焼酎好きの知人から進められたのですが香ばしくて絶品です！#{n}",
    location: "溜池山王",
  )
  File.open("./app/assets/images/alcohol4.jpg") do |file|
    post.image = file
  end
  post.post_image_id = post.image.id
  post.save
end
