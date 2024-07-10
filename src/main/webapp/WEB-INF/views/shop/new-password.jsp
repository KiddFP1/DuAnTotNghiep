<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Knotrea - Trang quên mật khẩu</title>
    <%@include file="/WEB-INF/assets/css/shop/login.jsp" %>
  </head>

  <body>
    <div id="login-form-wrap">
      <h2>Nhập lại mật khẩu mới</h2>
      <form action="/xacnhanthaydoimatkhau/${email}" method="post" enctype="multipart/form-data" id="login-form">
      
        <p>
        <div class="input-group">
          <input type="password" name="matKhau" value="${matk}" placeholder="Đặt lại mật khẩu mới"
            class="form-control pass" id="matkhau"><br>
          <div class="input-group-text"><i class="bi bi-eye"></i> </div><br>
          <div>
            <span style="color: red;">${thongbaothaydoimatkhau_tendangnhap}</span>
          </div>
        </div>
        </p>
        <p>
        <div class="input-group">
          <input type="password" name="xacnhanmatkhau" placeholder="Xác nhận mật khẩu" class="form-control pass"
            id="xacnhanmatkhau">
          <div class="input-group-text"><i class="bi bi-eye"></i> </div>
        </div>
        <div>
          <span style="color: red;">${thongbaothaydoimatkhau_matkhau}</span>
        </div>
        </p>
        <p>
          <input type="submit" id="login" value="Đổi mật khẩu">
        </p>
      </form>

      <div id="create-account-wrap">
      </div><!--create-account-wrap-->
    </div><!--login-form-wrap-->


    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

      })
      function callAlert() {
        swal("Thông báo", "${tieude}", "success");
      }

      window.addEventListener("load", function () {
        document.getElementById("login-form").addEventListener("submit", function (event) {
          function showWarningAndFocus(message, eleId) {
            event.preventDefault();
            Swal.fire("Knotrea Thông báo!", message, "warning");
            document.getElementById(eleId).focus();
          }

          var matKhauValue = document.getElementById("matkhau").value.trim();
          var matKhauCfmValue = document.getElementById("xacnhanmatkhau").value.trim();

          var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.])[A-Za-z\d@$!%*?&.]{8,}$/;

          if (matKhauValue === "") {
            showWarningAndFocus("Mật khẩu đang để trống!", "matkhau");
          }
          if (matKhauCfmValue === "") {
            showWarningAndFocus("Nhập lại mật khẩu đang để trống!", "xacnhanmatkhau");
          }
          if(!regex.test(matKhauValue)){
            showWarningAndFocus("Mật khẩu không đúng định dạng. Mật khẩu bao gồm chữ hoa, chữ thường, số, kí tự đặc biệt và tối thiểu 8  kí tự", "matkhau");
          }else{
            if(!regex.test(matKhauCfmValue)){
              showWarningAndFocus("Nhập lại mật khẩu không giống với mật khẩu", "xacnhanmatkhau");
            }else{
              if(matKhauValue !== matKhauCfmValue){
                showWarningAndFocus("Nhập lại mật khẩu không giống với mật khẩu", "matkhau");
              }
            }
          }
        })
      })
    </script>

    <!-- partial -->
  </body>



  </html>