<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOYAMOGA</title>
    
	<!-- include favicon -->
    <%@include file="/WEB-INF/views/common/favicon.jsp" %>

    <link rel="stylesheet" href="/resources/css/help/notice.css">

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,100,1,-25" />

    <script src="https://kit.fontawesome.com/1fe7ba446e.js" crossorigin="anonymous"></script>

    <!-- slick: cdn 방식으로 css, js 가져오기 -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>			
	<style>
		#search {
		    position: absolute;
		    display: inline-block;
		    width: 87px;
			height: 32px;
		    padding-top: 3.2px;
		    line-height: 20px;
		    border: 2px solid #5d5d5d;
		    background: #5d5d5d;
		    text-align: center;
		    font-size: 16px;
		    font-weight: 500;
		    color: #fff;
		    text-decoration: none;
		}
	</style> 
</head>
<body>
	<!-- header -->
	<%@include file= "/WEB-INF/views/common/header.jsp" %>
	
    <main>
        <div class="help_wrap">


            <!-- 상단 고객센터, 검색창 -->
            <div class="help_top">
                <div class="help_center">
                    <p class="help_center_text">고객센터</p>
                </div>
                <div class="help_search">
                    <ul class="help_search_ul">
                        <p>공지사항 검색</p>
                        <div class="help_search_input_a">
                        <form action="/help/search2" id="searchForm" method="get">
                            <input type="text" id="keyword" name="keyword" placeholder="자주 찾는 질문을 검색해 보세요! ">
                            <button id="search" style="color: #fff;">검색</button>
                        </form>
                        </div>
                    </ul>
                </div>
            </div>

            <!-- 중간 - notice 사이드 메뉴/ 게시물 -->
            <div class="help_content_wrap">

                <!-- 중간 - notice 사이드 메뉴 -->
                <div class="help_side_menu">
                    <ul class="sm_ul">
                        <li id="sm_li"><a href="/help/faq">FAQ</a></li>
                        <li id="sm_li"><a href="/help/notice">공지사항</a></li>
                        <li id="sm_li"><a href="/help/guide">이용안내</a></li>
                        <%-- 로그인이 되어 있는 경우 --%>
						<c:if test="${not empty sessionScope.member}">
							<li id="sm_li"><a href="/help/question">1:1문의</a></li>
						</c:if>

						<%-- 로그인이 되어 있지 않은 경우 --%>
						<c:if test="${empty sessionScope.member}">
							<li id="sm_li"><a href="/login/main">1:1문의</a></li>
						</c:if>
                    </ul>

                </div>
                

                <!-- 중간 - 게시물 -->
                <div class="content_wrap">
                        <h2>공지사항 <span class="test">새로운 소식들을 확인하세요</span></h2>
                        <br>
                        <br>
                        <h2><span style="color:#11BC0D;">${__PAGE_MAKER__.cri.keyword}</span> 검색 결과　총 <strong style="color:#11BC0D;">${__PAGE_MAKER__.totalAmount}</strong>개</h2>
                        <br>
                        <div class="content_list">
			            <table>
			                 <thead>
			                    <tr>
			                        <th>번호</th>
			                        <th>제목</th>
			                        <th>작성날짜</th>
			                    </tr>
			                </thead>
			                <tbody>
			                    <c:forEach items="${searchList2}" var="NoticeDTO">
			                        <tr>
			                            <td>${NoticeDTO.no}</td>
			                            <td><a href="/help/get?no=${NoticeDTO.no}">${NoticeDTO.title}</a></td>
			                            <td>${NoticeDTO.reg_date}</td>
			                        </tr>       
			                    </c:forEach>    
			                </tbody>
			            </table>
			            
						<div class="pageInfo_wrap" >
						  <form id=moveForm method="get">
						    <div class="pageInfo_area">
						    	<ul id="pageInfo" class="pageInfo">
									<c:if test="${__PAGE_MAKER__.prev}">
										<li class="searchprev"><a href="${__PAGE_MAKER__.startPage-1}">prev</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${__PAGE_MAKER__.startPage}" end="${__PAGE_MAKER__.endPage}">
							        	<li class="searchbutton"><a href="/help/search2?keyword=${__PAGE_MAKER__.cri.keyword}&currPage=${num}&amount=${__PAGE_MAKER__.cri.amount}">${num}</a></li>
							        </c:forEach>
							        
							        <c:if test="${__PAGE_MAKER__.next}">
										<li class="searchnext"><a href="${__PAGE_MAKER__.endPage + 1 }">next</a></li>
									</c:if>
								</ul>
					            
			            	</div>
			            	</form>
				    	</div>
        
            	</div>
        </div>
        </div>
        </div>
    </main>
    <!-- ==========================footer========================= -->
   <%@include file= "/WEB-INF/views/common/footer.jsp" %>
</body>
</html>