package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		if (session.getAttribute("urole").equals("Administrator") || session.getAttribute("urole").equals("Manager")  || session.getAttribute("urole").equals("General User")) {
			String catVal = "", searchVal = "";
			if (request.getParameter("searchVal") != null) {
				if (!request.getParameter("searchVal").trim().isEmpty()) {
					searchVal = request.getParameter("searchVal").trim();
				}	
			}
			
			if (request.getParameter("catVal") != null) {
				if (!request.getParameter("catVal").trim().isEmpty()) {
					catVal = request.getParameter("catVal").trim();
					if (catVal.equalsIgnoreCase("All")) catVal = "";
				}	
			}
			
			if (catVal.concat(searchVal).length() > 0) {
				request.setAttribute("searchVal", searchVal);
				request.setAttribute("catVal", catVal);
				request.setAttribute("ItemList", Item.search(searchVal, catVal));	
			} else {
				request.setAttribute("ItemList", Item.getAll());
			}
	
			request.setAttribute("CatList", Item.getCategories());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/read.jsp");
			dispatcher.forward(request, response);
		} else
		{
			throw new RuntimeException("Invalid access");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
