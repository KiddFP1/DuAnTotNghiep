<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <fmt:setLocale value="vi_VN" />
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Knotrea - Trang Chủ</title>
                <%@include file="/WEB-INF/assets/css/shop/css-link.jsp" %>
                    <%@include file="/WEB-INF/assets/css/shop/shopapp.jsp" %>
            </head>

            <body>

                <%@include file="layout/header.jsp" %>

                    <main class="container mt-3">

                        <div class="row">
                            <div class="col-md-12 text-center mb-4">
                                <strong class="text-warning fs-1">Thông tin liên hệ</strong> <br>
                                <strong class="mt-1"><i class="fas fa-map-marker-alt me-2"></i> Vị trí: 12/4 đường
                                    Nguyễn Chí Thanh, Trà Nóc, Bình Thủy, TP Cần
                                    Thơ</strong>
                                <br>
                                <strong class="mt-1">
                                    <i class="fas fa-envelope me-2"></i> <a href="mailto:knotreabookstore@gmail.com"
                                            class="text-decoration-none text-dark">knotreabookstore@gmail.com</a>
                                </strong>
                                <br>
                                <strong class="mt-1">
                                    <i class="fas fa-phone me-2"> 0344436724</i>
                                </strong>
                            </div>
                            <div class="col-md-7 text-center">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d1964.0625218995237!2d105.70527627118723!3d10.088839069283992!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMTDCsDA1JzE5LjEiTiAxMDXCsDQyJzIzLjEiRQ!5e0!3m2!1svi!2s!4v1701536634527!5m2!1svi!2s"
                                    width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="col-md-5">

                                <p class="text-center fs-4 fw-bold">Gửi mail đánh giá và góp ý</p>
                                <form action="/send-email" method="post" enctype="application/x-www-form-urlencoded">
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Địa chỉ mail của bạn</label>
                                        <input type="email" name="userMail" class="form-control" id="email"
                                            aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">Thông tin của bạn luôn được giữ an toàn.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="subject" class="form-label">Tiêu đề</label>
                                        <input type="text" name="subject" class="form-control" id="subject">
                                    </div>
                                    <div class="mb-3">
                                        <label for="message" class="form-label">Nội dung</label>
                                        <textarea name="message" id="message" rows="5" class="form-control"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary float-end"><i
                                            class="fas fa-paper-plane me-2"></i> Gửi</button>
                                </form>
                            </div>
                        </div>

                    </main>
                    <br>
                    <%@include file="layout/footer.jsp" %>

                        <%@include file="/WEB-INF/assets/js/shop/js-bs5.jsp" %>

                            <%@include file="/WEB-INF/assets/js/shop/index.jsp" %>

                                <c:if test="${not empty message}">
                                    <script>
                                        Swal.fire('Knotrea Thông báo!', '${message}', 'success');
                                    </script>
                                </c:if>

            </body>

            </html>