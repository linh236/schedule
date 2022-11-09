class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :default_role

  def has_role?(role)
    if self.role == role
      return true
    else 
      return false
    end
  end

  private

  def default_role
    self.update(role: 'user')
  end

end
