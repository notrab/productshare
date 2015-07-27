class User < ActiveRecord::Base
  validates :uid, :username, uniqueness: true
  validates :uid, :username, :name, presence: true

  def to_param
    username
  end

  def first_name
    name.split(" ").first
  end
end
