<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${ctx}/resources/thirdlib/bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="${ctx}/resources/thirdlib/jquery/jquery-1.11.1.js"></script>
<script type="text/javascript" src="${ctx}/resources/thirdlib/bootstrap/js/bootstrap.js"></script>
	<!-- 顶部导航条 begin -->
	<nav class="navbar navbar-default">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">教务管理系统</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;学生管理 </a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;班级管理</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;课程管理</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;教务管理</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="/ShiXun09/login?method=logout"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<!-- 顶部导航条 end -->