package models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import dbHelpers.DB;

public class Event {
	int id = -1;
	String name = "", client = "",location = "", telephone = "", comments = "";
	
	
	public Event(int id, String name, String client, String location, String telephone, String comments, Date eventDate) {
		super();
		this.id = id;
		this.name = name;
		this.client = client;
		this.location = location;
		this.telephone = telephone;
		this.comments = comments;
		this.eventDate = eventDate;
		this.hasError = hasError;
	}
	Date eventDate = Date.valueOf("2020-01-01");
	boolean hasError = false;
	
	public Event() {
		
	}
	
	@Override 
	public String toString() {
		return 	((id==-1)?"":"Event ID: " + id) +  
				"\nEvent Name: " + name +
				"\nEvent Date: " + eventDate+ 
				"\nEvent Location: " + location+ 
				"\nEvent Client: " + client + 
				"\nClient Telephone: " + telephone + 
				"\nComments: " + comments;
	}

	
	public static Event addNew(Event newEvent) {
		String insert="INSERT INTO Event (name, client, location, telephone, comments, eventDate) VALUES(?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(insert,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1,newEvent.getName());
			ps.setString(2,newEvent.getClient());
			ps.setString(3,newEvent.getLocation());
			ps.setString(4,newEvent.getTelephone());
			ps.setString(5,newEvent.getComments());
			ps.setDate(6,newEvent.getEventDate());
			
			int result = ps.executeUpdate();
			System.out.println("Inserted ID is " + result);
			ResultSet rs = ps.getGeneratedKeys();
			int id = 0;
			if (rs.next()) {
			    id = rs.getInt(1);
			    System.out.println(id);
			}
			  DB.closeConnection();
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
		
	public static Event editByID(Event newEvent) {
		String update="UPDATE Event SET name = ?, client = ?, location = ?, telephone = ?, comments = ?, eventDate = ? WHERE eventID = ?";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(update);
			ps.setString(1,newEvent.getName());
			ps.setString(2,newEvent.getClient());
			ps.setString(3,newEvent.getLocation());
			ps.setString(4,newEvent.getTelephone());
			ps.setString(5,newEvent.getComments());
			ps.setDate(6,newEvent.getEventDate());
			ps.setInt(7,newEvent.getId());
			int result = ps.executeUpdate();
			  DB.closeConnection();
			if (result==1) {
				return newEvent;
			}
			else 
				return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	public static Event getByID(int ID) {
		String select="SELECT * FROM Event WHERE eventID = ?;";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setInt(1,ID);
			ResultSet rs = ps.executeQuery();
			Event event = null;
			while(rs.next()) { 
				event = new Event(	ID, 
									rs.getString("name"), 
									rs.getString("client"), 
									rs.getString("location"),
									rs.getString("telephone"), 
									rs.getString("comments"),
									rs.getDate("eventDate"));
			}
			DB.closeConnection();
			return event;
		
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	public static int deleteByID(int ID) {
		PreparedStatement ps;
		String check="Select * from ItemGroup join Item using(itemGroupID) join ItemEvent ie using(itemID) WHERE eventID = ? AND dateBack IS NULL ORDER By dateBack, ItemGroup.itemName;";
		String delete="DELETE FROM Event WHERE eventID = ?;";
		try {
			ps = DB.getConnection().prepareStatement(check);
			ps.setInt(1,ID);
			ResultSet rs = ps.executeQuery();
			int size = 0;
	        while(rs.next()){
		            size++;
	        }
				if (size == 0) {
					//if all items in the event are returned, no non returned items found
					ps = DB.getConnection().prepareStatement(delete);
					ps.setInt(1,ID);
					int result = ps.executeUpdate();
					DB.closeConnection();
					  
					if (result==1) {
						//deleted
						return 1;
					}
					else {
						//not deleted
						return 0;
					}
				}
				else {
					//not deleted cuz some non returned items found
					DB.closeConnection();
					return 2;
				}
				
		
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		//not deleted some error
		return 0;
	}
	
	public static List<Event> getAll() {
		String select="SELECT * FROM Event ORDER BY eventDate DESC";
		List<Event> list = new ArrayList<Event>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Event(	rs.getInt("eventID"), 
									rs.getString("name"), 
									rs.getString("client"), 
									rs.getString("location"),
									rs.getString("telephone"), 
									rs.getString("comments"),
									rs.getDate("eventDate")));
			}
			  DB.closeConnection();
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<Event> search(String word) {
		String select="SELECT * FROM Event WHERE LOWER(CONCAT(name, ' ', client, ' ',location, ' ', telephone, ' ',comments,' ',eventDate)) LIKE LOWER(?) ORDER BY eventDate DESC";
		List<Event> list = new ArrayList<Event>(); 
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(select);
			ps.setString(1, "%" + word + "%");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new Event(	rs.getInt("eventID"), 
									rs.getString("name"), 
									rs.getString("client"), 
									rs.getString("location"),
									rs.getString("telephone"), 
									rs.getString("comments"),
									rs.getDate("eventDate")));
			}
			  DB.closeConnection();
			if (list.size() > 0) return list; else return null;
		} catch (SQLException e) {
			  DB.closeConnection();
			e.printStackTrace();
		}
		return null;
	}
	
	public int getId() {
		return id;
	}
	public boolean hasError() {
		return hasError;
	}


	public void setHasError(boolean hasError) {
		this.hasError = hasError;
	}


	public int setId(int id) {
		try {
			this.id = id;
			return id;
		} catch (NullPointerException npx) {
			hasError = true;
			return -1;
		}
	}
	public String getName() {
		return name;
	}
	public String setName(String name) {
		try {
			if (name.trim().isEmpty()) {
				hasError = true;
				return "Name Field cannot be empty";
			}
			if (name.length() > 45) {
				hasError = true;
				return "Name Field cannot exceed 45 characters";
			}
			this.name = name;
			return "";
		} catch (NullPointerException npx) {
			return "Name Field cannot be empty";
		}
	}
	public String getClient() {
		return client;
	}
	public String setClient(String client) {
		try {
			if (client.length() > 45) {
				hasError = true;
				return "Contact Field cannot exceed 45 characters";
			}
			this.client = client;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
		
	}
	public String getLocation() {
		return location;
	}
	public String setLocation(String location) {
		try {
			if (location.length() > 255) {
				hasError = true;
				return "Contact Field cannot exceed 255 characters";
			}
			this.location = location;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
		
	}
	
	
	public String getTelephone() {
		return telephone;
	}
	public String setTelephone(String telephone) {
		try {
			if (telephone.length() > 45) {
				hasError = true;
				return "Telephone Field cannot exceed 45 characters";
			}
			this.telephone = telephone;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
		
	}
	public String getComments() {
		return comments;
	}
	public String setComments(String comments) {
		try {
			if (comments.length() > 2000) {
				hasError = true;
				return "Comments Field cannot exceed 255 characters";
			}
			this.comments = comments;
			return "";
		} catch (NullPointerException npx) {
			hasError = true;
			return "";
		}
	}
	
	public Date getEventDate() {
		return eventDate;
	}
	public String setEventDate(String dateStr) {
		try {
			this.eventDate = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(dateStr).getTime());;
			return "";
			
		} catch (NullPointerException | ParseException npx) {
			hasError = true;
			return "";
		}
		
	}
	
	
	
}
