<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="container-lg">
        <div class="row pt-2">
            <div class="col-md-3" id="myDiv">
                <ul class="list-group">
                    <div class="p-2 bg-warning text-light sticky-top">
                        Phân loại sách
                    </div>
                    <c:forEach var="item" items="${typeList}">
                        <a href="/shop/product-type/${item.id}" class="text-decoration-none text-black">
                            <li class="list-group-item"><i class="fad fa-book fa-lg me-2"></i>${item.tenLoai}</li>
                        </a>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-9">
                <div>
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="/image/banner/poster.jpg" class="d-block w-100 img-carosel-h" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="/image/banner/poster2.jpg" class="d-block w-100 img-carosel-h"
                                    alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="/image/banner/poster3.png" class="d-block w-100 img-carosel-h"
                                    alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>