module ArticlesHelper
  def show_latest(article)
    unless article.nil?
      "<h2 class='blog-title'>#{@article.title}</h2>
       <div class='blog-author'>Posted by: #{@article.author.full_name}</div>
       <div class='blog-body'>#{@article.body}</div>
       <br />"
    else
      "<br /><h2 class='blog-title' >NO ARTICLES YET</h2>"
    end
  end
  def show_likes(x)
    unless x.nil?
      #i = x.author_id
      if x.like_status == 1 then
      "<div>#{x.author_name} likes this</div>
       <br />"
      end
    end
  end
  def retrieve_article_addons(article, status)
    author = current_author
    str = String.new
    return link_to 'Print', print_article_path(article) if author.nil?
    begin
      url_options = { :controller => :likers ,
                      :action     => :update ,
                      :article_id => article.id ,
                      :liker		  => { :author_name => author.full_name,
                      								 :article_id => article.id ,
                                       :author_id => author.id ,
                                       :like_status => 0 , }}

      liker = article.likers.find(:first, :conditions => "author_id = #{author.id}")
      status ||= liker.like_status
      url_options[:id] = liker.id
      case status
        when 1, '1'
          str << "#{link_to_remote 'Unlike', :update => 'addons' ,
                                             :method => :put ,
                                             :url => url_options } · "
        when -1, '-1'
          str << "#{link_to_remote 'Unhate', :update => 'addons' ,
                                             :method => :put ,
                                             :url => url_options } · "
      else
        url_options[:liker][:like_status] = 1
        str << "#{link_to_remote 'Like', :update => 'addons' ,
                                         :method => :put ,
                                         :url => url_options } · "

        url_options[:liker][:like_status] = -1
        str << "#{link_to_remote 'Hate', :update => 'addons' ,
                                         :method => :put ,
                                         :url => url_options } · "
      end
    rescue
      url_options[:action] = :create

      url_options[:liker][:like_status] = 1
      str << "#{link_to_remote 'Like', :update => 'addons' ,
                                       :method => :post ,
                                       :url => url_options } · "

      url_options[:liker][:like_status] = -1
      str << "#{link_to_remote 'Hate', :update => 'addons' ,
                                       :method => :post ,
                                       :url => url_options } · "
    end
    str << "#{link_to 'Print', print_article_path(article)}"
    return str
  end
end
