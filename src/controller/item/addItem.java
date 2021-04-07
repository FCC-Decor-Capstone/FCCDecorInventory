package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Item;
import models.ItemsBarcode;
import models.ItemSupplier;

/**
 * Servlet implementation class addItem
 */
@WebServlet("/Item")
public class addItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("action", "addItem");
        request.setAttribute("list",ItemSupplier.getAll());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ItemForm.jsp");
		dispatcher.forward(request, response);
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("action", "addItem");
		
		request.setAttribute("list",ItemSupplier.getAll());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ItemForm.jsp");

		Item item = new Item();
		ItemSupplier supplier = new ItemSupplier();
		
		
		//Request Verification 
		request.setAttribute("errName", item.setName(request.getParameter("itemName")));
		request.setAttribute("errCategory", item.setCategory(request.getParameter("category")));
		request.setAttribute("errDescription", item.setDescription(request.getParameter("description")));
			request.setAttribute("errSize", item.setSize(Double.parseDouble(request.getParameter("size"))));
			request.setAttribute("errColor", item.setColour(request.getParameter("color")));
			request.setAttribute("errCost", item.setinitialCost(Double.parseDouble(request.getParameter("initialCost"))));
			request.setAttribute("errLocation", item.setLocation(request.getParameter("Location")));
			request.setAttribute("errMultibarCode", item.setmultiBarcode(request.getParameter("multiBarcode")));
			request.setAttribute("errQuantity", item.setQuantity(Integer.parseInt(request.getParameter("quantity"))));
			request.setAttribute("errSupplier", item.setsupplierName(request.getParameter("supplierList")));
		    request.setAttribute("model",item);
		    request.setAttribute("model",supplier);
			
		if (item.hasError()) {
			request.setAttribute("ErrCtlMsg", "Item Adding Error");
		} else {
			Item.addNew(item);
//			Supplier.addNew(supplier);
			request.setAttribute("SucCtlMsg", "Item Added Successfully");
			request.setAttribute("ItemList", Item.getAll());
//			request.setAttribute("list",Supplier.getAll());
//		    dispatcher = request.getRequestDispatcher("/ItemForm.jsp");
			dispatcher = request.getRequestDispatcher("/read.jsp");
			// TODO redirect to Details
			//
		}
		
		dispatcher.forward(request, response);
	}
//	//get the data
//				String itemName = request.getParameter("itemName");
//				String category = request.getParameter("category");
//				String description = request.getParameter("description");
//				double size = Double.parseDouble(request.getParameter("size"));
//				String colour = request.getParameter("color");
//				double initialCost = Double.parseDouble(request.getParameter("initialCost"));
//				String location = request.getParameter("Location");
//				String multiBarcode = request.getParameter("multiBarcode");
//				int quantity = Integer.parseInt(request.getParameter("quantity"));
//				
//				
//				
//				//set up a item object
//				Item item = new Item();
//				item.setName(itemName);
//				item.setCategory(category);
//				item.setDescription(description);
//				item.setSize(size);
//				item.setColour(colour);
//				item.setinitialCost(initialCost);
//				item.setLocation(location);
//				item.setmultiBarcode(multiBarcode);
//				item.setQuantity(quantity);
//				
//				
//				
//				
//				//set up an addQuery object
//				AddQuery  aq = new AddQuery();
//				//pass the item to addQuery to add to the database
//				aq.doAdd(item);
//				
//				//pass execution control to the ReadServlet
//				String url ="/readItem";
//				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//				dispatcher.forward(request, response);
//				
//			
//	}

}
