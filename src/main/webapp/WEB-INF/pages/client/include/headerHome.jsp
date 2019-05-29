<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet"> 
    
     
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    
    function openModal(){
    	$('#myModal').modal();
    }
    
    </script>

</head>
<body>

<!--HEADER ROW-->
  <div id="header-row">
    <div class="container">
      <div class="row">
              <!--LOGO-->
              <div class="span3"><a class="brand" href="<%=request.getContextPath()%>/home"><img src="${pageContext.request.contextPath}/resources/file/images/logotest.png" /></a></div>
              <!-- /LOGO -->

            <!-- MAIN NAVIGATION -->  
              <div class="span9">
                <div class="navbar  pull-right">
                  <div class="navbar-inner">
                    <a data-target=".navbar-responsive-collapse" data-toggle="collapse" class="btn btn-navbar"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a>
                    <div class="nav-collapse collapse navbar-responsive-collapse">
                    <ul class="nav">
                        
                        
                       <c:if test="${pageContext.request.userPrincipal.name == null}">
                         	<li><a href="<%=request.getContextPath()%>/login">Đăng nhập</a></li>
	                        <li><a href="<%=request.getContextPath()%>/register">Đăng ký</a></li>
                       
                        </c:if>      
                       
                 
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                        
	                         <li><a>Xin chào: ${loggedInUser.hoTen}</a></li>
	                         <li></li>
	                         <li><a href="<%=request.getContextPath()%>/logout">Thoát</a></li>
                        
                        </c:if>         
                                
                                  
                            
                                  
                      </ul>            
                                   
                 
                    
                  </div>

                  </div>
                </div>
              </div>
            <!-- MAIN NAVIGATION -->  
      </div>
    </div>
  </div>
  <!-- /HEADER ROW -->
  
</body>
</html>