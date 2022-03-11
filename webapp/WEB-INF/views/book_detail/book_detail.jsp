<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="ko">
    
    <head>
        <meta charset="UTF-8">
        <!-- 메타데이터 -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>책 상세페이지</title>

        <script src="${pageContext.request.contextPath}/asset/js/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/bootstrap/css/bootstrap.css">
        <script src="${pageContext.request.contextPath}/asset/bootstrap/js/bootstrap.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/source.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/all_css.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/book_detail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/modal.css">

        <!-- kakao sdk 호출 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    </head>

    <body>
        
        <div id="wrap">
            
			<!-- 헤더 -->
            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>

            <div id="contents" class="clearfix">
                <div id="bookVo">
                    <img id="book_img" src="${requestScope.bookMap.bookVo.coverUrl}" alt="..." class="img-thumbnail">
                    <div id="book_detail">
                        <h1>${requestScope.bookMap.bookVo.bookTitle}</h1>
                        <h3>저자 ${requestScope.bookMap.bookVo.author}</h3>
                        <div id="book_review">
                            <span class="review_count">서평 수</span><span class="review_num">${requestScope.bookMap.bookReviewCount}+</span>
                        </div>
                        <div id="btn_review">
                            <button type="button" class="btn blue-2 font-color-w " onclick="window.open('${requestScope.bookMap.bookVo.bookUrl}')">알라딘 북스</button>
                            <button type="button" class="btn btn-default">관심가는 책+</button>
                            <!-- 관심가는책 빼기
                            <button type="button" class="btn btn-default">관심가는 책-</button> -->
                        </div>
                    </div>
                    <button id="btn_write" type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/reviewWrite';">이 책 서평 쓰기</button>
                </div>
            </div>

            <div class="reviewVo" class="clearfix">
                <div id="list" class="clearfix">
                    <ul>
                        <li><a class="latest-order"><span>최신순</span></a></li>
                        <li><a class="best-order"><span>인기순</span></a></li>
                    </ul>
                </div>

				<c:forEach items="${requestScope.bookMap.reviewList}" var="reviewVo">
                <!-- 서평 리스트 vo-->
                <div class="jumbotron">
                    <div id="review_first">
                        <h3>${reviewVo.bookTitle}</h3>

                        <!-- 자기글에만 수정 삭제 노출 -->
                        <a href="" class="review_modify">삭제</a>
                        <a href="" class="review_modify">수정</a>

                        <a href="${pageContext.request.contextPath}/${reviewVo.nickName}" class="review_nick">${reviewVo.nickName}<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>

                        <div class="multiline-ellipsis">${reviewVo.reviewContent}</div>
                    </div>

                    <div id="review_second">
                        <!-- 좋아요 활성화 -->
                        <span id="btn_like" class="glyphicon glyphicon-heart icon-success" aria-hidden="true"></span>
                        <!-- 좋아요 활성화 -->

                        <!-- 좋아요 비활성화
                        <span id="btn_like" class="glyphicon glyphicon-heart-empty icon-success" aria-hidden="true"></span> -->

                        <span class="review_like">16.2k</span><span class="review_like">${reviewVo.reviewDate}</span>
                        <span id="tag_btn">#${reviewVo.emoName}</span>
                        <!-- 더보기 클릭시 모달창 오픈 -->
                        <!-- <button type="button" class="btn btn-default btn-sm">+더보기</button> -->
                        
                        <div class="dropup float-r">
                            <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                + 더보기
                                <!-- <span class="caret"></span> -->
                            </a>
                            <ul class="dropdown-menu radius-15" role="menu" aria-labelledby="dropdownMenu2">
                                <li role="presentation"><a id="add_pli" role="menuitem" tabindex="-1">플레이리스트에 추가<span id="plus">+</span></a></li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation"><a id="shr_review" role="menuitem" tabindex="-1">서평 공유하기<span class="glyphicon glyphicon-share" aria-hidden="true"></span></a></li>
                                <li role="presentation" class="divider"></li>
                                <li role="presentation"><li role="presentation"><a id="save_img" role="menuitem" target="_blank" tabindex="-1" href="${pageContext.request.contextPath}/imgpreview">이미지 저장하기<span class="glyphicon glyphicon-save" aria-hidden="true"></span></a></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <!-- 서평 리스트 vo-->
				</c:forEach>
               
            </div>

            <!-- 모달창 -->
            <div id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">공유하기</h4>
                        </div>
                        <div class="modal-body">
                            <p>playbook의 서평을 SNS에 공유해 보세요 :)</p>
                            <a id="kakao-link-btn" href="javascript:kakaoShare()">
                                <img src="${pageContext.request.contextPath}/asset/img/share/kakao.jpg" />
                            </a>
                            <a id="facebook-link-btn" href="">
                                <img src="${pageContext.request.contextPath}/asset/img/share/facebook.jpg" />
                            </a>
                            <a id="twitter-link-btn" href="">
                                <img src="${pageContext.request.contextPath}/asset/img/share/twitter.png" />
                            </a>
                            <a id="kakaostory-link-btn" href="">
                                <img src="${pageContext.request.contextPath}/asset/img/share/kakaostory.png" />
                            </a>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- Modal -->

            <!-- 페이지네이션 -->
            <nav class="pageWrap">
                <ul class="pagination">
                  <li>
                    <a href="" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="active"><a href="">1 <span class="sr-only">(current)</span></a></li>
                  <li><a href="">2</a></li>
                  <li><a href="">3</a></li>
                  <li><a href="">4</a></li>
                  <li><a href="">5</a></li>
                  <li>
                    <a href="" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
            </nav>

            <!-- footer -->
            <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
            
            <!-- modal창 -->
            <c:import url="/WEB-INF/views/include/modal.jsp"></c:import>
            
        </div>
         
    </body>

    <script src="${pageContext.request.contextPath}/asset/js/more.js"></script>

</html>