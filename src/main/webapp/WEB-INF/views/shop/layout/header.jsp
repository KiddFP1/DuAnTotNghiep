<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- header -->
    <nav class="navbar navbar-expand-md container mb-2 mt-2 header">
        <div class="container">
            <div class="navbar-collapse collapse" id="navbarCollapse">
                <div class="navbar-nav mr-auto w-300 me-2">
                    <a class="nav-link" href="/shop/home"><img src="/image/logo-web/img-logo-removebg-preview.png"
                            alt="Logo" class="img-fluid"></a>
                </div>
                <div class="rounded p-1 border border-warning ms-7">
                    <form class="d-flex" role="search" action="/shop/auth/find-by-keyword" method="post">
                        <div class="input-group p-1">
                            <input type="text" class="form-control" id="keyword" name="keyword"
                                placeholder="Tìm kiếm sản phẩm mong muốn..." aria-label="Recipient's username"
                                aria-describedby="button-search">
                            <button class="btn btn-outline-secondary" type="submit" id="button-search"><i
                                    class="bi bi-search me-2"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap me-2">
                    <a class="nav-link text-secondary" href="/shop/auth/cart">
                        <i class="fas fa-shopping-cart me-2"></i>
                        Giỏ hàng <span class="badge bg-warning">${numProductCart}</span></a>
                </li>
                <li class="nav-item text-nowrap">
                    <!-- Nếu chưa đăng nhập thì hiển thị nút Đăng nhập -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.CURRENT_USER}">
                            <div class="dropdown">
                                <a class="nav-link text-secondary currentUser dropdown-toggle" id="dropdownMenuButton1"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user-circle fa-lg me-2"></i>Hello,
                                    ${sessionScope.CURRENT_USER.tenDangNhap}</a>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="/shop/auth/information">Thông tin tài
                                            khoản</a></li>
                                    <c:if test="${not empty sessionScope.MANA or not empty sessionScope.STAFF}">
                                        <li><a class="dropdown-item" href="/admin/dashboard">Sang trang quản trị</a></li>
                                    </c:if>
                                    <li><a class="dropdown-item" href="/shop/auth/logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link text-secondary text-decoration-none" href="/shop/auth/login"><i
                                    class="fas fa-user-circle fa-lg"></i>
                                Đăng nhập</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </nav>
    <hr class="container-lg">
    <!-- end header -->