<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Knotrea - Trang đăng nhập</title>
    <%@include file="/WEB-INF/assets/css/shop/login.jsp" %>
  </head>
<style>
.input1{
  margin-left: 10%;
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
    <br>
      <h2>Quên mật khẩu</h2>
      
      <form action="/xacnhanma/${email}" method="post" enctype="multipart/form-data" id="login-form">
        <p>
            <!-- <input type="submit" id="email" value="Gửi email"> -->
          </p>
        <p>
        <br>
            <div >
              <input type="text" class="input1" placeholder="Nhập mã xác nhận" id="" name="maxacnhan"  value="${param.maxacnhan}"/> <i
              class="bx bxl-gmail"></i><br>
              <center><label style="color: red; font-size: 10px">${kiemtramaxacnhan}</label></center>
              </div>
          
          <p>
            <input type="submit" id="email" value="Xác nhận">
          </p>
      </form>
      <div id="create-account-wrap">
        
        <p class="footer">Chưa có tài khoản? &nbsp;<a href="/shop/auth/register" class="link">Tạo tài khoản mới</a></p>
      </div>
    </div>



   
 
  </body>
  

   <!-- <sipt>menElementBym('submit', function(event) {
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