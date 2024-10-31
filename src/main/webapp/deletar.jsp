<%-- 
    Document   : deletar
    Created on : 30 de out. de 2024, 13:48:50
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
        
        <form action="deletar.jsp" method="post">
            TITULO <input type="text" name="titulo">
            <input type="submit" value="DELETAR">
        </form>
        
        <%
            }else{
                Banco b = new Banco();
                b.deleteLivro(titulo);
                out.print("LIVRO DELETADO COM SUCESSO!");
            }
        %>
    </body>
</html>
