<%@ include file="includes/header.jsp"%>

<% String mytype= (String) session.getAttribute("mytype");
   if(mytype.equals("U"))
   {   
    response.sendRedirect("Search.jsp")	 ;  
   }
%>
<link rel="stylesheet" type="text/css" href="css/epoch_styles.css" /> 
	<script type="text/javascript" src="javascript/epoch_classes.js"></script> 
<script type="text/javascript"> 
	var calendar1,calendar2,calendar3;  
	window.onload = function() 
	{ 
		calendar1 = new Epoch('cal1','popup',document.getElementById('member_birthdate'),false);
				
 	}; </script> 
 	<%! String d1,d2; %>
<script type="text/javascript">
var alphaNumExp = /^[0-9a-zA-Z_ ]+$/;
var alphaExp = /^[a-zA-Z ]+$/;
var numericExp = /^[0-9 ]+$/;
var passwordExp = /^[0-9a-zA-Z_]+$/;
var phoneNumExp = /^[0-9()-+ ]+$/;
function ShowNoBox(typeval){
	if(typeval=='Married'){
		document.getElementById("hidespouse").style.display='inline';
		document.getElementById("hideweddindate").style.display='inline';
		calendar2 = new Epoch('cal1','popup',document.getElementById('member_anniversary'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('frstrwdate'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('secondrwdate'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('thirdtrwdate'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('forthrwdate'),false);
        calendar3 = new Epoch('cal1','popup',document.getElementById('spouse_birth_date'),false);
	}else{
		document.getElementById("hidespouse").style.display='none';
		document.getElementById("hideweddindate").style.display='none';
		calendar3 = new Epoch('cal1','popup',document.getElementById('frstrwdate'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('secondrwdate'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('thirdtrwdate'),false);
		calendar3 = new Epoch('cal1','popup',document.getElementById('forthrwdate'),false);
		document.getElementById("spouse_birth_date").value="";
		document.getElementById("member_anniversary").value="";
		document.getElementById("frstrwdate").value="";
		document.getElementById("secondrwdate").value="";
		document.getElementById("thirdtrwdate").value="";
		document.getElementById("forthrwdate").value="";
		
	}
} 

function cancelAction()
{
	document.location.href("Search.jsp");
}


function Validate()
{
	if (document.frmaddmember.member_title.value=="0" )
	{
	alert("Please select title.");
	document.frmaddmember.member_title.focus();
	return false;
    }
	if (document.frmaddmember.member_code.value=="" )
		{
		alert("Please enter member code.");
		document.frmaddmember.member_code.focus();
		return false;
	    }
	if(document.frmaddmember.first_name.value==""){
		alert("Please enter first name.");
		document.frmaddmember.first_name.focus();
		return false;
	}
	if(document.frmaddmember.last_name.value==""){
		alert("Please enter last name.");
		document.frmaddmember.last_name.focus();
		return false;
	}
	if(document.frmaddmember.member_address.value==""){
		alert("Please enter address.");
		document.frmaddmember.member_address.focus();
		return false;
	}
	if(document.frmaddmember.member_city.value==""){
		alert("Please enter city.");
		document.frmaddmember.member_city.focus();
		return false;
	}
	if(document.frmaddmember.member_state.value==""){
		alert("Please enter state.");
		document.frmaddmember.member_state.focus();
		return false;
	}
	if(document.frmaddmember.member_pin.value==""){
		alert("Please enter pin.");
		document.frmaddmember.member_pin.focus();
		return false;
	}
	if(document.frmaddmember.member_email.value==""){
		alert("Please enter email.");
		document.frmaddmember.member_email.focus();
		return false;
	}
	if(document.frmaddmember.member_mobile.value==""){
		alert("Please enter mobile number.");
		document.frmaddmember.member_mobile.focus();
		return false;
	}
	if (document.frmaddmember.member_gender.value=="0" )
	{
	alert("Please select gender.");
	document.frmaddmember.member_gender.focus();
	return false;
    }
	if (document.frmaddmember.member_status.value=="0" )
	{
	alert("Please select status.");
	document.frmaddmember.member_status.focus();
	return false;
    }
	
	if(document.frmaddmember.member_birthdate.value==""){
		alert("Please enter member birthday.");
		document.frmaddmember.member_birthdate.focus();
		return false;
	}

	if(document.frmaddmember.member_anniversary.value=="" && document.getElementById('member_status').value=='Married'){
		alert("Please enter member anniversary.");
		document.frmaddmember.member_anniversary.focus();
		return false;
	}
	
	
	if(document.getElementById('member_status').value=='Married' && document.frmaddmember.spouse_first_name.value==""){
		alert("Please enter spouse first name.");
		document.frmaddmember.spouse_first_name.focus();
		return false;
	}if(document.getElementById('member_status').value=='Married' && document.frmaddmember.spouse_last_name.value==""){
		alert("Please enter spouse last name.");
		document.frmaddmember.spouse_last_name.focus();
		return false;
	}
	if(document.getElementById('member_status').value=='Married' && document.frmaddmember.spouse_email.value==""){
		alert("Please enter spouse email address.");
		document.frmaddmember.spouse_email.focus();
		return false;
	}
	if(document.getElementById('member_status').value=='Married' && document.frmaddmember.spouse_birth_date.value==""){
		alert("Please enter spouse birth date");
		document.frmaddmember.spouse_birth_date.focus();
		return false;
	}
	if (document.frmaddmember.member_status.value=="0" )
	{
	alert("Please select status.");
	document.frmaddmember.member_status.focus();
	return false;
    }
	//for member details
	if(document.frmaddmember.frstrwfullname.value!=null && document.frmaddmember.frstrwfullname.value!=""){
		if(document.frmaddmember.frstrwage.value==""){
			alert("Please enter first member's age.");
			document.frmaddmember.frstrwage.focus();
			return false;
		}
		if(document.frmaddmember.frstrwdate.value==""){
			alert("Please enter first member's birthdate.");
			document.frmaddmember.frstrwdate.focus();
			return false;
		}if(document.frmaddmember.frstrwgender.value==""){
			alert("Please enter first member's gender.");
			document.frmaddmember.frstrwgender.focus();
			return false;
		}
		if(document.frmaddmember.frstrwrelation.value==""){
			alert("Please enter first member's relation.");
			document.frmaddmember.frstrwrelation.focus();
			return false;
		}
		
	}
	
	if(document.frmaddmember.secondrwfullname.value!=null && document.frmaddmember.secondrwfullname.value!=""){
		if(document.frmaddmember.secondrwage.value==""){
			alert("Please enter second member's age.");
			document.frmaddmember.secondrwage.focus();
			return false;
		}
		if(document.frmaddmember.secondrwdate.value==""){
			alert("Please enter second member's birthdate.");
			document.frmaddmember.secondrwdate.focus();
			return false;
		}if(document.frmaddmember.secondrwgender.value==""){
			alert("Please enter second member's gender.");
			document.frmaddmember.secondrwgender.focus();
			return false;
		}
		if(document.frmaddmember.secondrwrelation.value==""){
			alert("Please enter second member's relation.");
			document.frmaddmember.secondrwrelation.focus();
			return false;
		}
		
	}
	
	if(document.frmaddmember.thirdrwfullname.value!=null && document.frmaddmember.thirdrwfullname.value!=""){
		if(document.frmaddmember.thirdrwage.value==""){
			alert("Please enter third member's age.");
			document.frmaddmember.thirdrwage.focus();
			return false;
		}
		if(document.frmaddmember.thirdrwdate.value==""){
			alert("Please enter third member's birthdate.");
			document.frmaddmember.thirdrwdate.focus();
			return false;
		}if(document.frmaddmember.thirdrwgender.value==""){
			alert("Please enter third member's gender.");
			document.frmaddmember.thirdrwgender.focus();
			return false;
		}
		if(document.frmaddmember.thirdrwrelation.value==""){
			alert("Please enter third member's relation.");
			document.frmaddmember.thirdrwrelation.focus();
			return false;
		}
		
	}
	
	if(document.frmaddmember.forthrwfullname.value!=null && document.frmaddmember.forthrwfullname.value!=""){
		if(document.frmaddmember.forthrwage.value==""){
			alert("Please enter fourth member's age.");
			document.frmaddmember.forthrwage.focus();
			return false;
		}
		if(document.frmaddmember.forthrwdate.value==""){
			alert("Please enter fourth member's birthdate.");
			document.frmaddmember.forthrwdate.focus();
			return false;
		}if(document.frmaddmember.forthrwgender.value==""){
			alert("Please enter fourth member's gender.");
			document.frmaddmember.forthrwgender.focus();
			return false;
		}
		if(document.frmaddmember.forthrwrelation.value==""){
			alert("Please enter fourth member's relation.");
			document.frmaddmember.forthrwrelation.focus();
			return false;
		}
		
	}
	/////////////////////////////////////////////////////////
		
	document.frmaddmember.submit();
	return true;
}
</script>

 	
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
<form name="frmaddmember" method="post" action="CommonServlet">

	<tr>
		<td colspan="7" align="left">
        <input type="hidden" name="myname" value="Addcustomer"></input>

						</td>
			</tr>
							<tr>
				<td colspan="7" align="left">
				
				<table width="100%" border="0" align="left" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="7" align="left" valign="top">&nbsp;</td>
    </tr>
  <tr>
						<td align="left" colspan="7">
						<div align="left" style="height: 25px;" class="pageheading">Registration Form :						</div>						</td></tr>
                        <tr>
    <td width="17%" align="left" valign="top">&nbsp;</td>
    <td width="4%" align="center" valign="top">&nbsp;</td>
    <td width="24%" align="left" valign="top">&nbsp;</td>
    <td width="3%" align="left" valign="top">&nbsp;</td>
    <td width="19%" align="left" valign="top">&nbsp;</td>
    <td width="4%" align="center" valign="top">&nbsp;</td>
    <td width="29%" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Title<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
          <select name="member_title" id="member_title" style="width:115px">
           <option value ="0" >Select Title</option>
          <option value ="Mr" >Mr</option>
            <option value ="Mrs" >Mrs</option>
             <option value ="Ms" >Ms</option>
          </select>
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Member Code<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="member_code" id="member_code" style="width:175px"></td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">First Name<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="first_name" id="first_name" style="width:175px">
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Last Name<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="last_name" id="last_name" style="width:175px"></td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
  </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Address<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
						 <textarea name="member_address" id="member_address" style="height: 100px" ></textarea>
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">City<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="member_city" id="member_city" style="width:175px"></td>
  </tr>
  <tr>
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
  <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">State<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="member_state" id="member_state" style="width:175px">
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Pin<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="member_pin" id="member_pin" style="width:175px"></td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
 <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Email<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="member_email" id="member_email" style="width:175px">
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top"> </td>
    <td align="center" valign="top"></td>
    <td align="left" valign="top"> </td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Phone</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <input type="text" name="member_phone" id="member_phone" style="width:175px">
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Mobile<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> 	<input type="text" name="member_mobile" id="member_mobile" style="width:175px"></td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
 <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Gender<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
          <select name="member_gender" id="member_gender" style="width:115px">
            <option value ="0" >Select Gender</option>
          <option value ="Male" >Male</option>
            <option value ="Female" >Female</option>
          </select>
        </div></td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Marital Status<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> <div align="left">
      <select name="member_status" id="member_status" style="width:115px" onChange="javascript:ShowNoBox(this.value);" >
        <option value ="0" >Select Status</option>
        <option value ="Single" >Single</option>
        <option value ="Married" >Married</option>
      </select>
    </div></td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="7" align="left">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date<span style="color:#FF0000"> *</span></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
       <input type="text" readonly="readonly" name="member_birthdate" style="width:175px" id="member_birthdate" <% if(d1!=null){ %> value="<%= d1 %>" <% } %>>

  
        </div></td>
    <td align="left" valign="top" >&nbsp;</td>
   <td align="left" valign="top"  colspan="3">
   <div id="hideweddindate">
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
  </tr>
  
   <tr>
     <td colspan="7" align="left">&nbsp;</td>
   </tr>
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
    </tr>

   
 
   <tr>
    <td colspan="7" align="left" valign="top">&nbsp;</td>
    </tr>
  <tr>
     <td colspan="7" align="left" valign="top">
		<div align="left" style="height: 25px;" class="pageheading">Family Details :	</div></td>
   </tr>
  
   <tr>
    <td colspan="7" align="left" valign="top">  <div align="left" style="margin-left:10px;">
     <table width="98%" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #000000;" align="left">
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
   <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
   <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
						<td align="left" valign="top">&nbsp;</td>
						<td align="left" valign="top">&nbsp;</td>
						<td colspan="5" align="left" valign="top">
						<div align="left"><input type="button" name="save"
							value="Preview" class="buttons" onclick="return Validate();"
							style="width: 80px;" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="reset" name="set" class="buttons" style="width: 80px;" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <a href="Search.jsp" onclick="javascript:cancelAction();"><input type="button" value="Cancel" class="buttons" style="width: 80px;">
						</a></div></td>
					</tr>
                    <tr>
						<td colspan="7" align="left">&nbsp;</td>
					</tr>
</table>			  </td>
			</tr></form>

		</table>
		<%@ include file="includes/footer.jsp"%>
		
<%if(request.getAttribute("result")!=null){
	%>
	<script type="text/javascript">
	   alert("Member added successfully.");
	   </script>
	   <%} %>