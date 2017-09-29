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
	<link href="${ctx}/resources/thirdlib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/kindeditor-all-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${ctx}/resources/thirdlib/kindeditor/lang/zh_CN.js"></script>
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/product/productList.action" class="list-group-item ">商品管理</a>
		                <a href="${pageContext.request.contextPath}/product/addProduct.action" class="list-group-item active">添加商品</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li >
		                    <a href="${pageContext.request.contextPath}/product/productList.action">商品列表</a>
		                </li>
		                <li class="active">
		                	<a href="${pageContext.request.contextPath}/product/addProduct.action">添加学生</a>
		                </li>
		            </ul>
		            <div style="margin-top:20px;">
		             	<div class="alert alert-danger" role="alert">注意！</div>
		           		<hr/>
		           		<form action="${ctx}/product/addProduct1.action" method="post" enctype="multipart/form-data" id="form-add">
			           		<!-- 分类id：<input type="text" name="categoryId" id="" class="form-control"/><br> -->
			           		一级分类：<select id="one" onchange="selecttwo(this)">
			           					<option value=""></option>
			           				  </select>
			           		二级分类(商品编号)：<select name="categoryId" id="two">
			           			         <option value=""></option>
			           				  </select><br/>
			           		商品名称：<input type="text" name="name" class="form-control"/><br>
			           		商品副标题：<input type="text" name="subtitle" class="form-control"/><br>
			           		
			           		<!-- 产品主图：<input type="text" name="mainImage" class="form-control"/><br> -->
			           		<!-- 图片地址：<input type="text" name="subImages" class="form-control"/><br> -->
			           		<!-- 商品详情：<input type="text" name="detail" class="form-control"/><br> -->
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
			           		 <div class="form-group">
					  				<label>商品图片</label>
				    		  		<a href="javascript:void(0)" class="picFileUpload" id="picFileUpload">上传图片</a>
							    	<input type="hidden" name="subImages" id="subImages"/>
							 		<div id="J_imageView"></div>
							 </div>
							 <div class="form-group">
									<label>商品描述</label>
									<textarea style="width:900px;height:300px;visibility:hidden;" name="detail"></textarea>
							 </div>
			           				  
							<button class="btn btn-primary" type="submit">提交</button>
						</form>
					</div>
		            </div>
		    </div>
	</div>
	<script type="text/javascript">
			var myKindEditor ;
		KindEditor.ready(function(K) {
			var kingEditorParams = {
			//指定上传文件参数名称
			filePostName  : "pictureFile",
			//指定上传文件请求的url。
			uploadJson : '${ctx}/upload/pic.action',
			//上传类型，分别为image、flash、media、file
			dir : "image"
		}
	var editor = K.editor(kingEditorParams);
	//多图片上传
	K('#picFileUpload').click(function() {
		editor.loadPlugin('multiimage', function() {
			editor.plugin.multiImageDialog({
				clickFn : function(urlList) {
					console.log(urlList);
					var div = K('#J_imageView');
					var imgArray = [];
					div.html('');
					K.each(urlList, function(i, data) {
						imgArray.push(data.url);
						div.append('<img src="' + data.url + '" width="80" height="50">');
					});
					$("#subImages").val(imgArray.join(","));
					editor.hideDialog();
				}
			});
		});
	});
	//富文本编辑器
	myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);
});
</script>
	<script type="text/javascript">
	$(function() {
        $.ajax({
            url:"${ctx}/product/selectOne.action",
            dataType:"json",
            success:function(data,textStatus,ajax){
              /*  alert(ajax.responseText); */
               //append_template(data, "province");
               var html = "<option>-请选择-</option>";
               for(var i=0;i<data.length;i++){
                   html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
               }
                $("#one").html(html);
            }
        });
    });
	function selecttwo(obj) {
        var one = $(obj).val();
       /*  //清空 下拉框中的内容，出第一项外
        $("#one option:gt(0)").remove(); */
        //清空 下拉框中的内容，出第一项外
        $("#two option:gt(0)").remove();
        $.ajax({
            url:"${ctx}/product/selectParentId.action",
            data:"one="+one,
            dataType:"json",
            success:function(data,textStatus,ajax){
              /*  alert(ajax.responseText); */
               //append_template(data, "city");
               
               var html = "<option>-请选择-</option>";
               for(var i=0;i<data.length;i++){
                   html +="<option value='"+data[i].parentId+"'>"+data[i].name+"</option>";
               }
               $("#two").html(html);
            }
        });
    }

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