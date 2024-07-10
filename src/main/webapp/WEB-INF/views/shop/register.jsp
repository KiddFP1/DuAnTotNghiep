<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>Knotrea - Trang đăng ký</title>
        <%@include file="/WEB-INF/assets/css/shop/register.jsp" %>
      </head>

      <body>
        <div id="login-form-wrap">
          <h2>Đăng ký tài khoản</h2>
          <form action="/dangky" method="post" enctype="multipart/form-data" id="login-form">
            <p>
              <input type="text" name="username" id="username" placeholder="Tên đăng nhập">
            </p>
            <p>
              <input type="text" name="email" id="email" placeholder="Email">
            </p>
            <p>
              <input type="password" name="matKhau" id="password" placeholder="Mật khẩu">
            </p>
            <p>
              <input type="password" name="xacNhanMK" id="cfm-password" placeholder="Nhập lại mật khẩu">
            </p>
            <p>
              <input type="submit" id="login" value="Đăng ký">
            </p>
          </form>
          <div id="create-account-wrap">
            <p>Đã có tài khoản ? <a href="/shop/auth/login" class="text-decoration-none">Quay lại trang đăng nhập</a>
            <p>
            <p><a href="/shop/auth/forgot-password" class="text-decoration-none">Quên mật khẩu</a>
            <p>
          </div><!--create-account-wrap-->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <c:if test="${not empty message}">
          <script>
            Swal.fire('Thông báo', '${message}', 'success');
            showConfirmButton: false
          </script>
        </c:if>
        <c:if test="${not empty error}">
          <script>
            Swal.fire('Thông báo', '${error}', 'error');
            showConfirmButton: false
          </script>
        </c:if>
        <!-- partial -->
        <script>
          window.addEventListener("load", function () {
            document.getElementById("login-form").addEventListener("submit", function (event) {
              function showWarningAndFocus(message, eleId) {
                event.preventDefault();
                Swal.fire("Knotrea Thông báo!", message, "warning");
                document.getElementById(eleId).focus();
              }

              var tenDangNhapValue = document.getElementById("username").value.trim();
              var matKhauValue = document.getElementById("password").value.trim();
              var cfmMatKhauValue = document.getElementById("cfm-password").value.trim();
              var emailValue = document.getElementById("email").value.trim();

              var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
              var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.])[A-Za-z\d@$!%*?&.]{8,}$/;

              if (tenDangNhapValue === "") {
                showWarningAndFocus("Tên đăng nhập đang để trống!", "username");
              } else {
                if (emailValue === "") {
                  showWarningAndFocus("Email đang để trống!", "email");
                } else {
                  if (!emailRegex.test(emailValue)) {
                    showWarningAndFocus("Email sai định dạng!", "email");
                  } else {
                    if (matKhauValue === "") {
                      showWarningAndFocus("Mật khẩu đang để trống!", "password");
                    } else {
                      if (!regex.test(matKhauValue)) {
                        showWarningAndFocus("Mật khẩu không đúng định dạng. Mật khẩu bao gồm chữ hoa, chữ thường, số, kí tự đặc biệt và tối thiểu 8  kí tự", "password");
                      } else {
                        if (cfmMatKhauValue === "") {
                          showWarningAndFocus("Nhập lại mật khẩu đang để trống!", "cfm-password");
                        } else {
                          if (matKhauValue !== cfmMatKhauValue) {
                            showWarningAndFocus("Mật khẩu và Nhập lại mật khẩu không giống nhau!", "password");
                          } else {
                            if (!regex.test(cfmMatKhauValue)) {
                              showWarningAndFocus("Mật khẩu không đúng định dạng. Mật khẩu bao gồm chữ hoa, chữ thường, số, kí tự đặc biệt và tối thiểu 8  kí tự", "cfm-password");
                            }
                          }

                        }
                      }
                    }
                  }

                }

              }

            })
          })
        </script>
      </body>

      </html>