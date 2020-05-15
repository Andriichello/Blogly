class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: {minimum: 1}
  validates :email, presence: true, length: {minimum: 1}
  validates :password, presence: true, length: {minimum: 1}

end
