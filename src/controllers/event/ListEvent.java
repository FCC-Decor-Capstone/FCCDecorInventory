package controllers.event;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Event;

/**
 * Servlet implementation class ListEvent
 */
@WebServlet(value="/Event/")
public class ListEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if (request.getParameter("search") != null) {
			if (!request.getParameter("search").trim().isEmpty()) {
				request.setAttribute("search", request.getParameter("search").trim());
				request.setAttribute("list", Event.search(request.getParameter("search")));	
			} else {
				request.setAttribute("list", Event.getAll());
			}
		} else {
			request.setAttribute("list", Event.getAll());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/event/table.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
