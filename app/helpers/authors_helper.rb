module AuthorsHelper
  def author_pane(author)
  " <div>
      <table>
        <tr>
          <td>Name:</td>
          <td>#{ author.full_name}</td>
        </tr>
        <tr>
          <td>Birthday:</td/>
          <td>#{ author.birthday}</td>
        </tr>
        <tr>
          <td>Articles:</td/>
        </tr>
      </table>
    </div>"
  end
end

