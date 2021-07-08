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
import models.ItemsBarcode;
import models.Logs;



/**
 * Servlet implementation class DeleteBarcode
 */
@WebServlet("/DeleteBarcode")
public class DeleteBarcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBarcode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("urole").equals("Administrator") || session.getAttribute("urole").equals("Manager")) {


			if (request.getParameter("barcodeId") != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("");
				try {
					
					int id = Integer.parseInt(request.getParameter("barcodeId"));
					ItemsBarcode oldItem = ItemsBarcode.getByID(id);
					if (ItemsBarcode.deleteByID(id)) {
						
						Logs.addNew(new Logs((int)session.getAttribute("uid"),"Item Barcodes", "Deleted Barcode(Item Piece):\n\n" + oldItem.toString() + "\n\nBelonging to Item:\n" + Item.getByID(oldItem.getitemGroupId()) ,""));
						
						response.sendRedirect(request.getContextPath() + "/ItemDetails?itemGroupId=" + request.getParameter("itemGroupId"));
//						
					} else {
						request.setAttribute("ErrCtlMsg", "Error Deleting barcode ");
						dispatcher.forward(request, response);
					}
				} catch (NumberFormatException nfe) {
					request.setAttribute("ErrCtlMsg", "Can't fulfil request without ID");
					dispatcher.forward(request, response);
				} 
			}
			
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
