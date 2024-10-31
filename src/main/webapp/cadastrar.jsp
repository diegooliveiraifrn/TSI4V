<%-- 
    Document   : cadastrar
    Created on : 30 de out. de 2024, 14:00:39
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
            String id = request.getParameter("id");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String edicao = request.getParameter("edicao");
            String editora = request.getParameter("editora");
            String ano = request.getParameter("ano");
            String codigo = request.getParameter("codigo");
            String exemplares = request.getParameter("exemplares");
            
            if(titulo == null){
        %>
        
        <form action="cadastrar.jsp" method="post">
            ID         <input type="text" name="id"><br>
            TITULO     <input type="text" name="titulo"><br>
            AUTOR      <input type="text" name="autor"><br>
            EDICAO     <input type="text" name="edicao"><br>
            EDITORA    <input type="text" name="editora"><br>
            ANO        <input type="text" name="ano"><br>
            CODIGO     <input type="text" name="codigo"><br>
            EXEMPLARES <input type="text" name="exemplares"><br>
            <input type="submit" value="CADASTRAR">
        </form>
        
        <%
            }else{
                Banco b = new Banco();
                b.cadastrarLivro(id, titulo, autor, edicao, editora, ano, codigo, exemplares);
                out.print("LIVRO CADASTRADO COM SUCESSO!");
            }
        %>
    </body>
</html>
