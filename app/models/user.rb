class User < ActiveRecord::Base
  belongs_to :budget
  has_many :sessions
  has_secure_password validations: false

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

end
