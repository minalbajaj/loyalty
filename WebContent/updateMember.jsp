<%@ include file="includes/header.jsp" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%@ page import="java.sql.Statement" %>
<% String mytype= (String) session.getAttribute("mytype");
   if(mytype.equals("U"))
   {   
    response.sendRedirect("Search.jsp")	 ;  
   }
%>
	<%
		List<?> Custlist1=(List<?>)request.getAttribute("updatelist1"); 
	String strcustid=null;
	if(request.getAttribute("strcustid")!=null){		
	    strcustid=(String)request.getAttribute("strcustid");
	}
	String strcustid1=null;
	if(request.getAttribute("strcustid1")!=null){		
		strcustid1=(String)request.getAttribute("strcustid1");
	}

	   
		List<?> Custlist2=null;
		List<?> Custlist3=null;
		if(request.getAttribute("updatelist2")!=null){		
			Custlist2=(List<?>)request.getAttribute("updatelist2"); 
		}
		
		if(request.getAttribute("updatelist3")!=null)
		{
			Custlist3=(List<?>)request.getAttribute("updatelist3");
		}
		
	%>
<link rel="stylesheet" type="text/css" href="css/epoch_styles.css" /> 
	<script type="text/javascript" src="javascript/epoch_classes.js"></script> 
<%  if(Custlist3!=null && Custlist3.size()>0){ %>
<script type="text/javascript"> 
window.onload = function() 
{ alert("if");
			calendar3 = new Epoch('cal1','popup',document.getElementById('frstrwdate1'),false);
			calendar1 = new Epoch('cal1','popup',document.getElementById('member_birthdate'),false);
			 calendar3 = new Epoch('cal1','popup',document.getElementById('spouse_birth_date'),false);
				calendar2 = new Epoch('cal1','popup',document.getElementById('member_anniversary'),false);
		 
}; </script> 

<%} else { %>
<script type="text/javascript"> 
window.onload = function() 
{ 
	calendar1 = new Epoch('cal1','popup',document.getElementById('member_birthdate'),false);
calendar3 = new Epoch('cal1','popup',document.getElementById('frstrwdate'),false);
calendar3 = new Epoch('cal1','popup',document.getElementById('secondrwdate'),false);
	calendar3 = new Epoch('cal1','popup',document.getElementById('thirdtrwdate'),false);
	calendar3 = new Epoch('cal1','popup',document.getElementById('forthrwdate'),false);
	 calendar3 = new Epoch('cal1','popup',document.getElementById('spouse_birth_date'),false);
		calendar2 = new Epoch('cal1','popup',document.getElementById('member_anniversary'),false);
};
</script> 

<%} %>
<script type="text/javascript">
function cancelAction()
{
	document.location.href("Search.jsp");
}
<% String str="a";%>

function ShowNoBox(typeval){
	if(typeval=='Married'){
		document.getElementById("hidespouse").style.display='inline';
	    document.getElementById("hideweddindate").style.display='inline';
	    calendar3 = new Epoch('cal1','popup',document.getElementById('spouse_birth_date'),false);
		calendar2 = new Epoch('cal1','popup',document.getElementById('member_anniversary'),false);
	    }else{
		document.getElementById("hidespouse").style.display='none';
		document.getElementById("hideweddindate").style.display='none';
		
	   
		}
} 

function ShowNoBox1(typeval){
	if(typeval=='Married'){
		
	    document.getElementById("hidespouse").style.display='inline';
	    document.getElementById("hideweddindate").style.display='inline';
	    calendar3 = new Epoch('cal1','popup',document.getElementById('spouse_birth_date'),false);
	     calendar2 = new Epoch('cal1','popup',document.getElementById('member_anniversary'),false);
		
	}else{
		document.getElementById("hidespouse").style.display='none';	
		document.getElementById("hideweddindate").style.display='none';
		
		}
} 

