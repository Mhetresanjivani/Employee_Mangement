<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration</title>
    <link rel="stylesheet" href="/resources/css/homePage.css">
    <link rel="stylesheet" href="/resources/css/from.css">
    <link rel="stylesheet" href="/resources/css/addEmployee.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container1">
        <form action="/saveEmployee" method="post" id="registrationForm"  enctype='multipart/form-data'>
            <fieldset>
                <div class="form">  Employee Registration Form</div>
                <h4 style="color:green;">${msg}</h4>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Employee Name: <span class="mandatory">*</span></label>
                        <input type="text" id="name" name="employeeName" placeholder="Enter Your Name">
                        <span id="nameError" class="error"></span>
                    </div> <br>
                    <div class="form-group-item">
                        <label>Employee Address:</label>
                        <input type="text" id="address" name="employeeAddress" placeholder="Enter Your Address">
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Mobile No: <span class="mandatory">*</span></label>
                        <input type="number" id="mobile" name="mobile" placeholder="Mobile No">
                        <span id="mobileError" class="error"></span>
                    </div> <br>
                    <div class="form-group-item">
                        <label>Email: <span class="mandatory">*</span></label>
                        <input type="email" id="email" name="email" placeholder="Enter Your Email">
                        
                    </div>

                    
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Salary: <span class="mandatory">*</span></label>
                        <input type="number" id="salary" name="salary" placeholder="Enter Salary">
                        <span id="salaryError" class="error"></span>
                    </div> <br>
                    <div class="form-group-item">
                        <label>Passward: <span class="mandatory">*</span></label>
                        <input type="passward" id="passward" name="passward" placeholder="Enter Your Password">
                        <span id="passwardError" class="error"></span>
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Date of Joining: <span class="mandatory">*</span> </label>
                        <input type="date" id="doj" name="doj">
                        <span id="dojError" class="error"></span>
                    </div> <br> <br> <br>
                    <div class="form-group-item">
                        <label>Date of Birth:</label>
                        <input type="date" id="dob" name="dob">
                    </div>
                </div>
                <div class="form-group side-by-side">
                    <div class="form-group-item">
                        <label>Employee Department:</label>
                        <select name="Department" id="department">
                            <option value="">---Select Department---</option>
                            <option value="HR">HR Department</option>
                            <option value="Admin">Admin Department</option>
                            <option value="Developer">Developer Department</option>
                        </select>
                    </div> <br>
                    <div class="form-group-item">
                        <label>Employee Role:</label>
                        <select name="role" id="role">
                            <option value="">---Select Role---</option>
                            <option value="HR">HR</option>
                            <option value="Admin">Admin</option>
                            <option value="Employee">Employee</option>
                        </select>
                    </div>
                  
                   
            </div>
            <div class="form-group side-by-side">
                <div class="form-group-item">
                    <label for="photo">Photo <span class="mandatory">*</span></label>
            <input type="file" id="photo" name="Pic" accept="image/*" required>
            <div class="error" id="photoError"></div>
                </div> <br>
                <div class="form-group-item">
                    <label> Select Gender</label>
                    <select name="Gender" id="gender">
                        <option value="">---Select Role---</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                    </div>
            </div>
                <div class="form-actions">
                    <button type="reset">Reset</button>
                    <button type="submit" id="submit">Submit</button>

                </div>
            </fieldset>
        </form>
    </div>
    <script>
     document.addEventListener('DOMContentLoaded', (event) => {
    const form = document.getElementById('registrationForm');
    const mobileNo = document.getElementById('mobile');
    const password = document.getElementById('password');
    const photo = document.getElementById('photo');
    const doj = document.getElementById('doj');
    const salary = document.getElementById('salary');
    const name = document.getElementById('name');


    doj.value = new Date().toISOString().split('T')[0];

    form.addEventListener('submit', function(event) {
        let isValid = true;
        const namePattern = /^[A-Za-z\s]+$/;
        if (!namePattern.test(name.value)) {
            document.getElementById('nameError').textContent = 'Name can only contain letters and spaces.';
            isValid = false;
        } else {
            document.getElementById('nameError').textContent = '';
        }
        const mobilePattern = /^[0-9]{10}$/;
        if (!mobilePattern.test(mobileNo.value)) {
            document.getElementById('mobileError').textContent = 'Mobile number must be 10 digits.';
            isValid = false;
        } else {
            document.getElementById('mobileError').textContent = '';
        }
        if (password.value.length < 8) {
            document.getElementById('passwordError').textContent = 'Password must be at least 8 characters long.';
            isValid = false;
        } else {
            document.getElementById('passwordError').textContent = '';
        }
        if (salary.value <= 10000) {
            document.getElementById('salaryError').textContent = 'Salary must be greater than 10000.';
            isValid = false;
        } else {
            document.getElementById('salaryError').textContent = '';
        }
        const allowedExtensions = /(\.jpg|\.jpeg)$/i;
        if (!allowedExtensions.test(photo.value)) {
            document.getElementById('photoError').textContent = 'Please upload jpg, jpeg, or png photo.';
            isValid = false;
        } else {
            document.getElementById('photoError').textContent = '';
        }
        if (!doj.value) {
            document.getElementById('dojError').textContent = 'Date of Joining is required.';
            isValid = false;
        } else {
            document.getElementById('dojError').textContent = '';
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
});
    </script>
        <jsp:include page="footer.jsp" />

</body>
</html>