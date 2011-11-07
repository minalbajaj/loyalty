<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ include file="includes/header.jsp" %>

   <script type="text/javascript">
   
   function linkAction(value){
		if(value=="Prepaid")
		{			
			document.getElementById("prepaidlinks").style.display='inline';
			document.getElementById("postpaidlinks").style.display='none';
		}
		else if(value=="Postpaid")
		{
			document.getElementById("postpaidlinks").style.display='inline';
			document.getElementById("prepaidlinks").style.display='none';						
		}
		else if(value=="Gift Card")
		{
			document.getElementById("prepaidlinks").style.display='none';
			document.getElementById("postpaidlinks").style.display='none';
		}
		
	}
    </script>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr >
          <td colspan="5">
           <table width="100%" height="23" border="0" align="left" cellpadding="0" cellspacing="0" style="border:0px solid #000000;">
         <tr><td>&nbsp;</td></tr>
          <tr>
              <td align="left" valign="top">
              <div align="left" class="pageheading">Card Management</div></td>
              <td align="right" valign="top"><div align="right" style="margin-right:10px; color:#990000;">
              
              <table border="0" cellpadding="0" cellspacing="0" align="right">
              
              <tr>
              	<td width="100"  align="right">
	              	<form name="prepaidform" method="post" style="margin:0px 0px 0px 0px;">
	           			<input type="hidden" name="prepaid1" value="Prepaid1"></input>
	           			<input type="button" name="prepaid" class="links" value="Prepaid" style="border:none;background: none;" onClick="return linkAction(value)"/>
	           			&nbsp;&nbsp;|&nbsp;
	           		</form>
              	</td>
              	<td width="113" align="right">
              		<form name="postpaidform" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="postpaid1" value="Postpaid1"></input>
              			<input type="button" name="postpaid" class="links" value="Postpaid" style="border:none;background: none;"  onclick="return linkAction(value)"/>
              			&nbsp;&nbsp;|&nbsp;
              		</form>              		
              	</td>
              	<td width="99" align="right">
              		<form name="giftcardform" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="giftcard1" value="Giftcard1"></input>
              			<input type="button" name="giftcard" class="links" value="Gift Card" style="border:none;background: none;"  onclick="return linkAction(value)"/>
              		</form>
              	</td>
              </tr>
              
              <tr >
              	<td align="right" colspan="3"><div align="right" id="prepaidlinks" style="display: none;">
                   <table border="0" cellpadding="0" cellspacing="0" align="right">
                   <tr><td width="99" align="right">
	              	<form name="activateform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
	           			<input type="hidden" name="activate" value="Activate"></input>
	           			<input type="submit" name="activate" class="links" value="Activate" style="border:none;background: none;" />
	           			&nbsp;&nbsp;|&nbsp;
	           		</form>
              	</td>
              	<td width="114"  align="right">
              		<form name="rechargeform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="recharge" value="Recharge"></input>
              			<input type="submit" name="recharge" class="links" value="Recharge" style="border:none;background: none;" />
              			&nbsp;&nbsp;|&nbsp;
              		</form>              		
              	</td>
              	<td width="99"  align="right">
              		<form name="deactivateform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="deactivate" value="Deactivate"></input>
              			<input type="submit" name="deactivate" class="links" value="Deactivate" style="border:none;background: none;" />
              		</form>
              	</td>
              </tr>
              </table></div></td></tr>
              <tr >
              	<td align="right" colspan="3"><div id="postpaidlinks" style="display:none;">
              	 <table border="0" cellpadding="0" cellspacing="0" align="right">
                   <tr><td width="99"  align="right">
	              	       &nbsp;       	</td>
              	<td width="114"  align="right">
              		<form name="activateform1" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
	           			<input type="hidden" name="activate1" value="Activate"></input>
	           			<input type="submit" name="activate1" class="links" value="Activate" style="border:none;background: none;" />
	           			&nbsp;&nbsp;|&nbsp;
	           		</form>
       		
              	</td>
              	<td width="99" align="right">
              		<form name="deactivateform1" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="deactivate1" value="Deactivate"></input>
              			<input type="submit" name="deactivate1" class="links" value="Deactivate" style="border:none;background: none;" />
              		</form>
              	</td>
              </tr>
              </table></div></td></tr>
              </table>
                 </div>            
               </td>
            </tr>
        </table>
      </td>
    </tr>
    
</table>

<%@ include file="includes/footer.jsp" %>
