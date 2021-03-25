package controllers.event;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Event;
import models.EventItem;

/**
 * Servlet implementation class DetailEvent
 */
@WebServlet(value="/Event/Details")
public class DetailEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		if (request.getParameter("id") != null) {
			try {
				int id = Integer.parseInt(request.getParameter("id"));
				Event model = Event.getByID(id);
				if (model != null) {
					request.setAttribute("model", model);
					request.setAttribute("listLinkedItems", EventItem.getLinkedItems(id));
					request.setAttribute("listAllItems", EventItem.getAllItems());
					request.setAttribute("listhmUsers", EventItem.getUsers());
					dispatcher = request.getRequestDispatcher("/event/details.jsp");
				} else {
					request.setAttribute("ErrCtlMsg", "Event Not Found");
				}
			} catch (NumberFormatException nfe) {
				request.setAttribute("ErrCtlMsg", "Can't fulfil request without ID");
			} 
		}
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
