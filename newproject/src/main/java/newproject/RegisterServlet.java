package newproject;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system", "admin");

            String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, password);

            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
            	 
                response.sendRedirect("index.html");

            } else {
                response.getWriter().print("Error registering user.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

