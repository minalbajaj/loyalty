<%@ include file="includes/headerInvoice.jsp" %>

<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.List" %>
<% String mytype= (String) session.getAttribute("mytype");
   if(mytype.equals("U"))
   {   
    response.sendRedirect("Search.jsp")	 ;  
   }
%>
<%  List<?> rsReceipt=(List<?>)request.getAttribute("updatelist2"); 
List<?> rsReceipt1=(List<?>)request.getAttribute("updatelist3");
  %>

<link rel="stylesheet" type="text/css" href="css/epoch_styles.css" /> 
	<script type="text/javascript" src="javascript/epoch_classes.js"></script> 

 <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td colspan="6">
		<table width="100%" height="23" border="0" align="center"
			cellpadding="1" cellspacing="0" style="border: 0px solid #000000;">
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>

				<td colspan="3">
				<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
					<tr>
						<td align="left">
						<div align="left" style="height: 25px;" class="pageheading">Preview Registration Form	:					</div>						</td>
						<td align="right">
							</td>
					</tr>
				</table>				</td>
			</tr>
<form name="frmaddmember" method="post" action="cardActivation">
				<input type="hidden" name="myname" value="Addcustomer"></input>
			<tr>
				<td colspan="3" align="left">
				
				<table width="100%" border="0" align="center">
  <tr>
    <td width="17%">&nbsp;</td>
    <td width="3%">&nbsp;</td>
    <td width="22%">&nbsp;</td>
    <td width="5%">&nbsp;</td>
    <td width="19%">&nbsp;</td>
    <td width="2%">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
      <% 
		if(rsReceipt!=null && rsReceipt.size()>0){ 
			Iterator<?> it21 = rsReceipt.iterator(); 
	 		while(it21.hasNext()){ 
	 			Object rowData[]= (Object[]) it21.next();

				   Integer z5=(Integer) rowData[0];

		 		%>  
  <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Title</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top">          <%=rowData[1] %>        </td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Member Code</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top">  <%=rowData[2] %>    </td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">First Name</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top">
          <%=rowData[3] %>           </td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Last Name</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> <%=rowData[4] %> </td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
  </tr>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Address</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
						 <%=rowData[5] %>
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">City</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[6] %> </td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
  <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels"></div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[7] %></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Pin</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> <%=rowData[8] %>	</td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
 <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Email</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[9] %></td>
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
    <td align="left" valign="top"><%=rowData[10] %></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Mobile</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[11] %></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
 <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Gender</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><div align="left">
        <%=rowData[12] %>
        </div></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Marital Status</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"> <div align="left">
         <%=rowData[13] %></div></td>
  </tr>
  <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
     <%if(rowData[13].equals("Married")){ %>
    
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
      <% 
					String sst = null,stt=null;
						
								sst = (rowData[14].toString()).substring(0,10);
								stt = sst.substring(8,10)+"/"+sst.substring(5,7)+"/"+sst.substring(0,4);
					%>
	
    <td align="left" valign="top"><div align="left">
       <%=stt %>

  
        </div></td>
    <td>&nbsp;</td>
   <td align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels">Wedding Anniversary</div>  </td>
    <td align="center" valign="top" ><div align="center" class="labels"><b>:</b></div></td>
     <% String sst1 = null,stt1=null;
         	 
			
			sst1 = (rowData[15].toString()).substring(0,10);
			stt1 = sst1.substring(8,10)+"/"+sst1.substring(5,7)+"/"+sst1.substring(0,4);
	 		
%>

<td align="left" valign="top" ><%=stt1 %>
    	</td>
  </tr>
  <%} else { %>
   <tr>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date</div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
      <% 
					String sst = null,stt=null;
						
								sst = (rowData[14].toString()).substring(0,10);
								stt = sst.substring(8,10)+"/"+sst.substring(5,7)+"/"+sst.substring(0,4);
					%>
	
    <td align="left" valign="top"><div align="left">
       <%=stt %>

  
        </div></td>
    <td>&nbsp;</td>
   <td align="left" valign="top" >
    <div align="left" style="margin-left:15px;" class="labels"></div>  </td>
    <td align="center" valign="top" ><div align="center" class="labels"></div></td>
   
<td align="left" valign="top" >
    	</td>
  </tr>
  <%} %>
   <tr>
     <td colspan="7">&nbsp;</td>
     </tr>
    <%if(rowData[13].equals("Married")){ %>
   <tr  >
     <td colspan="7" align="left" valign="top">
     
						<div align="left" style="height: 25px;" class="pageheading">Spouse Details :						</div></td>
   </tr>
   <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
   <tr  >
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Spouse's First Name </div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[16] %></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Spouse's Last Name </div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[17] %></td>
  </tr>
   <tr>
    <td colspan="7">&nbsp;</td>
    </tr>
   <tr  >
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Spouse's Email </div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top"><%=rowData[18] %></td>
    <td>&nbsp;</td>
    <td align="left" valign="top">
    <div align="left" style="margin-left:15px;" class="labels">Birth Date </div>  </td>
    <td align="center" valign="top"><div align="center" class="labels"><b>:</b></div></td>
    <td align="left" valign="top" > <div align="left">  <% 
					String sst2 = null,stt2=null;
						
								sst2 = (rowData[19].toString()).substring(0,10);
								stt2 = sst2.substring(8,10)+"/"+sst2.substring(5,7)+"/"+sst2.substring(0,4);
					%>
    <%=stt2 %>  
        </div></td>
  </tr>
 <%}} %>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%if(rsReceipt1!=null && rsReceipt1.size()>0){ %>
  <tr>
     <td colspan="7" align="left" valign="top">
		<div align="left" style="height: 25px;" class="pageheading">Family Details :</div></td>
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
   <% 
		 
			Iterator<?> it22 = rsReceipt1.iterator(); 
	 		while(it22.hasNext()){ 
	 			Object rowData1[]= (Object[]) it22.next();

				   Integer z6=(Integer) rowData1[0];

		 		%>  
      <tr>
        <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;"> 
          <div align="right">  
           <%=rowData1[3] %>
          </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  
         <div align="right">  
            <%=rowData1[5] %>         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;">
         <div align="left" style="margin-left:4px;">  
         <div align="right">   <% 
					String sst3 = null,stt3=null;
						
								sst3 = (rowData1[4].toString()).substring(0,10);
								stt3 = sst3.substring(8,10)+"/"+sst3.substring(5,7)+"/"+sst3.substring(0,4);
					%>
    <%=stt3 %>  

         </div></div></td>
       <td style="border-top:1px solid #000000;border-right:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
           <%=rowData1[1] %>
         </div></div></td>
         <td style="border-top:1px solid #000000;"><div align="left" style="margin-left:4px;">  <div align="right">  
             <%=rowData1[2] %>
              </div></div></td>
      </tr>
           </table>
</div>
    </td>
    </tr> <%} }%>
    
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
						<div align="left"><input type="submit" name="save"
							value="Submit" class="buttons" onClick="return Validate();"
							style="width: 80px;" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="button" name="set" value="Edit" class="buttons" style="width: 80px;" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <a href="Search.jsp" onClick="javascript:cancelAction();"><input type="button" value="Cancel" class="buttons" style="width: 80px;">
						</a></div></td>
					</tr>
                    <tr>
						<td colspan="7" align="left">&nbsp;</td>
					</tr>
</table>			  </td>
			</tr><%} %>
		</table>
		</form>
<%@ include file="includes/footer.jsp"%>