function Show(ID){
	if(ID==1)
	{
		document.getElementById('membercodeupd').disabled=false;
		document.getElementById('membernameupd').value==0;
		document.getElementById('membernameupd').disabled=true;
		
    }else
     {
		document.getElementById('membernameupd').disabled=false;
		document.getElementById('membercodeupd').value==0;
		document.getElementById('membercodeupd').disabled=true;
		
     }
}	
	var alphaNumExp = /^[0-9a-zA-Z_ ]+$/;
	var alphaExp = /^[a-zA-Z ]+$/;
	var numericExp = /^[0-9 ]+$/;
	var passwordExp = /^[0-9a-zA-Z_]+$/;
	var phoneNumExp = /^[0-9()-+ ]+$/;
	function Validate1()
	{
		
		if (document.frmup_customer.member_title.value=="0" )
		{
		alert("Please select title.");
		document.frmup_customer.member_title.focus();
		return false;
	    }
		if (document.frmup_customer.member_code.value=="" )
			{
			alert("Please enter member code.");
			document.frmup_customer.member_code.focus();
			return false;
		    }
		if(document.frmup_customer.first_name.value==""){
			alert("Please enter first name.");
			document.frmup_customer.first_name.focus();
			return false;
		}
		if(document.frmup_customer.last_name.value==""){
			alert("Please enter last name.");
			document.frmup_customer.last_name.focus();
			return false;
		}
		if(document.frmup_customer.member_address.value==""){
			alert("Please enter address.");
			document.frmup_customer.member_address.focus();
			return false;
		}
		if(document.frmup_customer.member_city.value==""){
			alert("Please enter city.");
			document.frmup_customer.member_city.focus();
			return false;
		}
		if(document.frmup_customer.member_state.value==""){
			alert("Please enter state.");
			document.frmup_customer.member_state.focus();
			return false;
		}
		if(document.frmup_customer.member_pin.value==""){
			alert("Please enter pin.");
			document.frmup_customer.member_pin.focus();
			return false;
		}
		if(document.frmup_customer.member_email.value==""){
			alert("Please enter email.");
			document.frmup_customer.member_email.focus();
			return false;
		}
		if(document.frmup_customer.member_mobile.value==""){
			alert("Please enter mobile number.");
			document.frmup_customer.member_mobile.focus();
			return false;
		}
		if (document.frmup_customer.member_gender.value=="0" )
		{
		alert("Please select gender.");
		document.frmup_customer.member_gender.focus();
		return false;
	    }
		if (document.frmup_customer.member_status.value=="0" )
		{
		alert("Please select status.");
		document.frmup_customer.member_status.focus();
		return false;
	    }
		if(document.frmup_customer.member_birthdate.value==""){
			alert("Please enter member birthday.");
			document.frmup_customer.member_birthdate.focus();
			return false;
		}
		if(document.frmup_customer.member_anniversary.value=="" && document.getElementById('member_status').value=='Married'){
			alert("Please enter member anniversary.");
			document.frmup_customer.member_anniversary.focus();
			return false;
		}
		
		if(document.getElementById('member_status').value=='Married' && document.frmup_customer.spouse_first_name.value==""){
			alert("Please enter spouse first name.");
			document.frmup_customer.spouse_first_name.focus();
			return false;
		}if(document.getElementById('member_status').value=='Married' && document.frmup_customer.spouse_last_name.value==""){
			alert("Please enter spouse last name.");
			document.frmup_customer.spouse_last_name.focus();
			return false;
		}
		if(document.getElementById('member_status').value=='Married' && document.frmup_customer.spouse_email.value==""){
			alert("Please enter spouse email address.");
			document.frmup_customer.spouse_email.focus();
			return false;
		}
		if(document.getElementById('member_status').value=='Married' && document.frmup_customer.spouse_birth_date.value==""){
			alert("Please enter spouse birth date");
			document.frmup_customer.spouse_birth_date.focus();
			return false;
		}
		//for member details
		<%if(Custlist3!=null  && Custlist3.size()>0){%>
		if(document.frmup_customer.frstrwfullname1.value!=null && document.frmup_customer.frstrwfullname1.value!=""){
		
			if(document.frmup_customer.frstrwage1.value==""){
				alert("Please enter first member's age.");
				document.frmup_customer.frstrwage1.focus();
				return false;
			}
			if(document.frmup_customer.frstrwdate1.value==""){
				alert("Please enter first member's birthdate.");
				document.frmup_customer.frstrwdate1.focus();
				return false;
			}if(document.frmup_customer.frstrwgender1.value==""){
				alert("Please enter first member's gender.");
				document.frmup_customer.frstrwgender1.focus();
				return false;
			}
			if(document.frmup_customer.frstrwrelation1.value==""){
				alert("Please enter first member's relation.");
				document.frmup_customer.frstrwrelation1.focus();
				return false;
			}
			

		}
		<% } else{%>
		if(document.frmup_customer.frstrwfullname.value!=null && document.frmup_customer.frstrwfullname.value!=""){
			
			if(document.frmup_customer.frstrwage.value==""){
				alert("Please enter first member's age.");
				document.frmup_customer.frstrwage.focus();
				return false;
			}
			if(document.frmup_customer.frstrwdate.value==""){
				alert("Please enter first member's birthdate.");
				document.frmup_customer.frstrwdate.focus();
				return false;
			}if(document.frmup_customer.frstrwgender.value==""){
				alert("Please enter first member's gender.");
				document.frmup_customer.frstrwgender.focus();
				return false;
			}
			if(document.frmup_customer.frstrwrelation.value==""){
				alert("Please enter first member's relation.");
				document.frmup_customer.frstrwrelation.focus();
				return false;
			}
		

		}
		if(document.frmup_customer.secondrwfullname.value!=null && document.frmup_customer.secondrwfullname.value!=""){
			
			if(document.frmup_customer.secondrwage.value==""){
				alert("Please enter second member's age.");
				document.frmup_customer.secondrwage.focus();
				return false;
			}
			if(document.frmup_customer.secondrwdate.value==""){
				alert("Please enter second member's birthdate.");
				document.frmup_customer.secondrwdate.focus();
				return false;
			}if(document.frmup_customer.secondrwgender.value==""){
				alert("Please enter second member's gender.");
				document.frmup_customer.secondrwgender.focus();
				return false;
			}
			if(document.frmup_customer.secondrwrelation.value==""){
				alert("Please enter second member's relation.");
				document.frmup_customer.secondrwrelation.focus();
				return false;
			}
		

		}
		
		if(document.frmup_customer.thirdrwfullname.value!=null && document.frmup_customer.thirdrwfullname.value!=""){
			if(document.frmup_customer.thirdrwage.value==""){
				alert("Please enter third member's age.");
				document.frmup_customer.thirdrwage.focus();
				return false;
			}
			if(document.frmup_customer.thirdrwdate.value==""){
				alert("Please enter third member's birthdate.");
				document.frmup_customer.thirdrwdate.focus();
				return false;
			}if(document.frmup_customer.thirdrwgender.value==""){
				alert("Please enter third member's gender.");
				document.frmup_customer.thirdrwgender.focus();
				return false;
			}
			if(document.frmup_customer.thirdrwrelation.value==""){
				alert("Please enter third member's relation.");
				document.frmup_customer.thirdrwrelation.focus();
				return false;
			}
		
		}
		
		if(document.frmup_customer.forthrwfullname.value!=null && document.frmup_customer.forthrwfullname.value!=""){
			if(document.frmup_customer.forthrwage.value==""){
				alert("Please enter fourth member's age.");
				document.frmup_customer.forthrwage.focus();
				return false;
			}
			if(document.frmup_customer.forthrwdate.value==""){
				alert("Please enter fourth member's birthdate.");
				document.frmup_customer.forthrwdate.focus();
				return false;
			}if(document.frmup_customer.forthrwgender.value==""){
				alert("Please enter fourth member's gender.");
				document.frmup_customer.forthrwgender.focus();
				return false;
			}
			if(document.frmup_customer.forthrwrelation.value==""){
				alert("Please enter fourth member's relation.");
				document.frmup_customer.forthrwrelation.focus();
				return false;
			}
		

		}
		/////////////////////////////////////////////////////////
		<%}%>
		document.getElementById("hdnupdt").value="SubmitFormupdt";
		document.frmup_customer.submit();
		
		return true;
	}


	function Showinfo()
	{
		
		if(document.getElementById("membercodeupd").value=="0" &&  document.getElementById("membernameupd").value=="0"){
			alert("Please select member code.");
			document.getElementById("membercodeupd").focus();
			return false;
		}else{
			
			document.frmup_customer.submit();
			return true;
		}	
		
	}
