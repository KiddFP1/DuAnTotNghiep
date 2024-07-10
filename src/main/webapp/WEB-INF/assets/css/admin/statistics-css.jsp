<style>
@charset "UTF-8";

/* Đặt chiều rộng cố định cho bảng và kích thước trang trượt */
.table-container {
	width: 100%;
	max-height: 300px; /* Điều chỉnh kích thước trang trượt theo nhu cầu */
	overflow: auto;
}

/* Tạo một hiệu ứng cho bảng */
.table {
	border-collapse: collapse;
	width: 100%;
}

.table th, .table td {
	padding: 8px;
	border: 1px solid #ccc;
	text-align: center;
}

.table th {
	background-color: #4CAF50; /* Màu nền cho hàng tiêu đề */
	color: white; /* Màu chữ cho hàng tiêu đề */
}

.table tbody tr:nth-child(odd) {
	background-color: #f2f2f2; /* Màu nền cho hàng lẻ */
}

.table tbody tr:hover {
	background-color: #ddd; /* Màu nền khi di chuột qua hàng */
}
</style>