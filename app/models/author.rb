class Author < ActiveRecord::Base
  has_many :articles
	validates_presence_of [:first_name, :last_name], :message => "First Name and Last Name required."
  def full_name
    "#{last_name}, #{first_name}"
  end
end
