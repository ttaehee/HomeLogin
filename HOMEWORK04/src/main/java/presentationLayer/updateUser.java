package presentationLayer;

import java.io.*;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.http.*;

import businessLogicLayer.UserDAO;
import businessLogicLayer.UserVO;

public class updateUser extends HttpServlet{

	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{

		req.setCharacterEncoding("euc-kr");
		res.setContentType("text/html;charset=euc-kr");

		PrintWriter out=res.getWriter();		
		
		//Ŭ���̾�Ʈ�� ���� ���� value ���
		String id=req.getParameter("id");
		String password=req.getParameter("password");
		String name=req.getParameter("name");
		String gender=req.getParameter("gender");
		String job=req.getParameter("job");		
		String address=req.getParameter("address");		
		
		Enumeration<String> en = req.getParameterNames();
		String  birth=" ";
		String  cellPhone=" ";
		
		while(en.hasMoreElements()) {
			String bnName=en.nextElement();
			
			if(bnName.equals("birth")) {
				String[] value=req.getParameterValues(bnName);
				
				for(int i=0;i<value.length;i++){
		            //out.println("<li>"+name+":"+value[i]);
		           // System.out.println(name+":"+value[i]);
					String nop = i==(value.length-1)? " " :"/"  ;
					birth+=value[i]+nop;
		        }
			}
			
			if(bnName.equals("cellphone")) {
				String[] value=req.getParameterValues(bnName);
				
				for(int i=0;i<value.length;i++){
		            //out.println("<li>"+name+":"+value[i]);
		           // System.out.println(name+":"+value[i]);
					String nop = i==(value.length-1)? " " :"-"  ;
					cellPhone+=value[i]+nop;
		        }
			}
			
		}
		
		//���� value UserVO�� ����
		UserVO userVO=new UserVO();
		userVO.setId(id);
		userVO.setPassword(password);
		userVO.setName(name);
		userVO.setGender(gender);
		userVO.setBirth(birth);
		userVO.setJob(job);
		userVO.setCellPhone(cellPhone);
		userVO.setAddress(address);
		
		//db�� UserVO update	
		UserDAO userDao=new UserDAO();
		userDao.updateUser(userVO);
		
		HttpSession session=req.getSession(true);
		session.setAttribute("userVO" ,userVO);
		
		out.println("<html>");
		out.println("<head><title>���� ���� �Ϸ�</title></head>");
		out.println("<body>");
		
		
		if(userVO.isActive()) {
		     out.println(userVO.getName()+"�� ���� ���� �Ϸ�Ǿ����ϴ�.");
		     req.getSession(true).setAttribute("userVO",  userVO);
		}else {
			out.println("�����Ұ�, �ٽ� �������ּ���.");
		}
		
		out.println("<p><p><a href='findUser.html'>�α��� �� ��������</a>");
		out.println("<p><p><a href='FindUser'>ȸ������ ����</a>");
	
		out.println("</body>");
		out.println("</html>");

	}

}
