<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.situ.mall.pojo.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://malsup.github.com/jquery.form.js "></script>
	
<script type="text/javascript">
	function delProductById(id){
		var isDel = confirm("您确认要删除么");
		if(isDel) {
			location.href="${pageContext.request.contextPath}/product/delProductById.action?id="+id;
		}
	}
	function selectAll() {
		/* .prop()获取匹配的元素的属性值 */
		$("input[name=selectid]").prop("checked", $("#selectAlls").is(":checked"));
	}
	function deleteAll() {
		var isDel = confirm("你确定要删除么？");
			//attr 得到属性并且修改
		$("#mainForm").attr("action","${pageContext.request.contextPath}/product/deleteAll.action");
		$("#mainForm").submit();
	}
</script>
</head>
<body>
	<%@include file="../common/head.jsp" %>
	
	<!-- 中间内容部分 begin -->
	<div class="container" style="width: 90%">
		<div class="row">
			<!--左边列表占12份中的2份-->
			<div class="col-md-2">
				<div class="list-group">
				  <a href="${ctx}/product/productList.action" class="list-group-item active">学生管理</a>
				  <a href="student_search.jsp" class="list-group-item">学生搜索</a>
				  <a href="${ctx}/product/addProduct.action" class="list-group-item">添加商品</a>
				</div>
			</div>
			<!--左边列表占12份中的10份-->
			<div class="col-md-10">
				<ul class="nav nav-tabs">
				  <li role="presentation" class="active"><a href="${ctx}/product/productList.action">学生管理</a></li>
				  <li role="presentation"><a href="student_search.jsp">学生搜索</a></li>
				  <li role="presentation"><a href="${ctx}/product/addProduct.action">添加商品</a></li>
				</ul>
				<input class="btn active" type="button" onclick="deleteAll();" value="批量删除"/>
				<form id="mainForm" action="" method="post">
				<table class="table  table-condensed table-hover">
					<thead>
						<tr>
							<td><input type="checkbox" id="selectAlls" onclick="selectAll();"/></td>
							<th>商品id</th>
							<th>分类id</th>
							<th>商品名称</th>
							<th>商品副标签</th>
							<!-- <th>产品主图</th>
							<th>图片地址</th>
							<th>商品详情</th> -->
							<th>价格</th>
							<th>库存</th>
							<th>商品状态</th>
							<th>创建时间</th>
							<th>更新时间</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.list}" var="product">
							<tr>
								<td><input type="checkbox" name="selectid" value="${product.id}"/></td>
								<td>${product.id}</td>
								<td>${product.categoryId}</td>
								<td>${product.name}</td>
								<td>${product.subtitle}</td>
								 <td>
								 <img alt="" src="/pic/${product.mainImage}" width="50" height="50">
								 
								 </td>
								<%--  <td>${product.subImages}</td>
								<td>${product.detail}</td> --%>
								<td>${product.price}</td>
								<td>${product.stock}</td>
								<c:if test="${product.status==1}">
									<td><a href="${ctx}/product/updateStatus.action?status=2&id=${product.id}">上架</a></td>
								</c:if>
								<c:if test="${product.status==2}">
									<td><a href="${ctx}/product/updateStatus.action?status=1&id=${product.id}">下架</a></td>
								</c:if>
								<td><fmt:formatDate value='${product.createTime}' pattern='yyyy-MM-dd-hh:mm:ss'/></td>								
								<td><fmt:formatDate value='${product.updateTime}' pattern='yyyy-MM-dd-hh:mm:ss'/></td>								
								<td><a href="javascript:delProductById(${product.id})">删除</a></td>
								<td><a href="${ctx}/product/findById.action?id=${product.id}">修改</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
				<!-- 分页开始 -->
		            <nav aria-label="Page navigation">
					  <ul class="pagination">
					
					  <!-- 上一页开始 -->
					   	<c:if test="${pageBean.pageIndex==1}">
					   		<li>
					     	 <a href="javascript:void(0);" aria-label="Previous">
					       	 <span aria-hidden="true">&laquo;</span>
					     	 </a>
					    	</li>
					    </c:if>
					    <c:if test="${pageBean.pageIndex!=1}">
					   		<li>
					     	 <a href="${pageContext.request.contextPath}/product/productList.action?pageIndex=${pageBean.pageIndex-1}" aria-label="Previous">
					       	 <span aria-hidden="true">&laquo;</span>
					     	 </a>
					    	</li>
					    </c:if>
					    <!-- 上一页结束 -->
						
						
						<c:forEach begin="1" end="${pageBean.totalPage}" var="page"> 
							<c:if test="${pageBean.pageIndex!=page}">  
						    <li><a href="${pageContext.request.contextPath}/product/productList.action?pageIndex=${page}">${page}</a></li>
					    	</c:if> 
					    	<c:if test="${pageBean.pageIndex==page}">  
						    <li class="active"><a href="${pageContext.request.contextPath}/product/productList.action?pageIndex=${page}">${page}</a></li>
					    	</c:if> 
					    </c:forEach>
					    
					    
					    <!-- 下一页开始 -->
					    
					    <c:if test="${pageBean.pageIndex==pageBean.totalPage}">
					   		<li>
					     	 <a href="javascript:void(0);" aria-label="Next">
					        	<span aria-hidden="true">&raquo;</span>
					     	 </a>
					    	</li>
					    </c:if>
					    <c:if test="${pageBean.pageIndex!=pageBean.totalPage}">
					   		<li>
					     	 <a href="${pageContext.request.contextPath}/product/productList.action?pageIndex=${pageBean.pageIndex+1}" aria-label="Next">
					        	<span aria-hidden="true">&raquo;</span>
					     	 </a>
					    	</li>
					    </c:if>
					   
					  </ul>
					</nav>
				  <!-- 分页结束 -->
			</div>
		</div>
	<!-- 中间内容部分 end -->
	</div>
	
</body>
</html>