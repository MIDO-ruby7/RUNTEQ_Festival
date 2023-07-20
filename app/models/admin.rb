class Admin < ApplicationRecord
  def self.import(file, category_id)
    updatable_attributes = ["id", "graduating_class", "name", "app_name", "contact", "app_url", "github_url", "usage_technology", "points_for_effort", "target_users", "pain_point", "remedy", "comment"]

    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      post = Post.find_by(id: row["id"]) || Post.new
      # CSVからデータを取得し、設定する
      post.attributes = row.to_hash.slice(*updatable_attributes)
      post.category_id = category_id
      post.save
    end
  end
end
