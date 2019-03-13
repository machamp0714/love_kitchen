# user
User.create!(
    name: "alice",
    email: "alice@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is alice."
)
User.create!(
    name: "bob",
    email: "bob@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is bob."
)
User.create!(
    name: "carol",
    email: "carol@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is carol."
)
User.create!(
    name: "david",
    email: "david@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is david."
)
User.create!(
    name: "elis",
    email: "elis@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is elis."
)
User.create!(
    name: "frank",
    email: "frank@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is frank."
)
User.create!(
    name: "gloria",
    email: "gloria@gmail.com",
    password: "password",
    password_confirmation: "password",
    introduce: "hello! my name is gloria."
)
# articles
user = User.first
5.times do |i|
    user.articles.create!(
        title: "テストタイトル #{i+1}",
        content: "テスト投稿 #{i+1}",
        label1: "ラベル1",
        label2: "ラベル2",
        label3: "ラベル3",
        label4: "ラベル4",
        label5: "ラベル5",
        data1: 1,
        data2: 2,
        data3: 3,
        data4: 4,
        data5: 5
    )
end

second_user = User.find(2)
5.times do |i|
    second_user.articles.create!(
        title: "テストタイトル #{i+1}",
        content: "テスト投稿 #{i+1}",
        label1: "ラベル1",
        label2: "ラベル2",
        label3: "ラベル3",
        label4: "ラベル4",
        label5: "ラベル5",
        data1: 1,
        data2: 2,
        data3: 3,
        data4: 4,
        data5: 5,
        created_at: 1.days.ago
    )
end

third_user = User.find(3)
5.times do |i|
    third_user.articles.create!(
        title: "テストタイトル #{i+1}",
        content: "テスト投稿 #{i+1}",
        label1: "ラベル1",
        label2: "ラベル2",
        label3: "ラベル3",
        label4: "ラベル4",
        label5: "ラベル5",
        data1: 1,
        data2: 2,
        data3: 3,
        data4: 4,
        data5: 5,
        created_at: 1.weeks.ago
    )
end

fourth_user = User.find(4)
5.times do |i|
    fourth_user.articles.create!(
        title: "テストタイトル #{i+1}",
        content: "テスト投稿 #{i+1}",
        label1: "ラベル1",
        label2: "ラベル2",
        label3: "ラベル3",
        label4: "ラベル4",
        label5: "ラベル5",
        data1: 1,
        data2: 2,
        data3: 3,
        data4: 4,
        data5: 5,
        created_at: 1.years.ago
    )
end