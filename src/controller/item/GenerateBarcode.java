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
 * Servlet implementation class GenerateBarcode
 */
@WebServlet("/GenerateBarcode")
public class GenerateBarcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateBarcode() {
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
		int id = Integer.parseInt(request.getParameter("ItemGroupID"));
	       
        int newbarcode = ItemsBarcode.addNew(id);
        Logs.addNew(new Logs((int)session.getAttribute("uid"),"Item Barcodes", "Added New Barcode("+ newbarcode + ") for Item:\n\n" + Item.getByID(id).toString(),""));
        request.setAttribute("listBarcode", ItemsBarcode.getItems(id));
	      // RequestDispatcher   dispatcher = request.getRequestDispatcher("/barcodeTable.jsp");
	       response.sendRedirect(request.getContextPath() + "/ItemDetails?itemGroupId=" + id);
	
	       //dispatcher.forward(request, response);
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
