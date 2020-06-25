class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups

  def grouped_by?(user)
    user_groups.where(user_id: user.id).exists?
  end
end
