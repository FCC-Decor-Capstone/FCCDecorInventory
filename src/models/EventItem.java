package models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dbHelpers.DB;

public class EventItem {
	
	private int groupQuantity = 0;
	private boolean multibarcode = false; 
	private String name="";

	private int itemID = 0, eventID = 0, userTaken = 0, userBack=0,quantity=0;
	private String dateTaken = "", dateBack = "";

	
	
	
	public EventItem(int itemID, String name, int groupQuantity, boolean multibarcode) {
		super();
		this.groupQuantity = groupQuantity;
		this.multibarcode = multibarcode;
		this.name = name;
		this.itemID = itemID;
	}

	public EventItem(	int eventID,
						int itemID,
						String name,
						boolean multibarcode,
						int groupQuantity,
						int quantity,
						int userTaken, 
						int userBack,  
						String dateTaken, 
						String dateBack 
						) {
		super();
		this.groupQuantity = groupQuantity;
		this.multibarcode = multibarcode;
		this.name = name;
		this.itemID = itemID;
		this.eventID = eventID;
		this.userTaken = userTaken;
		this.userBack = userBack;
		this.quantity = quantity;
		this.dateTaken = dateTaken;
		this.dateBack = dateBack;
	}
	
	public static HashMap<String,String> getUsers() {
		HashMap<String,String> hmUsers = new HashMap<String,String>();
		String select="Select * from Users;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				hmUsers.put(String.valueOf(rs.getInt("id")), rs.getString("name"));
			}
			return hmUsers;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}		
		
	} 
	
	public static List<EventItem> getLinkedItems(int ID) {
		List<EventItem> list = new ArrayList<EventItem>();
		String select="Select * from Item join ItemGroup using(itemGroupID) join ItemEvent using(itemID) WHERE eventID = ?;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setInt(1,ID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				EventItem item = new EventItem(	ID,
												rs.getInt("itemID"),
												rs.getString("itemName"), 
												isMulti(rs.getString("multibarcode")),
												rs.getInt("ItemGroup.quantity"),
												rs.getInt("Item.quantity"),
												rs.getInt("userTaken"), 
												rs.getInt("userBack"),
												dateOF(rs.getDate("dateTaken")), 
												dateOF(rs.getDate("dateBack"))						
												) ;
				
				item.setEventID(ID);
				list.add(item);
			}
			return list;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println(e.getCause() +"\n\n" +   e.getMessage());
			return null;
		}		
	}
	
	public static boolean isMulti(String word) {
		if (word.contains("y")) return true; else return false;
	}
	
	public static String dateOF (Date sqlDate) {
		try {
			String result = sqlDate.toString();
			if (!result.equals("2020-01-01")) {
				return result;
			} else return "";
		} catch (Exception e) {
			return "";
		}
	}
	
	public static List<EventItem> getAllItems() {
		List<EventItem> list = new ArrayList<EventItem>();
		String select="Select * from Item join ItemGroup using(itemGroupID) join ItemEvent using(eventID) WHERE eventID = ?;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				list.add(new EventItem( 	rs.getInt("itemID"),
											rs.getString("itemName"), 
											rs.getInt("Item.quantity"), 
											isMulti(rs.getString("multibarcode"))
											));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return null;
		}	
	}
	
	public int getItemID() {
		return itemID;
	}
	public void setItemID(Integer itemID) {
		if (itemID != null) this.itemID = itemID;
	}
	public int getEventID() {
		return eventID;
	}
	public void setEventID(Integer eventID) {
		if (eventID != null) this.eventID = eventID;
	}
	
	public int getGroupQuantity() {
		return groupQuantity;
	}
	public void setGroupQuantity(Integer groupQuantity) {
		if (groupQuantity != null) this.groupQuantity = groupQuantity;
	}
	public boolean isMultibarcode() {
		return multibarcode;
	}
	public void setMultibarcode(boolean multibarcode) {
		this.multibarcode = multibarcode;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(name != null) this.name = name;
	}
	public int getUserTaken() {
		return userTaken;
	}
	public void setUserTaken(Integer userTaken) {
		if (userTaken != null) this.userTaken = userTaken;
	}
	public int getUserBack() {
		return userBack;
	}
	public void setUserBack(Integer userBack) {
		if (userBack != null) this.userBack = userBack;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		if (quantity != null) this.quantity = quantity;
	}
	
	
	public String getDateTaken() {
		return dateTaken;
	}
	public void setDateTaken(String dateTaken) {
		if(dateTaken != null) this.dateTaken = dateTaken;
	}
	public String getDateBack() {
		return dateBack;
	}
	public void setDateBack(String dateBack) {
		if(dateBack != null)  this.dateBack = dateBack;
	}
	
}


