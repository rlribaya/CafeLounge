<%@page session="false"%>
<%  
    // no caching to prevent back button press
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <link rel="icon" href="resources/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="global.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafe Lounge</title>
    </head>
    <body>
        <%@include file="/components/navbar.jsp" %>
        <div class="row px-5 py-4 justify-content-center" style="background-color: rgba(255,255,255,0.5);">
            <div class="col-lg-auto">
                <div class="carousel-cust" style>
                    <div id="carouselExampleControls" class="carousel carousel-dark slide carousel-fade mh-100" data-bs-ride="carousel">
                        <div class="carousel-inner carousel-cust">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <img src="resources/cheesecake.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item" data-bs-interval="10000">
                                <img src="resources/choctruff.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item" data-bs-interval="10000">
                                <img src="resources/mangobene.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-auto d-flex align-items-center">
                <div style="width: 100%;">
                        <h1 class="name-title">CAFE LOUNGE</h1><br>
                        <h2 class="text-resp text-nowrap" style="line-height: 1.5">
                        Relax and lounge in this online café. Want something to eat?<br>
                        Have a look at our cakes. Want something to drink?<br>
                        Have a coffee. No caffeine? Have a cup of tea or hot chocolate.<br>
                        Relax now and enjoy your day, here at Café Lounge
                        </h2>
                </div>
            </div>
        </div>
        <div class="container-lg">
            <div class="row" style="text-align: justify">
                <div class="col-lg-6 d-flex flex-column align-items-center px-3 py-5">
                    <h1 class="title title-resp" id="cakes">
                        Cakes
                    </h1>
                        <img class="img-fluid rounded px-5" src="resources/cheesecake.jpg">
                    <p class="px-5 pt-3 text-resp">
                        Want something to eat while sipping your favorite stress relieving drink?
                        Take a look at our cakes. It's flavor will surely relieve stress.
                        Isn't it nice to just relax and eat cake after a very stressful day?
                    </p>
                    <a href="hom">
                        <input class="btn btn-dark p-2 px-4 text-resp" type="button" value="Learn More">
                    </a>
                </div>
                <div class="col-lg-6 d-flex flex-column align-items-center px-3 py-5">
                    <h1 class="title title-resp" id="coffee">
                        Coffee
                    </h1>
                        <img class="img-fluid rounded px-5" src="resources/espresso.jpg">
                    <p class="px-5 pt-3 text-resp">
                        Feeling tired? Take a sip of coffee. Have a little bit of caffeine
                        and the next thing you know you're awake. We respect everyone's
                        taste so we have a handful types of coffee where one might cater your taste
                    </p>
                    <a href="hom">
                        <input class="btn btn-dark p-2 px-4 text-resp" type="button" value="Learn More">
                    </a>
                </div>
                <div class="col-lg-6 d-flex flex-column align-items-center px-3 py-5">
                    <h1 class="title title-resp" id="tea">
                        Tea
                    </h1>
                        <img class="img-fluid rounded px-5" src="resources/earl.jpg">
                    <p class="px-5 pt-3 text-resp">
                        Coffee's not to your taste? Don't worry. Have a sip of hot tea
                        from our collection of different tea leaves. Feel refreshed after
                        every sip of your favorite tea.
                    </p>
                    <a href="hom">
                        <input class="btn btn-dark p-2 px-4 text-resp" type="button" value="Learn More">
                    </a>
                </div>
                <div class="col-lg-6 d-flex flex-column align-items-center px-3 py-5">
                    <h1 class="title title-resp"  id="choc">
                        Hot Chocolate
                    </h1>
                        <img class="img-fluid rounded px-5" src="resources/cheesecake.jpg">
                    <p class="px-5 pt-3 text-resp">
                        Abstaining from caffeine? You can still hae a hot beverage.
                        Take a sip of our Hot Chocolate. Just choose a style that caters
                        your taste from our selection. 
                    </p>
                    <a href="hom">
                        <input class="btn btn-dark p-2 px-4 text-resp" type="button" value="Learn More">
                    </a>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
