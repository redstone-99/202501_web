package test.food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.food.dto.FoodDto;
import test.util.DbcpBean;

public class FoodDao {
	
	// 매개변수로 전달되는 맛집 1개의 정보를 가져오는 메소드
    public FoodDto getData(int num) {
    	FoodDto dto = null;
    	
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            conn = new DbcpBean().getConn();
            String sql = """
                SELECT num, type, name, price
                FROM food
                WHERE num = ?
            """;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
            	dto = new FoodDto();
            	dto.setNum(rs.getInt("num"));
            	dto.setType(rs.getString("type"));
            	dto.setName(rs.getString("name"));
            	dto.setPrice(rs.getInt("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return dto;
    }

    // 맛집 정보를 업데이트하고 성공 여부를 리턴하는 메소드
    public boolean update(FoodDto food) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rowCount = 0;
        
        try {
            conn = new DbcpBean().getConn();
            //실행할 미완성의 sql 문
            String sql = """
                UPDATE food
                SET type = ?, name = ?, price = ?
                WHERE num = ?
            """;
            pstmt = conn.prepareStatement(sql);
            // ? 에 값을 여기서 바인딩한다.
            pstmt.setString(1, food.getType());
            pstmt.setString(2, food.getName());
            pstmt.setInt(3, food.getPrice());
            pstmt.setInt(4, food.getNum());
            
            rowCount = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return rowCount > 0;
    }
	
	//맛집 1개의 정보를 삭제하고 성공 여부를 리턴하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 미완성의 sql 문
			String sql = """
				DELETE FROM food
				WHERE num=?			
			""";
			pstmt = conn.prepareStatement(sql);	
			// ? 에 값을 여기서 바인딩한다.
			pstmt.setInt(1, num);
			// sql 문 실행하고 변화된 row 의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//맛집 1개의 정보를 추가하고 성공 여부를 리턴하는 메소드
	public boolean insert(FoodDto dto) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			conn=new DbcpBean().getConn();
			//실행할 미완성의 sql 문
			String sql="""
				INSERT INTO food
				(num, type, name, price)
				VALUES(food_seq.NEXTVAL, ?, ?, ?)
			""";
			pstmt=conn.prepareStatement(sql);
			// ? 에 값을 여기서 바인딩한다.
			pstmt.setString(1, dto.getType());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			// sql 문 실행하고 변화된 row 의 갯수 리턴받기
			rowCount=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			}catch(Exception e) {}
		}
		if(rowCount > 0) {
			return true;
		}else {
			return false;
		}
	}// insert()
	
	//맛집 목록을 리턴하는 메소드 
	public List<FoodDto> getList(){
		List<FoodDto> list=new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection Pool 로 부터 Connection 객체 하나 가져오기 
			conn=new DbcpBean().getConn();
			//실행할 sql 문 작성
			String sql="""
				SELECT num, type, name, price
				FROM food
				ORDER BY num ASC
			""";
			pstmt=conn.prepareStatement(sql);
			// ? 에 값 바인딩할게 있으면 여기서 하기
			
			//sql 문 실행하고 결과를 ResultSet 객체로 리턴받기
			rs=pstmt.executeQuery();
			while(rs.next()) {
				// 커서가 위치한 곳의 칼럼 내용을 읽어와서 dto 에 저장
				FoodDto dto=new FoodDto();
				dto.setNum(rs.getInt("num"));
				dto.setType(rs.getString("type"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				//맛집 정보 1개가 담긴 dto 를 List 객체에 누적 시키기
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		//List 객체 리턴하기 
		return list;
	}// getList()
	
}// class