/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.dao.ProductDAO;
import anhhy.dto.ProductDTO;
import anhhy.dto.UserDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author AnhHY
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class CreateServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "image";
    private final String LOGIN_PAGE = "login.jsp";
    private final String ADMIN_SEARCH_SERVLET = "AdminSearchServlet";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = LOGIN_PAGE;
        try {
            String imgUrl = UPLOAD_DIR + "/" + uploadFile(request);
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USERS");
            if (user != null) {
                url = ADMIN_SEARCH_SERVLET;
                String txtName = request.getParameter("txtName");
                String txtDescription = request.getParameter("txtDescription");
                String txtPrice = request.getParameter("txtPrice");
                String txtQuantity = request.getParameter("txtQuantity");
                String txtCategory = request.getParameter("txtCategory");

                ProductDTO productDTO = new ProductDTO();
                productDTO.setName(txtName);
                productDTO.setDescription(txtDescription);
                productDTO.setPrice(Float.parseFloat(txtPrice));
                productDTO.setQuantity(Integer.parseInt(txtQuantity));
                productDTO.setCategoryId(Integer.parseInt(txtCategory));
                productDTO.setImage(imgUrl);

                ProductDAO productDAO = new ProductDAO();
                productDAO.insertProduct(productDTO, user.getId());
            }
        } catch (SQLException ex) {
            log("CreateServlet_SQLException: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("CreateServlet_ClassNotFoundException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("CreateServlet_NamingException: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName;
        try {
            Part filePart = request.getPart("photo");

            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");

            //File.separator: \ 
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;

            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (IOException e) {
                log("UpdateProductServlet_IOException: " + e.getMessage());
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }
        } catch (IOException | ServletException e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
               return content.substring(content.lastIndexOf('\\') + 1).replaceAll(" ", "").replaceAll("\"", "").replace("filename=", "").trim();
            }
        }
        return null;
    }
}
