class Category < ActiveRecord::Base
  has_many :goods, dependent: :destroy
  validates :title, presence: true
end
