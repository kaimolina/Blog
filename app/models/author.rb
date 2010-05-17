class Author < ActiveRecord::Base
  has_many :articles
  has_many :likers
  has_many :likes, :source => :article, :through => :likers
  validates_presence_of [:first_name, :last_name], :message => "First Name and Last Name required."
  validates_uniqueness_of [:email, :login]
  acts_as_authentic {|c| c.login_field = :login}
  def full_name
    "#{last_name}, #{first_name}"
  end
end
