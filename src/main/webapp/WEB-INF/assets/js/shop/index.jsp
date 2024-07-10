<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <script>
        var addedIsbns = [];
        var addFavorite = [];

        function sendDataToCart(isbn) {
            var numProductCart = $('.badge.bg-warning').text();
            if (!addedIsbns.includes(isbn)) {
                numProductCart++;
            }
            $.ajax({
                type: 'POST',
                url: '/shop/add-to-cart/' + isbn,
                data: { isbn: isbn , number: 1},
                cache: false,
                success: function () {
                    addedIsbns.push(isbn);
                    Swal.fire({
                        title: 'Knotrea Thông Báo!',
                        text: 'Bạn đã thêm sản phẩm vào giỏ hàng!',
                        icon: 'success',
                        timer: 1000,
                        showConfirmButton: false,
                    });
                    updateCartUI(numProductCart);
                }
            });
        }

        function sendDataToFavorite(isbn) {
            if (!addFavorite.includes(isbn)) {
                console.log(addFavorite);
                // Set a flag to indicate that the ISBN is being processed
                addFavorite.push(isbn);

                $.ajax({
                    type: 'POST',
                    url: '/shop/add-to-favorite/' + isbn,
                    data: { isbn: isbn },
                    success: function () {
                        var button = $('[data-isbn="' + isbn + '"]');
                        if (button.length) {
                            button.removeClass('bg-warning').addClass('bg-danger');
                        }
                        Swal.fire({ title: 'Knotrea Thông Báo!', text: 'Bạn đã thích sản phẩm!', icon: 'success', timer: 1000, showConfirmButton: false });
                    }
                });
            } else {
                console.log('Run');
            }
        }

        function updateCartUI(numProductCart) {
            $('.badge.bg-warning').text(numProductCart);
        }

        $(document).ready(function () {
            var addToCartButtons = $('.addToCartBtn');
            var addToFavoriteButtons = $('.addToFavoriteBtn');

            updateCartUI();

            addToCartButtons.click(function (event) {
                event.preventDefault();
                var isbn = $(this).data('isbn');
                sendDataToCart(isbn);
            });

            addToFavoriteButtons.click(function (event) {
                event.preventDefault();
                var $button = $(this);
                var isbn = $button.data('isbn');

                sendDataToFavorite(isbn);
            });
        });


    </script>