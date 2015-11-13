class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  belongs_to :user

  validates :user, presence: true
  validates :likeable, presence: true
  validates_uniqueness_of :user_id, scope: [:likeable_id, :likeable_type]
end
