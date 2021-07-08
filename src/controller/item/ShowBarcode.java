	package controller.item;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.krysalis.barcode4j.HumanReadablePlacement;
import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;

import dbHelpers.BarcodeQuery;
import models.Item;
import models.ItemsBarcode;
import models.Logs;

/**
 * Servlet implementation class CreateBarcode
 */
@WebServlet("/ShowBarcode")
public class ShowBarcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBarcode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("urole").equals("Administrator") || session.getAttribute("urole").equals("Manager")) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("");	
		//get items id
		
		String value=request.getParameter("barcodeId");
		
		//logs by RMD
		int id = Integer.parseInt(request.getParameter("barcodeId"));
		ItemsBarcode barcode = ItemsBarcode.getByID(id);
		Logs.addNew(new Logs((int)session.getAttribute("uid"),"Item Barcodes", "Print Request for Barcode(Item Piece):\n\n" + barcode.toString() + "\n\nBelonging to Item:\n" + Item.getByID(barcode.getitemGroupId()) ,""));
		    
	    
	   //get id to generate barcode for items
	  
				
 

		String title = BarcodeQuery.getItemName(Integer.parseInt(value)); 

		
		response.setContentType("text/html");
		//response.setContentType("image/jpg");
		Code128Bean code128 = new Code128Bean();
		code128.setHeight(11.5f);
		code128.setModuleWidth(0.25);
		code128.setQuietZone(0);
		code128.setMsgPosition(HumanReadablePlacement.HRP_NONE);
		code128.doQuietZone(false);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		BitmapCanvasProvider canvas = new BitmapCanvasProvider(baos, "image/x-png",300,BufferedImage.TYPE_BYTE_BINARY,false,0);
		
		code128.generateBarcode(canvas, value);
		canvas.finish();
		
		//ServletOutputStream responseOutputStream = response.getOutputStream();
		//responseOutputStream.write(baos.toByteArray());
		
		response.getWriter().append(""
				+ "<!DOCTYPE html><html lang=\"en\">"
				+ "<head>"
					+ "<meta charset=\"UTF-8\">"
					+ "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"
					+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
					+ "<title>Document</title>"
					+ "<style>"
					+ "@media print"
					+ "{"
					+ "    .no-print, .no-print *"
					+ "    {"
					+ "        display: none !important;"
					+ "    }"
					+ "}"
					+ "</style>"
				+ "</head>"
				+ "<body onload=\"let params = new URLSearchParams(location.search);"
								+ "console.log('print is ' + params.get('prt'));"
								+ "console.log('close is ' + params.get('cls'));"
								+ "console.log(params.get('prt') == 'true');"
								+ "if (params.get('prt') == 'true') window.print();"
								+ "if (params.get('cls') == 'true') setTimeout(function(){window.close()},100);"
								+ "\">"
					+ "<div style=\"width:210px;height:83px;overflow:hidden;\">"
						+ "<img style=\"max-width: 100%;\" src=\"data:image/x-png;base64," + Base64.getEncoder().encodeToString(baos.toByteArray()) + "\" >"
						+ "<p style=\"text-align: center; margin: 0px;margin-top: -5px;white-space: nowrap;\">" + value + " - " + title + "</p>"
					+ "</div>"
						
					+ "<div class=\"no-print\" style=\"margin:2em;padding:1em;border:10px solid green; background-color:lightyellow;\">"
						+ "<h2 style=\"\">Printing Instructions</h2>"
						+ "<p style=\"\">Tested using chrome based browser, Use a browser that allows changing the following printing properties</p>"
						+ "<ul>"
							+ "<li>Destination Printer: DYMO_LabelWriter_450</li>"
							+ "<li>Layout: Landscape</li>"
							+ "<li>Paper Size: 30252 Address</li>"
							+ "<li>Margins: None</li>"
						+ "</ul>"
						+ "<p style=\"\">also make sure printer default printing density is light so barcode lines dont blend, light density will make it easy on the barcode scannerd</p></br>"
						+ "<p style=\"\">For Automatic Printing and Closure of Tab</p>"
							+ "<ul>"
								+ "<li>Make sure browser is not blocking javascript (should be default)</li>"
								+ "<li>Depending on browser you need to enable auto printing</li>"
								+ "<h4 style=\"margin:0px;\">Firefox</h4>"
								+ "<ul>"
									+ "<li>in about:config, you have to add new variable \"print.always_print_silent\" as boolean and set to true </li>"
									+ "<li>refer to this <a href=\"http://forums.mozillazine.org/viewtopic.php?t=48336\">link</a></li>"
								+ "</ul>"
								+ "<h4 style=\"margin:0px;\">Chrome</h4>"
								+ "<ul>"
									+ "<li>You have to add to the chrome command start option in target section \"--kiosk-printing\"</li>"
									+ "<li>refer to this <a href=\"https://www.shoptill-e.com/support/48\">link</a></li>"
								+ "</ul>"
								
							+ "</ul>"
					+ "</div>"
				+ "</body>"
				+ "</html>");
				
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
