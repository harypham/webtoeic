<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quản lý Vocab</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
     <script src="${pageContext.request.contextPath}/resources/js/jquery-1.js"></script>
	<script src="<c:url value='/js/admin/quanLyVocab.js'/>" ></script>

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
	<jsp:include page="template/header.jsp"></jsp:include>
	<jsp:include page="template/sidebar.jsp"></jsp:include>	
	

	<div class="col-md-9 animated bounce">
      <h3 class="page-header">Quản lý Bài hướng dẫn học từ vựng</h3>
      <button class="btn btn-success btnAddVocab" data-toggle="modal" data-target="#vocabModal">Thêm mới</button>
	      	<h4 style="color: red" id="info-success"></h4>
	      	<c:if test="${errorInfo != null }">
	      	<h4 style="color:red">${error}</h4>
	      	<h4>error: ${errorInfo}</h4>
	      	</c:if>
            <hr/>
            
      <table class="table table-hover nhanHieuTable" id="tableVocab">
        <thead>
        <tr>
          <th>ID</th>
          
          <th>Tên bài từ vựng</th>
          
          <th>Ảnh</th>
          
          
           <th></th>
           
           
         </tr>
        </thead>
        
        <tbody>
        
        
        
        </tbody>



      </table>
      
    </div>
    
	
		
<!-- Modal-->

   <div class="modal fade" id="vocabModal" tabindex="-1" role="dialog" aria-labelleby="myModalLable">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class = "modal-title" id ="titleModal"> Thêm mới Vocab </h4>
              <input style="display:none;" id="idVocab">
            </div>
    <div class="modal-body">
        <div class= "row">
     
            <span class="bg-danger" id="vocab_errors"></span>

                      <div class="form-group col-md-6">
                          <label for="full_name" >Tên bài hướng dẫn Vocab:</label>
                          <input class= "form-control" id="vocab_name" name="vocab_name" type="text" />
                      </div>

                      <div class="form-group col-md-6">
                          <label for="imageVocab" >File ảnh bài hướng dẫn:</label>
                         <input  type="file" class="form-control" id="file_imageVocab" name="file_imageVocab"  accept="image/*" onchange="showMyImage(this)" required />
						 <img alt="" src="" class="" id="previewImage" style="height: 100px; width: 150px">
                      </div>

                      <div class="form-group col-md-12">
                          <label for="imageQuestion" >File ảnh câu hỏi:</label>
                          <input type="file" class="form-control" id="file_imageQuestion" name="file_imageQuestion" required accept="image/*"  multiple >
                      </div>

                      <div class="form-group col-md-12">
                          <label for="fileNge" >File nghe câu hỏi:</label>
                         <input type="file" class="form-control" id="file_listen" name="file_listen"  required  multiple accept=".mp3,.org" >
                          
                      </div>

            
                      <div class="form-group col-md-12">
                          <label for="fileExcel" >File nội dung (Excel):</label>
                         <input type="file" class="form-control" id="file_Excel" name="file_Excel"  required  accept=".xlsx,.xls" >
                       
                      </div>

                </div>
            </div>
          

            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary" id="addNewVocab" > Xác nhận</button> 
              <button style="display:none;" type="button" class="btn btn-primary" id="updateVocab" > Cập nhật</button> 
     

            </div>
            </div>
          </div>
        </div>


	<jsp:include page="template/footer.jsp"></jsp:include>
	
</body>
</html>