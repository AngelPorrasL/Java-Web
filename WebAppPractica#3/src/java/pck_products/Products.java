/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pck_products;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author PC
 */
public class Products {
    
    int Id;
    String Name;
    String Category;
    int Price;
    String Fecha;
    
    public Products(int pId, String pName, String pCategory, int pPrice, String pFecha) {
        this.Id = pId;
        this.Name = pName;
        this.Category = pCategory;
        this.Price = pPrice;
        this.Fecha = pFecha;
    }
    public Boolean CreateProducts(Products product) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/Products", "root", "AngelPorras0022");
            Statement statement = connection.createStatement();

            String sql = "insert into products (Id, Name, Category, Price, Fecha) "
                    + "values (" + product.Id + ", '" + product.Name + "', '" + product.Category + "', " + product.Price + ", '" + product.Fecha + "')";

            statement.execute(sql);
            statement.close();
            
            return true;
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            return false;
        }
    }   
}
