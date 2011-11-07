<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.loyalty.utils.SessionUtils"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ include file="includes/header.jsp"%>
<%
SessionFactory factory = SessionUtils.getSessionFactory();
Session session1 = factory.openSession();
Transaction tr=session1.beginTransaction();
Query q5 = session1.createQuery("Select cardId,cardNo from CardActivation ");
List<?> cardno = q5.list();
System.out.println(cardno);
pageContext.setAttribute("cardNum", cardno);
%>

<script type="text/javascript">
window.onload=function(){
	document.getElementById("prepaidlinks").style.display='inline';
	document.getElementById("postpaidlinks").style.display='none';
};

function calculateBalance(p){
	
		document.getElementById("card_balance").value=parseFloat(p)+(parseFloat(p)*parseFloat((document.getElementById("discount").value)/100));	
			
	
	}
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
	
	if(document.cardactivation.card_number.value=="")
	{
		alert("Please enter member card number..");
		document.cardactivation.card_number.focus();
		return false;
	}
	if(document.cardactivation.paid_amount.value=="")
	{
		alert("Please enter paid amount..");
		document.cardactivation.paid_amount.focus();
		return false;
	}
	document.getElementById("hiddenMemberId").value=document.getElementById("memberCode").options[document.getElementById("memberCode").selectedIndex].value;
	document.getElementById("prdcardactivate").value='prepaidcardactivate';	
	return true;
	//document.getElementById("activate").value="";
}

function validateCard(number){
	
	len = document.cardactivation.hiddenCardNo.length;
	
	for (i=0; i<len; i++) {
		
		if (number==document.cardactivation.hiddenCardNo[i].value) {
	alert("card already exists");
	document.cardactivation.card_number.value="";
	document.cardactivation.card_number.focus();
	return false;
	}
	}	return true;	
	
	
	
}

function getname()
{	 
	document.getElementById("hiddenMemberId").value=document.getElementById("memberCode").options[document.getElementById("memberCode").selectedIndex].value;
	document.getElementById("hiddenDiscountCalcOnes").value='DiscountCalcOnes';
	document.cardactivation.submit();
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

<form name="cardactivation" method="post" action="CommonServlet">
	<input type="hidden" name="hiddenMemberId" id="hiddenMemberId" value=""/>	
	<input type="hidden" name="activate" id="activate" value="Activate"></input>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		        <% 
		List<?> cardNum=(List<?>) pageContext.getAttribute("cardNum");
		 
		if(!cardNum.isEmpty() && cardNum.size()>0){ 
			
			Iterator<?> it21 = cardNum.iterator(); 
	 		
			while(it21.hasNext()){ 
				
				Object rowData[]= (Object[]) it21.next();
		 		
		 		%> 
		 	<tr style="display:none;">
		 	 <td>
		 	 <select name="hiddenCardNo" id="hiddenCardNo">
           <option  value="<%= rowData[1] %>" > <%= rowData[1] %></option>
           
            
          </select>
		 	 </td></tr>	
  <%}}%>
		
		<tr >
          <td colspan="5">
          <input type="hidden" name="hiddenDiscountCalcOnes" id="hiddenDiscountCalcOnes" value="" />
           <table width="100%" height="23" border="0" align="left" cellpadding="0" cellspacing="0" style="border:0px solid #000000;">
         
          <tr>
              <td><div align="left" style="height:25px;" class="pageheading">Prepaid Card Activation</div></td></table>
              <td></td>
              <td align="right" valign="top"><div align="right" style="margin-right:10px; color:#990000;">
              
              				</div>
			</td>
		</tr>
		
		
		<tr>
		    <td><input type="hidden" name="id"></td>
			
			<td>&nbsp;<input type="hidden" name="hiddencode"></td>
			
		</tr>
		
		
		<tr id="textbox1">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Member Code<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <select name="memberCode" id="memberCode" style="width:182px" onchange="getname()">
					<option value="0">--Select Customer Code--</option>
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

	<%if(request.getAttribute("discount")!=null){ %>	
		<tr id="textbox2">
			<td colspan="2" align="right" valign="top"><div align="left"
					style="margin-left: 15px;" class="labels">
					Member Name<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="memberName" id="memberName" value="<%= request.getAttribute("fullName")%>">
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
					Card Number<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="card_number" id="card_number" onchange="return validateCard(this.value)"
						style="width: 175px">
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="hidden" name="prepaid" value="Prepaid"></td>
			<td>&nbsp;</td>
		</tr>
		<tr id="textbox4">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Paid Amount<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="paid_amount" id="paid_amount" onchange="return calculateBalance(this.value)"
						style="width: 175px">
				</div>
			</td>
		</tr>
		<tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		
		
		<tr id="textbox5">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Discount(%)<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> 				
					
					<input type="text" name="discount" id="discount" style="width: 175px" value="<%=request.getAttribute("discount")%>" >
				
				</div>
			</td>
		</tr>
		<tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr id="textbox6">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Card Balance</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="card_balance" id="card_balance"
					readonly="readonly"	style="width: 175px">
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
				<input type="hidden" name="prdcardactivate" id="prdcardactivate" value=""> 
					<input type="submit" name="activatebutton" value="Activate"
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
