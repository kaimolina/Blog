module CommentsHelper
  def list_comments(z)
    "<table>
         <tr>
           <td>From:</td>
           <td>#{ z.email}</td>
         </tr>
         <br />
         
         <tr>
           <td colspan='2'><div id='comment-#{z.id}'>#{ z.body} </div></td>
     
         </tr>
        
       </table>
       #{link_to 'Hide', "javascript:display('hide', #{z.id})", :id => "link-#{z.id}"}"
  end
end
