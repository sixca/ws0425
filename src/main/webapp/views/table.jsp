<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .small_img {
        width: 40px;
    }
</style>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-6 text-left">
                <h3>Item Table Page</h3>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>IMG</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Regdate</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${allitem}">
                        <tr>
                            <td><img class="small_img" src="/img/${obj.imgname}"></td>
                            <td>${obj.id}</td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" type="currency"/></td>
                            <td><fmt:formatDate value="${obj.regdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <ul class="pagination  justify-content-center">
                    <li class="page-item disabled"><a class="page-link" href="#">first</a></li>
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    <li class="page-item"><a class="page-link" href="#">last</a></li>
                </ul>  <%-- 작동은 안 하지만 걍 넣어봄.. --%>
            </div>
        </div>     <%-- Table End --%>
    </div>
</div>
