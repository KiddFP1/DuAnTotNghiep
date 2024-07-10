<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Knotrea - Trang đăng nhập</title>
    <%@include file="/WEB-INF/assets/css/shop/login.jsp" %>
  </head>

  <body>
    <div id="login-form-wrap">
      <h2>Đăng nhập</h2>
      <form action="/dangnhap" method="post" enctype="multipart/form-data" id="login-form">
        <p>
          <!-- <input type="text" id="tendangnhap"  name="tenDangnhap" placeholder="Tên đăng nhập" required><i
            class="validation"><span></span><span></span></i> -->
        <div class="input-group">
          <input type="text" name="tenDangNhap" id="tendangnhap" placeholder="Tên đăng nhập" class="form-control"> <i
            class="validation"><span></span><span></span></i>
        </div>
        </p>
        <p>
          <!-- <input type="password" id="matkhau" name="matKhau" placeholder="Mật khẩu" required><i
            class="validation"><span></span><span></span></i> -->
        <div class="input-group">
          <input type="password" name="matKhau" placeholder="Mật khẩu" class="form-control pass" id="matkhau">
          <div class="input-group-text"><i class="bi bi-eye"></i> </div>
        </div>
        </p>
        <p>
          <input type="submit" id="login" value="Đăng nhập">
        </p>
      </form>
      <div id="create-account-wrap">
        <p>Chưa có tài khoản? <a href="/shop/auth/register" class="text-decoration-none">Tạo tài khoản mới</a>
        <p>
        <p><a href="/shop/auth/forgot-password" class="text-decoration-none">Quên mật khẩu</a>
        <p>
      </div><!--create-account-wrap-->
    </div><!--login-form-wrap-->



    <script type="text/javascript">
      const btn = document.querySelector('.bi-eye');
      const passwordlEl = document.querySelector('.pass');

      btn.addEventListener("click", () => {
        if (passwordlEl.type == "password") {
          passwordlEl.type = "text";
          btn.classList.replace("bi-eye", "bi-eye-slash");
          console.log(btn);
        } else {
          passwordlEl.type = "password";
          btn.classList.replace("bi-eye-slash", "bi-eye");
          console.log(btn);
        }

      });
      window.addEventListener("load", function(){
        document.getElementById("login-form").addEventListener("submit", function (event){
          function showWarningAndFocus(message, eleId){
            event.preventDefault();
            Swal.fire("Knotrea Thông báo!" , message, "warning");
            document.getElementById(eleId).focus();
          }

          var tenDangNhapValue = document.getElementById("tendangnhap").value.trim();
          var matKhauValue = document.getElementById("matkhau").value.trim();

          if(tenDangNhapValue === ""){
            showWarningAndFocus("Tên đăng nhập đang để trống!", "tendangnhap");
          }
          if(matKhauValue === ""){
            showWarningAndFocus("Mật khẩu đang để trống!", "matkhau");
          }
        })
      })
    </script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <c:if test="${not empty message}">
      <script>
        Swal.fire('Thông báo', '${message}', 'success'); 
      </script>
    </c:if>
    <c:if test="${not empty error}">
      <script>
        Swal.fire('Thông báo', '${error}', 'error');
      </script>
    </c:if>
  </body>

  </html>