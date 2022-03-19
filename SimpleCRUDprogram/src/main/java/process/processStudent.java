package process;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.studentDao;
import studentEntity.student;


@WebServlet("/processStudent")
public class processStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		out.print("Please refresh page");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sname = request.getParameter("s_name");
		String sdob = request.getParameter("s_dob");
		String sdoj = request.getParameter("s_doj");
		student s = new student();
		if(sname!=""&&sdob!=""&&sdoj!="")
		{
			s.setS_name(sname);
			s.setS_dob(sdob);
			s.setS_doj(sdoj);
			
			try {
				studentDao.save(s);
				} 
			catch (Exception e) {
				e.printStackTrace();
				}
			
			
			RequestDispatcher rd = request.getRequestDispatcher("StudentForm.jsp");
			rd.include(request, response);
		}
		else
		{
			PrintWriter out = response.getWriter();
			out.print("Please fill the all fields");
		}
		
		
	}

}
