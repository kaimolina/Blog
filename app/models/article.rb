class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
	validates_presence_of [:title, :body, :author], :message => "is required."
  def self.statuses
    ["Draft","Posted"]
  end
  validates_inclusion_of :status, :in => Article.statuses
  def self.latest
    Article.find_by_status("Posted", :order => "date_posted DESC")
  end
  def self.sidebar
    Article.find_all_by_status("Posted", :order => "date_posted")
  end
  protected
end