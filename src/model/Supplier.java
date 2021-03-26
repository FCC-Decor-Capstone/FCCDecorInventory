package model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import dbHelpers.DB;


public class Supplier {
	
	int id = -1;
	String name="";
	
	public Supplier() {
		
	}
	
	public Supplier(int id, String name) {
		super();
		this.id= id;
		this.name=name;
	}

	public static List<Supplier> getAll(){
		String select="SELECT * FROM Supplier";
		List<Supplier> list = new ArrayList<Supplier>();
		PreparedStatement ps;
		
		try {
			ps=DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Supplier(rs.getInt("supplierID"),rs.getString("name")));
			}
			if(list.size()>0) return list;
			else return null;
			
		

}catch(SQLException e) {
	e.printStackTrace();
}
		return null;
}
//	public static List<Supplier> getItems(int id) {
//		String select="SELECT * FROM Spplier WHERE supplierID = ?";
//		List<Supplier> list = new ArrayList<Supplier>(); 
//		PreparedStatement ps;
//		try {
//			ps = DB.getConnection().prepareStatement(select);
//			ps.setInt(1, id);
//			ResultSet rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				list.add(new Supplier(rs.getInt("itemGroupID"), rs.getString("itemName"), rs.getString("category"), rs.getString("description")));
//			}
//			if (list.size() > 0) return list; else return null;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	public int getId() {
		return id;
		
	}
	public void setId(int id) {
		this.id=id;
	}
	public String getName() {
		return name;
		
	}
	public void setName(String name) {
		this.name=name;
	}
}
	
	
