<%@ include file="includes/header.jsp"%>
<script type="text/javascript">
function radioAction(value){
	if(value=="Prepaid Card"){
		
		document.getElementById("textbox1").style.display='inline';
		document.getElementById("textbox2").style.display='inline';
		document.getElementById("textbox3").style.display='inline';
		document.getElementById("textbox4").style.display='inline';
		document.getElementById("textbox5").style.display='inline';
		document.getElementById("textbox6").style.display='inline';
	   
	}else if(value="Postpaid Card"){
		document.getElementById("textbox1").style.display='inline';
		document.getElementById("textbox2").style.display='inline';
		document.getElementById("textbox3").style.display='inline';
		document.getElementById("textbox4").style.display='inline';
		document.getElementById("textbox5").style.display='none';
		document.getElementById("textbox6").style.display='inline';
	}
}
function validate_cardactivationForm(){
	if ( ( cardactivation.cardradio[0].checked == false )
		    && ( cardactivation.cardradio[1].checked == false ))
		    {
		        alert ( "Please select card type.." );
		        return false;
		    }
	if(document.cardactivation.memberCode.value=="")
		{
			alert("Please enter member code..");
			document.cardactivation.memberCode.focus();
			return false;
		}
	if(document.cardactivation.memberName.value=="")
	{
		alert("Please enter member name..");
		document.cardactivation.memberName.focus();
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
			<td valign="top" align="right">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><div align="left" style="height: 25px;"
					class="pageheading">Card Activation:</div></td>
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
			<td width="18%">&nbsp;</td>
			<td width="3%">&nbsp;</td>
			<td width="79%">&nbsp;</td>
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
					<input type="radio" name=cardradio value="Prepaid Card"
						onclick="return radioAction(this.value)" id="prepaid">
					Prepaid &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
						name=cardradio value="Postpaid Card"
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
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr id="textbox1">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Member Code<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="memberCode" id="member_name"
						style="width: 175px">
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
					Member Name<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="memberName" id="member_name"
						style="width: 175px">
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
					<b>:</b> <input type="text" name="cardNumber" id="card_number"
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
					Paid Amount<span style="color: #FF0000"> *</span>
				</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="paidamount" id="paid_amount"
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
					<b>:</b> <input type="text" name="discount" id="discount"
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
		<tr id="textbox6">
			<td colspan="2" align="right" valign="top">
				<div align="left" style="margin-left: 15px;" class="labels">
					Card Balance</div>
			<td align="left" valign="top"><div align="left" class="labels">
					<b>:</b> <input type="text" name="cardbalance" id="card_balance"
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
					<input type="submit" name="activate" value="Activate"
						style="width: 80px;" class="buttons"
						onclick="return validate_cardactivationForm()">
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
	</table>
</form>

<%@ include file="includes/footer.jsp"%>
