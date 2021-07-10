package org.renu;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Site")
public class SiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		page = page.toLowerCase();

		switch (page) {

		case "home":
			homePage(request, response);

			break;

		default:
			errorPage(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public void errorPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "errorPage");
		request.getRequestDispatcher("error.jsp").forward(request, response);

	}

	public void homePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("title", "HomePage");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
