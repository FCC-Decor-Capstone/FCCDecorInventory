package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbHelpers.DeleteQuery;
import models.Item;
import models.Logs;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("urole").equals("Administrator")||session.getAttribute("urole").equals("Manager")) {
			int ItemGroupID = Integer.parseInt(request.getParameter("itemGroupId"));
			Item olditem = Item.getByID(ItemGroupID);
			//craete a delelteQuery object 
			DeleteQuery dq = new DeleteQuery();
			
			//use delete Query to delete record
			dq.doDelete(ItemGroupID);
			
			//logs
			Logs.addNew(new Logs((int)session.getAttribute("uid"),"Items", "Deleted Item:\n\n" + olditem.toString() ,""));
			
			
			//pass execution on  to the ReadServlet
			String url="/ListItem";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
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
		//get items id
		doGet(request, response);
		
	}

}
