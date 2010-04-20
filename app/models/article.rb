class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
	validates_presence_of [:title, :body], :message => "Title and Body required."

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

  def before_save
    date_posted = DateTime.now if status.eql?("Posted")
  end
end