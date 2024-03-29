package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbHelpers.UpdateQuery;
import models.Item;
import models.ItemsBarcode;
import models.Logs;

/**
 * Servlet implementation class UpdateItem
 */
@WebServlet("/UpdateItem")
public class UpdateItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//get the form data and set the item object
		HttpSession session = request.getSession();
		if (session.getAttribute("urole").equals("Administrator") || session.getAttribute("urole").equals("Manager")) {
		int itemGroupId = Integer.parseInt(request.getParameter("itemGroupID"));
		String itemName = request.getParameter("itemName");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		String size = request.getParameter("size");
		String colour = request.getParameter("color");
		double initialCost = Double.parseDouble(request.getParameter("initialCost"));
		String location = request.getParameter("Location");
		String multiBarcode = request.getParameter("multiBarcode");
		String oldMultiBarcode = request.getParameter("oldMultibarcode");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		//only for logs
		Item oldItem = Item.getByID(itemGroupId);
		
		Item item = new Item();
		item.setItemGroupID(itemGroupId);
		item.setName(itemName);
		item.setCategory(category);
		item.setDescription(description);
		item.setSize(size);
		item.setColour(colour);
		item.setinitialCost(initialCost);
		item.setLocation(location);
		item.setmultiBarcode(multiBarcode);
		item.setQuantity(quantity);
		try {
			item.setsupplierID(Integer.parseInt(request.getParameter("supplierList")));
		} catch (Exception e) {
			item.setsupplierID(2);
		}
		
		if (!oldMultiBarcode.equalsIgnoreCase(multiBarcode)) {
			ItemsBarcode.deleteAllByGroupID(itemGroupId);
		}
		
		//create an UpdateQuery object and use it to update  a item
		UpdateQuery dq = new UpdateQuery();
		dq.doUpdate(item);
		
		//log 
		Logs.addNew(new Logs((int) session.getAttribute("uid"),"Items", 
				"Editted Item Name:" + item.getName() + 
				"\n\nBefore Changes: \n"+  oldItem.toString() + 
				"\n\nAfter Changes: \n"+  item.toString(),""));
		
		//pass the control to read servlet
		String url="/ListItem";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response); 
		} else
		{
			throw new RuntimeException("Invalid access");
		}
	}

}