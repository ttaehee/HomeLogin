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
		
		//클라이언트가 적은 정보 value 얻기
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
		
		//얻은 value UserVO에 저장
		UserVO userVO=new UserVO();
		userVO.setId(id);
		userVO.setPassword(password);
		userVO.setName(name);
		userVO.setGender(gender);
		userVO.setBirth(birth);
		userVO.setJob(job);
		userVO.setCellPhone(cellPhone);
		userVO.setAddress(address);
		
		//db에 UserVO update	
		UserDAO userDao=new UserDAO();
		userDao.updateUser(userVO);
		
		HttpSession session=req.getSession(true);
		session.setAttribute("userVO" ,userVO);
		
		out.println("<html>");
		out.println("<head><title>정보 수정 완료</title></head>");
		out.println("<body>");
		
		
		if(userVO.isActive()) {
		     out.println(userVO.getName()+"님 정보 수정 완료되었습니다.");
		     req.getSession(true).setAttribute("userVO",  userVO);
		}else {
			out.println("수정불가, 다시 기입해주세요.");
		}
		
		out.println("<p><p><a href='findUser.html'>로그인 후 정보보기</a>");
		out.println("<p><p><a href='FindUser'>회원정보 보기</a>");
	
		out.println("</body>");
		out.println("</html>");

	}

}
