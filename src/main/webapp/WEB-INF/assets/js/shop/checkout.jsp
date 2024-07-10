<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <script>
        window.addEventListener("load", function () {
            // Lấy giá trị từ input
            var tongTienValue = $("input[name='tongTien']").val();
            var tienShipValue = $("input[name='tienShip']").val();


            // Chuyển đổi giá trị thành số
            var tongTien = parseInt(tongTienValue) + parseInt(tienShipValue);

            // Kiểm tra xem có phải là số không
            if (!isNaN(tongTien)) {
                // Định dạng tiền tệ và gán giá trị vào phần tử
                var formattedTongTien = tongTien.toLocaleString('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                });

                $(".total-payment-info").text(formattedTongTien);

                // Gán giá trị vào input
                $("input[name='totalPayment']").val(tongTien);
            } else {
                console.log("Giá trị không hợp lệ");
            }
        });

        function submitForm() {
            // Lấy giá trị từ input
            var voucherCode = $("input[name='voucher']").val();
            var tongTien = $("input[name='tongTien']").val();
            var thanhTien = $("input[name='thanhTien']").val();

            // Thực hiện Ajax request bằng $.ajax
            $.ajax({
                type: "POST",
                url: "/shop/order/add-voucher",
                data: { voucher: voucherCode, total: tongTien },
                success: function (response) {
                    // Xử lý kết quả từ controller
                    console.log(response);

                    if (response.isValid) {
                        if (response.isActive) {
                            if (response.isSale) {
                                if (response.isTrue) {
                                    if (response.isUse) {
                                        // Kiểm tra ngày kết thúc và hiển thị thông báo lỗi nếu cần
                                        var ngayKetThuc = new Date(response.ngayKetThuc);
                                        var currentDate = new Date();

                                        if (ngayKetThuc > currentDate) {
                                            // Kiểm tra loại mã giảm giá
                                            // Mã giảm giá theo số tiền
                                            var discountAmount = response.soTienGiam;
                                            $(".voucher-info").text("-" + discountAmount);

                                            // Tính toán tổng thanh toán sau giảm giá
                                            var totalPayment = tongTien - discountAmount + 30000;

                                            // Định dạng số và gán vào total-payment-info
                                            var formattedTotalPayment = totalPayment.toLocaleString('vi-VN', {
                                                style: 'currency',
                                                currency: 'VND'
                                            });
                                            $(".total-payment-info").text(formattedTotalPayment);

                                            // Gán giá trị vào input
                                            $("input[name='totalPayment']").val(totalPayment);
                                        } else {
                                            Swal.fire({
                                                title: 'Knotrea Thông Báo!',
                                                text: 'Mã giảm giá đã hết hạn!',
                                                icon: 'error',
                                                timer: 1000,
                                                showConfirmButton: false,
                                            });
                                        }
                                    } else {
                                        Swal.fire({
                                            title: 'Knotrea Thông Báo!',
                                            text: 'Mã giảm giá đã được sử dụng!',
                                            icon: 'warning',
                                            timer: 1000,
                                            showConfirmButton: false,
                                        });
                                    }
                                } else {
                                    Swal.fire({
                                        title: 'Knotrea Thông Báo!',
                                        text: 'Số tiền sản phẩm không đủ để áp dụng mã giảm giá!',
                                        icon: 'warning',
                                        timer: 1000,
                                        showConfirmButton: false,
                                    });
                                }
                            } else {
                                Swal.fire({
                                    title: 'Knotrea Thông Báo!',
                                    text: 'Mã giảm giá không áp dụng cho sản phẩm!',
                                    icon: 'warning',
                                    timer: 1000,
                                    showConfirmButton: false,
                                });
                            }
                        } else {
                            Swal.fire({
                                title: 'Knotrea Thông Báo!',
                                text: 'Số lượng giảm giá đã hết hoặc chương trình giảm giá đã kết thúc!',
                                icon: 'warning',
                                timer: 1000,
                                showConfirmButton: false,
                            });
                        }
                    } else {
                        // Hiển thị thông báo lỗi hoặc xử lý theo ý bạn
                        Swal.fire({
                            title: 'Knotrea Thông Báo!',
                            text: 'Mã giảm giá không tồn tại!',
                            icon: 'error',
                            timer: 1000,
                            showConfirmButton: false,
                        });
                    }
                },
                error: function (error) {
                    console.log("Error:", error);
                }
            });
        }

        window.addEventListener("load", function () {
            // Add an event listener to the form submit event
            document.forms["frmthanhtoan"].addEventListener("submit", function (event) {
                // Helper function to show warning and focus on the specified element
                function showWarningAndFocus(message, elementId) {
                    event.preventDefault();
                    Swal.fire("Knotrea Thông báo!", message, "warning");
                    document.getElementById(elementId).focus();
                }

                // Get the values of the input fields
                var hoTenValue = document.forms["frmthanhtoan"]["hoTen"].value.trim();
                var diaChiValue = document.forms["frmthanhtoan"]["diaChi"].value.trim();
                var emailValue = document.forms["frmthanhtoan"]["email"].value.trim();
                var dienthoaiValue = document.forms["frmthanhtoan"]["dienthoai"].value.trim();

                // Regular expressions for email and Vietnamese phone number formats
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var phoneRegex = /^(0|\+84)(9[0-9]|3[2-9]|7[0-9]|8[0-9]|5[6-9])+([0-9]{7})$/;

                // Check if any of the fields is empty
                if (hoTenValue === "") {
                    showWarningAndFocus("Họ tên người nhận đang để trống!", "kh_ten");
                }

                if (diaChiValue === "") {
                    showWarningAndFocus("Địa chỉ giao hàng đang để trống!", "kh_diachi");
                }

                if (emailValue === "") {
                    showWarningAndFocus("Email đang để trống!", "kh_mail");
                }

                if (dienthoaiValue === "") {
                    showWarningAndFocus("Số điện thoại đang để trống!", "kh_dienthoai");
                }

                // Check email format
                if (!emailRegex.test(emailValue)) {
                    showWarningAndFocus("Email sai định dạng!", "kh_mail");
                }

                // Check phone number format
                if (!phoneRegex.test(dienthoaiValue)) {
                    showWarningAndFocus("Số điện thoại không hợp lệ!", "kh_dienthoai");
                }
            });
        });


    </script>