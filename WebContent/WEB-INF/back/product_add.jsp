<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<%@include file="../common/head.jsp" %>
	<script src="http://malsup.github.com/jquery.form.js "></script>
	
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/student/pageList.action" class="list-group-item ">学生管理</a>
		                <a href="${pageContext.request.contextPath}/student?method=addStu" class="list-group-item active">添加学生</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li >
		                    <a href="${pageContext.request.contextPath}/student/pageList.action"">学生列表</a>
		                </li>
		                <li class="active">
		                	<a href="${pageContext.request.contextPath}/student?method=addStu">添加学生</a>
		                </li>
		            </ul>
		            <div style="margin-top:20px;">
		             	<div class="alert alert-danger" role="alert">注意:请勿添加已存在的学生！</div>
		           		<hr/>
		           		<form action="${ctx}/product/addProduct1.action" method="post" enctype="multipart/form-data" id="form-add">
			           		分类id：<input type="text" name="categoryId" id="" class="form-control"/><br>
			           		商品名称：<input type="text" name="name" class="form-control"/><br>
			           		商品副标题：<input type="text" name="subtitle" class="form-control"/><br>
			           		
			           		<!-- 产品主图：<input type="text" name="mainImage" class="form-control"/><br> -->
			           		图片地址：<input type="text" name="subImages" class="form-control"/><br>
			           		商品详情：<input type="text" name="detail" class="form-control"/><br>
			           		价格：<input type="text" name="price" class="form-control"/><br>
			           		库存数量：：<input type="text" name="stock" class="form-control"/><br>
			           		商品状态：<select  name="status" class="form-control">
			           					<option value="1">上架</option>
			           					<option value="2">下架</option>
			           				  </select><br>
			           				  
			           				  <div>产品主图：
								           <img alt="" id="imgId" src="" width=100 height=100 />
								           <input type="hidden" name="mainImage" id="mainImage"/>
								           <input type="file" name="pictureFile" onchange="uploadPic();"/>
								       </div>
			           				  
			           				  
							<button class="btn btn-primary" type="submit">提交</button>
						</form>
					</div>
		            </div>
		    </div>
	</div>
	<script type="text/javascript">
	
	 function uploadPic() {
	       //定义参数
	       var options = {
	           url:"${ctx}/upload/uploadPic.action",
	           dataType:"json",
	           type:"post",
	           success: function(data) {
	               $("#imgId").attr("src","/pic/" + data.fileName);
	               $("#mainImage").val(data.fileName);
	           }
	       };
	        $("#form-add").ajaxSubmit(options);
	    };

	
	
    $(function() {
       $("#name").blur(function(){
           var name = $(this).val();
           $.post(
               "${pageContext.request.contextPath}/student?method=checkName", //url
               {"name":name}, //data
               function(data) { //callback
                  if(data.isExit) {//用户已经存在
                      $("#nameInfo").html("该用户名已存在");
                      $("#nameInfo").css("color", "red");
                  } else {
                      $("#nameInfo").html("该用户名可用");
                      $("#nameInfo").css("color", "green");
                  }
               },
               "json" //type
           );
       });
    });
    </script>
 
</head>            
</html>