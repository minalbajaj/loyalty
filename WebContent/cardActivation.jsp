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
List<?> discount = session1.createQuery("Select discount from Discount where id=1").list();
double d=(Double)discount.get(0);
System.out.println(d);
pageContext.setAttribute("discount", d);

Query q5 = session1.createQuery("Select cardId,cardNo from CardActivation ");
List<?> cardno = q5.list();
System.out.println(cardno);
pageContext.setAttribute("cardNum", cardno);
%>

<script type="text/javascript">

function radioAction(value){
	if(value=="Prepaid Card"){
		document.getElementById("completePage").style.display='inline';
		document.getElementById("textbox5").style.display='inline';
		document.getElementById("paidamount").value='';
		document.getElementById("cardbalance").value='';
	 	document.getElementById("cardNumber").focus();
	}else if(value="Postpaid Card"){
		document.getElementById("completePage").style.display='inline';
		document.getElementById("textbox5").style.display='none';
		document.getElementById("paidamount").value='';
		document.getElementById("cardbalance").value='';
	 	document.getElementById("cardNumber").focus();
	 	
	}
}
function calculateBalance(p){

	document.getElementById("cardbalance").value=parseFloat(p)+(parseFloat(p)*parseFloat((document.getElementById("discount").value)/100));	
}

function validateCard(number){
	
	len = document.cardactivation.hiddenCardNo.length;
	
	for (i=0; i<len; i++) {
		
		if (number==document.cardactivation.hiddenCardNo[i].value) {
	alert("card already exists");
	document.cardactivation.cardNumber.value="";
	document.cardactivation.cardNumber.focus();
	return false;
	}
	}	return true;	
	
	
	
}
function resetFields(){
	document.getElementById("cardNumber").value='';
	document.getElementById("paidamount").value='';
	document.getElementById("cardbalance").value='';
	
}
function validate_cardactivationForm(){
	if ( ( cardactivation.cardradio[0].checked == false )
		    && ( cardactivation.cardradio[1].checked == false ))
		    {
		        alert ( "Please select card type.." );
		        return false;
		    }

	if(document.cardactivation.cardNumber.value=="")
	{
		alert("Please enter member card number..");
		document.cardactivation.cardNumber.focus();
		return false;
	}
	if(document.cardactivation.paidamount.value=="")
	{
		
		alert("Please enter paid amount..");
		document.cardactivation.paidamount.focus();
		return false;
	}
	if(document.cardactivation.paidamount.value<=0)
	{
		alert("Please enter paid amount greater than zero..");
		document.cardactivation.paidamount.value="";
		document.cardactivation.paidamount.focus();
		return false;	
	}
	if(document.cardactivation.discount.value=="" && cardactivation.cardradio[0].checked == true)
	{
		alert("Please enter discount..");
		document.cardactivation.discount.focus();
		return false;
	}

	return true;

}
</script>


