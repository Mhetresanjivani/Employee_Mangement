<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/homePage.css">
    <link rel="stylesheet" href="/resources/css/custom.css">
    <link rel="stylesheet" href="/resources/css/addEmployee.css">
    <style>
        .modal-photo {
            max-width: 40px;
            max-height: 40px;
            margin-right: 100px;
            margin-top: 29px;
            cursor: pointer;
            transition: transform 0.8s ease-in-out;
        }
        .modal-photo:hover {
            transform: scale(6.5);
            z-index: 1000;
        }
    </style>
    </head>
    <body>
    <%@ include file="/WEB-INF/view/header.jsp" %>
    <br>
    <div class="container-fluid mt-4 mb-4">
        <div class="table-responsive">
            <table class="table table-success table-striped">
                <br>
                <br>
                <h4 style="color: rgb(14, 13, 13);">Employee List </h4>
                <br>
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">Mobile</th>
                        <th scope="col">Email</th>
                        <%
                        if(role.equalsIgnoreCase("Admin"))
                        { %>
                            <th scope="col">Passward</th>
                          <%
                        }
                        %>
                        <th scope="col">Gender</th>
                        <th scope="col">DOB</th>
                        <th scope="col">DOJ</th>
                   <%
                   if(role.equalsIgnoreCase("Admin"))
                   { %>
                      <th scope="col">Role</th>
                    <%
                       }
                        %>
                        <th scope="col">Department</th>
                        <%
                        if(role.equalsIgnoreCase("Admin"))
                        { %>
                            <th scope="col">Action</th>
                          <%
                        }
                        %>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="employee" items="${list}" varStatus="status"> 
                        <tr>
                            <td scope="row">${status.index + 1}</td>
                            <td class="d-flex align-items-center">
                            <img src="../../resources/uploads/${employee.photo}" class="rounded-circle bg-primary me-3 employee-photo" height="40px" width="40px">
                            <c:out value="${employee.employeeName}"/>
                            </td>
                            <td><c:out value="${employee.employeeAddress}"/></td>
                            <td><c:out value="${employee.mobile}"/></td>
                            <td><c:out value="${employee.email}"/></td>
                            <%
                            if(role.equalsIgnoreCase("Admin"))
                            { %>     
                                <td><c:out value="${employee.passward}"/></td>
                              <%
                            }
                            %>
                            <td><c:out value="${employee.gender}"/></td>
                            <td><c:out value="${employee.dob}"/></td>
                            <td><c:out value="${employee.doj}"/></td>
                            <%
                            if(role.equalsIgnoreCase("Admin"))
                            { %>   
                                <td><c:out value="${employee.role}"/></td>                  
                              <%
                            }
                            %>
                            <td><c:out value="${employee.department}"/></td>
                            <%
                            if(role.equalsIgnoreCase("Admin"))
                            { %>
                                <td> 
                                    <a class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#editModal" onclick="editEmployee('${employee.employeeId}', '${employee.employeeName}', '${employee.employeeAddress}', '${employee.mobile}', '${employee.email}','${employee.passward}', '${employee.gender}', '${employee.dob}', '${employee.doj}', '${employee.role}', '${employee.department}', '${employee.photo}')">
                                        <i class="fas fa-edit text-primary"></i>
                                    </a>
                                    <a class="btn btn-sm" href="/deleteemp/${employee.employeeId}" onclick="return confirm('Are you sure you want to delete this record?')">
                                        <i class="fas fa-trash-alt text-primary"></i>
                                    </a>
                                </td>  
                              <%
                            }
                            %>
                        </tr>
                    </c:forEach>
            </tbody>
            </table>
        </div>
        <!-- Edit Employee Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Employee</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Form for editing employee details -->
                        <form action="/updateEmployee" method="post" enctype="multipart/form-data" id="editEmployeeForm">
                            <input type="text" hidden id="employeeId" name="employeeId">
                            <fieldset>
                                <div class="form">Employee Registration Form</div>
                                <h4 style="color:green;">${msg}</h4>
                                <div class="form-group side-by-side">
                                    <div class="form-group-item">
                                        <label>Employee Name: <span class="mandatory">*</span></label>
                                        <input type="text" id="employeeName" name="employeeName" placeholder="Enter Your Name">
                                        <span id="nameError" class="error"></span>
                                    </div> <br>
                                    <div class="form-group-item">
                                        <label>Employee Address:</label>
                                        <input type="text" id="employeeAddress" name="employeeAddress" placeholder="Enter Your Address">
                                    </div>
                                </div>
                                <div class="form-group side-by-side">
                                    <div class="form-group-item">
                                        <label>Mobile No: <span class="mandatory">*</span></label>
                                        <input type="number" id="employeeMobile" name="mobile" placeholder="Mobile No">
                                        <span id="mobileError" class="error"></span>
                                    </div> <br>
                                    <div class="form-group-item">
                                        <label>Email: <span class="mandatory">*</span></label>
                                        <input type="email" id="employeeEmail" name="email" placeholder="Enter Your Email">   
                                    </div>
                                </div>
                                <div class="form-group side-by-side">
                                    <div class="form-group-item">
                                        <label>Password: <span class="mandatory">*</span></label>
                                        <input type="password" id="employeePassword" name="password" placeholder="Enter Your Password">
                                        <span id="passwordError" class="error"></span>
                                    </div>
                                    <div class="form-group-item">
                                        <label>Select Gender</label>
                                        <select name="gender" id="employeeGender">
                                            <option value="">---Select Role---</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>  
                                </div>
                                <div class="form-group side-by-side">
                                    <div class="form-group-item">
                                        <label>Date of Joining: <span class="mandatory">*</span> </label>
                                        <input type="date" id="employeeDoj" name="doj">
                                        <span id="dojError" class="error"></span>
                                    </div> <br> <br> <br>
                                    <div class="form-group-item">
                                        <label>Date of Birth:</label>
                                        <input type="date" id="employeeDob" name="dob">
                                    </div>
                                </div>
                                <div class="form-group side-by-side">
                                    <div class="form-group-item">
                                        <label>Employee Department:</label>
                                        <select name="department" id="employeeDepartment">
                                            <option value="">---Select Department---</option>
                                            <option value="HR">HR Department</option>
                                            <option value="Admin">Admin Department</option>
                                            <option value="Developer">Developer Department</option>
                                        </select>
                                    </div> <br>
                                    <div class="form-group-item">
                                        <label>Employee Role:</label>
                                        <select name="role" id="employeeRole">
                                            <option value="">---Select Role---</option>
                                            <option value="HR">HR</option>
                                            <option value="Admin">Admin</option>
                                            <option value="Developer">Developer</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group side-by-side">
                                    <div class="form-group-item">
                                        <label for="employeePhotoFile">Photo <span class="mandatory">*</span></label>
                                        <input type="file"  name="pic">
                                        <img id="employeePhoto" class="modal-photo" src="" alt="">
                                    </div>
                                </div>
                            </fieldset>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" >Save changes</button>
                            </div>
                        </div>
                        </form>
                    </div>
            </div>
        </div>
    </div>  
    <script>
        function editEmployee(employeeId, employeeName, employeeAddress, mobile, email,passward, gender, dob, doj, role, department, photo) {
            $('#employeeId').val(employeeId);
            $('#employeeName').val(employeeName);
            $('#employeeAddress').val(employeeAddress);
            $('#employeeMobile').val(mobile);
            $('#employeeEmail').val(email);
            $('#employeePassward').val(passward);
            $('#employeeGender').val(gender);
            $('#employeeDob').val(dob);
            $('#employeeDoj').val(doj);
            $('#employeeRole').val(role);
            $('#employeeDepartment').val(department);
            $('#employeePhoto').attr('src', '../../resources/uploads/' + photo);
        }
        function saveEmployee() {
            $('#editEmployeeForm').submit();
        }
    </script>
</body>
</html>






