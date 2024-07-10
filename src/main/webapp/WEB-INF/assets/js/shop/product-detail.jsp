<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <script>
        function incrementQuantity() {
            var quantityInput = document.getElementById("quantity");
            var currentValue = parseInt(quantityInput.value);
            var maxQuantity = parseInt(quantityInput.getAttribute("max"));

            if (currentValue + 1 > maxQuantity) {
                Swal.fire({
                    title: 'Knotrea Thông báo!',
                    text: 'Số lượng sản phẩm đã đạt giới hạn!',
                    icon: 'warning',
                    timer: 1000, // Thời gian đóng SweetAlert sau 1 giây (1000 milliseconds)
                    showConfirmButton: false, // Ẩn nút xác nhận
                });
            } else {
                quantityInput.value = currentValue + 1;
            }
        }

        function decrementQuantity() {
            var quantityInput = document.getElementById("quantity");
            var newValue = parseInt(quantityInput.value) - 1;
            quantityInput.value = newValue >= 1 ? newValue : 1;
        }
        $(document).ready(function () {
            $("#submitReviewBtn").click(function () {
                // Lấy giá trị đánh giá từ input radio đã được chọn
                if (!$("input[name='rating']:checked").val()) {
                    Swal.fire({
                        title: 'Knotrea Thông báo!',
                        text: 'Vui lòng chọn mức điểm đánh giá!',
                        icon: 'warning',
                        timer: 1000, // Thời gian đóng SweetAlert sau 1 giây (1000 milliseconds)
                        showConfirmButton: false, // Ẩn nút xác nhận
                    });
                } else {
                    var rating = $("input[name='rating']:checked").val();

                    // Lấy giá trị nhận xét từ textarea
                    var comment = $("textarea[name='review']").val();

                    var isbn = $("#productId").val();

                    // Gửi dữ liệu đánh giá lên máy chủ sử dụng AJAX
                    $.ajax({
                        type: "POST",
                        url: "/shop/auth/review/" + isbn, // Thay thế bằng đường dẫn tương ứng trên máy chủ của bạn
                        data: { rating: rating, review: comment },
                        success: function (data) {
                            // Xử lý kết quả trả về từ máy chủ
                            $("textarea[name='review']").val('');        // Xóa giá trị của textarea
                            $("input[name='rating']").prop('checked', false);

                            if(data.message != null){
                                Swal.fire({
                                title: 'Knotrea Thông báo!',
                                text: data.message,
                                icon: 'success',
                                timer: 1000, // Thời gian đóng SweetAlert sau 1 giây (1000 milliseconds)
                                showConfirmButton: false, // Ẩn nút xác nhận
                            });
                            }else{
                                Swal.fire({
                                title: 'Knotrea Thông báo!',
                                text: data.error,
                                icon: 'warning',
                                timer: 1000, // Thời gian đóng SweetAlert sau 1 giây (1000 milliseconds)
                                showConfirmButton: false, // Ẩn nút xác nhận
                            });
                            }
                        },
                        error: function (error) {
                            console.error("Error:", error);
                        }
                    });
                }
            });
        });
    </script>