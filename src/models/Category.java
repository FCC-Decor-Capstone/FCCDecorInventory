package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dbHelpers.DB;

public class Category {

	int id = -1;
	String categoryType="";
	boolean hasError= false;
	public Category() {
		
	}
	public Category(int id, String catType,boolean hasError) {
		super();
		this.id = id;
		this.categoryType = catType;
		this.hasError = hasError;
	}
	public int getId() {
		return id;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public int setId(int id) {
		try {
			this.id = id;
			return id;
		} catch (NullPointerException npx) {
			this.hasError = true;
			return -1;
		}
	}
	public String setCategoryType(String categoryType) {
		try {
			if (categoryType.trim().isEmpty()) {
				hasError = true;
				return "Category Field cannot be empty";
			}
			if (categoryType.length() > 45) {
				hasError = true;
				return "Name Field cannot exceed 45 characters";
			}
			this.categoryType = categoryType;
			return "";
		} catch (NullPointerException npx) {
			return "category Field cannot be empty";
		}
	}
	
	public static Category addNew(Category newCategory) {
		
		String insert = "insert into Category (category) values(?);";
		PreparedStatement ps;
		try {
			ps = DB.getConnection().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, newCategory.getCategoryType());
			
			int result = ps.executeUpdate();
			System.out.println("inserted category: "+result);
			ResultSet rs = ps.getGeneratedKeys();
			int id = 0;
			if (rs.next()) {
				id = rs.getInt(1);
				System.out.println();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
