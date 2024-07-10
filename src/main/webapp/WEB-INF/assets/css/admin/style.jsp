<style>
@charset "UTF-8";
/*
Responsive HTML Table With Pure CSS - Web Design/UI Design

Code written by:
👨🏻‍⚕️ Coding Design (Jeet Saru)

> You can do whatever you want with the code. However if you love my content, you can **SUBSCRIBED** my YouTube Channel.

🌎link: www.youtube.com/codingdesign 
*/

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
}

body {
    min-height: 100vh;
    background: rgb(247, 247, 247);
    display: flex;
    justify-content: center;
    align-items: center;
}

main.table {
    width: 79.5vw;
    height: 80vh;
    background-color: #fff5;
    backdrop-filter: blur(7px);
    border-radius: .8rem;

   
}
.od{
    width: 79.5vw;
    height: 80vh;
    background-color: #fff5;
    backdrop-filter: blur(7px);
    border-radius: .8rem;
}


.table__header .input-group img {
    width: 1.5rem;
    height: 1.5rem;
}

.table__header .input-group input {
    width: 100%;
    padding: 0 .5rem 0 .3rem;
    background-color: transparent;
    border: none;
    outline: none;
}

.table__body {
    border-radius: .6rem;
    overflow-y: auto;
}

.table__body::-webkit-scrollbar{
    width: 0.3rem;
    height: 0.3rem;
}

.table__body::-webkit-scrollbar-thumb{
    border-radius: .5rem;
    background-color: #0004;
    visibility: hidden;
}

.table__body:hover::-webkit-scrollbar-thumb{ 
    visibility: visible;
}
table {
    width: 100%;
    overflow-y: visible;

}

td img {
    width: 60px;
    height: 60px;
    margin-right: .5rem;
    border-radius: 20%;

    vertical-align: middle;
}

table, th, td {
    border-collapse: collapse;
    padding: 0.3rem;
    text-align: left;
}

thead th {
    position: sticky;
    top: 0;
    left: 0;
    background-color: #f7f1f4fe;
    cursor: pointer;
    text-transform: capitalize;
}

tbody tr:nth-child(even) {
    background-color: #0000000b;
}

tbody tr {
    --delay: .1s;
    transition: .5s ease-in-out var(--delay), background-color 0s;
}

tbody tr.hide {
    opacity: 0;
    transform: translateX(100%);
}

tbody tr:hover {
    background-color: #fff6 !important;
}

tbody tr td,
tbody tr td p,
tbody tr td img {
    transition: .2s ease-in-out;
}

tbody tr.hide td,
tbody tr.hide td p {
    padding: 0;
    font: 0 / 0 sans-serif;
    transition: .2s ease-in-out .5s;
}

tbody tr.hide td img {
    width: 0;
    height: 0;
    transition: .2s ease-in-out .5s;
}

.status {
    padding: .4rem 0;
    border-radius: 2rem;
    text-align: center;
}

.status.delivered {
    background-color: #86e49d;
    color: #006b21;
}

.status.cancelled {
    background-color: #d893a3;
    color: #b30021;
}

.status.pending {
    background-color: #ebc474;
}

.status.shipped {
    background-color: #6fcaea;
}


@media (max-width: 1000px) {
    td:not(:first-of-type) {
        min-width: 12.1rem;
    }
}

thead th span.icon-arrow {
    display: inline-block;
    width: 1.3rem;
    height: 1.3rem;
    border-radius: 50%;
    border: 1.4px solid transparent;
    
    text-align: center;
    font-size: 1rem;
    
    margin-left: .5rem;
    transition: .2s ease-in-out;
}

/* thead th:hover span.icon-arrow{
    border: 1.4px solid #6c00bd;
} */

/* thead th:hover {
    color: #6c00bd;
}

thead th.active span.icon-arrow{
    background-color: #6c00bd;
    color: #fff;
} */

thead th.asc span.icon-arrow{
    transform: rotate(180deg);
}

/* thead th.active,tbody td.active {
    color: #6c00bd;
} */

