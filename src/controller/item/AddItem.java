package controller.item;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Category;
import models.Item;
import models.ItemSupplier;
import models.Logs;

/**
 * Servlet implementation class AddItem
 */
@WebServlet("/AddItem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItem() {
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
				request.setAttribute("action", "AddItem");
		        request.setAttribute("list",ItemSupplier.getAll());
		        request.setAttribute("CatList", Item.getCategories());
		       
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ItemForm.jsp");
				dispatcher.forward(request, response);
				/* doPost(request,response); */
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
		HttpSession session = request.getSession();
		if (session.getAttribute("urole").equals("Administrator") || session.getAttribute("urole").equals("Manager")) {

				request.setAttribute("action", "AddItem");
				
				request.setAttribute("list",ItemSupplier.getAll());
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/ItemForm.jsp");

				Item item = new Item();
				ItemSupplier supplier = new ItemSupplier();
				
				
				//Request Verification 
				request.setAttribute("errName", item.setName(request.getParameter("itemName")));
				request.setAttribute("errCategory", item.setCategory(request.getParameter("category")));
				request.setAttribute("errDescription", item.setDescription(request.getParameter("description")));
				request.setAttribute("errSize", item.setSize(request.getParameter("size"))); 
				request.setAttribute("errColor", item.setColour(request.getParameter("color")));
				if (request.getParameter("initialCost") != null) {
						if (!request.getParameter("initialCost").trim().equalsIgnoreCase("")) {
							request.setAttribute("errCost", item.setinitialCost(Double.parseDouble(request.getParameter("initialCost"))));
						}
					}
	
					request.setAttribute("errLocation", item.setLocation(request.getParameter("Location")));
					request.setAttribute("errMultibarCode", item.setmultiBarcode(request.getParameter("multiBarcode")));
					if (request.getParameter("quantity") != null) {
							request.setAttribute("errQuantity", item.setQuantity(Integer.parseInt(request.getParameter("quantity"))));
					}
					if (request.getParameter("supplierList") != null) {
							request.setAttribute("errSupplier", item.setsupplierID(Integer.parseInt(request.getParameter("supplierList"))));
					}
				    request.setAttribute("model",item);
				    request.setAttribute("models",supplier);
					
				if (item.hasError()) {
					request.setAttribute("ErrCtlMsg", "Item Adding Error");
					
				} else {
					Item.addNew(item);
//					Supplier.addNew(supplier);
					Logs.addNew(new Logs((int)session.getAttribute("uid"),"Items", "Added New Item:\n" + item.toString(),""));
					response.sendRedirect(request.getContextPath()+"/ListItem");
					return;
					/*
					 * request.setAttribute("SucCtlMsg", "Item Added Successfully");
					 * request.setAttribute("ItemList", Item.getAll());
					 * //request.setAttribute("ItemList", Item.updateQuantity());
					 * 
					 * // request.setAttribute("list",Supplier.getAll()); // dispatcher =
					 * request.getRequestDispatcher("/ItemForm.jsp");
					 * 
					 * request.setAttribute("ItemList", Item.getAll());
					 * request.setAttribute("list",ItemSupplier.getAll());
					 * request.setAttribute("CatList", Item.getCategories());
					 * //request.setAttribute("Categorylist",Category.getAll()); dispatcher =
					 * request.getRequestDispatcher("/read.jsp");
					 */
					// TODO redirect to Details
					//
				}
				
				dispatcher.forward(request, response);
			} else
			{
				throw new RuntimeException("Invalid access");
			}
		}

//						
//					
//			}
	}


