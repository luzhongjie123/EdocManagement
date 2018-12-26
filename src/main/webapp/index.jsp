<%--
  Created by IntelliJ IDEA.
  User: 卢中杰
  Date: 2018/12/16
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新图管理系统</title>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <select id="selEdocCategory" class="form-control"style="width: 200px;height: 40px;display: inline-block">

        </select>
        <button type="button" class="btn btn-primary"style="margin-left: 20px" onclick="getEdocEntryByeyId()">查询</button>
        <table class="table table-hover" id="emps_table">
            <thead>
            <tr>
                <th>编号</th>
                <th>标题</th>
                <th>描述</th>
                <th>上传人</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <%--<c:forEach items="${PageInfo.list}"  var="emp">--%>
            <!--显示数据-->
            <tbody>
            </tbody>
            <%--</c:forEach>--%>

        </table>
        <div class="row">
            <!--显示分页信息-->
            <div class="col-md-6" id="page_info_area">

            </div>
            <!--显示分页条-->
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        selectselEdocCategory();
        to_page(1,null);
    })

    //根据条件查询
    function getEdocEntryByeyId() {
        var EdocCategoryId=$("#selEdocCategory").val();
        to_page(1,EdocCategoryId);
    }

//显示下拉框数据
    function selectselEdocCategory() {
        $.post("selEdocCategory",function (result) {
            $.each(result,function (index,item) {

                $("#selEdocCategory").append("<option value='"+item.id+"'>"+item.name+"</option>")
            })

        })
    }

    function to_page(pn,EdocCategoryId) {

        $.get("EdocEntry",{"pn":pn,"EdocCategoryId":EdocCategoryId},function (result) {
            //1.解析显示员工信息
            build_EdocEntry_table(result);
            //2.解析显示分页条
            build_EdocEntry_nav(result);
            //解析显示分页信息
            build_EdocEntry_info(result);
        })
    }

    //解析显示员工信息
    function build_EdocEntry_table (result) {
        $("tbody").empty();
        var EdocEbtryHtml="";
        var EdocEbtry=result.extend.pageInfo.list;
        $.each(EdocEbtry,function (index,item) {
           EdocEbtryHtml=
               '<td>'+item.id+'</td>'+
               '<td>'+item.title+'</td>'+
               '<td>'+item.summary+'</td>'+
               '<td>'+item.uploaduser+'</td>'+
               '<td>'+item.createdate+'</td>'+
               '<td><button class="btn btn-danger btn-sm delete_btn"><span class="glyphicon glyphicon-trash"></span></button></td>';
            $("<tr></tr>").append(EdocEbtryHtml).appendTo("#emps_table tbody");
            EdocEbtryHtml="";
        })
    }
    //解析显示分页条
    function build_EdocEntry_nav(result) {
        //清空分页条
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));

        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");//当前为第一页,首页不能点
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            })
            prePageLi.click(function () {
                to_page(result.extend.PageInfo.pageNum - 1)
            })
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            })
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            })
        }
//添加首页和上一页提示
        ul.append(firstPageLi).append(prePageLi)
        //添加分页条
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (item == result.extend.pageInfo.pageNum) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            })
            ul.append(numLi);
        })
        //添加分页条

        //添加下一条和末页
        ul.append(nextPageLi).append(lastPageLi);
        //把ul加入nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    //解析显示分页信息
    function build_EdocEntry_info(result) {
        total =result.extend.pageInfo.pages;
        currentNum=result.extend.pageInfo.pageNum;
        $("#page_info_area").empty();
        $("#page_info_area").append(" 当前" + result.extend.pageInfo.pageNum + "页,总" + result.extend.pageInfo.pages + "页,总"
            + result.extend.pageInfo.total + "记录数");
    }
</script>
</body>
</html>
