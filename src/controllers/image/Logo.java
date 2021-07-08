package controllers.image;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logo
 */
@WebServlet("/Img")
public class Logo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  ServletContext cntx= request.getServletContext();
	      // Get the absolute path of the image
		  String name="";
		  if (request.getParameter("name") != null) {
				if (!request.getParameter("name").trim().isEmpty()) {
					name = request.getParameter("name").trim();
				}	
			}
		  String filename = "";
		  switch (name) {
			  case "logo":
				  filename = cntx.getRealPath("images/logo.png");
				  break;
			  case "invlogo":
				  filename = cntx.getRealPath("images/invlogo.png");
				  break;
			  case "favicon":
				  filename = cntx.getRealPath("images/favicon.ico");
				  break;
			 default:
				 HttpSession session = request.getSession();
				 
				 if (session.getAttribute("urole") != null) {
					 
				 } else {
					 response.setStatus(HttpServletResponse.SC_FORBIDDEN);
					return;
				 }
		  }
		  
		  
		  
	     
			try {
			      
			      // retrieve mimeType dynamically
			      String mime = cntx.getMimeType(filename);
			      if (mime == null) {
			    	  response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			        return;
			      }
	
			      response.setContentType(mime);
			      File file = new File(filename);
			      response.setContentLength((int)file.length());
	
			      FileInputStream in = new FileInputStream(file);
			      OutputStream out = response.getOutputStream();
	
			      // Copy the contents of the file to the output stream
			       byte[] buf = new byte[1024];
			       int count = 0;
			       while ((count = in.read(buf)) >= 0) {
			         out.write(buf, 0, count);
			      }
			    out.close();
			    in.close();
			} catch (java.io.FileNotFoundException e) {
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
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
