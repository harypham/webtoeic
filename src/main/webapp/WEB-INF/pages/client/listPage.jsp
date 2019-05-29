<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Vocab</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchResult.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
</head>

<script>

function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {           
        var file = files[i];
        var imageType = /image.*/;     
        if (!file.type.match(imageType)) {
            continue;
        }           
        var img=document.getElementById("previewImage");            
        img.file = file;    
       
        var reader = new FileReader();
        reader.onload = (function(aImg) { 
            return function(e) { 
                aImg.src = e.target.result; 
            }; 
        })(img);
        reader.readAsDataURL(file);
    }    
}
</script>
<body>
	

	<div class="col-md-9 animated bounce">
      <h3 class="page-header">Quản lý Bài hướng dẫn học từ vựng</h3>

      <button class="btn btn-success btnAddVocab" data-toggle="modal" data-target="#vocabModal">Thêm mới</button>
	      	<c:if test="${errorInfo != null }">
	      	<h4 style="color:red">${error}</h4>
	      	<h4>error: ${errorInfo}</h4>
	      	</c:if>
            <hr/>
            
      <table class="table table-hover nhanHieuTable">
        <thead>
        <tr>
          <th>Vocab Id</th>
          
          <th>Name</th>
          
          <th>Image</th>
          
          
           <th>Update</th>
           
            <th>Delete</th>
         </tr>
        </thead>
        
        <tbody>
        
        <c:forEach items="${listData}" var="list">
	        <tr>
	        	<td class= "center"> ${list.baitaptuvungid} </td>
	        	<td class= "center"> ${list.tenbaituvung} </td>
	        	<td class= "center"> ${list.anhbaituvung} </td>
	        	<td class= "center"> 
		        	 <a class="yellow" href="#">
		        	 	<i class="glyphicon glyphicon-edit"></i>
		        	 </a>
	        	 </td>
	        	 
	        	<td class= "center">
		        	 <a class="red" href="deleteVocab/${list.baitaptuvungid}">
		        	 	<i class="ace-icon fa fa-trash-o bigger-130"></i>
		        	 </a>
	        	  </td>
	        </tr>
        
        </c:forEach>
        
        </tbody>



      </table>
      
    </div>
    
    
    <c:if test = "${listData.size() != 0}">
    	
		    		<div class="paging">
            		<c:if test = "${currentPage != 1}">
                		<a href="/webtoeic/list?page=${currentPage-1}">Back</a>
                	</c:if>
                	<c:if test = "${currentPage == 1}">	
        				<a class="current">1</a>
        			</c:if>
                	
        			<c:if test = "${currentPage != 1}">	
        				<a href="/webtoeic/list?page=1">1</a>
        			</c:if>
        			
        			<c:forEach var="pag" items="${pageList}" varStatus="loop">
            			<c:if test = "${currentPage == pag}">	
        					<a class="current">${pag}</a>
        				</c:if>
        				<c:if test = "${currentPage != pag}">	
        					<a href="/webtoeic/list?page=${pag}">${pag}</a>
        				</c:if>
      				</c:forEach>

            		<c:if test = "${currentPage != totalPage}">
                		<a href="/webtoeic/list?page=${currentPage+1}">Next</a>	
                	</c:if>
				</div>
		    	</c:if>
    
	
		

    
	

 



	
</body>
</html>