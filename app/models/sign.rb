class Sign < ActiveRecord::Base
  belongs_to :user
  belongs_to :good
  validates :user_id, presence: true
  validates :good_id, presence: true
end
