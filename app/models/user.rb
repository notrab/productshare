class User < ActiveRecord::Base
  has_many :products

  acts_as_voter

  validates :uid, :username, uniqueness: true
  validates :uid, :username, :name, presence: true

  def to_param
    username
  end

  def first_name
    name.split(" ").first
  end
end
