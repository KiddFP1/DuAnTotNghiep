<style>
  .custom-popup-class {
    margin-top: 50px;
    /* Điều chỉnh giảm khoảng cách từ trên xuống theo ý muốn */
  }

  .currentUser {
    margin-top: -7px;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 40px;
    -webkit-line-clamp: 1;
    height: 40px;
    width: 180px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
  }

  .w-300 {
    min-width: 200px;
    max-width: 300px;
  }

  .ms-7 {
    margin-left: 50px;
  }

  .img-carosel-h {
    max-height: 350px;
  }

  #myDiv {
    height: 350px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #myDiv::-webkit-scrollbar {
    width: 6px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #myDiv::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #main {
    max-height: 1100px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #main::-webkit-scrollbar {
    width: 6px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #main::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #thongtindonhang {
    max-height: 275px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #thongtindonhang::-webkit-scrollbar {
    width: 4px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #thongtindonhang::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #diachikhac {
    max-height: 480px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #diachikhac::-webkit-scrollbar {
    width: 4px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #diachikhac::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #chitietdonhang {
    max-height: 600px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #diachikhac::-webkit-scrollbar {
    width: 4px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #diachikhac::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #donhang {
    max-height: 500px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #donhang::-webkit-scrollbar {
    width: 4px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #donhang::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #sanphamyt {
    max-height: 528px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #sanphamyt::-webkit-scrollbar {
    width: 8px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #sanphamyt::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  .w-110 {
    background: lightgray;
  }

  #product {
    max-height: 465px;
    overflow: auto;
    /* Hoặc sử dụng 'scroll' thay vì 'auto' nếu bạn muốn luôn hiển thị thanh cuộn ngay cả khi nội dung không đầy đủ */
    resize: none;
  }

  /* Thiết lập thanh cuộn nhỏ nhất */
  #product::-webkit-scrollbar {
    width: 1px;
    /* Kích thước chiều rộng thanh cuộn */
  }

  #product::-webkit-scrollbar-thumb {
    background-color: #888;
    /* Màu sắc của "nút" thanh cuộn */
  }

  #keyword {
    border-left: 0px;
    border-top: 0px;
    border-bottom: 0px;
    box-shadow: none;
    min-width: 500px;
    max-width: 550px;
  }

  /* Thong bao Popup  */
  .tbpopup .tboverlay {
    position: fixed;
    top: 0px;
    left: 0px;
    width: 100vw;
    height: 100vh;
    background: rgba(0, 0, 0, 0.7);
    z-index: 1;
    display: none;
  }

  .tbpopup .tbcontent {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    background: #fff;
    max-width: 500px;
    z-index: 2;
    text-align: center;
    padding: 12px;
    box-sizing: border-box;
    font-family: "Open Sans", sans-serif;
    border-radius: 20px;
    display: block;
    position: fixed;
    box-shadow: 0px 0px 10px #111;
  }

  @media (max-width: 700px) {
    .tbpopup .tbcontent {
      width: 90%;
    }
  }

  .tbpopup .tbclose-btn {
    cursor: pointer;
    position: absolute;
    right: 20px;
    top: 20px;
    width: 35px;
    height: 35px;
    color: #ff4444;
    font-size: 30px;
    font-weight: 600;
    line-height: 35px;
    text-align: center;
    border-radius: 50%;
  }

  .tbpopup.active .tboverlay {
    display: block;
  }

  .tbpopup.active .tbcontent {
    transition: all 300ms ease-in-out;
    transform: translate(-50%, -50%) scale(1);
  }

  .tbbuttom {
    background: #00cc00;
    color: #fff;
  }

  .product-area {
    background-color: whitesmoke;
    padding: 10px;
    border-radius: 10px;
  }

  .directory {
    border: 1px darkgoldenrod solid;
    background-color: orange;
    color: white;
  }

  /* Thiết lập container chứa sản phẩm */
  .product-container {
    background: white;
    overflow: hidden;
    position: relative;
  }

  /* Thiết lập hình ảnh sản phẩm */
  .product-image {
    width: 100%;
    height: 250px;
    display: block;
  }

  /* Thiết lập thông tin sản phẩm */
  .product-info {
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 25px;
    -webkit-line-clamp: 2;
    height: 50px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
  }

  /* Thiết lập hiệu ứng box-shadow khi hover */
  .product-container:hover {
    box-shadow: 0 0 10px lightseagreen;
  }

  .sanpham:hover {
    box-shadow: 0 0 10px lightseagreen;
  }

  footer {
    background: rgb(240, 240, 240);
  }

  .btn-add {
    border: 1px solid yellow;
  }

  .rating {
    unicode-bidi: bidi-override;
    direction: rtl;
    text-align: center;
  }

  .rating input {
    display: none;
  }

  .rating label {
    display: inline-block;
    padding: 0 1px;
    font-size: 36px;
    color: #ccc;
    cursor: pointer;
  }

  .rating label:hover,
  .rating label:hover~label,
  .rating input:checked~label {
    color: #ffcc00;
  }

  textarea {
    min-height: 80px;
    width: 100%;
    /* Rộng hết div */
    box-sizing: border-box;
    /* Đảm bảo width bao gồm cả padding và border */
    resize: none;
    /* Ngăn chặn khả năng thay đổi kích thước */
  }

  input[name="number"] {
    width: 50px;
    text-align: center;
    margin: 0 5px;
    border: 0px;
    outline: none;
  }

  /* Style for the increment and decrement buttons */
  .quantity-button {
    display: inline-block;
    padding: 5px 10px;
    cursor: pointer;
    user-select: none;
    border-radius: 50%;
    /* Border-radius to make it round */
  }

  .w-150 {
    min-height: 100px;
  }

  .wh-200 {
    max-width: 160px;
    max-height: 200px;
    min-width: 159px;
    min-height: 199px;
  }

  .w-87 {
    width: 87%;
  }

  .wh-10 {
    max-height: 35px;
    max-width: 50px;
    min-height: 35px;
    min-width: 50px;
  }

  .wh-50 {
    min-width: 150px;
    max-width: 200px;
    height: 50px;
  }

  .img-detail-product {
    min-height: 369px;
    max-height: 370px;
    width: 60%;
  }

  .imageChange {
    max-width: 400px;
    min-height: 349px;
    max-height: 350px;
  }

  .centered-image {
    display: inline-block;
    vertical-align: middle;
    max-width: 100%;
    max-height: 100%;
  }

  .img-detail-product {
    min-height: 369px;
    max-height: 370px;
    width: 60%;
  }

  .cangiua {
    display: block;
    margin-left: auto;
    margin-right: auto;
    min-height: 329px;
    max-height: 330px;
  }

  .actives {
    border: 1px solid whitesmoke;
    background: white;
    border-radius: 15px;
    text-align: center;
  }

  .p-7 {
    padding: 15px;
  }
</style>