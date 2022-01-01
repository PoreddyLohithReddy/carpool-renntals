<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>CarOwnerRentals Portal</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style>
	 #boxes {
        content: "";
        display: table;
        clear: both;
      }
      div1 {
        float: left;
        height: 250px;
        width: 55%;
        padding: 0 10px;
      }
      #column1 {
        background-color: white;
      }
      #column2 {
        background-color: white;
        width: 45%;
      }
#log1{  
    width: 450px;  
    height: 30px;  
    border: none;  
    border-radius: 7px;  
    padding-left: 7px;  
    color: white;  
    background:green;
} 
.login{  
        width: 550px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 30px;  
        background: #B0C4DE;  
        border-radius: 15px ;  
          
}  
input[type=text] {
  border: 2px solid skyblue;
  border-radius: 4px;
}
</style>
<body>
	<div class="container">  
		<main id="boxes">
			<div1 id=column1>
				<label><h4>Let's Add your car to portal.</h4></label><br/>  
				<label>What's Your Car Mileage? </label>
				<input class="form-control form-control-sm" type="text" name="vital" id="vital" placeholder="Enter Car mileage" style="display:inline-block; width:300px;margin-top:25px;"">
				<label>What's Your Car Price?</label>
				<input class="form-control form-control-sm" type="text" name="vitalp" id="vitalp" placeholder="Enter Car Price" style="display:inline-block; width:300px;margin-top:25px;"">
				<br/><br/>
				<button onclick="sendVitals();" id=log1 class="btn btn-success btn-sm">Submit</button>
			</div1>
			<div1 id=column2>  
				<div class=login>
  					<h1 id=pr>CarPoolRentals</h1>
  					<p>This application enables admin can rent a car that can be used by a customer.By using this system admin can manage there rental, booking, car issues .
  					</p>
  				</div>
			</div1> 
		</main>
		<table id="example" class="table">
			<thead>
				<tr>
					<th>superadmin</th>
					<th>Issue</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
		var websocket=new WebSocket("ws://localhost:8087/CarPoolRentals/VitalCheckEndPoint");
		websocket.onmessage=function processVital(vital){
			var jsonData=JSON.parse(vital.data);
			if(jsonData.message!=null)
			{
				var details=jsonData.message.split(',');
				var row=document.getElementById('example').insertRow();
				if(details.length>2)
				{
					row.innerHTML="<td>"+details[0]+"</td><td>"+details[1]+"</td><td>"+details[2]+"</td>";		
				}
				else
				{
					alert("superadmin has accepted your request");
					row.innerHTML="<td>"+details[0]+"</td><td></td><td>"+details[1]+"</td>";		
				}
			}
		}
		function sendVitals()
		{
			websocket.send(vital.value+','+vitalp.value);
			vital.value="";
			vitalp.value="";
		}
	</script>
</body>
</html>