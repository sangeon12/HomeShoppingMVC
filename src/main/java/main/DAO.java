package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;

public class DAO {
	private static DAO instance = new DAO();
	public static DAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			System.out.println("오라클 연결");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오라클 연결 실패");
		}
		return conn;
	}
	
	public void close(ResultSet rs, Connection conn, PreparedStatement pstmt) {
		if(rs != null) try {rs.close();} catch (Exception e) {e.printStackTrace();}
		if(conn != null) try {conn.close();} catch (Exception e) {e.printStackTrace();}
		if(pstmt != null) try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public ArrayList<MemberVO> memberList = new ArrayList<>();
	public ArrayList<MoneyVO> moneyList = new ArrayList<>();
	public ArrayList<MemberVO> updateList = new ArrayList<>();
	
	public void addMemberList() {
		memberList.clear();
		try {
			String selectSql = "select * from member_tbl_02";
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6), rs.getString(7));
				memberList.add(vo);
			}
			
			close(rs, conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리스트 맴버 추가 실패");
		}
	}
	
	public void insertMemberList(MemberVO vo) {
		try {
			String insertSql = "insert into member_tbl_02 values(?,?,?,?,SYSDATE,?,?)";
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(insertSql);
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.executeUpdate();
			
			close(null, conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("맴버 추가 실패");
		}
	}
	
	public void addMoneyList() {
		moneyList.clear();
		try {
			String selectSql = "select a.custno, a.custname, a.grade, sum(b.price) as price from member_tbl_02 a, money_tbl_02 b where a.custno = b.custno group by a.custno, a.custname, a.grade order by price desc";
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MoneyVO vo = new MoneyVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
				moneyList.add(vo);
			}
			
			close(rs, conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("매출 추가 실패");
		}
	}
	
	public String grade(String grade) {
		String[] grade1 = {"VIP", "일반", "직원"};
		String[] grade2 = {"A", "B", "C"};
		String grade3 = "";
		
		for(int i = 0; i < grade1.length; i++) {
			if(grade2[i].equals(grade)) {
				grade3 = grade1[i];
			}
		}
		return grade3;
	}
	
	public String city(String city) {
		String[] city1 = {"서울", "인천", "성남", "대전", "광주", "부산"};
		String[] city2 = {"01", "10", "20", "30", "40", "60"};
		String city3 = "";
		
		for(int i = 0; i < city1.length; i++) {
			if(city2[i].equals(city)) {
				city3 = city1[i];
			}
		}
		return city3;
	}
	
	public int maxCustno() {
		int max = 0;
		for(int i = 0; i < memberList.size(); i++) {
			if(max < memberList.get(i).getCustno()) {
				max = memberList.get(i).getCustno();
			}
		}
		return max + 1;
	}
	
	public void updateMember(MemberVO vo) {
		try {
			String updateSql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?";
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(updateSql);
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getGrade());
			pstmt.setString(5, vo.getCity());
			pstmt.setInt(6, vo.getCustno());
			pstmt.executeUpdate();
			
			close(null, conn, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
		}
	}
}
