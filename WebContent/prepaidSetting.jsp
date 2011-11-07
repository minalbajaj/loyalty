<%@ include file="includes/header.jsp"%>
<script type="text/javascript">
	
function cancelAction()
{
	document.location.href("Search.jsp");
}
	
	function validate()
	{
		if(document.prepaidsettingform.minrecharge.value=="")
			{
				alert("Please enter minimum first recharge");
				document.prepaidsettingform.minrecharge.focus();
				return false;
			}
		if(document.prepaidsettingform.benifit.value=="")
		{
			alert("Please enter first recharge discount..");
			document.prepaidsettingform.benifit.focus();
			return false;
		}
		
		return true;
	}

</script>
<% if(request.getAttribute("minrecharge")!=null && request.getAttribute("minrecharge")!=" "){
	pageContext.setAttribute("minrecharge",request.getAttribute("minrecharge"));
	pageContext.setAttribute("rechargebenefit",request.getAttribute("rechargebenefit"));
}else{
	pageContext.setAttribute("minrecharge","");
	pageContext.setAttribute("rechargebenefit","");
} %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		align="left">
		<tr>
			<td colspan="5">
				<table width="100%" height="23" border="0" align="left"
					cellpadding="0" cellspacing="0" style="border: 0px solid #000000;">
                  <tr><td>&nbsp;</td></tr>
					<tr>
						<td colspan="2"><div align="left" style="height: 25px;"
								class="pageheading">Prepaid Settings :</div></td>
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
										<td>
											<form name="prepaidSetting" action="CommonServlet"
												method="post" style="margin: 0px 0px 0px 0px;">
												<input type="hidden" name="myname" value="PrepaidSetting"></input>
												<input type="submit" name="btnprepaidsetting" class="links"
													value="Prepaid setting"
													style="border: none; background: none;" />
												&nbsp;&nbsp;|&nbsp;
											</form>
										</td>
										<td >
											<form name="postpaidSetting" action="CommonServlet"
												method="post" style="margin: 0px 0px 0px 0px;">
												<input type="hidden" name="myname" value="PostpaidSetting"></input>
												<input type="submit" name="btnpostpaidsetting" class="links"
													value="Postpaid setting"
													style="border: none; background: none;" />
											</form>
										</td>
									</tr>
									<tr>
										<td colspan="5" align="left">&nbsp; <input type="hidden"
											name="myname" value="prepaidPage"></input>
										</td>

									</tr>


								</table>
						</td>
					</tr>
					<tr>
						<td width="30%">&nbsp;</td>
						<td width="5%">&nbsp;</td>
					  <td width="65%">&nbsp;</td>
				  </tr>
					<tr>
		<form name="prepaidsettingform" action="CommonServlet" method="post">
			<td colspan="5" align="left">&nbsp; <input type="hidden"
				name="myname" id="myname" value="PrepaidSetting"></input>
			</td>
		<tr>

						<td valign="top"><div align="left" style="margin-left: 15px;"
								class="labels">
								Minimum First Recharge<span
									style="color: #FF0000"> *</span>
							</div></td>
						<td valign="top"><div align="center" class="labels">
								<b>:</b>
							</div></td>
						<td valign="top"><div align="left">
								<input type="text" id="minrecharge" name="minrecharge" value="<%=pageContext.getAttribute("minrecharge") %>" 
									style="width: 210px">
							</div></td>
					</tr>
					<tr>
						<td valign="top"><div align="left">&nbsp;</div></td>
						<td valign="top"><div align="center"></div></td>
						<td valign="top"><div align="left"></div></td>
					</tr>
					<tr>
						<td valign="top"><div align="left" style="margin-left: 15px;"
								class="labels">
								First Recharge Discount(%)<span style="color: #FF0000">*</span>
							</div></td>
						<td valign="top"><div align="center" class="labels">
								<b>:</b>
							</div></td>
						<td valign="top"><div align="left">
								<input type="text" id="benifit" name="benifit"  value="<%=pageContext.getAttribute("rechargebenefit") %>" 
									style="width: 210px">

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
					<tr>
						<td align="left">&nbsp;</td>
						<td align="left" valign="top">&nbsp;</td>
						<td align="left" valign="top">
							<div align="left">
								<input type="submit" name="save" value="Save" class="buttons"
									onclick="return validate();" style="width: 80px;" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
									name="set" class="buttons" style="width: 80px;" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Search.jsp"
									onclick="javascript:cancelAction();"> <input type="button"
									value="Cancel" class="buttons" style="width: 80px;"></input> </a>
							</div></td>
					</tr>
				</table></td>
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