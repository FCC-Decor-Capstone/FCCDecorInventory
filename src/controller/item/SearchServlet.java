package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.searchQuery;
import models.Item;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		this.doPost(request, response);
		
		if (request.getParameter("searchVal") != null) {
			if (!request.getParameter("searchVal").trim().isEmpty()) {
				request.setAttribute("searchVal", request.getParameter("searchVal").trim());
				request.setAttribute("ItemList", Item.search(request.getParameter("searchVal")));	
			} else {
				request.setAttribute("ItemList", Item.getAll());
			}
		} else {
			request.setAttribute("ItemList", Item.getAll());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/read.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Get the text to search
//		String itemName = request.getParameter("searchVal");
//		//Create a SearchQuery helper object
//		searchQuery sq = new searchQuery();
//		
//		
//		//get the HTML table from the searchQuery
//		
//		sq.doSearch(itemName);
//		
//		String table =sq.getHTMLTable();
//		
//		//pass execution control to read.jsp along with table
////		request.setAttribute("table", table);
//		request.setAttribute("ItemList", Item.getAll());
//		String url="/read.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//		dispatcher.forward(request, response); 
		doGet(request, response);
	}
}