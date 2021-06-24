package dbHelpers;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.Item;
import models.Supplier;

public class BarcodeQuery {
	private Item item = new Item();
	 private String value;
	//private Connection con; //NOTE: was replaced by the singleton db connection 
	private ResultSet results = null;
	
	public BarcodeQuery(String value){
//		System.out.println();
		
		//Edit: Con was replaced by the singleton db connection 
		
//		InputStream input=getClass().getClassLoader().getResourceAsStream("dbConnection.properties");
//		Properties props = new Properties();
		this.value = value;
//		
//		try {
//			props.load(input);
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		try {
//			input.close();
//		}
//		catch(IOException e1) {
//			
//		}
//		String driver=props.getProperty("driver");
//		String url=props.getProperty("server");
//		String username=props.getProperty("username");
//		String passwd=props.getProperty("password");
//
//		
//		try {
//			Class.forName(driver);
//		}
//		catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		try {
//			con = DriverManager.getConnection(url,username,passwd);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(url + " " +  passwd + "  " +  username + "  " + driver);
		
		 
		
	}
	public static String getItemName(int barcode){
		String select="SELECT * FROM Item WHERE itemID = ?";
		PreparedStatement ps;
		String result = "";
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setInt(1, barcode);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				result = rs.getString("itemName");
			}
			  DB.closeConnection();
			if (!result.equalsIgnoreCase("")) return result; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void  doBarcode(){
		
		//Edit:  INACTIVE CODE, This was old code, giving errors was replaced by method above
		String query = "select * from ItemGroup where itemGroupID =?";
		 
		 try {
			PreparedStatement ps =  DB.getConnection().prepareStatement(query);
			
			ps.setString(1,this.value);
			this.results = ps.executeQuery();
			this.results.next();
			 item.setItemGroupID(this.results.getInt(1)); //line was producing errors
			    item.setName(this.results.getString("itemName"));
			    item.setCategory(this.results.getString("category"));
			    item.setDescription(this.results.getString("description"));
			    item.setSize(this.results.getString("size"));
			    item.setColour(this.results.getString("colour"));
			    item.setinitialCost(this.results.getDouble("initialCost"));
			    item.setLocation(this.results.getString("location"));
			    item.setmultiBarcode(this.results.getString("multiBarcode"));
			    item.setQuantity(this.results.getInt("quantity"));
			    item.setSupplierID(this.results.getInt("supplierID"));
			    
			 //Added in case reused
			    DB.closeConnection();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			DB.closeConnection();
			e.printStackTrace();
		}
	 }
   public Item getItem() {
	   return this.item;
   }

}
