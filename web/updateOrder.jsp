
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">

        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
    </head>

    <body>
        <c:choose>
            <c:when test="${sessionScope.manager == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>


                <!--HEADER-->
                <header>
                    <c:import url="header_managerDashboard.jsp" />
                </header>

                <div class="container-fluid">

                    <!-- menu -->
                    <div class="menu-btn">
                        <input type="checkbox" id="nav-toggle">
                    </div>
                    <div class="side-bar">
                        <div class="menu">
                            <div class="item">
                                <a class="sub-btn">
                                    <i class="fa-solid fa-user mx-3"></i>
                                    User
                                    <i class="fa-solid fa-angle-right dropdown"></i>
                                </a>
                                <div class="sub-menu">
                                    <a href="MainController?action=viewCustomers" class="sub-item">Customers</a>
                                    <a href="MainController?action=viewSales" class="sub-item">Sales</a>
                                    <a href="MainController?action=viewGuards" class="sub-item">Guards</a>
                                </div>
                            </div>

                            <div class="item">
                                <a href="MainController?action=viewAllCategories" class="sub-btn">
                                    <span><i class="fa-solid fa-bars-staggered mx-3"></i></span>
                                    <span>Category</span>
                                </a>
                            </div>

                            <div class="item">
                                <a  href="MainController?action=viewAllProducts" class="sub-btn">
                                    <span><i class="fa-solid fa-box mx-3"></i></span>
                                    <span>Product</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewVouchers">
                                    <span><i class="fa-solid fa-tag mx-3"></i></span>
                                    <span>Voucher</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewSchedule">
                                    <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                                    <span>Schedule</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn active" href="MainController?action=viewAllOrders">
                                    <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                    <span>Order</span>
                                </a>
                            </div>
                        </div>
                    </div>


                    <!-- table -->
                    <div class="dashboard ">
                        <div class="mt-4 container mb-5">
                            <div class="mt-5 row justify-content-between ">
                                <c:if test="${requestScope.noti != null}">
                                    ${requestScope.noti}
                                </c:if>

                                <!-- info -->
                                <div class="col-lg-5 order-info">
                                    <div class="form-item mt-3 mb-4 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Name</label>
                                        </div>
                                        <div class="col-9">
                                            <input type="text" id="name" disabled="" value="${requestScope.order.customerName}">
                                        </div>
                                    </div>

                                    <div class="form-item my-4 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Order Date</label>
                                        </div>
                                        <div class="col-9">
                                            <input type="datetime" id="orderDate" disabled="" value="${requestScope.order.orderDate}">
                                        </div>
                                    </div>

                                    <div class="form-item my-4 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Ship Date</label>
                                        </div>
                                        <div class="col-9">
                                            <input type="datetime" id="shipDate" disabled="" value="${requestScope.order.shipDate}">
                                        </div>
                                    </div>

                                    <div class="form-item my-4 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Phone</label>
                                        </div>
                                        <div class="col-9">
                                            <input type="tel" id="phone" disabled="" value="${requestScope.order.phone}">
                                        </div>
                                    </div>

                                    <div class="form-item my-4 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Address</label>
                                        </div>
                                        <div class="col-9">
                                            <input type="text" id="address" disabled="" value="${requestScope.order.address}">
                                        </div>
                                    </div>

                                    <div class="form-item my-4 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Voucher</label>
                                        </div>
                                        <div class="col-9">
                                            <c:choose>
                                                <c:when test="${requestScope.voucher.discount != null}">
                                                    <input type="text" id="voucher" disabled="" value="-$${requestScope.voucher.discount}">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="voucher" disabled="" value="">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                    <form action="MainController" method="post" class="change-status">
                                        <div class="d-flex align-items-center justify-content-center my-4 ">
                                            <div class="col-3">
                                                <label for="">Status</label>
                                            </div>
                                            <div class="col-9">
                                                <select class="form-select" aria-label="Default select example" name="status">
                                                    <option selected>
                                                        <c:choose>
                                                            <c:when test="${requestScope.order.status eq 2}">
                                                                Delivering
                                                            </c:when>
                                                            <c:when test="${requestScope.order.status eq 3}">
                                                                Completed
                                                            </c:when>
                                                            <c:when test="${requestScope.order.status eq 4}">
                                                                Canceled
                                                            </c:when>
                                                            <c:otherwise>
                                                                Processing
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </option>
                                                    <c:choose>
                                                        <c:when test="${requestScope.order.status eq 2}">
                                                            <option value="${1}">
                                                                Processing
                                                            </option>
                                                            <option value="${3}">
                                                                Completed
                                                            </option>
                                                            <option value="${4}">
                                                                Canceled
                                                            </option>
                                                        </c:when>
                                                        <c:when test="${requestScope.order.status eq 3}">
                                                            <option value="${1}">
                                                                Processing
                                                            </option>
                                                            <option value="${2}">
                                                                Delivering
                                                            </option>
                                                            <option value="${4}">
                                                                Canceled
                                                            </option>
                                                        </c:when>
                                                        <c:when test="${requestScope.order.status eq 4}">
                                                            <option value="${1}">
                                                                Processing
                                                            </option>
                                                            <option value="${2}">
                                                                Delivering
                                                            </option>
                                                            <option value="${3}">
                                                                Completed
                                                            </option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${2}">
                                                                Delivering
                                                            </option>
                                                            <option value="${3}">
                                                                Completed
                                                            </option>
                                                            <option value="${4}">
                                                                Canceled
                                                            </option>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </select>
                                                <input type="hidden" name="orderid" value="${order.orderID}" readonly="">
                                            </div>
                                        </div>
                                                
                                        <div class="d-flex justify-content-between mt-5 mb-3 ">
                                            <div class="col-12 d-flex justify-content-center">
                                                <button class="button apply mx-2" type="submit" name="action" value="changeOrderStatus">Update</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                                <!-- check out -->
                                <div class="col-lg-6 checkout">
                                    <div class="row">
                                        <table class="table-fixed text-center">
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th></th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="details" items="${requestScope.orderDetailsList}">
                                                    <tr>
                                                        <td  class="cart-item-img">                                                 
                                                            <img src="${details.imgPath}" style="width: 80px;"/>
                                                        </td>
                                                        <td class="cart-item-title">${details.productName}</td>
                                                        <td>${details.quantity}</td>
                                                        <td class="cart-price">$${details.money}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="total mt-4">
                                        <p>Total</p>
                                        <p>$${requestScope.order.totalMoney}</p>
                                    </div>

                                    <c:if test="${requestScope.error != null}">
                                        <div class="alert alert-danger alert-dismissible fade show notification mt-5" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 30px auto">
                                            <strong class="error">${requestScope.error}</strong> 
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                                        </div>
                                    </c:if>




                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>

</html>