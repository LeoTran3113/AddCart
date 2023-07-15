package coding.mentor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import coding.mentor.dto.CartSession;
import coding.mentor.entity.Book;
import coding.mentor.service.BookService;

/**
 * Servlet implementation class RemoveItemServlet
 */
@WebServlet("/removeItem")
public class RemoveItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveItemServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			String id = request.getParameter("id");
			HttpSession session = request.getSession();
			CartSession cart = (CartSession) session.getAttribute("cart");

			if (id != null) {
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(Integer.parseInt(id));
				cart.getBooks().remove(book);
				boolean isRemovedSuccess = cart.getBooks().remove(book);
				//if(isRemovedSuccess) {
					cart.setTotalPrice(cart.getTotalPrice() - book.getPrice());
				//}
				session.setAttribute("cart", cart);
				response.sendRedirect("viewcart.jsp");
			} else {
				response.sendRedirect("viewcart.jsp");
			}

		} catch (Exception e) {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
