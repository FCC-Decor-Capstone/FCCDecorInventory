package model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import dbHelpers.DB;

public class ItemsBarcode {
	 String itemGroupId;
	 String itemName;
     String description;
	String itemId = "";
	 int quantity;
	String condition="";
	String purchaseDate ;
	boolean hasError = false;
	int id=0;
  

	
	public ItemsBarcode() {
		this.quantity = 0;
		this.itemGroupId = "";
		this.itemName = "";
		this.description = ""; 
		this.itemId = "";
		
	}
	public ItemsBarcode(int itemId) {
		super();
	}
	
	public ItemsBarcode(String iD,String itemName, String description,int quantity) {
		super();
		this.itemId= iD;
	
	}
	public ItemsBarcode(int iD,String itemName, String description,int quantity) {
		super();
		this.id= iD;
	
	}
	public static ItemsBarcode addNew(String itemId) {
		String insert="insert into Item (barcode,quantity,comments,itemGroupID)  Select itemName ,quantity, description,itemGroupID from ItemGroup where itemGroupID=?";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(insert,Statement.RETURN_GENERATED_KEYS);
//			ps.setString(1, barcode.getBarcode());
//			ps.setInt(2, barcode.getQuantity());
//			ps.setString(3, barcode.getComments());
			ps.setString(1, itemId);
			
			int result = ps.executeUpdate();
			System.out.println("Inserted ID is " + result);
			ResultSet rs = ps.getGeneratedKeys();
			int itemGroupId = 0;
			if (rs.next()) {
				itemGroupId = rs.getInt(1);
			    System.out.println(itemGroupId);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static List<ItemsBarcode> getAll() {
		String select="SELECT * FROM Item";
		List<ItemsBarcode> list = new ArrayList<ItemsBarcode>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new ItemsBarcode(rs.getInt("itemID"), rs.getString("barcode"),  rs.getString("comments"),rs.getInt("quantity")));
			}
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ItemsBarcode getByID(String ID) {
		String select="SELECT * FROM Item WHERE itemGroupID = ?;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setString(1,ID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				return new ItemsBarcode(ID, rs.getString("barcode"),  rs.getString("comments"),rs.getInt("quantity"));
			}
			return null;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<ItemsBarcode> getItems(String id) {
		String select="SELECT * FROM Item where itemGroupID=?";
		List<ItemsBarcode> list = new ArrayList<ItemsBarcode>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new ItemsBarcode(rs.getString("itemID"),  rs.getString("barcode"),  rs.getString("comments"),rs.getInt("quantity")));
			}
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getitemGroupId() {
		return itemGroupId;
		
	}
	public String setitemGroupId(String itemGroupId) {
		this.itemGroupId=itemGroupId;
		return "";
	}
	
	public String getDate() {
		return purchaseDate;
		
	}
	public boolean hasError() {
		return hasError;
	}


	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}

	public String setDate(String purchaseDate) {
		// TODO Auto-generated method stub
		
		try {
			if (purchaseDate.trim().isEmpty()) {
				hasError = true;
				return "Name Field cannot be empty";
			}
			if (purchaseDate.length() > 45) {
				hasError = true;
				return "Name Field cannot exceed 45 characters";
			}
			this.purchaseDate = purchaseDate;

			return "";
		} catch (NullPointerException npx) {
			return "Name Field cannot be empty";
		}
	}

	public String getBarcode() {
		// TODO Auto-generated method stub
		return itemName;
	}
	public String getBarcode(String itemName) {
		// TODO Auto-generated method stub
		try {
			if (itemName.trim().isEmpty()) {
				hasError = true;
				return "Name Field cannot be empty";
			}
			if (itemName.length() > 45) {
				hasError = true;
				return "Name Field cannot exceed 45 characters";
			}
			this.itemName = itemName;
			return "";
		} catch (NullPointerException npx) {
			return "Name Field cannot be empty";
		}
	}
	public int getQuantity() {
		// TODO Auto-generated method stub
		return quantity;
	}
	public int setQuantity(int quantity) {
		// TODO Auto-generated method stub
		try {
			this.quantity = quantity;
			return quantity;
		} catch (NullPointerException npx) {
			hasError = true;
			return -1;
		}
		
	}
	public String getComments() {
		// TODO Auto-generated method stub
		return description;
	}

	public String getComments(String description) {
		// TODO Auto-generated method stub
		
		try {
			if (description.length() > 45) {
				hasError = true;
				return "Comments Field cannot exceed 255 characters";
			}
			this.description = description;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
	}
	

}


	
