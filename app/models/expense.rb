class Expense < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :amount, presence: true
end
