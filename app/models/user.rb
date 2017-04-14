require 'bcrypt'

class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(email, password)
    user = User.find_by(email: email)
    user.password == password
  end

end
