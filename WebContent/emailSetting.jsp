<%@ include file="includes/header.jsp"%>
<script type="text/javascript">

function cancelAction()
{
	document.location.href("Search.jsp");
}
function Validate(){
	
	if(document.getElementById("emailtxt").value=="")
		{
			alert("Please enter email..");
			document.emailSetting_form.emailtxt.focus();
			return false;
		}
	
	if(document.getElementById("user_pass").value=="")
	{
		alert("Please enter password..");
		document.emailSetting_form.user_pass.focus();
		return false;
	}
return true;	
}
</script>
<% if(request.getAttribute("email")!=null && request.getAttribute("email")!=" "){
	pageContext.setAttribute("email",request.getAttribute("email"));
	pageContext.setAttribute("password",request.getAttribute("password"));
}else{
	pageContext.setAttribute("email","");
	pageContext.setAttribute("password","");
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
								class="pageheading">Email Settings :</div></td>
						<td align="right" valign="top"><div align="right"
								style="margin-right: 10px; color: #990000;"></div>
						</td>
						<td align="right" valign="top"><div align="right"
								style="margin-right: 10px; color: #990000;">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<form name="emailSetting" action="CommonServlet"
												method="post" style="margin: 0px 0px 0px 0px;">
												<input type="hidden" name="myname" value="EmailSetting"></input>
												<input type="submit" name="btnemailsetting" class="links"
													value="Email setting"
													style="border: none; background: none;" />
												&nbsp;&nbsp;|&nbsp;
											</form>
										</td>
										<td >
											<form name="prepaidSetting" action="CommonServlet"
												method="post" style="margin: 0px 0px 0px 0px;">
												<input type="hidden" name="myname" value="PrepaidSetting"></input>
												<input type="submit" name="btnprepaidsetting" class="links"
													value="Prepaid setting"
													style="border: none; background: none;" />
												&nbsp;&nbsp;|&nbsp;
											</form>
										</td>
										<td>
											<form name="postpaidSetting" action="CommonServlet"
												method="post" style="margin: 0px 0px 0px 0px;">
												<input type="hidden" name="myname" value="PostpaidSetting"></input>
												<input type="submit" name="btnpostpaidsetting" class="links"
													value="Postpaid setting"
													style="border: none; background: none;" />
											</form>
										</td>
									</tr></table></div></td></tr>
									
									
					<form name="emailSetting_form" action="CommonServlet" method="post">
					<tr><td>
					<input type="hidden" name="myname" id="myname" value="EmailSetting">
					
						</td>
                            <tr>
										<td colspan="5" align="left">&nbsp; 
										</td>

									</tr>
										<tr>
							<tr>
								<td colspan="5">
									<table width="100%" height="23" border="0" align="left"
										cellpadding="0" cellspacing="0"
										style="border: 0px solid #000000;">


									</table></td>
							</tr>
							<tr>
								<td colspan="5" align="left">&nbsp; <input type="hidden"
									name="myname" value="EmailSetting"></input></td>
							<tr>
								<td align="left" valign="top" nowrap>
									<div align="left" style="margin-left: 15px;" class="labels">
										Email<span style="color: #FF0000"> *</span>
									</div></td>
								<td width="3%" valign="top">

									<div align="center" class="labels">
										<b>:</b>
									</div>
								</td>
								<td width="79%" align="left"><input type="text"
									name="emailtxt" id="emailtxt" value="<%=pageContext.getAttribute("email") %>" style="width: 175px">
								</td>
							</tr>
							<tr>
								<td align="left" valign="top">&nbsp;</td>
								<td valign="top"><div align="center"></div>
								</td>
								<td align="left">&nbsp;</td>
							</tr>
							<tr>
								<td align="left" valign="top">
									<div align="left" style="margin-left: 15px;" class="labels">
										Password <span style="color: #FF0000"> *</span>
									</div></td>
								<td width="3%" valign="top">

									<div align="center" class="labels">
										<b>:</b>
									</div>
								</td>
								<td align="left"><input type="password" name="user_pass"
									id="user_pass" value="<%=pageContext.getAttribute("password") %>"  style="width: 175px"></td>
							</tr>
							<tr>
								<td align="left" valign="top">&nbsp;</td>
								<td valign="top"><div align="center"></div>
								</td>
								<td align="left">&nbsp;</td>
							</tr>

							<tr>
								<td align="left" valign="top">&nbsp;</td>
								<td valign="top"><div align="center"></div>
								</td>
								<td align="left">&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td colspan="3" align="left">&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td colspan="3" align="left">
									<div>
										<input type="submit" name="save" value="Save"
											style="width: 80px;" class="buttons"
											onclick="return Validate();">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
											name="set" style="width: 80px;" class="buttons">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Search.jsp"
											onclick="javascript:cancelAction();"> <input
											type="button" name="Cancel" style="width: 80px;"
											value="Cancel" class="buttons"> </a>
									</div></td>
				</tr>
			</table>
		</td>
		<tr>
	</tr>
</form>
</table>



			
							
								
<%@ include file="includes/footer.jsp"%>
<%if(request.getAttribute("result")!=null){
	%>
	<script type="text/javascript">
	   alert("Settings saved");
	   </script>
	   <%} %>