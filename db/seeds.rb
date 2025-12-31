prefectures_data = [
  { name: "北海道", capital: "札幌市" },
  { name: "青森県", capital: "青森市" },
  { name: "岩手県", capital: "盛岡市" },
  { name: "宮城県", capital: "仙台市" },
  { name: "秋田県", capital: "秋田市" },
  { name: "山形県", capital: "山形市" },
  { name: "福島県", capital: "福島市" },
  { name: "茨城県", capital: "水戸市" },
  { name: "栃木県", capital: "宇都宮市" },
  { name: "群馬県", capital: "前橋市" },
  { name: "埼玉県", capital: "さいたま市" },
  { name: "千葉県", capital: "千葉市" },
  { name: "東京都", capital: "新宿区" },
  { name: "神奈川県", capital: "横浜市" },
  { name: "新潟県", capital: "新潟市" },
  { name: "富山県", capital: "富山市" },
  { name: "石川県", capital: "金沢市" },
  { name: "福井県", capital: "福井市" },
  { name: "山梨県", capital: "甲府市" },
  { name: "長野県", capital: "長野市" },
  { name: "岐阜県", capital: "岐阜市" },
  { name: "静岡県", capital: "静岡市" },
  { name: "愛知県", capital: "名古屋市" },
  { name: "三重県", capital: "津市" },
  { name: "滋賀県", capital: "大津市" },
  { name: "京都府", capital: "京都市" },
  { name: "大阪府", capital: "大阪市" },
  { name: "兵庫県", capital: "神戸市" },
  { name: "奈良県", capital: "奈良市" },
  { name: "和歌山県", capital: "和歌山市" },
  { name: "鳥取県", capital: "鳥取市" },
  { name: "島根県", capital: "松江市" },
  { name: "岡山県", capital: "岡山市" },
  { name: "広島県", capital: "広島市" },
  { name: "山口県", capital: "山口市" },
  { name: "徳島県", capital: "徳島市" },
  { name: "香川県", capital: "高松市" },
  { name: "愛媛県", capital: "松山市" },
  { name: "高知県", capital: "高知市" },
  { name: "福岡県", capital: "福岡市" },
  { name: "佐賀県", capital: "佐賀市" },
  { name: "長崎県", capital: "長崎市" },
  { name: "熊本県", capital: "熊本市" },
  { name: "大分県", capital: "大分市" },
  { name: "宮崎県", capital: "宮崎市" },
  { name: "鹿児島県", capital: "鹿児島市" },
  { name: "沖縄県", capital: "那覇市" }
]

prefectures_data.each do |pref_data|
  prefecture = Prefecture.find_or_create_by!(name: pref_data[:name])
  Municipality.find_or_create_by!(prefecture: prefecture, name: pref_data[:capital])
end

school_years_data = [
  "学部1年",
  "学部2年",
  "学部3年",
  "学部4年",
  "修士1年",
  "修士2年",
  "博士1年",
  "博士2年",
  "博士3年"
]

school_years_data.each do |year_name|
  SchoolYear.find_or_create_by!(name: year_name)
end

field_of_studies_data = [
  "情報工学",
  "電気工学",
  "機械工学",
  "化学",
  "物理学",
  "数学",
  "生物学",
  "経済学",
  "経営学",
  "法学",
  "文学",
  "その他"
]

field_of_studies_data.each do |field_name|
  FieldOfStudy.find_or_create_by!(name: field_name)
end

school_year_bachelor_3 = SchoolYear.find_by!(name: "学部3年")
school_year_bachelor_4 = SchoolYear.find_by!(name: "学部4年")
field_computer_science = FieldOfStudy.find_by!(name: "情報工学")
field_economics = FieldOfStudy.find_by!(name: "経済学")

intern1 = Intern.find_or_create_by!(firebase_uid: "wz3NOyIXlHU3IVbtioRtv2zvYjc2") do |i|
  i.field_of_study = field_computer_science
  i.school_year = school_year_bachelor_3
  i.name = "山田太郎"
  i.email = "yamada@example.com"
  i.school_name = "東京大学"
  i.major_name = "情報工学科"
end

intern2 = Intern.find_or_create_by!(firebase_uid: "test-intern-2") do |i|
  i.field_of_study = field_economics
  i.school_year = school_year_bachelor_4
  i.name = "佐藤次郎"
  i.email = "sato@example.com"
  i.school_name = "早稲田大学"
  i.major_name = "経済学部"
end

tokyo = Prefecture.find_by!(name: "東京都")
tokyo_capital = Municipality.find_by!(prefecture: tokyo, name: "新宿区")

company1 = Company.find_or_create_by!(firebase_uid: "test-company-1") do |c|
  c.name = "株式会社テクノロジー"
  c.email = "info@technology.com"
  c.prefecture = tokyo
  c.municipality = tokyo_capital
  c.address_line = "1-1-1 テックビル"
end

company2 = Company.find_or_create_by!(firebase_uid: "test-company-2") do |c|
  c.name = "株式会社イノベーション"
  c.email = "info@innovation.com"
  c.prefecture = tokyo
  c.municipality = tokyo_capital
  c.address_line = "2-2-2 イノベーションタワー"
end

company3 = Company.find_or_create_by!(firebase_uid: "gpyvlfrSX3fuIPXsVHL1zIC4jsE2") do |c|
  c.name = "株式会社テスト"
  c.email = "test1@gmail.com"
  c.prefecture = tokyo
  c.municipality = tokyo_capital
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
