<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>

    <!-- Custom Css -->
    <link rel="stylesheet" href="style.css">

    <!-- FontAwesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/homePage.css">

    <style>
    
@import url(https://fonts.googleapis.com/css?family=Dancing+Script);
body {
    background-color: #e8f5ff;
    font-family: Arial;
    
}
.navbar-top {
    background-color: #fff;
    color: #333;
    box-shadow: 0px 4px 8px 0px grey;
    height: 60px;
}

.title {
    padding-top: 15px;
    position: absolute;
    left: 45%;
}

.navbar-top ul {
    float: right;
    list-style-type: none;
    margin: 0;

    padding: 18px 50px 0 40px;
}

.navbar-top ul li {
    float: left;
}

.navbar-top ul li a {
    color: #333;
    padding: 14px 16px;
    text-align: center;
    text-decoration: none;
}

.icon-count {
    background-color: #ff0000;
    color: #fff;
    float: right;
    font-size: 11px;
    left: -25px;
    padding: 2px;
    position: relative;
}

/* End */

/* Sidenav */
.sidenav {
    background-color: #fff;
    color: #333;
    border-radius: 20px;
    box-shadow: 0px 0px 5px 1px grey;
    height: 68%;
    padding-top: 30px;
    position: absolute;
    top: 70px;
    width: 250px;
    margin-top: 44px;
    margin-left: 50px;
    
}

.profile {
    margin-bottom: 20px;
    margin-top: -12px;
    text-align: center;
}

.profile img {
    border-radius: 50%;
    box-shadow: 0px 0px 2px 1px grey;
}

.name {
    font-size: 20px;
    font-weight: bold;
    padding-top: 20px;
}

.job {
    font-size: 16px;
    font-weight: bold;
    padding-top: 10px;
}

.url, hr {
    text-align: center;
}

.url hr {
    margin-left: 20%;
    width: 60%;
}

.url a {
    color: #818181;
    display: block;
    font-size: 20px;
    margin: 10px 0;
    padding: 6px 8px;
    text-decoration: none;
}

.url a:hover, .url .active {
    background-color: #e8f5ff;
    border-radius: 28px;
    color: #000;
    margin-left: 14%;
    width: 65%;
}

/* End */

/* Main */
.main {
    margin-top: 2%;
    margin-left: 29%;
    font-size: 28px;
    padding: 0 10px;
    width: 65%;
}

.main h2 {
    color: #333;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 24px;
    margin-bottom: 4cqb;
}

.main .card {
    background-color: #fff;
    border-radius: 18px;
    box-shadow: 1px 1px 8px 0 grey;
    height: auto;
    margin-bottom: 25px;
    padding: 20px 0 20px 50px;
}

.main .card table {
    border: none;
    font-size: 16px;
    height: 270px;
    width: 80%;
}

.edit {
    position: absolute;
    color: #e7e7e8;
    right: 14%;
}

.social-media {
    text-align: center;
    width: 90%;
}

.social-media span {
    margin: 0 10px;
}
.fa-instagram:hover {
    color: #ce2b94 !important;
}

.fa-invision:hover {
    color: #5032f8 !important;
}

.fa-github:hover {
    color: #b8aeae !important;
}

.fa-whatsapp:hover {
    color: #25d366 !important;
}

.fa-snapchat:hover {
    color: #fffb01 !important;
}
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="navbar-top">
        <div class="title">

        </div>
    </div>

    <div class="sidenav">
        <div class="profile">
            <img src="../../resources/uploads/${employees.photo}" alt="" width="100" height="100">
            
            <div class="name">
                ${employees.employeeName}
            </div>
        <br>
            <div class="role">
                ${employees.role}
            </div>
        </div>

        <div class="sidenav-url">
            <div class="url">
                <a href="#profile" class="active">Profile</a>
                <hr align="center">
            </div>
            <div class="url">
                <a href="#settings">Settings</a>
                <hr align="center">
            </div>
        </div>
    </div>
    <div class="main">
        <h2>MY PROFILE</h2>
        <div class="card">
            <div class="card-body">
                <i class="fa fa-pen fa-xs edit"></i>
                <table>
                    <tbody>
                        <tr>
                            <td>Name</td>
                            <td>:</td>
                            <td>${employees.employeeName}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>:</td>
                            <td>${employees.email}</td>
                        </tr>
                         <tr>
                            <td>Passward</td>
                            <td>:</td>
                            <td>${employees.passward}</td>
                        </tr>

                        <tr>
                            <td>Address</td>
                            <td>:</td>
                            <td>${employees.employeeAddress}</td>
                        </tr>
                        <tr>
                            <td>Mobile No</td>
                            <td>:</td>
                            <td>${employees.mobile}</td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>:</td>
                            <td>${employees.gender}</td>
                        </tr>
                        <tr>
                            <td>Role</td>
                            <td>:</td>
                            <td>${employees.role}</td>
                        </tr>
                        <tr>
                            <td>Department</td>
                            <td>:</td>
                            <td>${employees.department}</td>
                        </tr>

                        <tr>
                            <td>Date Of Birth</td>
                            <td>:</td>
                            <td> ${employees.dob}</td>
                        </tr>
                        <tr>
                            <td>Date Of Joining</td>
                            <td>:</td>
                            <td>${employees.doj}</td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>

        <h2>SOCIAL MEDIA</h2>
        <div class="card">
            <div class="card-body">
                <i class="fa fa-pen fa-xs edit"></i>
                <div class="social-media">
                    <span class="fa-stack fa-sm">
                        <i class="fas fa-circle fa-stack-2x"></i>
                        <i class="fab fa-instagram fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-sm">
                        <i class="fas fa-circle fa-stack-2x"></i>
                        <i class="fab fa-invision fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-sm">
                        <i class="fas fa-circle fa-stack-2x"></i>
                        <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-sm">
                        <i class="fas fa-circle fa-stack-2x"></i>
                        <i class="fab fa-whatsapp fa-stack-1x fa-inverse"></i>
                    </span>
                    <span class="fa-stack fa-sm">
                        <i class="fas fa-circle fa-stack-2x"></i>
                        <i class="fab fa-snapchat fa-stack-1x fa-inverse"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />

</body>
</html>