<form name="cardactivation" method="post" action="CommonServlet">

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
        
		
			<td colspan="3">&nbsp;</td>
			<td width="3%" align="right" valign="top">&nbsp;</td>
		</tr>
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
		
		<tr>
			<td colspan="3"><div align="left" style="height: 25px;"
					class="pageheading">Card Activation:</div>        <input type="hidden" name="myname" value="cardactivate"></input></td>
			<td valign="top" align="right">
				<div align="right" style="margin-right: 10px; color: #990000;">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top"></td>
							<td></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td width="17%">&nbsp;<input type="hidden" name="hiddenid" id="hiddenid" value="<%= request.getParameter("hiddenId")%>"></td>
			<td width="3%">&nbsp;</td>
			<td width="77%">&nbsp;</td>
		</tr>
		<tr>
			<td valign="top"><div align="left" style="margin-left: 15px;"
					class="labels">
					Card Type:<span style="color: #FF0000"> *</span>
				</div></td>
			<td valign="top"><div align="center" class="labels">
					<b>:<b>
				</div></td>
			<td valign="top"><div align="left">
					<input type="radio" name=cardradio value="Prepaid Card" onclick="return radioAction(this.value);" id="prepaid" >
					Prepaid &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name=cardradio value="Postpaid Card"
						onclick="return radioAction(this.value)" id="postpaid">Postpaid
				</div>
			</td>
		</tr>


		<tr>
			<td valign="top"><div align="left">&nbsp;</div></td>
			<td valign="top"><div align="center"></div></td>
			<td valign="top"><div align="left"></div></td>
		</tr>

		<tr>
			<td colspan="3">
			<div id="completePage" style="display: none;">
			<table width="100%" border="0">
  <tr>
    <td width="18%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
    <td width="79%">&nbsp;</td>
  </tr>
  	<tr >
			<td  align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Member Code<span style="color: #FF0000;"> *</span>
				</div></td>
                 <td width="3%">
                 <div align="center" class="labels"><b>:</b></div></td>
			<td align="left" valign="top"><div align="left" class="labels">
			  <input type="text" name="memberCode" id="memberCode" value="<%= request.getParameter("hiddenCode") %>" readonly="readonly"
						style="width: 175px">
				</div>
			</td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>

		<tr >
			<td  align="right" valign="top"><div align="left"
					style="margin-left: 15px;" class="labels">
					Member Name<span style="color: #FF0000"> *</span>
				</div></td>
                 <td width="3%"> <div align="center" class="labels"><b>:</b></div></td>
			<td align="left" valign="top"><div align="left" class="labels">
					<input type="text" name="member_name" id="member_name" value="<%= request.getParameter("hiddenFirstName")+' '+ request.getParameter("hiddenLastName") %>   " readonly="readonly"
						style="width: 175px">
				</div><input type="hidden" name="hiddenid" id="hiddenid" value="<%= request.getParameter("hiddenId")%>">
			</td>
	</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr >
			<td  align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Card Number<span style="color: #FF0000"> *</span>
				</div></td>
                 <td width="3%"> <div align="center" class="labels"><b>:</b></div></td>
			<td align="left" valign="top"><div align="left" class="labels">
					<input type="text" name="cardNumber" id="cardNumber"  onchange="return validateCard(this.value)"
						style="width: 175px">
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr >
			<td  align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Paid Amount<span style="color: #FF0000"> *</span>
				</div></td>
                 <td width="3%"> <div align="center" class="labels"><b>:</b></div></td>
			<td align="left" valign="top"><div align="left" class="labels">
					 <input type="text" name="paidamount" id="paidamount" onChange="return calculateBalance(this.value)"
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
			<td colspan="3"><div id="textbox5">
            <table width="100%" border="0">
<tr >
			<td width="18%"  align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Discount(%)<span style="color: #FF0000"> *</span>
				</div></td>
                 <td width="3%"> <div align="center" class="labels"><b>:</b></div></td>
			<td width="79%" align="left" valign="top">
			<div align="left" class="labels">
			<input type="text" id="discount" name="discount" value="<%= pageContext.getAttribute("discount") %>"  readonly="readonly"  style="width: 175px;"/>
				</div>
			</td>
		</tr>
		
		<tr >
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr >
			<td  align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Card Balance</div></td>
                     <td width="3%"> <div align="center" class="labels"><b>:</b></div></td>
			<td align="left" valign="top"><div align="left" class="labels">
					<input type="text" name="cardbalance" id="cardbalance" readonly="readonly"
						style="width: 175px">
				</div>
			</td>
		</tr>
		<tr></table></div>

            </td>
					</tr>
		
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td  align="left">
				<div>
					<input type="submit" name="activate" value="Activate" id="activate"
						style="width: 80px;" class="buttons" 
						onclick="return validate_cardactivationForm()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="set" id="reset"
						style="width: 80px;" class="buttons" onClick="resetFields()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Search.jsp"
						onclick="javascript:cancelAction()"> <input type="button" id="cancel"
						name="Cancel" style="width: 80px;" value="Cancel" class="buttons">
					</a>
				</div></td>
		</tr>
	</table>
	</div>
</td>
			
		</tr>

		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>

		
		
		
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		
	</table>
	
</form>

<%@ include file="includes/footer.jsp"%>
<%if(request.getAttribute("userlistrd")!=null){ %>
<script type="text/javascript">
	   alert("Card number already exist.");
	   </script>
	   <%} %>

