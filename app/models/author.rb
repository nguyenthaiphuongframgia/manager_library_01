class Author < ApplicationRecord
  has_many :book_items, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name},
    uniqueness: true
  validates :description, presence: true,
    length: {maximum: Settings.maximum.description}

  def self.to_xls
    CSV.generate do |csv|
      csv << [I18n.t("index"), I18n.t("author_name"), I18n.t("description"),
        I18n.t("quantity")]
      all.each do |author|
        csv << [author.id, author.name, author.description]
      end
    end
  end
end