</script>

	<%!String d1; %>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">  
    <tr >
      <td colspan="4">
        <table width="100%" height="23" border="0" align="left" cellpadding="0" cellspacing="0" style="border:0px solid #000000;">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
              <td><div align="left" style="height:25px;" class="pageheading">Update Customer </div></td>
              <td align="right"><table border="0" cellpadding="0" cellspacing="0" style="margin-right:1px; color:#990000;">
              <tr>
              	<td valign="top">
	                          	</td>
              	<td >
              		<form name="updatecustomer" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="myname" value="Updatecustomer"></input>
              			<input type="submit" name="btnupdatecustomer" class="links" value="Update" style="border:none;background: none;" />
              			&nbsp;&nbsp;|&nbsp;
              		</form>              	</td>
              	<td>
              		<form name="Deletecustomer" action="CommonServlet" method="post" style="margin:0px 0px 0px 0px;">
              			<input type="hidden" name="myname" value="Deletecustomer"></input>
              			<input type="submit" name="btndeletecustomer" class="links" value="Delete" style="border:none;background: none;" />
              		</form>              	</td>
              </tr>
              </table>            </td>
          </tr>
        </table></td>
    </tr>
    <form name="frmup_customer" method="post" action="CommonServlet">
    <tr>
      <td colspan="5" align="left" >&nbsp;<input type="hidden" name="myname" value="Updatecustomer"></input></td>
    </tr>
    <tr>
      <td colspan="5" align="left"><table width="100%" border="0">
       
        <tr><% 
						if(Custlist1!=null && Custlist1.size()>0 && strcustid1!=null){ 
					%>
         <td width="18%" align="left" valign="top" ><div align="left" style="margin-left:7px;">
      
					<input type="radio" name="rdoShipmentAdd" id="rdoShipmentAdd" value="dbadd"  onclick="javascript:Show('1');" >
					 Member Code
	  </div></td>

          <td width="24%" align="left">	<select name="membercodeupd" id="membercodeupd" size="2" style="width:182px" disabled="disabled">
					 <option value ="0" style="width:182px;" >--Select Customer Code--</option>
						<% Iterator<?> it1 = Custlist1.iterator(); 
						Object []rowData=null;
						   while(it1.hasNext()){ 
						   rowData = (Object[]) it1.next(); 
						   Integer z5=(Integer) rowData[0];
						   if(z5.toString().equals(strcustid)){
						   %>
							<option value="<%= rowData[0] %>"  selected="selected"><%= rowData[1] %></option>
							<% 
						} else { 
					%><option value="<%= rowData[0] %>"><%= rowData[1] %></option>
					
						<% } }%> <input type="hidden" name="memberid1" id="memberid1" style="width:175px" value="<%= rowData[0]%>">
			</select></td>
					<%} else { %> <td width="18%" align="left" valign="top" ><div align="left" style="margin-left:7px;">
	  <input type="radio" name="rdoShipmentAdd" id="rdoShipmentAdd" value="dbadd"  onclick="javascript:Show('1');" checked="checked">Member Code
	  </div></td>

          <td width="24%" align="left">	<select name="membercodeupd" id="membercodeupd" size="2" style="width:182px" >
					 <option value ="0" style="width:182px;">--Select Customer Code--</option>
						<% Iterator<?> it1 = Custlist1.iterator(); 
						Object []rowData=null;
						   while(it1.hasNext()){ 
						   rowData = (Object[]) it1.next(); 
						   Integer z5=(Integer) rowData[0];
						   if(z5.toString().equals(strcustid)){
						   %>
							<option value="<%= rowData[0] %>"  selected="selected"><%= rowData[1] %></option>
							<% 
						} else { 
					%><option value="<%= rowData[0] %>"><%= rowData[1] %></option>
				
						<% } }%> <input type="hidden" name="memberid1" id="memberid1" style="width:175px" value="<%= rowData[0]%>">
			</select></td><%} %>	
          <td width="3%">&nbsp;</td><% 
						if(Custlist1!=null && Custlist1.size()>0 && strcustid1!=null){ 
					%>
          <td width="17%" valign="top">  <input type="radio" name="rdoShipmentAdd" id="rdoShipmentAdd" value="dbadd"  onclick="javascript:Show('2');" checked="checked"> Member Name
	  </div></td>
          <td width="20%" align="right">	<select name="membernameupd" id="membernameupd" style="width:182px" size="2">
					 <option value ="0" style="width:182px;" >--Select Customer Name--</option>
						<% Iterator<?> it6 = Custlist1.iterator(); 
						Object []rowData1=null;
						while(it6.hasNext()){ 
							rowData1 = (Object[]) it6.next();
						   Integer z5=(Integer) rowData1[0];
						   if(z5.toString().equals(strcustid1)){
							 
						   %>
						   
							<option value="<%= rowData1[0] %>"  selected="selected"><%= rowData1[2]+"  "+rowData1[3]%></option>
							<% 
						} else { 
					%><option value="<%= rowData1[0] %>"><%= rowData1[2]+"  "+rowData1[3] %></option>
					
						<% } }%> <input type="hidden" name="memberid1" id="memberid1" style="width:175px" value="<%= rowData1[0]%>">
			</select></td><%}else{ %><td width="17%" valign="top" align="center">
			<input type="radio" name="rdoShipmentAdd" id="rdoShipmentAdd" value="dbadd"  onclick="javascript:Show('2');" > Member Name
	  </div></td>
          <td width="23%" valign="top" align="right">	
          <select name="membernameupd" id="membernameupd" style="width:182px" size="2" disabled="disabled" >
					 <option value ="0" style="width:182px;">--Select Customer Name--</option>
						<% Iterator<?> it6 = Custlist1.iterator(); 
						Object []rowData1=null;
						while(it6.hasNext()){ 
							rowData1 = (Object[]) it6.next();
						   Integer z5=(Integer) rowData1[0];
						   if(z5.toString().equals(strcustid1)){
													   %>
						   
							<option value="<%= rowData1[0] %>"  selected="selected"><%= rowData1[2]+"  "+rowData1[3]%></option>
							<% 
						} else { 
					%><option value="<%= rowData1[0] %>"><%= rowData1[2]+"  "+rowData1[3] %></option>
				
						<% } }%>	 <input type="hidden" name="memberid1" id="memberid1" style="width:175px" value="<%= rowData1[0]%>">
			</select></td><%} %>
          <td width="7%"><input type="hidden" name="myname" value="Updatecustomer">
          
					<input type="button" name="btnGet" style="margin-left:10px; width:50px; height:24px" value="Get" onClick="return Showinfo();" class="buttons"></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan="5" align="left" >&nbsp;</td>
    </tr>
   <% %>
		
			<tr>
			<td colspan="4">
				<div id="001" style="display:inline;">
					<% 
						if(Custlist2!=null && Custlist2.size()>0 ){ 
					%>
							
	
					<table width="100%" border="0">
  <tr>
    <td colspan="7" style="border-top:1px solid #000000">&nbsp;</td>
    </tr>
  <% 
				             Iterator<?> it2= Custlist2.iterator(); 
						     while(it2.hasNext()){ 
						     Object []rowData = (Object[]) it2.next();
						 %>	
					  <input type="hidden" name="memberid2" id="memberid2" style="width:175px" value="<%= rowData[0]%>">
  <tr>
    <td width="18%" align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Title<span style="color:#FF0000"> *</span></div>  </td>
    <td width="3%" align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td width="24%" align="left" valign="top"><div align="left">
          <select name="member_title" id="member_title" style="width:115px">
           <option  value="<%= rowData[1] %>" > <%= rowData[1] %></option>
           <%if(rowData[1].equals("Mr")) { %>
           <option value ="Mrs" >Mrs</option>
             <option value ="Ms" >Ms</option>
             <%} %>
             <%if(rowData[1].equals("Mrs")) { %>
           <option value ="Mr" >Mr</option>
             <option value ="Ms" >Ms</option>
             
             <%}else { %>
           <option value ="Mr" >Mr</option>
             <option value ="Mrs" >Mrs</option>
             <%} %>
            
          </select>
        </div></td>
    <td width="3%">&nbsp;</td>
    <td width="19%" align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Member Code<span style="color:#FF0000"> *</span></div>  </td>
    <td width="2%" align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td width="31%" align="left" valign="top"> 	<input type="text"  value="<%= rowData[2] %>" name="member_code" id="member_code" style="width:175px"></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">First Name<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="first_name" id="first_name"value="<%= rowData[3] %>" style="width:175px">
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Last Name<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="last_name" id="last_name" value="<%= rowData[4] %>" style="width:175px"></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Address<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
						 <textarea name="member_address" id="member_address"  style="height: 100px" ><%= rowData[5] %></textarea>
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">City<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="member_city" id="member_city" value="<%= rowData[6] %>" style="width:175px"></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
  <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">State<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="member_state" id="member_state" value="<%= rowData[7] %>" style="width:175px">
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Pin<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" value="<%= rowData[8] %>" name="member_pin" id="member_pin" style="width:175px"></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
 <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Email<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="member_email" id="member_email" value="<%= rowData[9] %>" style="width:175px">
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top"> </td>
    <td align="center" valign="top"></td>
    <td> </td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Phone</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="member_phone" id="member_phone" value="<%= rowData[10] %>" style="width:175px">
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Mobile<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="member_mobile" id="member_mobile" value="<%= rowData[11] %>" style="width:175px"></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
 <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Gender<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
          <select name="member_gender" id="member_gender" style="width:115px">
           <option  value="<%= rowData[12] %>" > <%= rowData[12] %></option>
           <%if(rowData[12].equals("Male")) { %>
           <option value ="Female" >Female</option>
           
             <%}else { %>
           <option value ="Male" >Male</option>
             
             <%} %>
            
          </select>
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Marital Status<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td> <div align="left">
          <select name="member_status" id="member_status" style="width:115px" <%if(rowData[13].equals("Married")){ %> onChange="javascript:ShowNoBox(this.value) ;"<%}else { %>
         onChange="javascript:ShowNoBox1(this.value) ;" <%} %>
           >
           
           <option  value="<%= rowData[13] %>" > <%= rowData[13] %></option>
           <%if(rowData[13].equals("Single")) { %>
            <option value ="Married" >Married</option>
           
             <%}else { %>
            <option value ="Single" >Single</option>
             
           
          
            <%} %>
                
          </select>
        </div></td>
  </tr>
     <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
      <%if(rowData[13].equals("Married")){ %>
    
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
    <input type="text" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> value="<%= rowData[14] %>" name="member_birthdate" id="member_birthdate"  style="width:175px"  readonly="readonly">
    

  
        </div></td>
    <td>&nbsp;</td>
      <td align="left" valign="top"  colspan="3">
   <div id="hideweddindate">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
       <td width="37%" align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Wedding Anniversary<span style="color:#FF0000"> *</span></div>  </td>
    <td width="8%" align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
    <td width="55%" align="left" valign="top" > 
    <input type="text" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> value="<%= rowData[15] %>" name="member_anniversary" id="member_anniversary" style="width:175px" readonly="readonly">    
    	</td>  </tr>
</table></div>
</td>
</tr>
  <%} else {%><tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
    				<input type="text" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> value="<%= rowData[14] %>" name="member_birthdate" id="member_birthdate"  style="width:175px"  readonly="readonly">
    

  
        </div></td>
  <td>&nbsp;</td>
    <td align="left" valign="top"  colspan="3">
   <div id="hideweddindate" style="display: none">
   <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
       <td width="37%" align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Wedding Anniversary<span style="color:#FF0000"> *</span></div>  </td>
    <td width="8%" align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
    <td width="55%" align="left" valign="top" > 
     <input type="text" readonly="readonly" name="member_anniversary" style="width:175px" id="member_anniversary" <% if(d1!=null){ %> value="<%= d1 %>" <% } %>>
    	</td>  </tr>
</table></div>
</td>

  </tr>  <%} %>
   <tr>
     <td colspan="7">&nbsp;</td>
     </tr>
      <%
   
      if(rowData[13].equals("Married")  ){ 
      
      
      %>
         <tr>
    <td colspan="7" align="left">
    <div id="hidespouse">
    <table width="100%" border="0" align="left">
     <tr  >
     <td colspan="7" align="left" valign="top">
     
						<div align="left" style="height: 25px;" class="pageheading">Spouse Details :</div></td>
   </tr>
   <tr>
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr >
    <td width="18%" align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Spouse's First Name <span style="color:#FF0000"> *</span></div>  </td>
    <td width="3%" align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
    <td width="24%" align="left" valign="top" ><div align="left">
        <input type="text" value="<%= rowData[16] %>" name="spouse_first_name" id="spouse_first_name" style="width:175px">
        </div></td>
    <td width="4%" align="left" valign="top">&nbsp;</td>
    <td width="23%" align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Spouse's Last Name <span style="color:#FF0000"> *</span></div>  </td>
    <td width="1%" align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
    <td width="27%" align="left" valign="top" > 	
    <input type="text"  value="<%= rowData[17] %>" name="spouse_last_name" id="spouse_last_name" style="width:175px"></td>
  </tr>
   <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr  >
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Spouse's Email <span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text"  value="<%= rowData[18] %>" name="spouse_email" id="spouse_email" style="width:175px">
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date <span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top" > <div align="left">
       <input type="text" value="<%= rowData[19] %>" name="spouse_birth_date" id="spouse_birth_date" style="width:175px" readonly="readonly">
 </div></td>
  </tr>
</table></div>
</td>
    </tr>
   <%}else {%>
      <tr>
    <td colspan="7" align="left">
    <div id="hidespouse" style="display: none;">
    <table width="100%" border="0" align="left">
     <tr  >
     <td colspan="7" align="left" valign="top">
     
						<div align="left" style="height: 25px;" class="pageheading">Spouse Details :</div></td>
   </tr>
   <tr>
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr >
    <td width="18%" align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Spouse's First Name <span style="color:#FF0000"> *</span></div>  </td>
    <td width="3%" align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
    <td width="24%" align="left" valign="top" ><div align="left">
        <input type="text" name="spouse_first_name" id="spouse_first_name" style="width:175px">
        </div></td>
    <td width="4%" align="left" valign="top">&nbsp;</td>
    <td width="23%" align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Spouse's Last Name <span style="color:#FF0000"> *</span></div>  </td>
    <td width="1%" align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
    <td width="27%" align="left" valign="top" > 	<input type="text" name="spouse_last_name" id="spouse_last_name" style="width:175px"></td>
  </tr>
   <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr  >
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Spouse's Email <span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="spouse_email" id="spouse_email" style="width:175px">
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date <span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top" > <div align="left">
       <input type="text" readonly="readonly" style="width:175px" name="spouse_birth_date" id="spouse_birth_date" <% if(d1!=null){ %> value="<%= d1 %>" <% } %>>

  
        </div></td>
  </tr>
</table></div>
</td>
    </tr>  <%}} %>
    
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%  if(Custlist3!=null && Custlist3.size()>0){%>
  <tr>
     <td colspan="7" align="left" valign="top">
		<div align="left" style="height: 25px;" class="pageheading">Family Details :	</div></td>
   </tr>
  
   <tr>
    <td colspan="7">  <div align="left" style="margin-left:10px;">
     <table width="95%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
  <tr>
    <td width="20%" height="28px" style="border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Full Name</span></strong></div></td>
    <td width="18%"  style="border-right:1px solid #000000; background:#CCCCCC;"><div align="center"><strong><span class="style1">Age</span></strong></div></td>
    <td width="20%"  style=" border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Date of Birth</span></strong></div></td>
    <td width="23%"  style=" border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Relationship with member</span></strong></div></td>
     <td width="19%"  style=" border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Sex</span></strong></div></td>
  </tr>
  
  						<% Iterator<?> iterator = Custlist3.iterator(); 
						Object []rowData9=null;
						   while(iterator.hasNext()){ 
						   rowData9 = (Object[]) iterator.next(); 
						   %>
      <tr>
        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;"> 
          <div align="right">  
            <input type="text" name="frstrwfullname1" id="frstrwfullname1" value="<%=rowData9[3] %>" "text-align:right;margin-right:2px "  />
          </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" name="frstrwage1" id="frstrwage1" value="<%=rowData9[5] %>"style="text-align:right;margin-right:2px "  />
         </div></div></td>
       
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;">  
         <div align="right">  
            <input type="text" name="frstrwdate1" id="frstrwdate1" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> value="<%=rowData9[4] %>" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> style="text-align:right;margin-right:2px ">
         </div></div></td>
       
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
          <input type="text" name="frstrwrelation1" id="frstrwrelation1" value="<%=rowData9[1] %>" style="text-align:right;margin-right:2px "  />
         </div></div></td>
         
         <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
          <select name="frstrwgender1" id="frstrwgender1" style="width:115px">
           <option  value="<%= rowData9[2] %>" > <%= rowData9[2] %></option>
           <%if(rowData9[2].equals("Male")) { %>
           <option value ="Female" >Female</option>
             
             <%}else { %>
         
             <option value ="Male" >Male</option>
             <%} %>
            
          </select>
        </div></div></td>
      </tr>
      <%} %>
          
</table>
</div>    </td>
    </tr>   <% } else {%>
      <tr>
     <td colspan="7" align="left" valign="top">
		<div align="left" style="height: 25px;" class="pageheading">Family Details :	</div></td>
   </tr>
  
   <tr>
    <td colspan="7">  <div align="left" style="margin-left:10px;">
     <table width="95%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;">
  <tr>
    <td width="20%" height="28px" style="border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Full Name</span></strong></div></td>
    <td width="18%"  style="border-right:1px solid #000000; background:#CCCCCC;"><div align="center"><strong><span class="style1">Age</span></strong></div></td>
    <td width="20%"  style=" border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Date of Birth</span></strong></div></td>
    <td width="23%"  style=" border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Relationship with member</span></strong></div></td>
     <td width="19%"  style=" border-right:1px solid #000000;background:#CCCCCC;"><div align="center"><strong><span class="style1">Sex</span></strong></div></td>
  </tr>
      <tr>
        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;"> 
          <div align="right">  
            <input type="text" name="frstrwfullname" id="frstrwfullname" style="text-align:right;margin-right:2px "  />
          </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" name="frstrwage" id="frstrwage" style="text-align:right;margin-right:2px "  />
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" readonly="readonly"  name="frstrwdate" id="frstrwdate" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> style="text-align:right;margin-right:2px ">
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
          <input type="text" name="frstrwrelation" id="frstrwrelation" style="text-align:right;margin-right:2px "  />
         </div></div></td>
         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
         <select name="frstrwgender" id="frstrwgender" style="text-align:right;margin-right:2px ">
          <option value ="Male" >Male</option>
            <option value ="Female" >Female</option>
          </select>
        </div></div></td>
      </tr>
       <tr>
        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;"> 
          <div align="right">  
            <input type="text" name="secondrwfullname" id="secondrwfullname" style="text-align:right;margin-right:2px "  />
          </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" name="secondrwage" id="secondrwage" style="text-align:right;margin-right:2px "  />
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" readonly="readonly"  name="secondrwdate" id="secondrwdate" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> style="text-align:right;margin-right:2px ">
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
          <input type="text" name="secondrwrelation" id="secondrwrelation" style="text-align:right;margin-right:2px "  />
         </div></div></td>
         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
         <select name="secondrwgender" id="secondrwgender" style="text-align:right;margin-right:2px ">
          <option value ="Male" >Male</option>
            <option value ="Female" >Female</option>
          </select>
        </div></div></td>
      </tr>
       <tr>
        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;"> 
          <div align="right">  
            <input type="text" name="thirdrwfullname" id="thirdrwfullname" style="text-align:right;margin-right:2px "  />
          </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" name="thirdrwage" id="thirdrwage" style="text-align:right;margin-right:2px "  />
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" readonly="readonly"  name="thirdtrwdate" id="thirdtrwdate" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> style="text-align:right;margin-right:2px ">
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
          <input type="text" name="thirdrwrelation" id="thirdrwrelation" style="text-align:right;margin-right:2px "  />
         </div></div></td>
         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
         <select name="thirdrwgender" id="thirdrwgender" style="text-align:right;margin-right:2px ">
          <option value ="Male" >Male</option>
            <option value ="Female" >Female</option>
          </select>
        </div></div></td>
      </tr>
        <tr>
        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;"> 
          <div align="right">  
            <input type="text" name="forthrwfullname" id="forthrwfullname" style="text-align:right;margin-right:2px "  />
          </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" name="forthrwage" id="forthrwage" style="text-align:right;margin-right:2px "  />
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;">  
         <div align="right">  
           <input type="text" readonly="readonly"  name="forthrwdate" id="forthrwdate" <% if(d1!=null){ %> value="<%= d1 %>" <% } %> style="text-align:right;margin-right:2px ">
         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
          <input type="text" name="forthrwrelation" id="forthrwrelation" style="text-align:right;margin-right:2px "  />
         </div></div></td>
         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
         <select name="forthrwgender" id="forthrwgender" style="text-align:right;margin-right:2px ">
          <option value ="Male" >Male</option>
            <option value ="Female" >Female</option>
          </select>
        </div></div></td>
      </tr>
</table>
</div>
    </td>
    </tr>
    
    
    <%} %>
    
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
						<td align="left">&nbsp;</td>
						<td align="left" valign="top">&nbsp;</td>
						<td align="left" colspan="5">
						<div align="left"> <input type="hidden" name="hdnupdt" id="hdnupdt" value=""></input>
				        <input type="submit" name="save" value="Update" onClick="return Validate1();" class="buttons" style="width: 80px;">
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         <a href="Search.jsp" onClick="javascript:cancelAction();"><input type="button" class="buttons" value="Cancel" style="width: 80px;">
				     </a> </div></td>
					</tr>
                    <tr>
						<td colspan="7" align="left">&nbsp;</td>
					</tr>
</table>
				  <% } %>	
				</div>			</td>
		</tr>
	</form>
  </table>
<%@ include file="includes/footer.jsp" %>
<%if(request.getAttribute("result")!=null){
	%>
	<script type="text/javascript">
	   alert("Customer updated successfully.");
	   </script>
	   <%} %>