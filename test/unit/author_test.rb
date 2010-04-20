require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  
  setup do
	@author = Author.create(:last_name => "Tamad", :first_name =>"Juan")
	@author_without_lastname = Author.new(:first_name =>"Juan")
	@author_without_firstname = Author.new(:last_name =>"Tamad")
	end

  # Replace this with your real tests.
	teardown do
  end
  
	test "Should have many articles" do
		assert_equal Array, @author.articles.class
	end
	
  test "Should validate the presence of last_name" do
		assert_equal false, @author_without_lastname.save
	end	
  
  test "Should validate the presence of first_name" do
		assert_equal false, @author_without_firstname.save
	end

  test "the truth" do
    assert true
  end
end
