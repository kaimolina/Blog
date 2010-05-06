class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of [:first_name, :last_name], :message => "First Name and Last Name required."
  validates_uniqueness_of [:email, :login]

  acts_as_authentic
  def full_name
    "#{last_name}, #{first_name}"
  end
end
