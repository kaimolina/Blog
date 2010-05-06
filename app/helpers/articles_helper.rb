module ArticlesHelper
  def show_latest(article)
    unless article.nil?
      "<h2 class='blog-title'>#{@article.title}</h2>
       <div class='blog-author'>Posted by: #{@article.author.full_name}</div>
       <div class='blog-body'>#{@article.body}</div>
       <br />
       #{link_to 'Print this article.', print_article_path(@article)}"
    else
      "<br /><h2 class='blog-title' >NO ARTICLES YET</h2>"
    end
  end
end
