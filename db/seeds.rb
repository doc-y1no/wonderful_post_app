# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# - ユーザーが3つ作られる。
#     - メールアドレス: ''[user001@test.com](mailto:user001@test.com)"
#         - 「001」の部分は、2人目は「002」、3人目は「003」にする。
#     - パスワード: "test1234"

#     大量生産方法
#tag　seed追記
tags = %w(学習 転職活動 豆知識 その他)
tags.each { |tag| Tag.find_or_create_by!(name: tag) }

  3.times do |n|
  n += 1
  user = User.find_or_create_by!(email: "user00#{n}@test.com") do |user|
    user.password = "test123"
  end
# 3.times do |i|
#   i += 1
#   user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
#     _user.password = 'test1234'
  # end

    # - タイトル:　No.1: user001の記事
    # - 本文:　No.1: user001の記事の本文
    # - • 「タイトル」「本文」の `No.1` の部分はデータ作成順の連番になるようにする。

    50.times do |i|
      i += 1
      user.articles.find_or_create_by!(title: "No#{i}:user00#{n}の記事") do |article|
        article.content = "No#{i}:user#{n}の記事の本文"
        article.tag_ids = Tag.all.pluck(:id)
    end
  end
end
    # 50.times do |n|
    # Article.find_or_create_by!(
    # articles = [title: "No#{n+1}:user001の記事", content: "No#{n+1}:user1の記事の本文"]
    # )
    # end
