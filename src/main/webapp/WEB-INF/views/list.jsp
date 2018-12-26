<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018\9\2 0002
  Time: 0:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>员工列表</title>

    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script TYPE="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<!--bootstrap-->
<div class="container ">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CURD</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-14 col-md-offset-8">
           <button class="btn btn-primary"> 新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
<!--表格-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${PageInfo.list}"  var="emp">
                <tr>
                    <th>${emp.empId}</th>
                    <th>${emp.empName}</th>
                    <th>${emp.gender=="M"?"男":"女" }</th>
                    <th>${emp.email}</th>
                    <th>${emp.department.deptName}</th>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>

                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>
                            删除
                        </button>
                    </th>
                </tr>
                </c:forEach>

            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">

                当前${PageInfo.pageNum}页,总${PageInfo.pages}页,总${PageInfo.total}记录数


        </div>

        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="/emps?pn=1">首页</a></li>
                        <!--显示上一页-->
                        <c:if test="${PageInfo.hasPreviousPage}">
                            <li>
                                <a href="/emps?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                    <!--显示分页条-->
                    <c:forEach items="${PageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == PageInfo.pageNum }">
                            <li class="active"><a href="#">${page_num }</a></li>
                        </c:if>
                        <c:if test="${page_num != PageInfo.pageNum }">
                            <li ><a href="/emps?pn=${page_num } ">${page_num }</a></li>
                        </c:if>
                    </c:forEach>
                        <!--下一页-->
                        <c:if test="${PageInfo.hasNextPage}">
                            <li>
                                <a href="/emps?pn=${PageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                    <li><a href="/emps?pn=${PageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
