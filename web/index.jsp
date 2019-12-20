<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body class="container" onload="openSocket();">
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<main>
    <c:if test="${errors.size()>0 }">
        <div class="danger">
            <ul>
                <c:forEach var="error" items="${errors }">
                    <li>${error }</li>
                </c:forEach>
            </ul>
        </div>
    </c:if> <c:choose>
    <c:when test="${user!=null}">
        <p>Welcome ${user.getFirstName()}!</p>
        <form method="post" action="Controller?action=LogOut">
            <p>
                <input class="btn btn-info" type="submit" id="logoutbutton" value="Log Out" onclick="openSocket()">
            </p>
        </form>
    </c:when>
    <c:otherwise>
        <form method="post" action="Controller?action=LogIn" class="form">
            <p>
                <label for="email">Your email </label>
                <input type="text" id="email" name="email" value="jan@ucll.be">
            </p>
            <p>
                <label for="password">Your password</label>
                <input type="password" id="password" name="password" value="t">
            </p>
            <p>
                <input class="btn btn-info" type="submit" id="loginbutton" value="Log in" onclick="closeSocket()">
            </p>
            <p><a class="btn btn-info" href="register.jsp">Registreer</a></p>
        </form>
        <div class="blog">
            <section>
                <h3>Hoe was de projectweek?</h3>
                <div id="messages1"></div>
                <input type="text" placeholder="naam" id="nameinput1" required>
                <input type="text" placeholder="opmerking" id="messageinput1" required>
                <input type="number" placeholder="score" id="scoreinput1" required>
                <button class="btn btn-info" type="button" onclick="send1();">Send</button>
            </section>
            <section>
                <h3>Wat vond je van de les?</h3>
                <div id="messages2"></div>
                <input type="text" placeholder="naam" id="nameinput2" required/>
                <input type="text" placeholder="opmerking" id="messageinput2" required/>
                <input type="text" placeholder="score" id="scoreinput2" required/>
                <button class="btn btn-info" type="button" onclick="send2();">Send</button>
            </section>
            <section>
                <h3>Ben je hier graag?</h3>
                <div id="messages3"></div>
                <input type="text" placeholder="naam" id="nameinput3" required/>
                <input type="text" placeholder="opmerking" id="messageinput3" required/>
                <input type="text" placeholder="score" id="scoreinput3" required/>
                <button class="btn btn-info" type="button" onclick="send3();">Send</button>
            </section>
            <section>
                <h3>Wat kan je goed?</h3>
                <div id="messages4"></div>
                <input type="text" placeholder="naam" id="nameinput4" required/>
                <input type="text" placeholder="opmerking" id="messageinput4" required/>
                <input type="text" placeholder="score" id="scoreinput4" required/>
                <button class="btn btn-info" type="button" onclick="send4();">Send</button>
            </section>
            <section>
                <h3>Wat is je favoriete OPO?</h3>
                <div id="messages5"></div>
                <input type="text" placeholder="naam" id="nameinput5" required/>
                <input type="text" placeholder="opmerking" id="messageinput5" required/>
                <input type="text" placeholder="score" id="scoreinput5" required/>
                <button class="btn btn-info" type="button" onclick="send5();">Send</button>
            </section>
        </div>
    </c:otherwise>
</c:choose></main>
<br>
<br>
<br>
<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<script type="text/javascript" src="js/blog.js"></script>
</body>
</html>
