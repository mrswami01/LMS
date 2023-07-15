<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Join Us</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="index_body">
        <div class="Homepage_header">
            <img width="52" height="75" src="img/VJTI_logo.png" class="custom-logo" alt="VJTI Mumbai" decoding="async" srcset="https://xkt381.n3cdn1.secureserver.net/wp-content/uploads/oldupload/cropped-New-VJTI-Logo_1-1-52x75.jpg 52w, https://xkt381.n3cdn1.secureserver.net/wp-content/uploads/oldupload/cropped-New-VJTI-Logo_1-1-208x300.jpg 208w, https://xkt381.n3cdn1.secureserver.net/wp-content/uploads/oldupload/cropped-New-VJTI-Logo_1-1.jpg 400w" sizes="(max-width: 52px) 100vw, 52px" style="margin:0px">
            <p class="title">VJTI Mumbai<br>
                Veermata Jijabai Technological Institute 
            </p>
        </div>
        <div class="topnav">
            <a class="active" href="#home">Home</a>
            <a href="../StudentLogin.jsp">Student Login</a>
            <a href="../AdminLogin.jsp"> Admin Login</a>
        </div>
        <div style="text-align: center; font-size: 40px;">
            Welcome to VJTI Library !!!
        </div>
        <div class="index_container">
            <!-- Full-width images with number text -->
            <div class="mySlides"; style="text-align:center">
                <div class="numbertext">1 / 5</div>
                <img src="../img/Lib_Pic1.jpg" style="width:100%">
            </div>
            <div class="mySlides">
                <div class="numbertext">2 / 5</div>
                <img src="../img/Lib_Pic2.jpg" style="width:100%">
            </div>
            <div class="mySlides">
                <div class="numbertext">3 / 5</div>
                <img src="../img/Lib_Pic3.jpg" style="width:100%">
            </div>
            <div class="mySlides">
                <div class="numbertext">4 / 5</div>
                <img src="../img/Lib_Pic4.jpg" style="width:100%">
            </div>
            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
         <!-- Image text -->
            <div class="caption-container">
                <p id="caption"></p>
            </div>
            <!-- Thumbnail images -->
            <div class="row">
                <div class="column">
                    <img class="demo cursor" src="../img/Lib_Pic1.jpg" style="width:50%" onclick="currentSlide(1)" alt="Library 1">
                </div>
                <div class="column">
                    <img class="demo cursor" src="../img/Lib_Pic2.jpg" style="width:50%" onclick="currentSlide(2)" alt="Library 2">
                </div>
                <div class="column">
                    <img class="demo cursor" src="../img/Lib_Pic3.jpg" style="width:50%" onclick="currentSlide(3)" alt="Library 3">
                </div>
                <div class="column">
                    <img class="demo cursor" src="../img/Lib_Pic4.jpg" style="width:50%" onclick="currentSlide(4)" alt="Library 4">
                </div>
            </div>
        </div>
        <script>
            let slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("demo");
                let captionText = document.getElementById("caption");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                captionText.innerHTML = dots[slideIndex - 1].alt;
            }
        </script>
    </body>
</html>

