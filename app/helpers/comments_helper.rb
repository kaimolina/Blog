module CommentsHelper
  def list_comments(comment)
      " <div>
      <table>
        <tr>
          <td>From:</td>
          <td>#{ comment.email}</td>
        </tr>
        <br />
        <tr>
          <td colspan='2'>#{ comment.body}</td>
        </tr>
      </table>
    </div>"
  end
end
