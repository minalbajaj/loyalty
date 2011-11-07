package com.loyalty;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.loyalty.utils.SessionUtils;

public class CommonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommonServlet() {
		super();
	}



	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher;
		SessionFactory factory = SessionUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tr;
		Query strQuery = null;
		HttpSession session1 = request.getSession();
		Date dtToday = new Date();
		try {
			if (request.getParameter("Pagename") != null && request.getParameter("Pagename").equals("login")) {
				String clientUser = request.getParameter("us");
				String clientPass = request.getParameter("ps");
				boolean flag = true;
				Query qlogin = null;
				qlogin = session.createQuery("select u.pk_user_id ,u.username, u.password,user_type from User u where u.username='"+ clientUser + "'");

				List<?> login = qlogin.list();
				if (login.size() > 0) {
					Iterator<?> itlogin = login.iterator();
					Object rowData[] = null;
					while (itlogin.hasNext()) {
						rowData = (Object[]) itlogin.next();
						if (rowData[2].equals(clientPass)) {
							session1.setAttribute("myname", clientUser);
							session1.setAttribute("mystatus", "Loggedin");
							session1.setAttribute("mytype", rowData[3].toString());
							session1.setAttribute("myid", rowData[0]);
							session1.setAttribute("mypwd", rowData[2]);
						} else {
							flag = false;
						}
					}
				} else {
					flag = false;
				}
				if (flag == false) 
				{
					request.setAttribute("IU", "iu");
					dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
					dispatcher.forward(request, response);


				} else {
					dispatcher = getServletContext().getRequestDispatcher("/addUser.jsp");
					dispatcher.forward(request, response);
				}
			} else if (request.getParameter("myname") != null && request.getParameter("myname").equals("AddUser")) {
				if (request.getParameter("user_name") != null) {
					tr = session.beginTransaction();
					String name = request.getParameter("user_name");
					String radio1 = request.getParameter("usertype");
					String pass = request.getParameter("user_pass");
					Query q5 = session.createQuery("Select u.pk_user_id ,u.username, u.password from User u where u.username='"+ name + "'");
					List<?> userlistrd = q5.list();
					Iterator<?> itlogin1 = userlistrd.iterator();
					if (userlistrd != null && userlistrd.size() > 0) {
						request.setAttribute("userlistrd", userlistrd);
					} else {
						User users = new User();
						users.setUsername(name);
						users.setPassword(pass);
						users.setUser_update_date(dtToday);
						int intTrnUserID = Integer.parseInt(session1.getAttribute("myid").toString());
						users.setUpdate_user_id(intTrnUserID);
						users.setUser_type(radio1);
						session.save(users);
						request.setAttribute("result", "DONE");
						tr.commit();
					}
				}
				dispatcher = getServletContext().getRequestDispatcher("/addUser.jsp");
				dispatcher.forward(request, response);
			} else if (request.getParameter("userid1") != null|| (request.getParameter("myname") != null && request.getParameter("myname").equals("UpdateUser"))) {

				int a1 = 0;
				if (request.getParameterValues("userid1") != null) {
					a1 = Integer.parseInt(request.getParameter("userid1"));
				}
				tr = session.beginTransaction();
				if (request.getParameter("hdnupdtuser") != null && request.getParameter("hdnupdtuser").equals("SubmitFormuser")) {
					String name1 = request.getParameter("txtuser_name");
					String pass1 = request.getParameter("user_pass");
					User user1 = (User) session.get(User.class, a1);
					user1.setUsername(name1);
					user1.setPassword(pass1);

					user1.setUser_update_date(dtToday);
					int intTrnUserID = Integer.parseInt(session1.getAttribute("myid").toString());
					user1.setUpdate_user_id(intTrnUserID);
					session.update(user1);
					request.setAttribute("result", "DONE");
				}

				Query q5 = session.createQuery("Select u.pk_user_id ,u.username from User u where u.user_type='U'");

				List<?> userlist1 = q5.list();
				request.setAttribute("updatelist1", userlist1);
				String r2 = null;
				if (request.getParameter("username1") != null && (request.getParameter("hdnupdtuser") == null || !request.getParameter("hdnupdtuser").equals("SubmitFormuser"))) {
					r2 = request.getParameter("username1");
					request.setAttribute("struserid", r2);
					Query q6 = session.createQuery("Select u.pk_user_id,u.username,u.password from User u where u.pk_user_id="+ r2);
					List<?> userlist2 = q6.list();
					request.setAttribute("updatelist2", userlist2);
				}
				tr.commit();
				dispatcher = getServletContext().getRequestDispatcher("/updateUser.jsp");
				dispatcher.forward(request, response);
			} else if (request.getParameterValues("on") != null || (request.getParameter("myname") != null && request.getParameter("myname").equals("DeleteUser"))) {
				String Check[] = null;
				Integer si = 0;
				if (request.getParameterValues("on") != null) {
					Check = request.getParameterValues("on");
				}
				if (Check != null) {
					for (int i = 0; i < Check.length; i++) {
						si = Integer.valueOf(Check[i]);
						User u = (User) session.get(User.class, si);
						session.delete(u);
						request.setAttribute("result", si);
					}
				}
				tr = session.beginTransaction();
				Query qqq = session.createQuery("Select u.pk_user_id ,u.username from User u where u.user_type='U'");
				strQuery = session.createQuery("select count(u.pk_user_id),u.username from User u where u.user_type='U'");
				int istart = 0;
				int iPageNo = 0;
				int cPageNo = 1;
				int itotalpages = 0;
				int ilength = 10;
				List<?> ltry = strQuery.list();
				Iterator<?> ittry = ltry.iterator();
				double d = 0;
				String str = null;
				Object rowData1[] = null;
				while (ittry.hasNext()) {
					rowData1 = (Object[]) ittry.next();
					str = rowData1[0].toString();
					d = Double.valueOf(str).doubleValue();
					itotalpages = ((int) (Math.ceil((double) d / ilength)));
				}
				if (request.getParameter("iPageNo") != null) {
					cPageNo = Integer.parseInt(request.getParameter("iPageNo"));
					if (cPageNo == 0) {
						cPageNo = 1;
					} else if (cPageNo > itotalpages) {
						cPageNo = itotalpages;
					}
					istart = (cPageNo - 1) * ilength;
					iPageNo = cPageNo * ilength;
					qqq.setFirstResult(istart);
					qqq.setMaxResults(ilength);
				} else {
					qqq.setFirstResult(istart);
					qqq.setMaxResults(ilength);
				}
				List<?> l13 = qqq.list();
				request.setAttribute("abc", l13);
				request.setAttribute("itotalpages", itotalpages);
				request.setAttribute("cPageNo", cPageNo);
				request.setAttribute("iPageNo", iPageNo);
				request.setAttribute("ilength", ilength);
				request.setAttribute("str", str);
				tr.commit();
				dispatcher = getServletContext().getRequestDispatcher("/deleteUser.jsp");
				dispatcher.forward(request, response);
			}
			// Change Password
			else if ((request.getParameter("myname") != null && request.getParameter("myname").equals("changepassword"))) {
				int a1 = 0;
				tr = session.beginTransaction();
				if (session1.getAttribute("myid") != null) {
					a1 = Integer.parseInt(session1.getAttribute("myid")
							.toString());
					String userpass = request.getParameter("cnfmpass");
					User user1 = (User) session.get(User.class, a1);
					user1.setPassword(userpass);
					session.update(user1);
					session1.setAttribute("mypwd", userpass);
					request.setAttribute("result", "DONE");
				}
				tr.commit();
				dispatcher = getServletContext().getRequestDispatcher("/changePassword.jsp");
				dispatcher.forward(request, response);
			}
			// FOR Member
			else if (request.getParameter("myname") != null && request.getParameter("myname").equals("Addcustomer")) {
				tr = session.beginTransaction();

				if (request.getParameter("member_code") != null) {
					String member_code = request.getParameter("member_code");
					String member_title = request.getParameter("member_title");
					String first_name = request.getParameter("first_name");
					String last_name = request.getParameter("last_name");
					String member_address = request.getParameter("member_address");
					String member_city = request.getParameter("member_city");
					String member_state = request.getParameter("member_state");
					String member_pin = request.getParameter("member_pin");
					String member_email = request.getParameter("member_email");
					String member_phone = request.getParameter("member_phone");
					String member_mobile = request.getParameter("member_mobile");
					String member_gender = request.getParameter("member_gender");
					String member_status = request.getParameter("member_status");
					String spouse_first_name = request.getParameter("spouse_first_name");
					String spouse_last_name = request.getParameter("spouse_last_name");
					String spouse_email = request.getParameter("spouse_email");
					Member member=new Member();
					member.setMemberCode(member_code);
					member.setTitle(member_title);
					member.setFirstName(first_name);
					member.setLastName(last_name);
					member.setAddress(member_address);
					member.setCity(member_city);
					member.setState(member_state);
					member.setPin(member_pin);
					member.setPhone(member_phone);
					member.setMobile(member_mobile);
					member.setEmail(member_email);
					member.setGender(member_gender);
					member.setMaritalStatus(member_status);
					member.setSpouseFname(spouse_first_name);
					member.setSpouseLname(spouse_last_name);
					member.setSpouseEmail(spouse_email);
					String sts=null,member_birthdateDatein=null;
					String member_birthdate = (String)request.getParameter("member_birthdate");
					if (member_birthdate!=null && member_birthdate!="" && member_birthdate.length() > 0) {
						sts = (member_birthdate.toString()).substring(0, 10);
						member_birthdateDatein = sts.substring(0, 4) + "/"+ sts.substring(5, 7) + "/"+ sts.substring(8, 10);
					}
					member.setBirthDate(member_birthdateDatein);
					String sts1=null,spouse_birth_dateDatein=null;
					String spouse_birth_date = (String)request.getParameter("spouse_birth_date");
					if (spouse_birth_date!=null && spouse_birth_date!="" && spouse_birth_date.length() > 0) {
						sts1 = (spouse_birth_date.toString()).substring(0, 10);
						spouse_birth_dateDatein = sts1.substring(0, 4) + "/"+ sts1.substring(5, 7) + "/"+ sts1.substring(8, 10);
					}
					member.setSpouseBdate(spouse_birth_dateDatein);

					String sts2=null,member_anniversaryDatein=null;
					String member_anniversary = (String)request.getParameter("member_anniversary");
					if (member_anniversary!=null && member_anniversary!="" && member_anniversary.length() > 0) {
						sts2 = (member_anniversary.toString()).substring(0, 10);
						member_anniversaryDatein = sts2.substring(0, 4) + "/"+ sts2.substring(5, 7) + "/"+ sts2.substring(8, 10);
					}
					member.setAnnivDate(member_anniversaryDatein);

					Set mdetails = new HashSet();
					if(request.getParameter("frstrwfullname")!=null && request.getParameter("frstrwfullname")!=""){
						String frstrwfullname = request.getParameter("frstrwfullname");
						int frstrwage = Integer.parseInt(request.getParameter("frstrwage"));
						String frstrwrelation = request.getParameter("frstrwrelation");
						String frstrwgender = request.getParameter("frstrwgender");
						String sts3=null,frstrwdate1Datein1=null;
						String frstrwdate1 = (String)request.getParameter("frstrwdate");

						if (frstrwdate1!=null && frstrwdate1!="" && frstrwdate1.length() > 0) {
							sts3 = (frstrwdate1.toString()).substring(0, 10);
							frstrwdate1Datein1 = sts3.substring(0, 4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8,10);
						}
						mdetails.add(new Memberfamily(frstrwage,frstrwrelation,frstrwgender,frstrwfullname,frstrwdate1Datein1));
					}
					if(request.getParameter("secondrwfullname")!=null && request.getParameter("secondrwfullname")!=""){

						String secondrwfullname = request.getParameter("secondrwfullname");
						int secondrwage = Integer.parseInt(request.getParameter("secondrwage"));
						String secondrwrelation = request.getParameter("secondrwrelation");
						String secondrwgender = request.getParameter("secondrwgender");
						String sts3=null,secondDatein1=null;
						String secondrwdate = (String)request.getParameter("secondrwdate");

						if (secondrwdate!=null && secondrwdate!="" && secondrwdate.length() > 0) {
							sts3 = (secondrwdate.toString()).substring(0, 10);
							secondDatein1 = sts3.substring(0,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8,10);
						}
						mdetails.add(new Memberfamily(secondrwage,secondrwrelation,secondrwgender,secondrwfullname,secondDatein1));
					}
					if(request.getParameter("thirdrwfullname")!=null && request.getParameter("thirdrwfullname")!=""){

						String thirdrwfullname = request.getParameter("thirdrwfullname");
						int thirdrwage = Integer.parseInt(request.getParameter("thirdrwage"));
						String thirdrwrelation = request.getParameter("thirdrwrelation");
						String thirdrwgender = request.getParameter("thirdrwgender");
						String sts3=null,thirdtrwdatedatein=null;
						String thirdtrwdate = (String)request.getParameter("thirdtrwdate");

						if (thirdtrwdate!=null && thirdtrwdate!="" && thirdtrwdate.length() > 0) {
							sts3 = (thirdtrwdate.toString()).substring(0, 10);
							thirdtrwdatedatein = sts3.substring(0,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
						}
						mdetails.add(new Memberfamily(thirdrwage,thirdrwrelation,thirdrwgender,thirdrwfullname,thirdtrwdatedatein));
					}
					if(request.getParameter("forthrwfullname")!=null && request.getParameter("forthrwfullname")!=""){
						String forthrwfullname = request.getParameter("forthrwfullname");
						int forthrwage = Integer.parseInt(request.getParameter("forthrwage"));
						String forthrwrelation = request.getParameter("forthrwrelation");
						String forthrwgender = request.getParameter("forthrwgender");
						String sts3=null,forthrwdatedatein=null;
						String forthrwdate = (String)request.getParameter("forthrwdate");

						if (forthrwdate!=null && forthrwdate!="" && forthrwdate.length() > 0) {
							sts3 = (forthrwdate.toString()).substring(0, 10);
							forthrwdatedatein = sts3.substring(0, 4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8,10);
						}
						mdetails.add(new Memberfamily(forthrwage,forthrwrelation,forthrwgender,forthrwfullname,forthrwdatedatein));
					}

					member.setMdetails(mdetails);

					session.save(member);
					request.setAttribute("result", "DONE");
					tr.commit();
				}
				Query q2 = session.createQuery("select max(memberId) from Member");
				List<?> la = q2.list();
				Iterator<?> it = la.iterator();
				Integer rowData1 = 0;
				while (it.hasNext()) {
					rowData1 = (Integer) it.next();
				}
				Query q4 = session.createQuery("Select m.memberId,m.title,m.memberCode,m.firstName,m.lastName,m.address,m.city,m.state,m.pin,m.email,m.phone,m.mobile,m.gender,m.maritalStatus,m.birthDate,m.annivDate,m.spouseFname,m.spouseLname,m.spouseEmail,m.spouseBdate from Member m where  m.memberId="+ rowData1);
				List<?> Custlist2 = q4.list();


				request.setAttribute("updatelist2", Custlist2);

				Query q3 = session.createQuery("Select mf.mFamilyId,mf.Relation,mf.Gender,mf.Name,mf.DOB,mf.Age from Memberfamily mf where mf.memberId="+ rowData1);
				List<?> Custlist3 = q3.list();
				request.setAttribute("updatelist3", Custlist3);

				dispatcher = getServletContext().getRequestDispatcher("/PreviewMember.jsp");
				dispatcher.forward(request, response);
			} else if (request.getParameter("memberid1") != null || (request.getParameter("myname") != null && request.getParameter("myname").equals("Updatecustomer"))) {
				System.out.println("test");
				int a2 = 0;
				if (request.getParameterValues("memberid2") != null) {
					a2 = Integer.parseInt(request.getParameter("memberid2"));

				}
				tr = session.beginTransaction();
				if (request.getParameter("hdnupdt") != null && request.getParameter("hdnupdt").equals("SubmitFormupdt")) {
					String member_code = request.getParameter("member_code");
					String member_title = request.getParameter("member_title");
					String first_name = request.getParameter("first_name");
					String last_name = request.getParameter("last_name");
					String member_address = request.getParameter("member_address");

					String member_city = request.getParameter("member_city");
					String member_state = request.getParameter("member_state");
					String member_pin = request.getParameter("member_pin");
					String member_email = request.getParameter("member_email");

					String member_phone = request.getParameter("member_phone");
					String member_mobile = request.getParameter("member_mobile");
					String member_gender = request.getParameter("member_gender");
					String member_status = request.getParameter("member_status");

					String spouse_first_name = request.getParameter("spouse_first_name");
					String spouse_last_name = request.getParameter("spouse_last_name");
					String spouse_email = request.getParameter("spouse_email");
					Member memberupdate = (Member) session.get(Member.class,a2);
					memberupdate.setMemberCode(member_code);
					memberupdate.setTitle(member_title);
					memberupdate.setFirstName(first_name);
					memberupdate.setLastName(last_name);
					memberupdate.setAddress(member_address);
					memberupdate.setCity(member_city);
					memberupdate.setState(member_state);
					memberupdate.setPin(member_pin);
					memberupdate.setPhone(member_phone);
					memberupdate.setMobile(member_mobile);
					memberupdate.setEmail(member_email);
					memberupdate.setGender(member_gender);
					memberupdate.setMaritalStatus(member_status);
					memberupdate.setSpouseFname(spouse_first_name);
					memberupdate.setSpouseLname(spouse_last_name);
					memberupdate.setSpouseEmail(spouse_email);
					String sts=null,member_birthdateDatein=null;
					String member_birthdate = (String)request.getParameter("member_birthdate");
					if (member_birthdate!=null && member_birthdate!="" && member_birthdate.length() > 0) {
						sts = (member_birthdate.toString()).substring(0, 10);
						member_birthdateDatein = sts.substring(0, 4) + "/"+ sts.substring(5, 7) + "/"+ sts.substring(8, 10);
					}
					memberupdate.setBirthDate(member_birthdateDatein);
					String sts1=null,spouse_birth_dateDatein=null;
					String spouse_birth_date = (String)request.getParameter("spouse_birth_date");
					if (spouse_birth_date!=null && spouse_birth_date!="" && spouse_birth_date.length() > 0) {
						sts1 = (spouse_birth_date.toString()).substring(0, 10);
						spouse_birth_dateDatein = sts1.substring(0, 4) + "/"+ sts1.substring(5, 7) + "/"+ sts1.substring(8, 10);
					}
					memberupdate.setSpouseBdate(spouse_birth_dateDatein);

					String sts2=null,member_anniversaryDatein=null;
					String member_anniversary = (String)request.getParameter("member_anniversary");
					if (member_anniversary!=null && member_anniversary!="" && member_anniversary.length() > 0) {
						sts2 = (member_anniversary.toString()).substring(0, 10);
						member_anniversaryDatein = sts2.substring(0,4) + "/"+ sts2.substring(5, 7) + "/"+ sts2.substring(8,10);
					}
					memberupdate.setAnnivDate(member_anniversaryDatein);




					Set mdetails = new HashSet();
					//Set fdetails=new HashSet();
					if(request.getParameterValues("frstrwfullname1")!=null )
					{
						String frstrwfullname[] = request.getParameterValues("frstrwfullname1");

						String frstrwage[] = request.getParameterValues("frstrwage1");

						String frstrwrelation[] = request.getParameterValues("frstrwrelation1");

						String frstrwgender[] = request.getParameterValues("frstrwgender1");

						String date44[] = request.getParameterValues("frstrwdate1");
						//date4 = (Date) formatter.parse(date44);
						String sts3=null,frstrwdate1Datein=null;


						for(int i=0;i<frstrwfullname.length;i++){

							String name=frstrwfullname[i];

							int age=Integer.parseInt(frstrwage[i]);

							String relation=frstrwrelation[i];

							String gender=frstrwgender[i];
							if (date44[i]!=null && date44[i]!="" && date44[i].length() > 0) {
								sts3 = (date44[i].toString()).substring(0, 10);
								frstrwdate1Datein = sts3.substring(0, 4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8 ,10);
							}

							Query memberdel=session.createQuery("delete from Memberfamily m where m.memberId="+a2);
							int rowcount=memberdel.executeUpdate();

							mdetails.add(new Memberfamily(age, relation, gender, name, frstrwdate1Datein));
						}
					}

					if(request.getParameter("frstrwfullname")!=null && request.getParameter("frstrwfullname")!=""){
						String frstrwfullname1 = request.getParameter("frstrwfullname");
						int frstrwage1 = Integer.parseInt(request.getParameter("frstrwage"));
						String frstrwrelation1 = request.getParameter("frstrwrelation");
						String frstrwgender1 = request.getParameter("frstrwgender");			
						String sts3=null,frstrwdate1Datein1=null;
						String frstrwdate1 = (String)request.getParameter("frstrwdate");

						if (frstrwdate1!=null && frstrwdate1!="" && frstrwdate1.length() > 0) {
							sts3 = (frstrwdate1.toString()).substring(0, 10);
							frstrwdate1Datein1 = sts3.substring(0, 4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
						}					
						mdetails.add(new Memberfamily(frstrwage1,frstrwrelation1,frstrwgender1,frstrwfullname1,frstrwdate1Datein1));
					}
					if(request.getParameter("secondrwfullname")!=null && request.getParameter("secondrwfullname")!=""){

						String secondrwfullname = request.getParameter("secondrwfullname");
						int secondrwage = Integer.parseInt(request.getParameter("secondrwage"));
						String secondrwrelation = request.getParameter("secondrwrelation");
						String secondrwgender = request.getParameter("secondrwgender");				
						String sts3=null,secondDatein1=null;
						String secondrwdate = (String)request.getParameter("secondrwdate");

						if (secondrwdate!=null && secondrwdate!="" && secondrwdate.length() > 0) {
							sts3 = (secondrwdate.toString()).substring(0, 10);
							secondDatein1 = sts3.substring(0 ,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
						}			    
						mdetails.add(new Memberfamily(secondrwage,secondrwrelation,secondrwgender,secondrwfullname,secondDatein1));
					}
					if(request.getParameter("thirdrwfullname")!=null && request.getParameter("thirdrwfullname")!=""){

						String thirdrwfullname = request.getParameter("thirdrwfullname");
						int thirdrwage = Integer.parseInt(request.getParameter("thirdrwage"));
						String thirdrwrelation = request.getParameter("thirdrwrelation");
						String thirdrwgender = request.getParameter("thirdrwgender");
						String sts3=null,thirdtrwdatedatein=null;
						String thirdtrwdate = (String)request.getParameter("thirdtrwdate");

						if (thirdtrwdate!=null && thirdtrwdate!="" && thirdtrwdate.length() > 0) {
							sts3 = (thirdtrwdate.toString()).substring(0, 10);
							thirdtrwdatedatein = sts3.substring(0,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8,10);
						}
						mdetails.add(new Memberfamily(thirdrwage,thirdrwrelation,thirdrwgender,thirdrwfullname,thirdtrwdatedatein));
					}
					if(request.getParameter("forthrwfullname")!=null && request.getParameter("forthrwfullname")!=""){
						String forthrwfullname = request.getParameter("forthrwfullname");
						int forthrwage = Integer.parseInt(request.getParameter("forthrwage"));
						String forthrwrelation = request.getParameter("forthrwrelation");
						String forthrwgender = request.getParameter("forthrwgender");
						String sts3=null,forthrwdatedatein=null;
						String forthrwdate = (String)request.getParameter("forthrwdate");

						if (forthrwdate!=null && forthrwdate!="" && forthrwdate.length() > 0) {
							sts3 = (forthrwdate.toString()).substring(0, 10);
							forthrwdatedatein = sts3.substring(0,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8,10);
						}
						mdetails.add(new Memberfamily(forthrwage,forthrwrelation,forthrwgender,forthrwfullname,forthrwdatedatein));
					}
					memberupdate.setMdetails(mdetails);
					session.update(memberupdate);
					request.setAttribute("result", "DONE");	

				}
				Query q = session.createQuery("Select m.memberId,m.memberCode,m.firstName,m.lastName from Member m");
				List<?> Custlist1 = q.list();
				request.setAttribute("updatelist1", Custlist1);
				String r1,r2 = null;
				if ((request.getParameter("membercodeupd") != null || request.getParameter("membernameupd") != null) && (request.getParameter("hdnupdt") == null || !request.getParameter("hdnupdt").equals("SubmitFormupdt"))) {
					if (request.getParameterValues("membercodeupd") != null) {
						r1 = request.getParameter("membercodeupd");
						request.setAttribute("strcustid", r1);
					}else
					{
						r1 = request.getParameter("membernameupd");

					}

					r2 = request.getParameter("membernameupd");
					request.setAttribute("strcustid1", r2);
					Query q2 = session.createQuery("Select m.memberId,m.title,m.memberCode,m.firstName,m.lastName,m.address,m.city,m.state,m.pin,m.email,m.phone,m.mobile,m.gender,m.maritalStatus,m.birthDate,m.annivDate,m.spouseFname,m.spouseLname,m.spouseEmail,m.spouseBdate from Member m where  m.memberId="+ r1);
					List<?> Custlist2 = q2.list();


					request.setAttribute("updatelist2", Custlist2);


					Query q3 = session.createQuery("Select mf.mFamilyId,mf.Relation,mf.Gender,mf.Name,mf.DOB,mf.Age from Memberfamily mf where mf.memberId="+ r1);
					List<?> Custlist3 = q3.list();
					request.setAttribute("updatelist3", Custlist3);
				}
				Query q1 = session.createQuery("Select m.memberId,m.memberCode,m.firstName,m.lastName from Member m");
				List<?> Custlist11 = q1.list();
				request.setAttribute("updatelist1", Custlist11);

				tr.commit();
				dispatcher= getServletContext().getRequestDispatcher("/updateMember.jsp");
				dispatcher.forward(request, response);
			}else if (request.getParameterValues("on1") != null || (request.getParameter("myname") != null && request.getParameter("myname").equals("Deletecustomer"))) {
				String Check1[] = null;
				Integer si1;
				tr = session.beginTransaction();
				if (request.getParameterValues("on1") != null) {
					Check1 = request.getParameterValues("on1");
				}
				if (Check1 != null) {
					for (int i = 0; i < Check1.length; i++) {
						si1 = Integer.valueOf(Check1[i]);
						Member memberdel = (Member) session.get(Member.class,si1);
						//strQuery=session.createQuery("Delete from Member m where m.memberId="+si1);
						//int rowcount=strQuery.executeUpdate();
						session.delete(memberdel);

						request.setAttribute("result", si1);
					}
				}
				Query q4 = session.createQuery("Select m.memberId,m.memberCode, m.firstName,m.lastName from Member m");
				strQuery = session.createQuery("select count(m.memberId),m.memberCode,m.firstName,m.lastName from Member m");
				int istart = 0;
				int iPageNo = 0;
				int cPageNo = 1;
				int itotalpages = 0;
				int ilength = 10;
				List<?> ltry = strQuery.list();
				Iterator<?> ittry = ltry.iterator();
				String str = null;
				double d = 0;
				Object rowData1[] = null;
				while (ittry.hasNext()) {
					rowData1 = (Object[]) ittry.next();
					str = rowData1[0].toString();
					d = Double.valueOf(str).doubleValue();
					itotalpages = ((int) (Math.ceil((double) d / ilength)));
				}
				if (request.getParameter("iPageNo") != null) {
					cPageNo = Integer.parseInt(request.getParameter("iPageNo"));
					if (cPageNo == 0) {
						cPageNo = 1;
					} else if (cPageNo > itotalpages) {
						cPageNo = itotalpages;
					}
					istart = (cPageNo - 1) * ilength;
					iPageNo = cPageNo * ilength;
					q4.setFirstResult(istart);
					q4.setMaxResults(ilength);
				} else {
					q4.setFirstResult(istart);
					q4.setMaxResults(ilength);
				}
				List<?> lc = q4.list();
				request.setAttribute("Deletecus", lc);
				request.setAttribute("itotalpages", itotalpages);
				request.setAttribute("cPageNo", cPageNo);
				request.setAttribute("iPageNo", iPageNo);
				request.setAttribute("ilength", ilength);
				request.setAttribute("str", str);
				tr.commit();
				dispatcher = getServletContext().getRequestDispatcher("/deleteMember.jsp");
				dispatcher.forward(request, response);
			}
			//card activate
			else 
				if(request.getParameter("cardradio")!=null && request.getParameter("cardradio")!="" && (request.getParameter("myname") != null && request.getParameter("myname").equals("cardactivate"))) {
					if(request.getParameter("cardradio").equals("Prepaid Card")){
						tr = session.beginTransaction();
						String cType=request.getParameter("cardradio");

						int mCode=Integer.parseInt(request.getParameter("hiddenid"));

						String cardNo=request.getParameter("cardNumber");
						double pamt=Double.parseDouble(request.getParameter("paidamount"));
						double disc=Double.parseDouble(request.getParameter("discount"));
						double cbal=Double.parseDouble(request.getParameter("cardbalance"));
						long time = System.currentTimeMillis();
						Date date = new Date(time);
						CardActivation cardActivation=new CardActivation();
						cardActivation.setMemberId(mCode);
						cardActivation.setCardType(cType);
						cardActivation.setCardNo(cardNo);
						cardActivation.setPaidAmount(pamt);
						cardActivation.setDiscount(disc);
						cardActivation.setActivationDate(date);
						cardActivation.setCardBalance(cbal);

						cardActivation.setCardStatus("Active");
						cardActivation.setPoints(0);
						session.save(cardActivation);
						tr.commit();
					}else{

						tr = session.beginTransaction();
						String cType=request.getParameter("cardradio");

						int mCode=Integer.parseInt(request.getParameter("hiddenid"));
						String memberCode=request.getParameter("memberCode");
						String member_name=request.getParameter("member_name");

						String cardNo=request.getParameter("cardNumber");
						double pamt=Double.parseDouble(request.getParameter("paidamount"));
						//System.out.println("hi"+request.getParameter("cardbalance"));
						//double cbal=Double.parseDouble(request.getParameter("cardbalance"));
						long time = System.currentTimeMillis();
						Date date = new Date(time);

						//calculating points for postpaid user
						Points point=(Points)session.createQuery("from Points where pointId=1").uniqueResult();

						double pointAmount=point.getPointAmount();
						double points=point.getPoints();
						double userPoints=0L;

						if(pamt>=pointAmount){
							double temp=(pamt/pointAmount);
							userPoints=temp*points;

						}

						CardActivation cardActivation=new CardActivation();
						cardActivation.setMemberId(mCode);
						cardActivation.setCardType(cType);
						cardActivation.setCardNo(cardNo);
						cardActivation.setPaidAmount(pamt);

						cardActivation.setDiscount(0);
						cardActivation.setActivationDate(date);
					//	cardActivation.setCardBalance(cbal);
						cardActivation.setPoints(userPoints);
						cardActivation.setCardStatus("Active");
						session.save(cardActivation);
						tr.commit();
					}
					request.setAttribute("result", "DONE");
					dispatcher = getServletContext().getRequestDispatcher("/addMember.jsp");
					dispatcher.forward(request, response);
				}
			//edit member
				else if( request.getParameter("myname")!=null  && request.getParameter("myname").equals("EditMember")){
					int r1=0;
					if(request.getParameter("hiddenEditId")!=null){
						r1=Integer.parseInt(request.getParameter("hiddenEditId"));
						Query q2 = session.createQuery("Select m.memberId,m.title,m.memberCode,m.firstName,m.lastName,m.address,m.city,m.state,m.pin,m.email,m.phone,m.mobile,m.gender,m.maritalStatus,m.birthDate,m.annivDate,m.spouseFname,m.spouseLname,m.spouseEmail,m.spouseBdate from Member m where  m.memberId="+ r1);
						List<?> Custlist2 = q2.list();


						request.setAttribute("updatelist2", Custlist2);


						Query q3 = session.createQuery("Select mf.mFamilyId,mf.Relation,mf.Gender,mf.Name,mf.DOB,mf.Age from Memberfamily mf where mf.memberId="+ r1);
						List<?> Custlist3 = q3.list();
						request.setAttribute("updatelist3", Custlist3);
						System.out.println("family: "+Custlist3);
						dispatcher = getServletContext().getRequestDispatcher("/editMember.jsp");
						dispatcher.forward(request, response);
					}

					if (request.getParameter("myname").equals("EditMember") && request.getParameter("myname")!=null && request.getParameter("hdnupdt") != null && request.getParameter("hdnupdt").equals("SubmitFormupdt")){
						System.out.println("test");
						tr=session.beginTransaction();
						if(request.getParameter("memberidedit")!=null){
							r1=Integer.parseInt(request.getParameter("memberidedit"));
						}
						System.out.println("member id: "+r1);
						String member_code = request.getParameter("member_code");
						System.out.println(member_code);
						String member_title = request.getParameter("member_title");
						String first_name = request.getParameter("first_name");
						String last_name = request.getParameter("last_name");
						String member_address = request.getParameter("member_address");
						String member_city = request.getParameter("member_city");
						String member_state = request.getParameter("member_state");
						String member_pin = request.getParameter("member_pin");
						String member_email = request.getParameter("member_email");

						String member_phone = request.getParameter("member_phone");
						String member_mobile = request.getParameter("member_mobile");
						String member_gender = request.getParameter("member_gender");
						String member_status = request.getParameter("member_status");

						String spouse_first_name = request.getParameter("spouse_first_name");
						String spouse_last_name = request.getParameter("spouse_last_name");
						String spouse_email = request.getParameter("spouse_email");
						System.out.println("above member object");
						Member memberupdate = (Member) session.get(Member.class,r1);
						System.out.println("after object");
						memberupdate.setTitle(member_title);
						memberupdate.setMemberCode(member_code);
						System.out.println("after code");

						memberupdate.setFirstName(first_name);
						memberupdate.setLastName(last_name);
						memberupdate.setAddress(member_address);
						memberupdate.setCity(member_city);
						memberupdate.setState(member_state);
						memberupdate.setPin(member_pin);
						memberupdate.setPhone(member_phone);
						memberupdate.setMobile(member_mobile);
						memberupdate.setEmail(member_email);
						memberupdate.setGender(member_gender);
						memberupdate.setMaritalStatus(member_status);
						memberupdate.setSpouseFname(spouse_first_name);
						memberupdate.setSpouseLname(spouse_last_name);
						memberupdate.setSpouseEmail(spouse_email);
						System.out.println(request.getParameter("member_birthdate"));
						String sts=null,member_birthdateDatein=null;
						String member_birthdate = (String)request.getParameter("member_birthdate");
						if (member_birthdate!=null && member_birthdate!="" && member_birthdate.length() > 0) {
							sts = (member_birthdate.toString()).substring(0, 10);
							member_birthdateDatein = sts.substring(0 ,4) + "/"+ sts.substring(5, 7) + "/"+ sts.substring(8,10);
						}
						memberupdate.setBirthDate(member_birthdateDatein);
						String sts1=null,spouse_birth_dateDatein=null;
						String spouse_birth_date = (String)request.getParameter("spouse_birth_date");
						if (spouse_birth_date!=null && spouse_birth_date!="" && spouse_birth_date.length() > 0) {
							sts1 = (spouse_birth_date.toString()).substring(0, 10);
							spouse_birth_dateDatein = sts1.substring(0 ,4) + "/"+ sts1.substring(5, 7) + "/"+ sts1.substring(8,10);
						}
						memberupdate.setSpouseBdate(spouse_birth_dateDatein);

						String sts2=null,member_anniversaryDatein=null;
						String member_anniversary = (String)request.getParameter("member_anniversary");
						if (member_anniversary!=null && member_anniversary!="" && member_anniversary.length() > 0) {
							sts2 = (member_anniversary.toString()).substring(0, 10);
							member_anniversaryDatein = sts2.substring(0 ,4) + "/"+ sts2.substring(5, 7) + "/"+ sts2.substring(8, 10);
						}
						memberupdate.setAnnivDate(member_anniversaryDatein);

						Set mdetails = new HashSet();
						//Set fdetails=new HashSet();
						if(request.getParameterValues("frstrwfullname1")!=null )
						{
							String frstrwfullname[] = request.getParameterValues("frstrwfullname1");
							String frstrwage[] = request.getParameterValues("frstrwage1");

							String frstrwrelation[] = request.getParameterValues("frstrwrelation1");

							String frstrwgender[] = request.getParameterValues("frstrwgender1");

							String date44[] = request.getParameterValues("frstrwdate1");
							//date4 = (Date) formatter.parse(date44);
							String sts3=null,frstrwdate1Datein=null;




							for(int i=0;i<frstrwfullname.length;i++){

								String name=frstrwfullname[i];

								int age=Integer.parseInt(frstrwage[i]);

								String relation=frstrwrelation[i];

								String gender=frstrwgender[i];
								if (date44[i]!=null && date44[i]!="" && date44[i].length() > 0) {
									sts3 = (date44[i].toString()).substring(0, 10);
									frstrwdate1Datein = sts3.substring(0 ,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
								}

								Query memberdel=session.createQuery("delete from Memberfamily m where m.memberId="+r1);
								int rowcount=memberdel.executeUpdate();

								mdetails.add(new Memberfamily(age, relation, gender, name, frstrwdate1Datein));
							}
						}


						if(request.getParameter("frstrwfullname")!=null && request.getParameter("frstrwfullname")!=""){
							String frstrwfullname1 = request.getParameter("frstrwfullname");
							int frstrwage1 = Integer.parseInt(request.getParameter("frstrwage"));
							String frstrwrelation1 = request.getParameter("frstrwrelation");
							String frstrwgender1 = request.getParameter("frstrwgender");
							String sts3=null,frstrwdate1Datein1=null;
							String frstrwdate1 = (String)request.getParameter("frstrwdate");

							if (frstrwdate1!=null && frstrwdate1!="" && frstrwdate1.length() > 0) {
								sts3 = (frstrwdate1.toString()).substring(0, 10);
								frstrwdate1Datein1 = sts3.substring(0 ,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
							}

							mdetails.add(new Memberfamily(frstrwage1,frstrwrelation1,frstrwgender1,frstrwfullname1,frstrwdate1Datein1));
						}
						if(request.getParameter("secondrwfullname")!=null && request.getParameter("secondrwfullname")!=""){

							String secondrwfullname = request.getParameter("secondrwfullname");
							int secondrwage = Integer.parseInt(request.getParameter("secondrwage"));
							String secondrwrelation = request.getParameter("secondrwrelation");
							String secondrwgender = request.getParameter("secondrwgender");
							String sts3=null,secondDatein1=null;
							String secondrwdate = (String)request.getParameter("secondrwdate");

							if (secondrwdate!=null && secondrwdate!="" && secondrwdate.length() > 0) {
								sts3 = (secondrwdate.toString()).substring(0, 10);
								secondDatein1 = sts3.substring(0 ,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
							}
							mdetails.add(new Memberfamily(secondrwage,secondrwrelation,secondrwgender,secondrwfullname,secondDatein1));
						}
						if(request.getParameter("thirdrwfullname")!=null && request.getParameter("thirdrwfullname")!=""){

							String thirdrwfullname = request.getParameter("thirdrwfullname");
							int thirdrwage = Integer.parseInt(request.getParameter("thirdrwage"));
							String thirdrwrelation = request.getParameter("thirdrwrelation");
							String thirdrwgender = request.getParameter("thirdrwgender");
							String sts3=null,thirdtrwdatedatein=null;
							String thirdtrwdate = (String)request.getParameter("thirdtrwdate");

							if (thirdtrwdate!=null && thirdtrwdate!="" && thirdtrwdate.length() > 0) {
								sts3 = (thirdtrwdate.toString()).substring(0, 10);
								thirdtrwdatedatein = sts3.substring(0 ,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
							}

							mdetails.add(new Memberfamily(thirdrwage,thirdrwrelation,thirdrwgender,thirdrwfullname,thirdtrwdatedatein));
						}
						if(request.getParameter("forthrwfullname")!=null && request.getParameter("forthrwfullname")!=""){
							String forthrwfullname = request.getParameter("forthrwfullname");
							int forthrwage = Integer.parseInt(request.getParameter("forthrwage"));
							String forthrwrelation = request.getParameter("forthrwrelation");
							String forthrwgender = request.getParameter("forthrwgender");
							String sts3=null,forthrwdatedatein=null;
							String forthrwdate = (String)request.getParameter("forthrwdate");

							if (forthrwdate!=null && forthrwdate!="" && forthrwdate.length() > 0) {
								sts3 = (forthrwdate.toString()).substring(0, 10);
								forthrwdatedatein = sts3.substring(0 ,4) + "/"+ sts3.substring(5, 7) + "/"+ sts3.substring(8, 10);
							}


							mdetails.add(new Memberfamily(forthrwage,forthrwrelation,forthrwgender,forthrwfullname,forthrwdatedatein));
						}
						System.out.println("test1");
						memberupdate.setMdetails(mdetails);
						session.update(memberupdate);

						tr.commit();
						Query q2 = session.createQuery("select max(memberId) from Member");
						List<?> la = q2.list();
						Iterator<?> it = la.iterator();
						Integer rowData1 = 0;
						while (it.hasNext()) {
							rowData1 = (Integer) it.next();
						}
						Query q4 = session.createQuery("Select m.memberId,m.title,m.memberCode,m.firstName,m.lastName,m.address,m.city,m.state,m.pin,m.email,m.phone,m.mobile,m.gender,m.maritalStatus,m.birthDate,m.annivDate,m.spouseFname,m.spouseLname,m.spouseEmail,m.spouseBdate from Member m where  m.memberId="+ rowData1);
						List<?> Custlist2 = q4.list();


						request.setAttribute("updatelist2", Custlist2);

						Query q3 = session.createQuery("Select mf.mFamilyId,mf.Relation,mf.Gender,mf.Name,mf.DOB,mf.Age from Memberfamily mf where mf.memberId="+ rowData1);
						List<?> Custlist3 = q3.list();
						request.setAttribute("updatelist3", Custlist3);

						List<?> discount = session.createQuery("Select discount from Discount where id=1").list();
						double d=(Double)discount.get(0);
						request.setAttribute("discount", d);

						dispatcher = getServletContext().getRequestDispatcher("/PreviewMember.jsp");
						dispatcher.forward(request, response);

					}

				}
			//card 
				else if(request.getParameter("activate") != null && request.getParameter("activate").equals("Activate"))
				{
					tr=session.beginTransaction();

					String rid = null;
					if(request.getParameter("hiddenMemberId")!=null){
						String id=request.getParameter("hiddenMemberId"); 
						if (request.getParameterValues("memberCode") != null && request.getParameter("hiddenDiscountCalcOnes")!=null && request.getParameter("hiddenDiscountCalcOnes").equals("DiscountCalcOnes")) {
							rid = request.getParameter("memberCode");
							request.setAttribute("strcustid", rid);

							Query discountquery = session.createQuery("Select discount from Discount where id=1");

							List Discount = discountquery.list();
							double disc=(Double) Discount.get(0);
							System.out.println("Discount"+disc);
							request.setAttribute("discount", disc);

							Member getName=(Member)session.createQuery("from Member where memberId="+id).uniqueResult();
							String fullName=getName.getFirstName()+" "+getName.getLastName();
							request.setAttribute("fullName", fullName);

						}
					}   
					if(request.getParameter("memberCode") != null && request.getParameter("prdcardactivate") != null && request.getParameter("prdcardactivate").equals("prepaidcardactivate") ){
						System.out.println("inside prepaid");
						String cardNo=request.getParameter("card_number");
						int mCode=Integer.parseInt(request.getParameter("hiddenMemberId"));
						double pamt=Double.parseDouble(request.getParameter("paid_amount"));
						double disc=Double.parseDouble(request.getParameter("discount"));
						double cbal=Double.parseDouble(request.getParameter("card_balance"));
						long time = System.currentTimeMillis();
						Date date = new Date(time);
						System.out.println("system date: "+date);
						CardActivation cardActivation=new CardActivation();
						cardActivation.setMemberId(mCode);
						cardActivation.setCardType("Prepaid Card");
						cardActivation.setCardNo(cardNo);
						cardActivation.setPaidAmount(pamt);
						cardActivation.setDiscount(disc);
						cardActivation.setActivationDate(date);
						cardActivation.setCardBalance(cbal);
						System.out.println("card balance: "+cbal);
						cardActivation.setCardStatus("Active");
						cardActivation.setPoints(0);
						session.save(cardActivation);
						tr.commit();


					}
					String q="select m.memberId,m.memberCode,m.firstName,m.lastName from member as m left outer join card as cd on (cd.memberId=m.memberId) where cd.cardNo is null";
					Query activatequery=session.createSQLQuery(q);			    
					List activateList = activatequery.list();     		 
					request.setAttribute("activateList",activateList);	
					RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/activate.jsp");
					dispatcher1.forward(request, response);


				}

				else if(request.getParameter("activate1") != null && request.getParameter("activate1").equals("Activate"))
				{
					tr=session.beginTransaction();

					String rid = null;
					if(request.getParameter("hiddenMemberId")!=null){
						String id=request.getParameter("hiddenMemberId"); 
						if (request.getParameterValues("memberCode") != null && request.getParameter("hiddenDiscountCalcOnes")!=null && request.getParameter("hiddenDiscountCalcOnes").equals("DiscountCalcOnes")) {
							rid = request.getParameter("memberCode");
							request.setAttribute("strcustid", rid);

							Member getName=(Member)session.createQuery("from Member where memberId="+id).uniqueResult();
							String fullName=getName.getFirstName()+" "+getName.getLastName();
							request.setAttribute("fullName", fullName);

						}   			
					}   
					if(request.getParameter("memberCode") != null && request.getParameter("postcardactivate") != null && request.getParameter("postcardactivate").equals("postpaidcardactivate") ){
						System.out.println("inside postpaid");
						String cardNo=request.getParameter("card_number");
						int mCode=Integer.parseInt(request.getParameter("hiddenMemberId"));
						long time = System.currentTimeMillis();
						Date date = new Date(time);
						System.out.println("system date: "+date);
						CardActivation cardActivation=new CardActivation();
						cardActivation.setMemberId(mCode);
						cardActivation.setCardType("Postpaid Card");
						cardActivation.setCardNo(cardNo);
						cardActivation.setActivationDate(date);
						cardActivation.setCardStatus("Active");
						cardActivation.setPoints(0);
						session.save(cardActivation);
						tr.commit();


					}
					String q="select m.memberId,m.memberCode,m.firstName,m.lastName from member as m left outer join card as cd on (cd.memberId=m.memberId) where cd.cardNo is null";
					Query activatequery=session.createSQLQuery(q);	
					List activateList = activatequery.list();     		 
					request.setAttribute("activateList",activateList);
					RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/PostpaidActivate.jsp");
					dispatcher1.forward(request, response);


				}

				else if(request.getParameter("deactivate")!=null && request.getParameter("deactivate").equals("Deactivate"))
				{tr=session.beginTransaction();
				if(request.getParameter("cardNumber") != null  ){
					System.out.println("inside pprepaidpaid");
					int cardNo=Integer.parseInt(request.getParameter("cardNumber"));
					System.out.println("test"+cardNo);

					CardActivation deactivatecard=(CardActivation) session.get(CardActivation.class, cardNo);
					deactivatecard.setCardStatus("Inactive");
					session.update(deactivatecard);
					tr.commit();
					System.out.println("test"+cardNo);
					request.setAttribute("result", "DONE");


				}


				Query activatequery=session.createQuery("SELECT c.cardId,c.cardNo from CardActivation c where c.cardStatus='Active' and c.cardType='Prepaid Card'");			    

				List activateList = activatequery.list();     		 
				request.setAttribute("activateList",activateList);    		 	

				RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/PrepaidDeactivate.jsp");
				dispatcher1.forward(request, response);
				}

				else if(request.getParameter("deactivate1")!=null && request.getParameter("deactivate1").equals("Deactivate"))
				{
					tr=session.beginTransaction();
					if(request.getParameter("cardNumber") != null  ){
						System.out.println("inside postpaid");
						int cardNo=Integer.parseInt(request.getParameter("cardNumber"));
						System.out.println("test"+cardNo);

						CardActivation deactivatecard=(CardActivation) session.get(CardActivation.class, cardNo);
						deactivatecard.setCardStatus("Inactive");
						session.update(deactivatecard);
						tr.commit();
						System.out.println("test"+cardNo);
						request.setAttribute("result", "DONE");

					}			
					Query activatequery=session.createQuery("SELECT c.cardId,c.cardNo from CardActivation c where c.cardStatus='Active' and c.cardType='Postpaid Card'");			    

					List activateList = activatequery.list();     		 
					request.setAttribute("activateList",activateList);    		 	

					RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/PostpaidDeactivate.jsp");
					dispatcher1.forward(request, response);
				}
			
				else if(request.getParameter("recharge") != null && request.getParameter("recharge").equals("Recharge"))
				{
					tr=session.beginTransaction();
					Query activatequery=session.createQuery("SELECT c.cardId,c.cardNo FROM CardActivation c where c.cardType='Prepaid Card' and c.cardStatus='Active'");			    
	     			
				    //Query activatequery=session.createQuery("Select m.memberId,m.memberCode,m.firstName,m.lastName from Member m");
	       		 	List activateList = activatequery.list();     		 
	     		 	request.setAttribute("activateList",activateList);	
	     		 	String rid = null;
	     			if(request.getParameter("hiddenCardId")!=null){
	     			String id=request.getParameter("hiddenCardId"); 
	     			if (request.getParameterValues("cardNumber") != null) {
						rid = request.getParameter("cardNumber");
						request.setAttribute("strcustid", rid);
	     			}
	     			
	     			CardActivation getBalance=(CardActivation) session.createQuery("from CardActivation where cardId="+id).uniqueResult();
	    			
	    			double balance=getBalance.getCardBalance();
	    			request.setAttribute("balance", balance);
	    			
	     			}   
	     			
					RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/Recharge.jsp");
					dispatcher1.forward(request, response);									
					
				}
				
				else if(request.getParameter("redeem")!=null && request.getParameter("redeem").equals("Redeem"))
				{
					tr=session.beginTransaction();
					Query activatequery=session.createQuery("SELECT c.cardId,c.cardNo FROM CardActivation c where c.cardType='Postpaid Card' and c.cardStatus='Active'");			    
	       		 	List activateList = activatequery.list();     		 
	     		 	request.setAttribute("activateList",activateList);	
	     		 	String rid = null;
	     			if(request.getParameter("hiddenCardId1")!=null){
	     			String id=request.getParameter("hiddenCardId1"); 
	     			if (request.getParameterValues("cardNumber") != null) {
						rid = request.getParameter("cardNumber");
						request.setAttribute("strcustid", rid);
	     			}
	     			
	     			CardActivation getPoint=(CardActivation) session.createQuery("from CardActivation where cardId="+id).uniqueResult();
	    			
	    			double points=getPoint.getPoints();
	    			request.setAttribute("points", points);
	    			
	     			}     		 	
	       		    RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/redeem.jsp");
					dispatcher1.forward(request, response);	
				}

			//setting
			else if(request.getParameter("myname")!=null && request.getParameter("myname").equals("EmailSetting")){
					if(request.getParameter("emailtxt")!=null){
						tr = session.beginTransaction();
						System.out.println("after click of save button.......");
						String emailstr=request.getParameter("emailtxt");
						String pssstr=request.getParameter("user_pass");
						System.out.println(emailstr+"\n"+pssstr);



						Email email=new Email();
						email.setEmailId(1);
						email.setEmail(emailstr);
						email.setPassword(pssstr);

						session.saveOrUpdate(email);
						tr.commit();
						request.setAttribute("result", "done");
					}
					String checkDb="from Email where id=1";
					Email e=(Email)session.createQuery(checkDb).uniqueResult();
					if(e!=null){
						request.setAttribute("email", e.getEmail());
						request.setAttribute("password", e.getPassword());
					}
					
					dispatcher = getServletContext().getRequestDispatcher("/emailSetting.jsp");
					dispatcher.forward(request, response);

				}else if(request.getParameter("myname")!=null && request.getParameter("myname").equals("PostpaidSetting")){
					if(request.getParameter("points")!=null){
						tr = session.beginTransaction();
						System.out.println("after click of save......");
						double pts=Double.parseDouble(request.getParameter("points"));
						double rs=Double.parseDouble(request.getParameter("rupees"));
						System.out.println("points"+pts+"rs::"+rs);

						Points points=new Points();
						points.setPointId(1);
						points.setPoints(pts);
						points.setPointAmount(rs);
						session.saveOrUpdate(points);
						tr.commit();
						request.setAttribute("result", "done");
					}
					String checkDb2="from Points where id=1";
					Points p=(Points)session.createQuery(checkDb2).uniqueResult();
					if(p!=null){
						request.setAttribute("amount", p.getPointAmount());
						request.setAttribute("points", p.getPoints());
					}
			
					dispatcher = getServletContext().getRequestDispatcher("/postpaidSetting.jsp");
					dispatcher.forward(request, response);

				}else if(request.getParameter("myname")!=null && request.getParameter("myname").equals("PrepaidSetting")){
					System.out.println("This is prepaid section..........");
					if(request.getParameter("minrecharge")!=null){	
					tr=session.beginTransaction();
						System.out.println("This is prepaid section..........");
						System.out.println(request.getParameter("minrecharge")+"\n"+request.getParameter("benifit"));
						double minRecharge=Double.parseDouble(request.getParameter("minrecharge"));
						double benifit=Double.parseDouble(request.getParameter("benifit"));

						Discount discount=new Discount();
						discount.setdiscountId(1);
						discount.setMinRecharge(minRecharge);
						discount.setDiscount(benifit);

						session.saveOrUpdate(discount);
						tr.commit();
						request.setAttribute("result", "done");


					}
					String checkDb3="from Discount where id=1";
					Discount d=(Discount)session.createQuery(checkDb3).uniqueResult();
					if(d!=null){
						request.setAttribute("minrecharge", d.getMinRecharge());
						request.setAttribute("rechargebenefit", d.getDiscount());
					}
			
					dispatcher = getServletContext().getRequestDispatcher("/prepaidSetting.jsp");
					dispatcher.forward(request, response);

				}else if (request.getParameter("myname") != null
						&& request.getParameter("myname").equals("searchpage")) {
					String strOptVal = null;
					int istart = 0;
					int iPageNo = 0, cPageNo = 1;
					double d = 0;
					Object rowData1[] = null;
					int itotalpages = 0, ilength = 10;
					String strTotalCnt = null;
					Query qcount = null, q25 = null;
					if (request.getParameter("hdnOptVal") != null
							&& request.getParameter("hdnOptVal") != "") {
						strOptVal = request.getParameter("hdnOptVal");
						if (strOptVal.equals("date")
								&& request.getParameter("txtfromdate") != null) {
							String serhdate1 = request.getParameter("txtfromdate");
							String serhdate2 = request.getParameter("txttodate");
							qcount = session
							.createQuery("Select count(order_id),Cust_id,prod_Id,orderedqty,invoiceno,cust_name,Order_date,ProductName,ProductCost,customerorder,dispatching,dispatched,amount,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from datesearch where Order_date>= '"
									+ serhdate1
									+ "' and Order_date<='"
									+ serhdate2
									+ "' order by cust_name,customerorder");

							q25 = session
							.createQuery("Select order_id,Cust_id,prod_Id,orderedqty,invoiceno,cust_name,Order_date,ProductName,ProductCost,customerorder,dispatching,dispatched,amount,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from datesearch where Order_date>= '"
									+ serhdate1
									+ "' and Order_date<='"
									+ serhdate2
									+ "' order by cust_name,customerorder");
							request.setAttribute("serhdate1", serhdate1);
							request.setAttribute("serhdate2", serhdate2);
						} else if (strOptVal.equals("ordernumber")
								&& request.getParameter("entertext") != null) {
							String entertext = request.getParameter("entertext");
							qcount = session
							.createQuery("Select count(Order_id),srnoid,Cust_id,cust_Name,Order_date,Prod_ID,ProductName,ProductCost,orderedqty,invoiceno,customerorder,dispatched,dispatching,amount,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from orderSearch where customerorder like '"
									+ entertext + "%'order by cust_name,customerorder");
							q25 = session
							.createQuery("Select srnoid,Order_id,Cust_id,cust_Name,Order_date,Prod_ID,ProductName,ProductCost,orderedqty,invoiceno,customerorder,dispatched,dispatching,amount,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from orderSearch where customerorder like '"
									+ entertext + "%'order by cust_name,customerorder");
							request.setAttribute("entertext", entertext);
						} else if (strOptVal.equals("orderCustomerName")
								&& request.getParameter("entertext") != null
								&& !request.getParameter("entertext").equals("")) {
							String entertext = request.getParameter("entertext");
							qcount = session
							.createQuery("select count(Cust_id),srnoid,order_id,Cust_id,Order_date,ProductName,ProductCost,orderedqty,invoiceno,customerorder,dispatched,dispatching,amount,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from customerSearch c where c.cust_Name like '"
									+ entertext
									+ "%' order by cust_name,customerorder");
							q25 = session
							.createQuery("select srnoid,cust_Name ,order_id,Cust_id,Order_date,ProductName,ProductCost,orderedqty,invoiceno,customerorder,dispatched,dispatching,amount,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from customerSearch c where c.cust_Name like '"
									+ entertext
									+ "%' order by cust_name,customerorder");
							request.setAttribute("entertext", entertext);
						} else if (strOptVal.equals("orderProductName")
								&& request.getParameter("entertext") != null
								&& !request.getParameter("entertext").equals("")) {
							String entertext = request.getParameter("entertext");
							qcount = session
							.createQuery("select count(productid),productname,productcost,orderedqty,Order_id,invoiceno,cust_name,customerorder,dispatched,dispatching,amount,Order_date,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from searchProduct where  productname like '"
									+ entertext + "%'order by productname,cust_name,customerorder");
							q25 = session
							.createQuery("select productid,productname,productcost,orderedqty,Order_id,invoiceno,cust_name,customerorder,dispatched,dispatching,amount,Order_date,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from searchProduct where  productname like '"
									+ entertext + "%'order by productname,cust_name,customerorder");
							request.setAttribute("entertext", entertext);
						} else if (strOptVal.equals("invoicenumber")
								&& request.getParameter("entertext") != null
								&& !request.getParameter("entertext").equals("")) {
							String entertext = request.getParameter("entertext");
							qcount = session
							.createQuery("select count(invoiceNo),order_Id,totalAmount,dispatching,advance,netPayable,Cust_Name,customerorder,productname,productcost,amount,dispatched,orderedqty,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from invoiceSearch where invoiceNo ="
									+ entertext + " ");
							q25 = session
							.createQuery("select invoiceNo,order_Id,totalAmount,dispatching,advance,netPayable,Cust_Name,customerorder,productname,productcost,amount,dispatched,orderedqty,AmendmentQty,AmendmentCost,AmendmentNo,AmendmentDate from invoiceSearch  where invoiceNo ="
									+ entertext + " ");
							request.setAttribute("entertext", entertext);
						}
						if (qcount != null) {
							List<?> ldate = qcount.list();
							Iterator<?> ittry = ldate.iterator();
							while (ittry.hasNext()) {
								rowData1 = (Object[]) ittry.next();
								strTotalCnt = rowData1[0].toString();
								d = Double.valueOf(strTotalCnt).doubleValue();
								itotalpages = ((int) (Math.ceil((double) d
										/ ilength)));
							}
							if (request.getParameter("iPageNo") != null) {
								cPageNo = Integer.parseInt(request
										.getParameter("iPageNo"));
								if (cPageNo == 0) {
									cPageNo = 1;
								} else if (cPageNo > itotalpages) {
									cPageNo = itotalpages;
								}
								istart = (cPageNo - 1) * ilength;
								iPageNo = cPageNo * ilength;
								q25.setFirstResult(istart);
								q25.setMaxResults(ilength);
							}

							List <?> lstrsCount = qcount.list();
							request.setAttribute("lstrsCount", lstrsCount);
							List <?> lstrsResult = q25.list();
							request.setAttribute("lstrsResult", lstrsResult);
							request.setAttribute("itotalpages", itotalpages);
							request.setAttribute("cPageNo", cPageNo);
							request.setAttribute("iPageNo", iPageNo);
							request.setAttribute("ilength", ilength);
							request.setAttribute("strTotalCnt", strTotalCnt);
						}
						request.setAttribute("hdnOptVal", strOptVal);
					}

					if (request.getParameter("hdnInvoiceVal") != null
							&& request.getParameter("hdnInvoiceVal").equals(
							"Print invoice")
							&& strOptVal != null
							&& (strOptVal.equals("invoicenumber")
									|| strOptVal.equals("ordernumber") || strOptVal
									.equals("orderCustomerName"))
									&& request.getParameter("entertext") != null
									&& (request.getParameter("s_orderid2") != null
											|| request.getParameter("s_orderid") != null
											|| request.getParameter("s_invoiceno") != null
											|| request.getParameter("s_orderid2") != null || request
											.getParameter("s_invoiceno1") != null)
											&& !request.getParameter("entertext").equals("")) {
						dispatcher = getServletContext().getRequestDispatcher("/Redirect.jsp");
						dispatcher.forward(request, response);
					} else {
						dispatcher = getServletContext()
						.getRequestDispatcher("/Search.jsp");
						dispatcher.forward(request, response);
					}
				}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}