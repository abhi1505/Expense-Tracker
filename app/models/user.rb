class User < ApplicationRecord
has_many:expenses
  before_save {self.email = email.downcase }
    validates :name, presence: true, length: { minimum: 3, maximum: 70 }
	validates :income, presence: true
	 VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: { maximum: 105 },
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
end
