<?php

if(isset($_GET["error"])){
    $error = $_GET["error"];
    switch($error){
        case "emptyinput":
            echo "<p class='error-message'>Please fill in all fields.</p>";
            break;
        case "username":
            echo "<p class='error-message'>Invalid username format.</p>";
            break;
        case "email":
            echo "<p class='error-message'>Invalid email address.</p>";
            break;
        case "passwordmatch":
            echo "<p class='error-message'>Passwords do not match.</p>";
            break;
        case "useroremailtaken":
            echo "<p class='error-message'>Username or email is already taken. Please choose a different one.</p>";
            break;
        // More cases to be added here for other errors
    }
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelScapes</title>
    <link rel="stylesheet" href="loginstyle.css">
</head>
<body>
<header>
        <nav>
            <div>
                <h3>TravelScapes</h3><br><br>
                <ul class="menu-main">
                    <li><a href="index.php">HOME</a></li>
                    <li><a href="#">DESTINATIONS</a></li>
                    <li><a href="#">HOTELS</a></li>
                    <li><a href="#">ABOUT</a></li>
                </ul><br><br><hr color="white"><br>
            </div>
            <ul class="menu-member">
                <?php
                session_start();
                if(isset($_SESSION["userid"])){
                ?>
                <li><a href="#"><?php echo $_SESSION["userid"];?></a></li>
                <li><a href="includes/logout.inc.php" class="header-login-a">LOGOUT</a></li>
                <?php
                }
                else
                {
                ?>
                <div class="menu-buttons">
                    <div class="center-links">
                        <li><a href="#" class="header-login-a">SIGN UP</a></li>
                        <li><a href="#" class="header-login-a">LOGIN</a></li>
                    </div>
                </div>
                <?php
                }
                ?>
            </ul>
        </nav>
    </header>

    <section class="index-intro">
        <div class="index-intro-bg">
            <div class="wrapper">
                <div class="index-intro-c1">
                    <div class="video"></div>
                    <p>Use this website to book travel!</p>
                </div>
                <div class="index-intro-c2">
                    <h2>We facilitate<br>Your<br>Trip</h2>
                    <a href="#">Book Your Travel Here</a>
                </div>
            </div>
        </div>
    </section>

    <section class="index-login">
    <div class="wrapper">
        <div class="index-login-signup">
            <h4>SIGN UP</h4>
            <p>Don't have an account yet? Sign Up here!</p>
            <form action="includes/signup.inc.php" method="post">
                <input type="text" name="email" placeholder="E-mail"><br>
                <input type="text" name="uid" placeholder="Username"><br>
                <input type="password" name="pwd" placeholder="Create a password"><br>
                <input type="password" name="pwdrepeat" placeholder="Confirm password"><br>
                <button type="submit" name="submit">SIGN UP</button>
            </form>
        </div>
        <div class="index-login-login">
            <h4>LOGIN</h4>
            <p>Already have an account? Log in here:</p>
            <form action="includes/login.inc.php" method="post">
                <input type="text" name="uid" placeholder="Username"><br>
                <input type="password" name="pwd" placeholder="Password"><br>
                <button type="submit" name="submit">LOGIN</button>
            </form>
        </div>
    </div>
</section>

</body>
</html>
