package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.ReadQuery;
import model.Item;
import model.Supplier;

/**
 * Servlet implementation class readItem
 */
@WebServlet("/readItem")
public class readItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		if (request.getParameter("searchVal") != null) {
			if (!request.getParameter("searchVal").trim().isEmpty()) {
				request.setAttribute("search", request.getParameter("searchVal").trim());
				request.setAttribute("list", Item.search(request.getParameter("searchVal")));	
			} else {
				request.setAttribute("list", Item.getAll());
			}
		} else {
			request.setAttribute("ItemList", Item.getAll());
			
		}
		request.setAttribute("list",Supplier.getAll());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/read.jsp");
		dispatcher.forward(request, response);
	}

		   // Create  a ReadQuery helper object
//		    ReadQuery rq = new ReadQuery();
//		   
//
//		   // Get the HTML table from the ReadQuery object
//		    rq.doRead();
//		    String table = rq.getHTMLTable();
//
//		  // Pass excecution control to read.jsp along with the table
//		   request.setAttribute("table", table);
//		   request.setAttribute("list",Supplier.getAll());
//		   String url = "/read.jsp";
//		   
//
//		  RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//		  dispatcher.forward(request, response);
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//create a insert query helper object	
		 
//		   // Create  a ReadQuery helper object
//		    ReadQuery rq = new ReadQuery();
//		   
//
//		   // Get the HTML table from the ReadQuery object
//		    rq.doRead();
//		    String table = rq.getHTMLTable();
//
//		  // Pass excecution control to read.jsp along with the table
//		   request.setAttribute("table", table);
//		   String url = "/read.jsp";
//		   
//
//		  RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//		  dispatcher.forward(request, response);
		  

		
	}

}
