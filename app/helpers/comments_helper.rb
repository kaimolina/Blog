module CommentsHelper
  def list_comments(z)
    "<div>
       <table>
         <tr>
           <td>From:</td>
           <td>#{ z.email}</td>
         </tr>
         <br />
         <tr>
           <td colspan='2'>#{ z.body}</td>
         </tr>
       </table>
     </div>"
  end
end