/* .export__file {
    position: relative;
}

.export__file .export__file-btn {
    display: inline-block;
    width: 2rem;
    height: 2rem;
    background: #fff6 url(images/export.png) center / 80% no-repeat;
    border-radius: 50%;
    transition: .2s ease-in-out;
} */

/* .export__file .export__file-btn:hover { 
    background-color: #fff;
    transform: scale(1.15);
    cursor: pointer;
} */

.export__file input {
    display: none;
}

.export__file .export__file-options {
    position: absolute;
    right: 0;
    
    width: 12rem;
    border-radius: .5rem;
    overflow: hidden;
    text-align: center;

    opacity: 0;
    transform: scale(.8);
    transform-origin: top right;
    
    box-shadow: 0 .2rem .5rem #0004;
    
    transition: .2s;
}

.export__file input:checked + .export__file-options {
    opacity: 1;
    transform: scale(1);
    z-index: 100;
}

.export__file .export__file-options label{
    display: block;
    width: 100%;
    padding: .6rem 0;
    background-color: #f2f2f2;
    
    display: flex;
    justify-content: space-around;
    align-items: center;

    transition: .2s ease-in-out;
}

.export__file .export__file-options label:first-of-type{
    padding: 1rem 0;
    background-color: #86e49d !important;
}

.export__file .export__file-options label:hover{
    transform: scale(1.05);
    background-color: #fff;
    cursor: pointer;
}

.export__file .export__file-options img{
    width: 2rem;
    height: auto;
}

/* .pagination .page-item a.page-link:hover {
    background-color: #6f51b8;
    color: #fff;
  } */
  
  /* Hiệu ứng cho nút phân trang hiện tại (active) */
  .pagination .page-item.active a.page-link {
    background-color: #781b1b;
    color: #fff;
    cursor: default;
  }
  
  /* Hiệu ứng cho nút Previous và Next */
  /* .pagination .page-item:first-child a.page-link,
  .pagination .page-item:last-child a.page-link {
    background-color: #190fac;
    color: #fff;
  } */
  
  /* Hiệu ứng cho nút Previous và Next khi hover */
  /* .pagination .page-item:first-child a.page-link:hover,
  .pagination .page-item:last-child a.page-link:hover {
    background-color: #6f51b8;
  } */
  .ag-courses_item {
  margin: auto;
  overflow: hidden;
  border-radius: 28px;
}
.ag-courses-item_link {
  display: block;
  padding: 30px 20px;
  /* background-color: #121212; */
  overflow: hidden;
  position: relative;
  text-decoration: none;
}

/* .ag-courses-item_link:hover,
.ag-courses-item_link:hover .ag-courses-item_date {
  color: #121212;
}
.ag-courses-item_link:hover .ag-courses-item_bg {
  -webkit-transform: scale(10);
  -ms-transform: scale(10);
  transform: scale(10);
} */
.ag-courses-item_title {
  min-height: 57px;
  margin: 0 0 30px;
  overflow: hidden;
  font-weight: bold;
  font-size: 20px;
 
  z-index: 2;
  position: relative;
}
.ag-courses-item_date-box {
  font-size: 18px;
  
  z-index: 2;
  position: relative;
}
/* .ag-courses-item_date {
  font-weight: bold;
  color: #f9e534;
  -webkit-transition: color 0.5s ease;
  -o-transition: color 0.5s ease;
  transition: color 0.5s ease;
} */
/* .ag-courses-item_bg {
  height: 130px;
  width: 200px;
  background-color: #f9b234;
  z-index: 1;
  position: absolute;
  top: -75px;
  right: -75px;
  border-radius: 50%;
  -webkit-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
} */
input[type="date"] {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            padding: 0.5em;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
            font-size: 16px;
            width: 200px;
        }

        /* Định dạng hover và focus */
        input[type="month"]:hover,
        input[type="month"]:focus {
            border-color: #007bff;
        }
        input[type="month"] {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            padding: 0.5em;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
            font-size: 16px;
            width: 200px;
        }

        /* Định dạng hover và focus */
        input[type="month"]:hover,
        input[type="month"]:focus {
            border-color: #007bff;
        }
      

</style>