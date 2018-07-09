<?php 
session_start();  
include "dbcon.php";
$obj = new Database();
include "header.php";
?>
<div class="container">
	<?php

	if (isset($_POST['place_order']))
 	{
		$insert_order = "INSERT INTO order_table(customer_id,creation_date,order_status)
		VALUES(1,'".date('Y-m-d')."','pending')";
		$order_id = '';
		if($obj->conn->query($insert_order))
		{
			$order_id = $obj->conn->insert_id;

		}
		$_SESSION["order_id"] = $order_id; 
		$order_details = "";  
	    foreach($_SESSION["shopping_cart"] as $keys => $values)  
	        {  
	            $order_details .= "  
	            INSERT INTO product_order_detail(order_id, 
	            product_name,product_price,product_quantity)  
	            VALUES('".$order_id."', '".$values["product_name"]."',
	            '".$values["product_price"]."', '".$values["product_quantity"]."');";  
	        }  
	            if($obj->conn->multi_query($order_details))  
	            {  
	                unset($_SESSION["shopping_cart"]);  
	                echo '<script>alert("You have successfully place an order...Thank you")</script>';  
	                echo '<script>window.location.href="cart.php"</script>';  
	            }  
	}

	  if(isset($_SESSION["order_id"]))  
                {  
                     $customer_details = '';  
                     $order_details = '';  
                     $total = 0;  
                     $query = '  
                     SELECT * FROM order_table  
                     INNER JOIN product_order_detail  
                     ON product_order_detail.order_id = order_table.order_id  
                     INNER JOIN customer_table  
                     ON customer_table .CustomerID = order_table.customer_id  
                     WHERE order_table.order_id = "'.$_SESSION["order_id"].'"  
                     ';  
                     $result = $obj->conn->query($query);  
                     while($row = $result->fetch_assoc())  
                     {  
                          $customer_details = '  
                          <label>'.$row["CustomerName"].'</label>  
                          <p>'.$row["Address"].'</p>  
                          <p>'.$row["City"].', '.$row["ZipCode"].'</p>  
                          <p>'.$row["State"].'</p>  
                          ';  
                          $order_details .= "  
                               <tr>  
                                    <td>".$row["product_name"]."</td>  
                                    <td>".$row["product_quantity"]."</td>  
                                    <td>".$row["product_price"]."</td>  
                                    <td>".number_format($row["product_quantity"] * $row["product_price"], 2)."</td>  
                               </tr>  
                          ";  
                          $total = $total + ($row["product_quantity"] * $row["product_price"]);  
                     }  
                     echo '  
                     <h3 align="center">Order Summary for Order No.'.$_SESSION["order_id"].'</h3>  
                     <div class="table-responsive">  
                          <table class="table">  
                               <tr>  
                                    <td><label>Customer Details</label></td>  
                               </tr>  
                               <tr>  
                                    <td>'.$customer_details.'</td>  
                               </tr>  
                               <tr>  
                                    <td><label>Order Details</label></td>  
                               </tr>  
                               <tr>  
                                    <td>  
                                         <table class="table table-bordered">  
                                              <tr>  
                                                   <th width="50%">Product Name</th>  
                                                   <th width="15%">Quantity</th>  
                                                   <th width="15%">Price</th>  
                                                   <th width="20%">Total</th>  
                                              </tr>  
                                              '.$order_details.'  
                                              <tr>  
                                                   <td colspan="3" align="right"><label>Total</label></td>  
                                                   <td>'.number_format($total, 2).'</td>  
                                              </tr>  
                                         </table>  
                                    </td>  
                               </tr>  
                          </table>  
                     </div>  
                     ';  
                }   
	 ?>
</div>















<?php include "footer.php" ?>