<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>ShopEasy</title>
	<style>
		.card {
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			max-width: 300px;
			margin: auto;
			text-align: center;
			font-family: arial;
			padding: 10px;
		}

        body h1{
            text-align: center;
        }
		.price {
			color: grey;
			font-size: 22px;
		}

		button {
			border: none;
			outline: 0;
			display: inline-block;
			padding: 8px;
			color: white;
			background-color: #000;
			text-align: center;
			cursor: pointer;
			width: 100%;
			font-size: 18px;
		}

		button:hover, a:hover {
			opacity: 0.7;
		}
	</style>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/movie_db", "root", "");
        if (conn != null) {
            out.println("<h1>ShopEasy Online Shopping Website</h1>");
        }
        stmt = conn.createStatement();
        // Update the contact information of the customer with the given name
        String sql = "SELECT * FROM item_store";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            // Retrieve by column name
            String id = rs.getString("item_id");
            String item = rs.getString("item_name");
            String price = rs.getString("item_price");
            // Display values
            out.println("<div class='card'>");
            out.println("<p id=\"" + id + "\">ID: " + id + "<br>");
            out.println("Item Name: " + item + "<br>");
            out.println("<span class='price'>Price: " + price + " $&emsp;&emsp;&emsp;</span>");
            out.println("<button onclick='AddItem(\"" + id + "\", \"" + price + "\")'>ADD ITEM</button></p>");
            out.println("</div>");
        }
        out.println("<div style='clear:both;'></div>");
        out.println("<div style='margin: auto;width: 200px;'><button onclick='ViewCart()'>View Cart</button></div>");
        rs.close();
        // Clean-up environment
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.print("Error connecting to DB - Error: " + e);
    }
%>
<script>
    function AddItem(id, price) {
        console.log(id);
        console.log(price);
        alert("Item added to Cart");
        var item = sessionStorage.getItem(id);
        var arr;
        if (item) {
            arr = JSON.parse(item);
            arr.count++;
        } else {
            arr = { price: price, count: 1 };
        }
        sessionStorage.setItem(id, JSON.stringify(arr));
    }

    function ViewCart() {
        window.location.href = "cart.html";
    }
</script>
</body>
</html>
