class Good < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :signs, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
end
