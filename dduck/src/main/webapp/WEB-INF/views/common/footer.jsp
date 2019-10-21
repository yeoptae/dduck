<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,400i,500,500i,600,600i,700,700i,800|Vollkorn:400,400i,600,600i,700,700i');
* {
    margin: 0;
    padding: 0;
    outline: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Vollkorn', 'Poppins', sans-serif, serif;
}

ul {
    list-style: none;
}

/* footer */

.contact-area {
    position: relative;
}

.contact-us {
    background: gray url(https://subtlepatterns.com/patterns/geometry2.png) repeat 0 0;
    width: 100%;
    margin: 0;
    text-align: center;
    height: 300px;
    padding: 60px 0;
    box-sizing: border-box;
    -webkit-animation: slide 20s linear infinite;
}

@-webkit-keyframes slide {
    from {
        background-position: 0 0;
    }
    to {
        background-position: -400px 0;
    }
}

.contact-list li i.fa {
    color: #000;
    font-size: 16px;
    margin-right: 5px;
}

.contact-list li {
    margin-bottom: 15px;
}

.contact-list li a {
    color: #000;
    font-size: 16px;
    -webkit-transition: all 350ms ease;
    -moz-transition: all 350ms ease;
    -ms-transition: all 350ms ease;
    -o-transition: all 350ms ease;
    transition: all 350ms ease;
}

.contact-list li a:hover {
    background-color: #FF7779;
    text-decoration: none;
}

.social-content {
    position: relative;
    z-index: 2;
    max-width: 1578px;
    background: #00a3de;
    border-radius: 5px;
    text-align: center;
    padding: 50px 20px;
    margin: 0 auto;
}

.social-title {
    display: block;
    color: #0477ae;
    margin-bottom: 20px;
    letter-spacing: -1px;
}

.socials {
    display: table;
    width: 100%;
    table-layout: fixed;
    border: 1px solid #5cc2e9;
    max-width: 1444px;
    margin: 0 auto;
}

.socials .item:first-child {
    border-left: none;
}

.socials .item {
    background: rgba(37, 37, 37, .1);
    border-left: 1px solid #5cc2e9;
    display: table-cell;
    height: 73px;
    color: #fff;
    vertical-align: middle;
    text-align: center;
    transition: background .2s ease-out;
}


/* End footer */
</style>
<footer id="contact" class="contact-us">
        <div class="container">
            <div class="row">
                <div class="contact-area">
                    <h2 style="font-size: 150%;">내마음 콩떡콩떡집</h2><br><br>
                    <ul class="contact-list">
                        <li>
                            <i class="fa fa-phone"></i> <a href="##">02.123.1234</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope"></i> <a href="#">taeyeop@kh.or.kr</a>
                        </li>
                        <li>
                            <i class="fa fa-map-marker"></i> <a href="#">대한민국, 서울시 강남구 역삼동 무슨빌딩 222-11</a>
                        </li>
                        <li>
                            <i class="fa fa-map-user"></i> <a href="#">대표 : 김태엽 , 국민은행 12345-456-789</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

</html>