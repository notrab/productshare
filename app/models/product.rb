class Product < ActiveRecord::Base
  belongs_to :user

  acts_as_votable

  validates :name, :tagline, :url, presence: true
  validates :url, uniqueness: true

  def user
    super || NullUser.new
  end

  def to_date
    created_at.to_date
  end
end
