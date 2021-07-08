package models;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import dbHelpers.DB;
import models.Item;






public class Item {
    private int itemGroupId;
    private int supplierID;
	private String itemName;
	private String description;
	private String size;
	private String colour;
	private double initialCost;
	private String location;
	private String multiBarcode;
	private int quantity;
	private String category;
	boolean hasError = false;
	
	public Item() {
		this.itemGroupId = 0;
		this.supplierID = 0;
		this.itemName = "";
		this.description = ""; 
		this.size = "";
		this.colour = "";
		this.initialCost = 0.0;
		this.location = "";
		this.multiBarcode = "";
		this.quantity = 0;
		this.category ="";
	}
 
	public Item(int itemGroupId, String itemName, String description,String size,String colour,double initialCost,String location,
			String multiBarcode,int quantity,String category,int supplierID){
		this.itemGroupId =itemGroupId;
		this.itemName = itemName;
		this.description = description;
		this.size = size;
		this.colour = colour;
		this.initialCost = initialCost;
		this.location = location;
		this.multiBarcode = multiBarcode;
		this.quantity = quantity;
		this.category = category;
	
		this.supplierID = supplierID;
		this.itemGroupId = itemGroupId;
	}
 
	public boolean hasError() {
		return hasError;
	}


	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}

	public String getName() {
		// TODO Auto-generated method stub
		return itemName;
	}
	public String setName(String itemName) {
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
	



	public String getdescription() {
		// TODO Auto-generated method stub
		return description;
	}

	public String setDescription(String description) {
		// TODO Auto-generated method stub
		
		try {
			if (description.length() > 1000) {
				hasError = true;
				return "description Field cannot exceed 255 characters";
			}
			this.description = description;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
	}



	public String getsize() {
		// TODO Auto-generated method stub
		return size;
	}
	public String setSize(String size) {
		// TODO Auto-generated method stub
		try {
			if (size.length() > 25) {
				hasError = true;
				return "Size Field cannot exceed 45 characters";
			}
			this.size = size;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
		
		
	}




	public String getColour() {
		// TODO Auto-generated method stub
		return colour;
	}

	public String setColour(String colour) {
		// TODO Auto-generated method stub
		try {
			if (colour.length() > 45) {
				hasError = true;
				return "Name Field cannot exceed 45 characters";
			}
			this.colour = colour;

			return "";
		} catch (NullPointerException npx) {
			return "Name Field cannot be empty";
		}
			}



	public double getinitialCost() {
		// TODO Auto-generated method stub
		return initialCost;
	}

	public String setinitialCost(double initialCost) {
		// TODO Auto-generated method stub
		
		try {
			this.initialCost = initialCost;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "cost not numeric";
		}
		
	}



	public String getmultiBarcode() {
		// TODO Auto-generated method stub
		return multiBarcode;
	}
	public String setmultiBarcode(String multiBarcode) {
		// TODO Auto-generated method stub
		try {
			if (multiBarcode.trim().isEmpty()) {
				hasError = true;
				return "multiBarcode Field cannot be empty";
			}
			if (multiBarcode.length() > 8) {
				hasError = true;
				return "multiBarcode Field cannot exceed 8 characters";
			}
			this.multiBarcode = multiBarcode;
			return "";
		} catch (NullPointerException npx) {
			return "multiBarcode Field cannot be empty";
		}
		
	}

	
	public int getsupplierID() {
		return supplierID;
	}
	public int setsupplierID(int supplierID) {
		// TODO Auto-generated method stub
		
		try {
			this.supplierID = supplierID;
			return supplierID;
		} catch (NullPointerException npx) {
			hasError = true;
			return 1;
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




	public String getLocation() {
		// TODO Auto-generated method stub
		return location;
	}
	public String setLocation(String location) {
		// TODO Auto-generated method stub
		
		try {
			if (location.length() > 45) {
				hasError = true;
				return "location Field cannot exceed 45 characters";
			}
			this.location = location;

			return "";
		} catch (NullPointerException npx) {
			return "location Field cannot be empty";
		}
	}




	public String getCategory() {
		// TODO Auto-generated method stub
		return category;
	}
	public String setCategory(String category) {
		// TODO Auto-generated method stub
		try {
			if (category.trim().equalsIgnoreCase("")) {
				hasError = true;
				return "Select the category";
			}
			this.category = category;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
		
		
	}

	public int getitemGroupId() {
		// TODO Auto-generated method stub
		return itemGroupId;
	}

	public void setItemGroupID(int itemGroupId) {
		// TODO Auto-generated method stub
		this.itemGroupId = itemGroupId;
	}
	public static Item updateQuantity() {
		String update="UPDATE ItemGroup\r\n" + 
				"SET quantity = 1\r\n" + 
				"WHERE multiBarcode = 'no' ";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(update);
			
			
			int result = ps.executeUpdate();
			  DB.closeConnection();
			if (result==1) {
				return null;
			}
			else 
				return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static Item addNew(Item item) {
		String insert="insert into ItemGroup (itemName,category,description,size,colour,initialCost,location,multiBarcode,quantity,supplierID) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(insert,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, item.getName());
			ps.setString(2, item.getCategory());
			ps.setString(3, item.getdescription());
			ps.setString(4, item.getsize());
			ps.setString(5, item.getColour());
			ps.setDouble(6, item.getinitialCost());
			ps.setString(7, item.getLocation());
			ps.setString(8, item.getmultiBarcode());
			ps.setInt(9, item.getQuantity());
			
			ps.setInt(10, item.getsupplierID());
			int result = ps.executeUpdate();
			System.out.println("Inserted ID is " + result);
			ResultSet rs = ps.getGeneratedKeys();
			int itemGroupId = 0;
			if (rs.next()) {
				itemGroupId = rs.getInt(1);
			    System.out.println(itemGroupId);
			}
			  DB.closeConnection();
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	

	public int setSupplierID(int supplierID) {
		// TODO Auto-generated method stub
		try {
			this.supplierID = supplierID;
			return supplierID;
		} catch (NullPointerException npx) {
			hasError = true;
			return -1;
		}
		
	}
	public static List<Item> getAll() {
		String select="SELECT * FROM ItemGroup";
		List<Item> list = new ArrayList<Item>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Item(rs.getInt("itemGroupID"), rs.getString("itemName"),  rs.getString("description"), rs.getString("size"),
						rs.getString("colour"),rs.getDouble("initialCost"),rs.getString("location"),rs.getString("multiBarcode"),rs.getInt("quantity"),rs.getString("category"),rs.getInt("supplierID")));
			}
			  DB.closeConnection();
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<String> getCategories() {
		String select="SELECT DISTINCT Category FROM pldinven_fccdecor.ItemGroup Order by category";
		List<String> list = new ArrayList<String>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString("Category"));
			}
			  DB.closeConnection();
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	public static Item getByID(int ID) {
		String select="SELECT * FROM ItemGroup WHERE itemGroupID = ?;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setInt(1,ID);
			ResultSet rs = ps.executeQuery();
			Item item = null; 
			while(rs.next()) { 
				item = new Item(ID, rs.getString("itemName"),  rs.getString("description"), rs.getString("size"),
						rs.getString("colour"),rs.getDouble("initialCost"),rs.getString("location"),rs.getString("multiBarcode"),rs.getInt("quantity"),rs.getString("category"),rs.getInt("supplierID"));
			}
			 DB.closeConnection();
			return item;
		
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	public static List<Item> getItems(int id) {
		String select="SELECT *  FROM ItemGroup where itemGroupID=?";
		List<Item> list = new ArrayList<Item>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Item(rs.getInt("itemGroupID"), rs.getString("itemName"),  rs.getString("description"), rs.getString("size"),
						rs.getString("colour"),rs.getDouble("initialCost"),rs.getString("location"),rs.getString("multiBarcode"),rs.getInt("quantity"),rs.getString("category"),rs.getInt("supplierID")));
			}
			  DB.closeConnection();
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	public static List<Item> search(String word, String valCat) {
		int conditionCount = 0;
		String conditions = " where ";
		ArrayList<String> psAttr = new ArrayList<String>();
		
		if (word.length() > 0) {
			conditionCount++;
			conditions += "lower(CONCAT(itemName, ' ', category, ' ', IFNULL(description,''), ' ',IFNULL(size,''),' ',IFNULL(colour,''),' ', initialCost,' ' , IFNULL(location,''), ' ', quantity,' ', IFNULL(supplierID,2))) LIKE lower(?)";
			psAttr.add("%" + word + "%");
		}
		if (valCat.length() > 0) {
			if (conditionCount > 0) conditions += " AND ";
			conditionCount++;
			conditions += " Category = ? ";
			if (valCat.equals("Empty")) {
				psAttr.add("");
			} else {
				psAttr.add(valCat);
			}
		
		}
		
		String select=	"select * from ItemGroup " + conditions + " ORDER BY itemName ASC";
		List<Item> list = new ArrayList<Item>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			for (int i = 0; i < psAttr.size(); i++) {
				ps.setString(i+1, psAttr.get(i));
			}
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Item(rs.getInt("itemGroupID"), rs.getString("itemName"),  rs.getString("description"), rs.getString("size"),
						rs.getString("colour"),rs.getDouble("initialCost"),rs.getString("location"),rs.getString("multiBarcode"),rs.getInt("quantity"),rs.getString("category"),rs.getInt("supplierID")));
			}
			  DB.closeConnection();
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
}
