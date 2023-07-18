class Post < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      post = Post.find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      post.attributes = row.to_hash.slice(*updatable_attributes)
      post.save
    end
  end

  def self.updatable_attributes
    ["id", "graduating_class", "name", "app_name", "contact", "app_url", "github_url", "usage_technology", "points_for_effort", "target_users", "pain_point", "remedy", "comment"]
  end
end
