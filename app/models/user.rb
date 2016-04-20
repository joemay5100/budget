class User < ActiveRecord::Base
  belongs_to :budget
  has_many :sessions
  has_secure_password validations: false

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: { scope: :is_deleted }, unless: "is_deleted"
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true


  def self.signup(user_params)
    user = User.new(user_params) 
    user.is_deleted = false
    
    new_budget = Budget.new
    new_budget.name = "test budget"
    user.budget = new_budget
    return user, user.save
  end

  def self.add_to_budget(user_params, budget)
    user = User.new(user_params) 
    byebug
    user.is_deleted = false
    
    user.budget = budget
    user.save
  end

  def self.delete(user)
    user.is_deleted = true
    user.save(validate: false)
  end


end
