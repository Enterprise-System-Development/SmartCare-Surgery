<!DOCTYPE html>
<html>
    <head>
        <title>Error Page</title>
        <style>
            .login {     
    height: max-content;
    width: 35%;
    padding: 50px;
    position: absolute;
    z-index: 1;
    left: 50%;
    top: 50%;
    overflow-x: hidden;
    overflow-y: auto;
    text-align: center;
    transform: translate(-50%, -50%);
    background-color: #ddf7fb;

}
        </style>
    </head>
    <body>
        <div class="login">
            <h1>Incorrect username or password <br><br> </h1>
            <h2>${message}${pageContext.exception}</h2>
            <form action="index.jsp" method="post">
                <input type="submit" value="Return to homepage" />
            </form>
        </div>
    </body>
</html>

