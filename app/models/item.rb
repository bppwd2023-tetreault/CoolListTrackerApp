class Item < ApplicationRecord
  belongs_to :list
  has_one_attached :picture

  def self.past_due
    where("deadline < ?", DateTime.now)
  end


  def self.approaching_end
    where("deadline < ? & deadline != ?", DateTime.now + 7.days, DateTime.now)
  end
end
