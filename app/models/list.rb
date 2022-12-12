class List < ApplicationRecord
  has_many :items
  belongs_to :user
  belongs_to :group, optional: true
end
