<%-- 
    Document   : consultar.jsp
    Created on : 30 de out. de 2024, 13:19:42
    Author     : 2108761
--%>

<%@page import="data.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String titulo = request.getParameter("titulo");
            if(titulo == null){
        %>
        
        <form action="consultar.jsp" method="post">
            TITULO <input type="text" name="titulo">
            <input type="submit" value="CONSULTAR">
        </form>
        
        <%
            }else{
                Banco b = new Banco();
                String titulos = b.getTitulos(titulo);
                out.print(titulos);
            }
        %>
    </body>
</html>
