package models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dbHelpers.DB;

/*
 * Notes:
 * 2020-01-01 is the minimum date, if it is inserted into database it is considered null
 * 
 * 
 * */
		


public class EventItem {
	
	private int groupQuantity = 0;
	private boolean multibarcode = false; 
	private String name="";

	private int itemID = 0, eventID = 0, userTaken = 0, userBack=0,quantity=0;
	private String dateTaken = "", dateBack = "";

	
	
	
	public EventItem(int itemID, String name, int quantity, boolean multibarcode) {
		super();
		setGroupQuantity(quantity);;
		setMultibarcode(multibarcode);
		setName(name);
		setItemID(itemID);
	}

	public EventItem(	int eventID,
						int itemID,
						String name,
						boolean multibarcode,
						int groupQuantity,
						int quantity,  
						String dateTaken, 
						String dateBack ,
						int userTaken, 
						int userBack
						) {
		super();
		setGroupQuantity(groupQuantity);
		setMultibarcode(multibarcode);
		setName(name);
		setItemID(itemID);
		setEventID(eventID);
		setUserTaken(userTaken);
		setUserBack(userBack);
		setQuantity(quantity);;
		setDateTaken(dateTaken);
		setDateBack(dateBack);
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
//		String select="Select * from ItemGroup join Item using(itemGroupID) join ItemEvent ie using(itemID) WHERE eventID = ?;";
		String select="Select * from ItemGroup join Item using(itemGroupID) join ItemEvent ie using(itemID) WHERE eventID = ?;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setInt(1,ID);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				EventItem item = new EventItem(	ID,
												rs.getInt("itemID"),
												rs.getString("ItemGroup.itemName"), 
												isMulti(rs.getString("multibarcode")),
												rs.getInt("quantity"),
												rs.getInt("quantityIE"),
												dateOF(rs.getDate("dateTaken")), 
												dateOF(rs.getDate("dateBack")),	
												rs.getInt("userTaken"), 
												rs.getInt("userBack")					
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
		if (word != null)
			if (word.contains("y")) return true; else return false;
		else return false;
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
		String select="Select * from Item join ItemGroup using(itemGroupID);";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) { 
				list.add(new EventItem( 	rs.getInt("itemID"),
											rs.getString("ItemGroup.itemName"), 
											rs.getInt("ItemGroup.quantity"), 
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