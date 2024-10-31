package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Banco {
    
    private Statement stmt;
    private ResultSet rs;
    private Connection conn;
    
    
    public Banco(){
        String url = "jdbc:mysql://localhost:3306/livraria";
        String usr = "root";
        String pas = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            conn = DriverManager.getConnection(url, usr, pas);
            
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public String getTipo(String login) throws SQLException{
        String tipo = "";
        rs = stmt.executeQuery("SELECT tipo FROM usuario WHERE login = '"+login+"'");
        while(rs.next()){
            tipo = rs.getString("tipo");
        }
        return tipo;
    }
    
    public String getSenha(String login) throws SQLException{
        String senha = "";
        rs = stmt.executeQuery("SELECT senha FROM usuario WHERE login = '"+login+"'");
        while(rs.next()){
            senha = rs.getString("senha");
        }
        return senha;
    }
    
    public String getTitulos(String titulo) throws SQLException{ //era getLivros
        String titulos = "";
        rs = stmt.executeQuery("SELECT * FROM livros WHERE titulo like '%"+titulo+"%'");
        while(rs.next()){
            titulos += rs.getString("titulo") + "<br>";
        }
        return titulos;
    }
    
    public void deleteLivro(String titulo) throws SQLException{
        stmt.executeUpdate("DELETE FROM livros WHERE titulo = '"+titulo+"'");
    }
    
    public void cadastrarLivro(String id, String titulo, String autor, String edicao, String editora, String ano, String codigo, String exemplares) throws SQLException{
        stmt.executeUpdate("INSERT INTO livros VALUES('"+id+"', '"+titulo+"', '"+autor+"', '"+edicao+"', '"+editora+"', '"+ano+"', '"+codigo+"', '"+exemplares+"')");
    }
    
    public void atualizarLivro(String tituloAntigo, String tituloNovo, String autor, String edicao, String editora, String ano, String codigo, String exemplares) throws SQLException{
        stmt.executeUpdate("UPDATE livros SET \n" +
                "titulo='"+tituloNovo+"', \n" +
                "autor='"+autor+"',\n" +
                "edicao='"+edicao+"',\n" +
                "editora='"+editora+"',\n" +
                "ano = '"+ano+"',\n" +
                "codigo = '"+codigo+"',\n" +
                "exemplares = '"+exemplares+"'\n" +
                "WHERE titulo='"+tituloAntigo+"'");
    }
}

