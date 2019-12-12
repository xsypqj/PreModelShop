<!DOCTYPE html>
<html lang="en">
<head>
 
  <style>
  * {
  	margin: 0;
  	padding: 0;
  }
  
  body {
  	font-family: Source Sans Pro;
  }
  
  #sidebar {
  	position: absolute;
  	width: 300px;
  	height: 100%;
  	background: #000;
  	left: -300px;
  	transition: .4s;
  }
  
  #sidebar.active {
  	left: 0;
  }
  
  #sidebar ul li {
  	list-style: none;
  	color: #fff;
  	font-size: 20px;
  	padding: 20px 24px;
  }
  
  #sidebar .toggle-btn {
  	position: absolute;
  	top: 30px;
  	left: 330px;
  	}
  	
  	.toggle-btn span {
  		width: 45px;
  		height: 4px;
  		background: #000;
  		display: block;
  		margin-top: 4px;
  		
  	}
  
  </style>
  
  <script type="text/javascript">
  	
  	
  		function show() {
  			document.getElementById('sidebar').classList.toggle('active');
  		}
  		
  	
  
  </script>
</head>
<body>

<div id="sidebar">
	<div class="toggle-btn" onclick="show()">
		<span></span>
		<span></span>
		<span></span>
	</div>
	
	<ul>
		<li>Home</li>
		<li>Work</li>
		<li>About</li>
		<li>Contact</li>
	</ul>
</div>


</body>
</html>