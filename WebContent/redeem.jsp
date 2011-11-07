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
	
	if(document.cardactivation.cardNumber.value=="")
	{
		alert("Please enter member card number..");
		document.cardactivation.cardNumber.focus();
		return false;
	}
	if(document.cardactivation.rechargeAmount.value=="")
	{
		alert("Please enter recharge amount..");
		document.cardactivation.rechargeAmount.focus();
		return false;
	}
	document.getElementById("hiddenCardId1").value=document.getElementById("cardNumber").options[document.getElementById("cardNumber").selectedIndex].value;
	document.getElementById("postpaidRedeem").value='postpaidRedeem';	
	return true;
	//document.getElementById("activate").value="";
}
function calculatePoints(paidAmount)
{
	if(paidAmount>=100)
		{
		document.getElementById("points").value=paidAmount/100;
		}			
}
function getname()
{	 
	document.getElementById("hiddenCardId1").value=document.getElementById("cardNumber").options[document.getElementById("cardNumber").selectedIndex].value;
	document.redeemForm.submit();
}
</script>
<%
List<?> activateList=null;
if(request.getAttribute("activateList")!=null){		
	activateList=(List<?>)request.getAttribute("activateList"); 
}
String strcustid=(String)request.getAttribute("strcustid");
%>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
              
              <tr>
              <td width="65%">&nbsp;</td>
              	<td align="right">
	              	<form name="prepaidform" method="post" style="margin:0px 0px 0px 0px;">
	           			<input type="hidden" name="prepaid1" value="Prepaid1"></input>
	           			<input type="button" name="prepaid" class="links" value="Prepaid" style="border:none;background: none;" onclick="return linkAction(value)"/>
	           			|&nbsp;
	           			</td>
              	</form>
              	<td><form name="postpaidform" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="postpaid1" value="Postpaid1"></input>
              			<input type="button" name="postpaid" class="links" value="Postpaid" style="border:none;background: none;"  onclick="return linkAction(value)"/>
              			|&nbsp;
              		</form>              		
              	</td>
              	<td valign="top">
              		<form name="giftcardform" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="giftcard1" value="Giftcard1"></input>
              			<input type="button" name="giftcard" class="links" value="Gift Card" style="border:none;background: none;"  onclick="return linkAction(value)"/>
              		</form>
              	</td>
              </tr>
              
              <tr id="prepaidlinks">
              <td width="65%">&nbsp;</td>
              	<td id="activate" >
	              	<form name="activateform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
	           			<input type="hidden" name="activate" value="Activate"></input>
	           			<input type="submit" name="activate" class="links" value="Activate" style="border:none;background: none;" />
	           			|&nbsp;
	           		</form>
              	</td>
              	<td id="recharge" >
              		<form name="rechargeform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="recharge" value="Recharge"></input>
              			<input type="submit" name="recharge" class="links" value="Recharge" style="border:none;background: none;" />
              			|&nbsp;
              		</form>              		
              	</td>
              	<td valign="top" id="deactivate">
              		<form name="deactivateform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="deactivate" value="Deactivate"></input>
              			<input type="submit" name="deactivate" class="links" value="Deactivate" style="border:none;background: none;" />
              		</form>
              	</td>
              </tr>
              <tr>
              
              </tr>
              <tr id="postpaidlinks" style="display:none;">
              <td width="65%">&nbsp;</td>
              	<td id="activate1">
	              	<form name="activateform1" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
	           			<input type="hidden" name="activate1" value="Activate"></input>
	           			<input type="submit" name="activate1" class="links" value="Activate" style="border:none;background: none;" />
	           			|&nbsp;
	           		</form>
              	</td>
              	<td id="redeem">
              		<form name="redeemform" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="redeem" value="Redeem"></input>
              			<input type="submit" name="redeem" class="links" value="Redeem" style="border:none;background: none;" />
              			|&nbsp;
              		</form>              		
              	</td>
              	<td valign="top" id="deactivate1">
              		<form name="deactivateform1" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="deactivate1" value="Deactivate"></input>
              			<input type="submit" name="deactivate1" class="links" value="Deactivate" style="border:none;background: none;" />
              		</form>
              	</td>
              </tr>
              </table>

<form name="redeemForm" method="post" action="CommonServlet">
	<input type="hidden" name="hiddenCardId1" id="hiddenCardId1" value=""/>	
	<input type="hidden" name="redeem" id="redeem" value="Redeem"></input>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr >
          <td colspan="5">
           <table width="100%" height="23" border="0" align="left" cellpadding="0" cellspacing="0" style="border:0px solid #000000;">
         
          <tr>
              <td><div align="left" style="height:25px;" class="pageheading">Postpaid Card Redeem</div></td></table>
              <td></td>
              <td align="right" valign="top"><div align="right" style="margin-right:10px; color:#990000;">
              
              				</div>
			</td>
		</tr>		
		
		<tr id="textbox1">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Card Number<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <select name="cardNumber" id="cardNumber" style="width:182px" onchange="getname()">
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

	<%if(request.getParameter("cardNumber")!=null){ %>	
	    <tr>
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Shop Amount<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="shopAmount" id="shopAmount"
						style="width: 175px">
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<tr>
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Paid Amount<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="paidAmount" id="paidAmount" onchange="calculatePoints(this.value)" style="width: 175px">
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr id="textbox2">
		   <td colspan="2" align="right" valign="top"><div align="left"
					style="margin-left: 15px;" class="labels">
					Points<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="points" id="points" >
				</div>
			</td>
			<td colspan="2" align="right" valign="top"><div align="left"
					style="margin-left: 15px;" class="labels">
					Previous Points<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="previousPoints" id="previousPoints" value="<%= request.getAttribute("points")%>" readonly="readonly">
				</div>
			</td>
		</tr>
	
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		
		<tr id="textbox3">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Redeem Points<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="rechargeAmount" id="rechargeAmount"
						style="width: 175px">
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr id="textbox4">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					XXXX<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="newBalance" id="newBalance"
						style="width: 175px">
				</div>
			</td>
		</tr>
		
		<tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td colspan="3" align="left">
				<div>
				<input type="hidden" name="postpaidRedeem" id="postpaidRedeem" value=""> 
					<input type="submit" name="redeembutton" value="Redeem"
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
			<%} %>
	</table>
</form>

<%@ include file="includes/footer.jsp"%>
<% if(request.getAttribute("result")!=null){
	%>
	<script type="text/javascript">
	   alert("Selected Prepaid Card activated successfully!!");
	   </script>
	   <%} %>