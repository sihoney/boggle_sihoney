<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/mybook_review.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">

        <script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
        <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>
    </head>

    <body>
        <div id="wrap">
        
        	<!-- 헤더 -->
            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
            
            <!-- ------nav------ -->
            <div id="nav" class="clearfix">
		       <ul class="nav nav-tabs">
		           <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/mybook">내 서평</a></li>
		           <li role="presentation"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
		           <!--세션 아이디와 사이트아이디 같을때-->
		           <li role="presentation"><a href="${pageContext.request.contextPath}/analyze">통계</a></li>
		       </ul>
		       <!-- 세션아이디랑 다를때는
		       <ul class="nav nav-tabs">
		           <li role="presentation"><a href="">'유저이름'님의 서평</a></li>
		           <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/taste_main">취향저격</a></li>
		       </ul>	       
		        -->
	   		</div>
            <!-- ------nav------ -->
            
            <!--content-->
            <div class="container">
                <div class="row">
                    <!-- col-xs-8 -->
                    <div id="content" class="col-xs-8">
                        <!--기록하기 박스-->
                        <!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->  
                        <div id="writebox" class="jumbotron">
                            <h1>서평 기록하기</h1>
                            <p>'유저이름'님 오늘은 어떤 책을 읽으셨나요?</p>
                            <p><a class="btn btn-primary btn-md" href="${pageContext.request.contextPath}/review_write" role="button">기록하기</a></p>
                        </div>
                        <!-- list -->
                        <div id="list">
                            <ul>
                                <li><a><span>최신순</span></a></li>
                                <li><a><span>인기순</span></a></li>
                            </ul>
                            <span class="glyphicon glyphicon-filter" aria-hidden="true"></span>
                            <div id="category" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                  카테고리
                                  <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                  <li role="presentation"><a role="menuitem" tabindex="-1" href="">즐거운</a></li>
                                  <li role="presentation"><a role="menuitem" tabindex="-1" href="">우울한</a></li>
                                  <li role="presentation"><a role="menuitem" tabindex="-1" href="">화난</a></li>
                                  <li role="presentation"><a role="menuitem" tabindex="-1" href="">감성적인</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- list -->
                        
                        <!-- 서평 리스트 -->
                        <div id="reviews">
                            <div id="reviews-header">
                                <div class="left"><p><a href="${pageContext.request.contextPath}/bookdetail">데미안</a></p></div>
                                <!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->  
                                <div class="right">
                                    <a>수정</a>
                                    <a>삭제</a>
                                </div>
                            </div>
                            <!-- 작성자아이디와 세션아이디가 동일할 경우에는 안보이게 -->  
                            <div id="reviewer"><a>돈까스먹는 오리</a></div>
                            <div id="reviews-content">
                                <p>새는 알에서 빠져나오려고 몸부림친다. 알은 세계이다. 태어나려는 자는 누구든 한 개의 세계를 부숴야 한다. 그 새는 신을 향해 날아간다. 그 신의 이름은 아브락사스다.</p>
                                <span class="label label-default">우울한</span>
                                <span class="label label-default">#mood</span>
                            </div>
                            <div id="reviews-footer">
                                <div class="left">
                                    <span id="heart" class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                                    <span>16.5k</span>
                                    <span>2022/02/22</span>
                                </div>
                                <div class="right">
                                    <div class="dropup">
                                        <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            더보기
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                                            <li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" target="_blank" href="${pageContext.request.contextPath}/imgpreview">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 서평 리스트 -->
                        <div id="reviews">
                            <div id="reviews-header">
                                <div class="left"><p><a href="${pageContext.request.contextPath}/bookdetail">데미안</a></p></div>
                                <!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->  
                                <div class="right">
                                    <a>수정</a>
                                    <a>삭제</a>
                                </div>
                            </div>
                            <!-- 작성자아이디와 세션아이디가 동일할 경우에는 안보이게 -->  
                            <div id="reviewer"><a>돈까스먹는 오리</a></div>
                            <div id="reviews-content">
                                <p>새는 알에서 빠져나오려고 몸부림친다. 알은 세계이다. 태어나려는 자는 누구든 한 개의 세계를 부숴야 한다. 그 새는 신을 향해 날아간다. 그 신의 이름은 아브락사스다.</p>
                                <span class="label label-default">우울한</span>
                                <span class="label label-default">#mood</span>
                            </div>
                            <div id="reviews-footer">
                                <div class="left">
                                    <span id="heart" class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
                                    <span>16.5k</span>
                                    <span>2022/02/22</span>
                                </div>
                                <div class="right">
                                    <div class="dropup">
                                        <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            더보기
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                                            <li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 서평 리스트 -->
                        <div id="reviews">
                            <div id="reviews-header">
                                <div class="left"><p><a>데미안</a></p></div>
                                <!-- 작성자아이디와 세션아이디가 동일할 시에만 보이게 -->  
                                <div class="right">
                                    <a>수정</a>
                                    <a>삭제</a>
                                </div>
                            </div>
                            <!-- 작성자아이디와 세션아이디가 동일할 경우에는 안보이게 -->  
                            <div id="reviewer"><a>돈까스먹는 오리</a></div>
                            <div id="reviews-content">
                                <p>새는 알에서 빠져나오려고 몸부림친다. 알은 세계이다. 태어나려는 자는 누구든 한 개의 세계를 부숴야 한다. 그 새는 신을 향해 날아간다. 그 신의 이름은 아브락사스다.</p>
                                <span class="label label-default">우울한</span>
                                <span class="label label-default">#mood</span>
                            </div>
                            <div id="reviews-footer">
                                <div class="left">
                                    <span id="heart" class="glyphicon glyphicon-heart" aria-hidden="true"></span>
                                    <span>16.5k</span>
                                    <span>2022/02/22</span>
                                </div>
                                <div class="right">
                                    <div class="dropup">
                                        <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            더보기
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
                                            <li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
                                            <li role="presentation" class="divider"></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- //col-xs-8 -->
                    
                    

                    <!-- col-xs-4:프로필 -->
                    <div id="aside" class="col-xs-4">
                        <div id="profile-box" class="panel panel-default">
                            <div class="panel-heading">
                              <h3 id="profile-title" class="panel-title">내 프로필</h3>
                            </div>
                            <div class="panel-body">
                                <div id="profile">
                                    <img id="profile-image" src="${pageContext.request.contextPath}/asset/img/profile.png">
                                </div>
                                <p id="username">황태형</p>
                                <p id="level">Lv.0</p>
                                <div id="info">
                                    <a>회원정보수정</a>
                                    <a>로그아웃</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //col-xs-4 -->

                </div>
            </div>
            <!--content-->

            
            
            
            <!-- footer -->
            <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
            
            <!-- modal창 -->
            <c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
                       
        </div> 
    </body>
    
    <script src="${pageContext.request.contextPath}/asset/js/more.js"></script>
    
</html>