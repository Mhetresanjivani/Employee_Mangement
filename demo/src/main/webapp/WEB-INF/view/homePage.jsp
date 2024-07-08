<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/resources/css/homePage.css">

</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="main">
            <h1 class="wel">Welcome To Nits Software...</h1>
            <p class="come"> 
              <h2> Hello,Guys!</h2>
              <br>
            This is your home page where you can manage your profile, view your projects, and communicate with your team.</p>
        </div>
        <div id="projects" class="section">
            <h1>Projects</h1>
            <div class="box1">
                <div class="box2">
                    <h3 class="box-title">List of Projects</h3>
                    <div class="project-info">
                        <p><strong>Project 1:</strong>Online Notes Sharing</p>
                        <p><strong>Project 2:</strong> Mobile App Development</p>
                        <p><strong>Project 3:</strong> Database Optimization</p>
                    </div>
                    <p class="box-text">View and manage projects.</p>
                    <a href="#">Go To Home</a>
                </div>
            </div>
            </div>
        <div id="team" class="section">
            <h1>Team</h1>
            <div class="box1">
                <div class="box2">
                    <h3 class="box-title">Team Members</h3>
                    <div class="team-info">
                        <p><strong>Team Member 1:</strong> Anushek Yadav - Project Manager</p>
                        <p><strong>Team Member 2:</strong> Karan Kadam - UI/UX Designer</p>
                        <p><strong>Team Member 3:</strong> Ketan Kamble - Backend Developer</p>
                    </div>
                    <p class="box-text">Communicate with your team members.</p>
                    <a href="#">Go to Home</a>
                </div>
            </div>
        </div>
        <div id="addemployee" class="section">
            <h1>Other Employees</h1>
            <div class="box1">
                <div class="box2">
                    <h3 class="box-title">Employee Profiles</h3>
                    <div class="employee-profile">
                        <img src="/resources/images/sarika.jpg" alt="Emp Img">
                        <div>
                            <p><strong>Name:</strong>Sarika Dake</p>
                            <p><strong>Mobile:</strong>8625995416</p>
                            <p><strong>Position:</strong> Frontend Developer</p>
                        </div>
                    </div>
                    <div class="employee-profile">
                        <img src="/resources/images/Abhi.jpg" alt="Emp Img">
                        <div>
                            <p><strong>Name:</strong>Abhijit Upade</p>
                            <p><strong>Mobile:</strong>9999999999</p>
                            <p><strong>Position:</strong> Data Scientist</p>
                        </div>
                        </div>  
                    <div class="employee-profile">
                      <img src="/resources/images/jj.jpg" alt="Emp Img">
                        <div>
                          <p><strong>Name:</strong>Jyoti Jadhav</p>
                          <p><strong>Mobile:</strong>8888888888</p>
                          <p><strong>Position:</strong> Data Analytics</p>
                      </div>
                  </div>
                    <p class="box-text">Add others employees...</p> 
                    <a href="#">Go To Home</a>        
                  </div>
              </div> 
              </div>
          </div>  

          <jsp:include page="footer.jsp" />

            </body>
            </html>
             
