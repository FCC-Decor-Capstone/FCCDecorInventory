package dbHelpers;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DB {
	private static Connection connection;
	private static String driver,url,username,passwd;
	
	public static void loadProperties() {
		InputStream input= DB.class.getClassLoader().getResourceAsStream("dbConnection.properties");
		Properties props = new Properties();
		try {
			props.load(input);
		} catch (IOException e1) {
			// TODO remove
			e1.printStackTrace();
		}
		 driver=props.getProperty("driver");
		 url=props.getProperty("server");
		 username=props.getProperty("username");
		 passwd=props.getProperty("password");
		
	}
	
	public static Connection getConnection() {
		loadProperties();
		try {
			Class.forName(driver);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			if(connection != null) {
				if (!connection.isClosed()) { 
					return connection;
				} else {
					connection = DriverManager.getConnection(url,username,passwd);	
				}
			} else {
				connection = DriverManager.getConnection(url,username,passwd);
			}
		} catch (SQLException e) {
			// TODO remove
			e.printStackTrace();
		}
		return connection;
	}
	
	
	public static void closeConnection() {
// Realized better keep the 1 connection open rather than opening and closing, as earlier method was keeping some open
		
		try {
			if(connection != null) {
				if (!connection.isClosed()) {
					connection.close();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
