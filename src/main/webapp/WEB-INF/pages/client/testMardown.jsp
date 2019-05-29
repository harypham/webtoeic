<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>test markdown</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>   
<link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>

<script>
function content(){

	var a = simplemde.value();
	console.log(a);
}

</script>
<body>

<div class="container">
<div class="row">
<div class="col-md-8">
<p>asdfasdf></p>
<textarea id="markdown-editor" >

			
</textarea>

<button class="btn btn-primary" onclick=content()>check content</button>
<script>

 var simplemde =new SimpleMDE({
    element: document.getElementById("markdown-editor"),
    spellChecker: false,
});



</script>
</div>
<div class="col-md-4">
<p>adfadsfadsf</p>
</div>
</div>
</div>

	
</body>
</html>