<%@ include file="includes/header.jsp"%>
<style type="text/css">
input {
	border-left: 0;
	border-right: 0;
	border-top: 0;
	border-bottom-color: black;
	text-align: center;
}
</style>
<script type="text/javascript">
function cancelAction()
{
	document.location.href("Search.jsp");
}

function Validatepost(){
	
	if(document.getElementById('points').value=="")
		{
			alert("Please enter points..");
			document.postpaidsettingform.points.focus();
			return false;
		}
	if(document.getElementById('rupees').value=="")
	{
		alert("Please enter rupees..");
		document.postpaidsettingform.rupees.focus();
		return false;
	}
return true;
	
}
</script>
<% if(request.getAttribute("amount")!=null && request.getAttribute("amount")!=" "){
	pageContext.setAttribute("amount",request.getAttribute("amount"));
	pageContext.setAttribute("points",request.getAttribute("points"));
}else{
	pageContext.setAttribute("amount","");
	pageContext.setAttribute("points","");
} %>

<table width="100%" border="0" cellspacing="0" cellpadding="0"
	align="left">
	<tr>
		<td colspan="5">
			<table width="100%" height="23" border="0" align="left"
				cellpadding="0" cellspacing="0" style="border: 0px solid #000000;">
<tr><td>&nbsp;</td></tr>
				<tr>
					<td><div align="left" style="height: 25px;"
							class="pageheading">Postpaid Settings :</div>
					</td>
					<td align="right" valign="top"><div align="right"
							style="margin-right: 10px; color: #990000;">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<form name="emailSetting" action="CommonServlet" method="post"
											style="margin: 0px 0px 0px 0px;">
											<input type="hidden" name="myname" value="EmailSetting"></input>
											<input type="submit" name="btnemailsetting" class="links"
												value="Email setting"
												style="border: none; background: none;" />
											&nbsp;&nbsp;|&nbsp;
										</form></td>
									<td>
										<form name="prepaidSetting" action="CommonServlet"
											method="post" style="margin: 0px 0px 0px 0px;">
											<input type="hidden" name="myname" value="PrepaidSetting"></input>
											<input type="submit" name="btnprepaidsetting" class="links"
												value="Prepaid setting"
												style="border: none; background: none;" />
											&nbsp;&nbsp;|&nbsp;
										</form></td>
									<td>
										<form name="postpaidSetting" action="CommonServlet"
											method="post" style="margin: 0px 0px 0px 0px;">
											<input type="hidden" name="myname" value="PostpaidSetting"></input>
											<input type="submit" name="btnpostpaidsetting" class="links"
												value="Postpaid setting"
												style="border: none; background: none;" />
										</form></td>
								</tr>
								
							</table>
						</div>
					</td>
					
				</tr>
			</table>
		</td>
		</tr>
		
		<tr>
		<form name="postpaidsettingform" action="CommonServlet" method="post">
			<tr>
			<td colspan="5" align="left">&nbsp; <input type="hidden"
				name="myname" id="myname" value="PostpaidSetting"></input>
			</td></tr>
		<tr>
			<td align="left" valign="top">&nbsp;</td>
			<td valign="top"><div align="center"></div></td>
			<td align="left">&nbsp;</td>
		</tr>
		<tr>
			<td align="left" valign="top"></td>
			<td width="3%" valign="top"></td>
			<td align="center"><div align="left" style="margin-left: 15px;"
					class="labels">
					<input type="text" name="points" id="points" value="<%=pageContext.getAttribute("points") %>"  style="width: 75px" text-align="center">
					points for every<input type="text" name="rupees" id="rupees" value="<%=pageContext.getAttribute("amount") %>" 
						style="width: 75px">rupees spent.
				</div>
			</td>
		</tr>
		<tr>
			<td align="left" valign="top">&nbsp;</td>
			<td valign="top"><div align="center"></div></td>
			<td align="left">&nbsp;</td>
		</tr>

		<tr>
			<td align="left" valign="top">&nbsp;</td>
			<td valign="top"><div align="center"></div></td>
			<td align="left">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td colspan="3" align="left">&nbsp;</td>
		</tr>
		<tr>
<td>&nbsp;</td><td>&nbsp;</td>
			<td colspan="3" align="left">
				<div align="left" style="margin-left: 80px">
					<input type="submit" name="save" value="Save" style="width: 80px;"
						class="buttons" onclick="return Validatepost();">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="set"
						style="width: 80px;" class="buttons">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Search.jsp"
						onclick="javascript:cancelAction();"> <input type="button"
						name="Cancel" style="width: 80px;" value="Cancel" class="buttons">
					</a>
				</div>
			</td>
		</tr>
		
	
</table>
</form>
<%@ include file="includes/footer.jsp"%>
<%if(request.getAttribute("result")!=null){
	%>
	<script type="text/javascript">
	   alert("Settings saved");
	   </script>
	   <%} %>