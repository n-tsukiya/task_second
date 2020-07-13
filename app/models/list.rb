class List < ApplicationRecord
  belongs_to :group
  has_many :tasks, dependent: :destroy
end
