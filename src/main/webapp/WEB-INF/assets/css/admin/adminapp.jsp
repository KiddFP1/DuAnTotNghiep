<style>
.li-hover:hover {
	background-color: gray;
}

#side_nav {
	background: #252121;
	min-height: 100vh;
	min-width: 280px;
	max-width: 280px;
}

.mgs_errors {
	color: red;
	font-style: italic;
}
a {
	text-decoration: none;
}
.modal-dialog {
	max-width: 650px;
}

/* Tùy chỉnh màu nền của modal header */
.modal-header {
	background-color: #05213e;
	color: #fff;
}

body {
	overflow-x: hidden;
}

.custom-table th {
	background-color: #ce519e;
	color: #ffffff;
}

.custom-table th, .custom-table td {
	padding: 12px;
	text-align: center;
	vertical-align: middle;
	border: 1px solid #dee2e6;
}
/* Table */
.custom-table tbody tr:hover {
	background-color: #f8f9fa;
	color: #000000;
}

.btn-secondary {
	border: hidden;
	background-color: rgb(215, 147, 147);
}

.mh-130{
	min-height: 130px;
}
#chitiet {
    max-height: 550px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #chitiet::-webkit-scrollbar {
    width: 4px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #chitiet::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }
</style>