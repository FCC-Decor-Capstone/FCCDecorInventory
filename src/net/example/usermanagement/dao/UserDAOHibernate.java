package net.example.usermanagement.dao;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;

import net.example.usermanagement.model.Logs;
import net.example.usermanagement.model.User;

public class UserDAOHibernate {
	static Session sessionObj;
    static SessionFactory sessionFactoryObj;
    
    public static synchronized SessionFactory getSessionFactory() {
    	
        if (sessionFactoryObj == null) {
        	buildSessionFactory();
        }
        return sessionFactoryObj;
    }

    
    // This Method Is Used To Create The Hibernate's SessionFactory Object
    private static SessionFactory buildSessionFactory() {
    	// Creating configuration Instance and Passing Hibernate Configuration File
    	Configuration configObj = new Configuration();
    	configObj.configure("/resources/hibernate.cfg.xml").addAnnotatedClass(User.class);
    	configObj.configure("/resources/hibernate.cfg.xml").addAnnotatedClass(Logs.class);
    	
    	// Since Hibernate Version 4.x and newer, ServiceRegistry Is Being Used
    	ServiceRegistry serviceRegistryObj = new 
    			StandardServiceRegistryBuilder().applySettings(configObj.getProperties()).build();
    	
    	// Creating Hibernate SessionFactory Instance
    	sessionFactoryObj = configObj.buildSessionFactory(serviceRegistryObj);
    	System.out.print("Rebuilding");
    	return sessionFactoryObj;
    }
    
