require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
=begin  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, :comment => { }
    end

    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should show comment" do
    get :show, :id => comments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => comments(:one).to_param
    assert_response :success
  end

  test "should update comment" do
    put :update, :id => comments(:one).to_param, :comment => { }
    assert_redirected_to comment_path(assigns(:comment))
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, :id => comments(:one).to_param
    end

    assert_redirected_to comments_path
=end
	def setup
		@author = authors(:one)
		@author2 = authors(:two)
		@article = articles(:one)
		@comment = comments(:one)
		@controller = CommentsController.new
	end
	
	test "author should be able to delete comments on owned articles" do
		@article.author = @author
		@article.save
		@article.comments << @comment
		assert_difference '@article.comments(true).count', -1 do
			delete :destroy, :id => @comment.to_param, :author_id => @author.to_param
		end
	end
	
	test "author should not be able to delete comments on not owned articles" do
		@article.author = @author
		@article.save
		@article.comments << @comment
		assert_no_difference '@article.comments.count' do
			delete :destroy, :id => @comment.to_param, :author_id => @author2.to_param
		end
	end


end
