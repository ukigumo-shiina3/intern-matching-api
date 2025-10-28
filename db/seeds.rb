intern1 = Intern.find_or_create_by!(firebase_uid: "wz3NOyIXlHU3IVbtioRtv2zvYjc2") do |i|
  i.field_of_study_id = "1"
  i.school_year_id = "1"
  i.name = "山田太郎"
  i.email = "yamada@example.com"
  i.school_name = "東京大学"
  i.major_name = "情報工学科"
end

intern2 = Intern.find_or_create_by!(firebase_uid: "test-intern-2") do |i|
  i.field_of_study_id = "2"
  i.school_year_id = "2"
  i.name = "佐藤次郎"
  i.email = "sato@example.com"
  i.school_name = "早稲田大学"
  i.major_name = "経済学部"
end

company1 = Company.find_or_create_by!(firebase_uid: "test-company-1") do |c|
  c.name = "株式会社テクノロジー"
  c.email = "info@technology.com"
  c.prefecture = "東京都"
  c.municipality = "渋谷区"
  c.address_line = "1-1-1 テックビル"
end

company2 = Company.find_or_create_by!(firebase_uid: "test-company-2") do |c|
  c.name = "株式会社イノベーション"
  c.email = "info@innovation.com"
  c.prefecture = "東京都"
  c.municipality = "港区"
  c.address_line = "2-2-2 イノベーションタワー"
end

# 実際にログインしている会社用（test1@gmail.com）
company3 = Company.find_or_create_by!(firebase_uid: "gpyvlfrSX3fuIPXsVHL1zIC4jsE2") do |c|
  c.name = "株式会社テスト"
  c.email = "test1@gmail.com"
  c.prefecture = "東京都"
  c.municipality = "中央区"
  c.address_line = "日本橋1-1-1"
end

room1 = Room.find_or_create_by!(intern: intern1, company: company1)
room2 = Room.find_or_create_by!(intern: intern1, company: company2)
room3 = Room.find_or_create_by!(intern: intern2, company: company1)
room4 = Room.find_or_create_by!(intern: intern2, company: company2)
room5 = Room.find_or_create_by!(intern: intern1, company: company3)
room6 = Room.find_or_create_by!(intern: intern2, company: company3)

unless Message.exists?(room: room1)
  Message.create!([
    {
      room: room1,
      company: company1,
      intern: nil,
      content: "こんにちは！弊社のインターンシップにご応募いただきありがとうございます。",
      created_at: 2.days.ago
    },
    {
      room: room1,
      intern: intern1,
      company: nil,
      content: "こんにちは！よろしくお願いいたします。",
      created_at: 2.days.ago + 1.hour
    },
    {
      room: room1,
      company: company1,
      intern: nil,
      content: "面接の日程についてですが、来週の火曜日か木曜日はいかがでしょうか？",
      created_at: 1.day.ago
    },
    {
      room: room1,
      intern: intern1,
      company: nil,
      content: "木曜日でお願いできますでしょうか。",
      created_at: 1.day.ago + 2.hours
    },
    {
      room: room1,
      company: company1,
      intern: nil,
      content: "承知しました！木曜日の14時からでいかがでしょうか？",
      created_at: 12.hours.ago
    }
  ])
end

unless Message.exists?(room: room2)
  Message.create!([
    {
      room: room2,
      company: company2,
      intern: nil,
      content: "ご応募ありがとうございます。まずは簡単な面談をさせていただきたいと思います。",
      created_at: 1.day.ago
    },
    {
      room: room2,
      intern: intern1,
      company: nil,
      content: "ありがとうございます。いつ頃がよろしいでしょうか？",
      created_at: 6.hours.ago
    }
  ])
end

unless Message.exists?(room: room3)
  Message.create!([
    {
      room: room3,
      intern: intern2,
      company: nil,
      content: "はじめまして。貴社のインターンシップに興味があります。",
      created_at: 3.days.ago
    },
    {
      room: room3,
      company: company1,
      intern: nil,
      content: "はじめまして！ご興味いただきありがとうございます。詳細をお送りしますね。",
      created_at: 3.days.ago + 30.minutes
    },
    {
      room: room3,
      intern: intern2,
      company: nil,
      content: "ありがとうございます！楽しみにしています。",
      created_at: 2.days.ago
    }
  ])
end

unless Message.exists?(room: room4)
  Message.create!([
    {
      room: room4,
      company: company2,
      intern: nil,
      content: "書類選考に合格しました。おめでとうございます！",
      created_at: 1.day.ago
    },
    {
      room: room4,
      intern: intern2,
      company: nil,
      content: "ありがとうございます！次のステップについて教えていただけますか？",
      created_at: 12.hours.ago
    }
  ])
end

unless Message.exists?(room: room5)
  Message.create!([
    {
      room: room5,
      company: company3,
      intern: nil,
      content: "はじめまして！弊社のインターンシップについてご案内させていただきます。",
      created_at: 1.day.ago
    },
    {
      room: room5,
      intern: intern1,
      company: nil,
      content: "はじめまして。よろしくお願いします！",
      created_at: 12.hours.ago
    }
  ])
end

unless Message.exists?(room: room6)
  Message.create!([
    {
      room: room6,
      intern: intern2,
      company: nil,
      content: "こんにちは。インターンシップに応募させていただきます。",
      created_at: 2.days.ago
    },
    {
      room: room6,
      company: company3,
      intern: nil,
      content: "ご応募ありがとうございます！まずは面談をさせていただきたいと思います。",
      created_at: 1.day.ago
    }
  ])
end
