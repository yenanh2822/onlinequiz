<%@page import="com.UserDAO"%>
<%@page import="com.AdminDAO"%>
<html>
<head>
<title>Online Quiz</title>
<link rel="stylesheet" type="text/css" href="style.css">

</head>


<body>

	<script type="text/javascript">
    	function check(){
    		if(document.register.name.value.length<5){
    			alert("minimum name length must be 5 characters");
    			return false;
    		}
    		
            if(document.register.name.value.length>50){
                alert("maximum name length must be 50 characters");
                return false;
            }

            if(document.register.email.value.length>50){
                alert("maximum email length must be 50 characters");
                return false;
            }            
    	}
	</script>

    <jsp:include page="header.jsp"></jsp:include>        
        
    <div id="section">
    
        <br/><br/>
        
        <div align="center">
        <form action="registerDAO.jsp" name="register" onsubmit="return check()">
            <table cellpadding="10">
                <tr>
                    <th colspan="2">Register Student</th>
                </tr>        
                
                <tr>
                    <td><b>Name:</b></td>
                    <td><input type="text" name="name" required/></td>
                </tr>
                
                <tr>
                    <td><b>Email:</b></td>
                    <td><input type="email" name="email" required/></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Register"/></td>
                </tr>
            </table>
        </form>
        
        <%
        String status=request.getParameter("status");
        
        if(status!=null){
        	if(status.equals("false")){%>
        		<p style="color:red">Some error occurred!</p>
        	<%}
        	else if(status.equals("registered")){%>
        		<p style="color:red">Email already registered!</p>
        	<%}
        }
        %>
        </div>
        
    </div>
    
</body>

</html>