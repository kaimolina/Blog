require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  setup do
	@comment = Comment.create(:body => "ecc", :email =>"kaimolina2@gmail.com")
	@comment_without_email = Comment.new(:body =>"exist code camper")
	@comment_without_body = Comment.new(:email =>"kaimolina@gmail.com")
	end

  # Replace this with your real tests.
	teardown do
  end
  
	test "Should belong to Article" do
		assert_equal true, @comment.respond_to?(:article)
	end
	
  test "Should validate the presence of body" do
		assert_equal false, @comment_without_body.save
	end	
  
  test "Should validate the presence of email" do
		assert_equal false, @author_without_email.save
	end
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
