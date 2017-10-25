class Book < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # 画像アップロード対応
  has_attached_file :picture
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
