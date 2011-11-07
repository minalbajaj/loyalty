<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@ include file="includes/header.jsp"%>

<script type="text/javascript">
window.onload=function(){
	document.getElementById("postpaidlinks").style.display='inline';
	document.getElementById("prepaidlinks").style.display='none';
};

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

function validate_cardactivationForm(){
	
	if(document.PostpaidCardDeactivation.cardNumber.value==0)
	{
		alert("Please enter member card number..");
		document.PostpaidCardDeactivation.cardNumber.focus();
		return false;
	}
	
		return true;
	//document.getElementById("activate").value="";
}

</script>
<%
List<?> activateList=null;
if(request.getAttribute("activateList")!=null){		
	activateList=(List<?>)request.getAttribute("activateList"); 
}
String strcustid=(String)request.getAttribute("strcustid");
%>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr >
          <td colspan="5">
           <table width="100%" height="23" border="0" align="left" cellpadding="0" cellspacing="0" style="border:0px solid #000000;">
         
          <tr>
              <td align="left" valign="top">&nbsp;</td>
              <td align="right" valign="top"><div align="right" style="margin-right:10px; color:#990000;">
              
              <table border="0" cellpadding="0" cellspacing="0" align="right">
              <tr><td>&nbsp;</td></tr>
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

<form name="PostpaidCardDeactivation" method="post" action="CommonServlet">
	
	<input type="hidden" name="deactivate1" id="deactivate1" value="Deactivate"></input>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr >
          <td colspan="5">
           <table width="100%" height="23" border="0" align="left" cellpadding="0" cellspacing="0" style="border:0px solid #000000;">
         
          <tr>
              <td><div align="left" style="height:25px;" class="pageheading">Postpaid Card Deactivation</div></td></table>
              <td></td>
              <td align="right" valign="top"><div align="right" style="margin-right:10px; color:#990000;">
              
              				</div>
			</td>
		</tr>
		
		
		<tr>
		    <td><input type="hidden" name="id"></td>
			
			<td>&nbsp;</td>
			
		</tr>
		
		
		<tr id="textbox1">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Card Number<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <select name="cardNumber" id="cardNumber" style="width:182px">
					<option value="0">--Select Card Number--</option>
					<%
		Iterator<?> it2= activateList.iterator(); 
	     while(it2.hasNext()){ 
	     Object []rowData = (Object[]) it2.next();
	     Integer z5=(Integer) rowData[0];
		 if(z5.toString().equals(strcustid)){
							   System.out.println("gdgg");
						   %>
						   
							<option value="<%= rowData[0] %>"  selected="selected"><%= rowData[1]%></option>
							<% 
						} else { 
					%><option value="<%= rowData[0] %>"><%=rowData[1] %></option>
						<% } }%> 
					</select>
				</div>
			</td>

		</tr>
		
		
		<tr>
			<td valign="top"><div align="left">&nbsp;</div></td>
			<td valign="top"><div align="center"></div></td>
			<td valign="top"><div align="left"></div></td>
		</tr>
	
		<tr>
			<td>&nbsp;</td>
			<td><input type="hidden" name="prepaid" value="Prepaid"></td>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td colspan="3" align="left">
				<div>
				 
					<input type="submit" name="deactivatebutton" value="Deactivate"
						style="width: 80px;" class="buttons"
						onclick="return validate_cardactivationForm() ">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="set"
						style="width: 80px;" class="buttons">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Search.jsp"
						onclick="javascript:cancelAction();"> <input type="button"
						name="Cancel" style="width: 80px;" value="Cancel" class="buttons">
					</a>
				</div></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			</tr>

	</table>
</form>

<%@ include file="includes/footer.jsp"%>
