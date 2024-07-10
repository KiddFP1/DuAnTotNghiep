<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Knotrea - Trang đăng nhập</title>
    <%@include file="/WEB-INF/assets/css/shop/login.jsp" %>
  </head>
  <style>
    #tendangnhap{
      width: 100%;
    }
  
.mb-1{
    
}
.link{
    color: #0ef;
    text-decoration: none;
}
.footer{
    margin-top: 20px;
    letter-spacing: 0.5px;
    font-size: 14px;
}
*{
    margin: 0;
    padding: 0;
    font-family: Arial;
    color: #081b29;
}

</style>
  <body>
    <div id="login-form-wrap">
      <h2>Quên mật khẩu</h2><h6>Vui lòng nhập thông tin để tìm tài khoản của bạn</h6><br>
      <form action="/kiemtraemail" method="post" enctype="multipart/form-data" id="login-form">
        <div class="mb-1">
            <input type="text" id="tendangnhap" name="tendangnhap" class="form-control" value="${param.tendangnhap}" placeholder="Nhập tên đăng nhập">
            <center><label style="color: red; font-size: 10px">${kiemtratendangnhap}</label></center>
        </div>
        <div class="mb-1">
            <input type="email" id="email" name="email" class="form-control" value="${param.email}" placeholder="Nhập email" aria-describedby="emailHelp">             
            <center><label style="color: red; font-size: 10px">${kiemtramail}</label></center>
        </div>
        <input type="submit" value="Gửi email">
    </form>
    <br>
      <div id="create-account-wrap">
        <p class="footer">Chưa có tài khoản? &nbsp;<a href="/shop/auth/register" class="link">Tạo tài khoản mới</a></p>
        <p>
      
        <p>
      </div>
    </div>
 
  </body>
  

   <!-- <script>
   document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault(); // Ngăn chặn gửi form một cách thông thường

    // Lấy giá trị email từ input
    let email = document.getElementById('emailInput').value;

    // Gửi yêu cầu POST đến máy chủ
    fetch('/sendemail', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        to: JSON.stringify({ email: email }), // Thay body thành to
    })
    .then(response => {
        // Xử lý response ở đây
    })
    .catch(error => {
        // Xử lý lỗi nếu có
        console.error('There was an error!', error);
    });
});

</script> -->

  </html>