
<style>
    @charset "UTF-8";
    .btn {
--color: #3c78de;
--color2: rgb(10, 25, 30);
padding: 0.8em 1.75em;
background-color: transparent;
border-radius: 6px;
border: .3px solid var(--color);
transition: .5s;
position: relative;
overflow: hidden;
cursor: pointer;
z-index: 1;
font-weight: 30;
font-size: 15px;
font-family: 'Roboto', 'Segoe UI', sans-serif;
text-transform: uppercase;
color: var(--color);
}

.btn::after, .btn::before {
content: '';
display: block;
height: 100%;
width: 100%;
transform: skew(90deg) translate(-50%, -50%);
position: absolute;
inset: 50%;
left: 25%;
z-index: -1;
transition: .5s ease-out;
background-color: var(--color);
}

.btn::before {
top: -50%;
left: -25%;
transform: skew(90deg) rotate(180deg) translate(-50%, -50%);
}

.btn:hover::before {
transform: skew(45deg) rotate(180deg) translate(-50%, -50%);
}

.btn:hover::after {
transform: skew(45deg) translate(-50%, -50%);
}

.btn:hover {
color: var(--color2);
}

.btn:active {
filter: brightness(.7);
transform: scale(.98);
}
.btn1 {
  width: 150px;
  height: 50px;
  border-radius: 5px;
  border: none;
  transition: all 0.5s ease-in-out;
  font-size: 20px;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-weight: 600;
  display: flex;
  align-items: center;
  background: #040f16;
  color: #f5f5f5;
}

.btn1:hover {
  box-shadow: 0 0 20px 0px #2e2e2e3a;
}

.btn1 .icon {
  position: absolute;
  height: 40px;
  width: 70px;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: all 0.5s;
}

.btn1 .text {
  transform: translateX(55px);
}

.btn1:hover .icon {
  width: 175px;
}

.btn1:hover .text {
  transition: all 0.5s;
  opacity: 0;
}

.btn1:focus {
  outline: none;
}

.btn1:active .icon {
  transform: scale(0.85);
}
</style>