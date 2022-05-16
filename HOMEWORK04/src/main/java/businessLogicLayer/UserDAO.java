package businessLogicLayer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jw.common.dao.AbstractDao;


public class UserDAO extends AbstractDao {

	public UserDAO() {
		// TODO Auto-generated constructor stub
		System.out.println("DB 시작");
	}
	
	public void addUser(UserVO userVO) {
		
		System.out.println("UserDAO addUser시작");
		
		Connection con=connect();

		PreparedStatement pstmt=null;
		
		try {					
				
					pstmt=con.prepareStatement("INSERT INTO homework VALUES(?,?,?,?,?,?,?,?)");
					pstmt.setString(1, userVO.getId());
					pstmt.setString(2, userVO.getPassword());
					pstmt.setString(3, userVO.getName());
					pstmt.setString(4, userVO.getGender());
					pstmt.setString(5, userVO.getBirth());
					pstmt.setString(6, userVO.getJob());
					pstmt.setString(7, userVO.getCellPhone());
					pstmt.setString(8, userVO.getAddress());
					
					pstmt.executeQuery();
					userVO.setActive(true);
		
					System.out.println("데이터 insert 성공");
			
		}catch(Exception e) {
			System.out.println("SQL Exception"+e.getMessage());
			e.printStackTrace();
		}
		close(con,pstmt);
	}
	
	public UserVO findUser(String id) {
		
		System.out.println("UserDAO  findUser시작");
		
		Connection con=connect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		UserVO userVO=null;
		
		try {
			
			userVO=new UserVO();
			
			String query="Select * FROM homework WHERE id=?";
			
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, id);
				
			rs=pstmt.executeQuery();	
			
			if(rs.next()) {
				userVO.setActive(true);
				
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setName(rs.getString("name"));
				userVO.setGender(rs.getString("gender"));
				userVO.setBirth(rs.getString("birth"));
				userVO.setJob(rs.getString("job"));
				userVO.setCellPhone(rs.getString("cellphone"));
				userVO.setAddress(rs.getString("address"));
				System.out.println(userVO);
			}else {
				System.out.println("db에 "+userVO.getId() +"에 해당하는 자료가 없습니다.");
			}
			
			
		}catch(Exception e) {
			System.out.println("SQL Exception"+e.getMessage());
		}
		close(con,pstmt,rs);
		return userVO;
	}
	
	public void updateUser(UserVO userVO) {
		
		System.out.println("UserDAO  updateUser시작");
		
		Connection con=connect();
		PreparedStatement pstmt=null;
		
		try {
			
			String query="UPDATE homework SET password=?, name=?, gender=?, birth=?, job=?, cellphone=?, address=? WHERE id=?";
			
			pstmt=con.prepareStatement(query);
			System.out.println("UserDAO, DB update 전 userVO:"+userVO);
			pstmt.setString(1, userVO.getPassword());
			pstmt.setString(2, userVO.getName());
			pstmt.setString(3, userVO.getGender());
			pstmt.setString(4, userVO.getBirth());
			pstmt.setString(5, userVO.getJob());
			pstmt.setString(6, userVO.getCellPhone());
			pstmt.setString(7, userVO.getAddress());
			pstmt.setString(8, userVO.getId());
			
			
			if(pstmt.executeUpdate()==1) {
				userVO.setActive(true);
				System.out.println("DB update 성공");				
			}else {
				userVO.setActive(false);
				System.out.println("DB update 실패");
			}
			
			
		}catch(Exception e) {
			System.out.println("SQL Exception"+e.getMessage());
			e.printStackTrace();
		}
		close(con,pstmt);
	}

}