    public void insertUser(User user) {
		// try-with-resource statement will auto close the connection.
		try {
			
			if(MD5(user.getPassword()).equals("")) {
				System.out.print("Cannot be encrypted");
				return;
			}else {
				String hash = MD5(user.getPassword());
				
				user.setPassword(hash);
				// Getting Session Object From SessionFactory
				sessionObj = getSessionFactory().openSession();
				// Getting Transaction Object From Session Object
				sessionObj.beginTransaction();
				// save 'user' object to session as a transaction
				sessionObj.save(user);
				// Committing The Transactions To The Database
	            sessionObj.getTransaction().commit();
	            System.out.println("\nSuccessfully Created Record(s) In The Database!\n");
			}
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return ;
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
	}
    
    private String MD5(String c) throws UnsupportedEncodingException {
		
    	try {
			MessageDigest digs = MessageDigest.getInstance("MD5");
			byte[] messageDigest = digs.digest(c.getBytes());
			BigInteger number = new BigInteger(1, messageDigest );
			String hashtext = number.toString(16);
			while(hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
						
			return hashtext;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			return "";
		}
    }
    
    public List<User> selectAllUsers() {
		List<User> users = new ArrayList<>();

		try {
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
 
            users = sessionObj.createQuery("FROM User").list();
            System.out.println("\nSuccessfully Get Record(s) In The Database!\n");
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return selectAllUsers();
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return users;
	}
    
    public List<Logs> selectAllLogs() {
		List<Logs> logs = new ArrayList<>();

		try {
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
 
            logs = sessionObj.createQuery("FROM Logs ORDER BY LogID DESC").list();
            System.out.println("\nSuccessfully Get Record(s) In The Database!\n");
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return selectAllLogs();
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return logs;
	}
    
    public boolean updateUser(User user) {
		boolean rowUpdated = true;

		try {
//			if(MD5(user.getPassword()).equals("")) {
//				System.out.print("Cannot be encrypted");
//				return false;
//			}else {
				//System.out.println("Hashing password: " + user.getPassword());
				//String hash = MD5(user.getPassword());
				
				//user.setPassword(hash);
			sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
            
            // Creating Transaction Entity
            sessionObj.update(user);
 
            // Committing The Transactions To The Database
            sessionObj.getTransaction().commit();
            //rowUpdated = true;
            System.out.println("\nSuccessfully Updated Record In The Database!\n");
			//}
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return updateUser(user);
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
			rowUpdated = false;
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return rowUpdated;
	}
    
    public boolean updateUserSettings(User user) {
		boolean rowUpdated = true;
		try {
		System.out.print(user.getPassword());
			//if(user.getPassword() == null) {
			// user.getPassword();
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
            
            // Creating Transaction Entity
            sessionObj.update(user);
 
            // Committing The Transactions To The Database
            sessionObj.getTransaction().commit();
            //rowUpdated = true;
            System.out.println("\nSuccessfully Updated Record In The Database!\n");
			//}
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return updateUserSettings(user);
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
			rowUpdated = false;
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return rowUpdated;
	}
    
    public boolean deleteUser(int id) {
		boolean rowDeleted;
		try {
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
 
            User findUser = (User) sessionObj.load(User.class, id);
            sessionObj.delete(findUser);
 
            // Committing The Transactions To The Database
            sessionObj.getTransaction().commit();
            rowDeleted = true;
            System.out.println("\nSuccessfully Deleted Record In The Database!\n");
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return deleteUser(id);
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
			rowDeleted = false;
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return rowDeleted;
	}
    
    public User loginUser(String login_email, String login_password) {
		User user = null;
		String login_status = "Active";
		
		try {
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
            login_password = MD5(login_password);
            // FROM User, the User is Object / Class and so the param belong to Object / Class, not the table name!
            System.out.println(login_password);
            Query hql_query = sessionObj.createQuery("FROM User u WHERE u.email = :email AND u.password = :password AND u.status = :status");
            hql_query.setParameter("email",login_email);
            hql_query.setParameter("password",login_password);
            hql_query.setParameter("status",login_status);
            
            List<User> result = hql_query.list();
    		if(!result.isEmpty())
    			user = result.get(0);
 
            System.out.println("\nSuccessfully Login !\n");
		} catch (java.lang.IllegalStateException  e) {
			buildSessionFactory();
			return loginUser(login_email, login_password);
            
		} catch (org.hibernate.exception.JDBCConnectionException  e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return loginUser(login_email, login_password);
			
		} catch (Exception e) {
			if(sessionObj != null) {
				if(sessionObj.getTransaction() != null ) {
					System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
	                sessionObj.getTransaction().rollback();
	            }
			}
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return user;
	}
    
    public User selectUser(int id) {
		User user = null;
		try {
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
            
            // FROM User, the User is Object / Class and so the param belong to Object / Class, not the table name!
            user = (User) sessionObj.load(User.class, id);
 
            // Committing The Transactions To The Database
            sessionObj.getTransaction().commit();
            System.out.println("\nSuccessfully Selected 1 Record By ID In The Database!\n");
		} catch (java.lang.IllegalStateException  e) {
			buildSessionFactory();
			return selectUser(id);
		
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return selectUser(id);
			
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return user;
	}
	
	public User selectUser(String email, String role) {
		User user = null;
		try {
			// Getting Session Object From SessionFactory
            sessionObj = getSessionFactory().openSession();
            // Getting Transaction Object From Session Object
            sessionObj.beginTransaction();
            
            // FROM User, the User is Object / Class and so the param belong to Object / Class, not the table name!
            Query hql_query = sessionObj.createQuery("FROM User u WHERE u.email = :email AND u.role = :role");
            hql_query.setParameter("email",email);
            hql_query.setParameter("role",role);

            List<User> result = hql_query.list();
    		if(!result.isEmpty())
    			user = result.get(0);
 
            System.out.println("\nSuccessfully Selected 1 Record By Email and Role In The Database!\n");
            
		} catch (org.hibernate.exception.JDBCConnectionException e) {
			sessionFactoryObj.close();
			buildSessionFactory();
			return selectUser(email,role);
            
		} catch (Exception e) {
			if(null != sessionObj.getTransaction()) {
				System.out.println("\n.......Transaction Is Being Rolled Back.......\n");
                sessionObj.getTransaction().rollback();
            }
            e.printStackTrace();
		} finally {
	        if(sessionObj != null) {
	            sessionObj.close();
	        }
	    }
		return user;
	}
}