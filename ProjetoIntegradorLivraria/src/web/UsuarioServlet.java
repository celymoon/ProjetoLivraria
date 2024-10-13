package web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import model.UsuarioBean;


/**
 * @email Ramesh Fadatare
 */

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
        UsuarioBean usuarioBean = new UsuarioBean();
        usuarioBean.setUsuario(usuario);
        usuarioBean.setSenha(senha);
        
        try {
            if (loginDao.validate(usuarioBean)) {
            	 HttpSession session = request.getSession();
                 session.setAttribute("usuario", usuario);
                 response.sendRedirect("adm.jsp");
                
            } else {
               // HttpSession session = request.getSession();
                //ession.setAttribute("usuario", usuario);
                //response.sendRedirect("index.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        
        
    }
}