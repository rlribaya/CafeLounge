<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR 404: NOT FOUND</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;600&display=swap');
            body {
                background-color: #FFFBE9;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 98vh;
            }
            img {
                width: 300px;
            }
            h1 {
                color: rgba(20,20,20,0.95);
                font-size: 36px;
                font-family: 'Source Sans Pro', sans-serif;
                weight:600;
            }
            @media(max-width:991px) {
                img {
                    width: 50vw;
                }
                h1 {
                    font-size: 64px;
                    font-family: 'Source Sans Pro', sans-serif;
                    weight:600;
                }
            }
        </style>
    </head>
    <body>
        <div>
        <img src="resources/error404logo.png">
        </div>
        <div>
        <h1>ERROR 404: PAGE NOT FOUND</h1>
        </div>
    </body>
</html>
