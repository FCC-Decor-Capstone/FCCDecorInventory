package controllers.event;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Event;
import models.Logs;

/**
 * Servlet implementation class DeleteEvent
 */
@WebServlet(value="/Event/Delete")
public class DeleteEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("urole") == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}
		if (session.getAttribute("urole").equals("Administrator")||session.getAttribute("urole").equals("Manager")) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("");
		if (request.getParameter("id") != null) {
			try {
				
				int id = Integer.parseInt(request.getParameter("id"));
				Event oldEvent = Event.getByID(id) ;
				
				switch (Event.deleteByID(id)) {
				case 1:
					request.setAttribute("SucCtlMsg", "Deleted Event Successfully");
					Logs.addNew(new Logs((int)session.getAttribute("uid"),"Event", "Deleted Event:\n\n" + oldEvent.toString() ,""));
					response.sendRedirect("./.");
					return;
				case 2:
					request.setAttribute("ErrCtlMsg", "Can't Delete Events having Items not returned");
					break;
					
				default:
					request.setAttribute("ErrCtlMsg", "Error Deleting Event");
				}
			} catch (NumberFormatException nfe) {
				request.setAttribute("ErrCtlMsg", "Can't fulfil request without ID");
			} 
		}
		
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
