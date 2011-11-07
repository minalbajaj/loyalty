<script language="javascript">
function Openmypage(menuid){
	if(menuid=="1"){
		document.getElementById("myname").value="Updatecustomer";
		document.frmMenus.submit();
	}else if(menuid=="2"){
		document.getElementById("myname").value="EmailSetting";
		document.frmMenus.submit();
	}else if (menuid=="8"){
		document.getElementById("myname").value="searchpage";
		document.frmMenus.submit();
	}}
</script>
<form name="frmMenus" action="CommonServlet" method="post">
<div style="float: left" id="my_menu" class="sdmenu">
<input type="hidden" id="myname" name="myname" value=""></input>
	<div align="left">
	    <a href="addUser.jsp" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Users</div></a>
		<a href="addMember.jsp" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Registration</div></a>
		<a href="#" onclick="javascript:Openmypage('1');" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Member Management</div></a>
		<a href="CardManagement.jsp" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Card Management</div></a>
		<a href="email.jsp"  style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Transaction</div></a>
		<a href="#"  style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Sms</div></a>
		<a href="#" onclick="javascript:Openmypage('8');" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Search</div></a>
		<a href="#" onclick="javascript:Openmypage('2');" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Setting</div></a>
		<a href="changePassword.jsp" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Offers</div></a>
		<a href="changePassword.jsp" style="text-decoration:none;"><div align="left" style="border-bottom:1px solid;background:none;">Change Password</div></a>	

	</div>
</div>
</form>