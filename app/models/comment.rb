class Comment < ActiveRecord::Base
  belongs_to :article
	validates_presence_of [:email, :body], :message => "required!"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "Format Invalid!"


	def delete_by_author(author)
		case author
			when Author
				author
			when String, Integer
				author = Author.find(author)
		else
			raise "Invalid Author Parameter"	
		end
		delete if article(true).author(true) == author #or article(true).author(true).id == author
	end
end
