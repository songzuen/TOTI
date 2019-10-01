<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE HTML>
<!--
	Transitive by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>WELCOME</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
		.tumbnail123{
		width : 300px;
		height :400px;
		}
		 #footlist>ul{
                list-style: none;
                
            }
        	#footlist>ul>li {
                height: 35px;
                line-height: 35px;
                float: left;
                padding-left:35px;
                color: white;
                
            }
		</style>
	</head>
	
	
	
	<body>
		<!-- 해더 시작 -->
	<%@ include file="/views/frame/header.jsp" %>
		<!-- 해더 끝 -->

			
		<!-- 네비게이션 시작 -->
	<%@ include file="/views/frame/nav.jsp" %>
		<!-- 네비게이션 끝 -->


		<!-- Banner -->
		<!--
			To use a video as your background, set data-video to the name of your video without
			its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
			formats to work correctly.
		-->
			<section id="banner" data-video="images/banner">
				<div class="inner">
					<h1>What is the culture Fork?</h1>
					<p>Autumn is a second spring when every leaf is a flower.<br/>
					A good  <a href="https://templated.co/">reputation is more</a>valuable than money <a href="https://templated.co/license">eaf is a flower</a>.</p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
				<video autoplay="" loop=""><source src="images/banner.mp4" type="video/mp4"><source src="images/banner.webm" type="video/webm"></video>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="images/pic01.jpg" alt="" />
							</div>
							
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<div id="flexgrid">
						<div>
							<header>
								<h3>공연 / 전시 소개</h3>
							</header>
							<p>공연 / 전시를 검색하고<br>
							다양한 문화 생활을 만나보세요</p>
							<ul class="actions">
								<li><a href="mainList.jsp"><img src="http://www.culture.go.kr/upload/rdf/19/04/show_2019041217372494371.jpg" class="thumbnail123"></a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3>이벤트</h3>
							</header>
							<p>각 지역의 특색있는 문화와 <br>
							새로운 이벤트를 만나보세요</p>
							<ul class="actions">
								<li><a href="http://ec2-13-209-47-124.ap-northeast-2.compute.amazonaws.com:8080/EvClient/eventPage.jsp"><img src="http://www.culture.go.kr/upload/rdf/17/08/show_201708221065083055.JPG" class="thumbnail123"></a></li>
							</ul>
						</div>
						<div>
							<header>
								<h3>후기를 위한공간</h3>
							</header>
							<p>다양한 평가를 확인하시고 <br>
								소중한 후기를 등록해주세요</p>
							<ul class="actions">
								<li><a href="#"><img src="http://www.culture.go.kr/upload/rdf/18/09/show_2018091314182269001.jpg" class="thumbnail123"></a></li>
							</ul>
						</div>
					</div>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">

						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic02.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2>문화 포크란?</h2>
										<p>고객의 시선에서 효율적인 선택을 도와드립니다.</p>
									</header>
									<hr />
									<p> 문화포털은 대한민국 문화체육관광부와 소속기관 및 공공기관에서 생산되는 다양한 한국의 문화예술, 문화유산, 문화산업, 관광, 체육,도서정보 등을 제공하여 한국의 문화를 보다 풍족하고 편리하게 이용할 수 있도록 지원하는 통합문화정보사이트 입니다. 문화체험(공연, 전시, 행사 등), 문화공감(문화이슈, 문화영상 등), 문화지식(문화공간, 한국문화 100 등), 소식(정책, 채용정보 등), 산업활용(한국의 문양, 3D 콘텐츠) 등을 주요 메뉴로 서비스하고 있습니다. 문화포털은 앞으로도 한국의 공공문화정보는 물론 민간의 문화정보연계를 점차 확대하고, 양질의 문화예술 콘텐츠를 제공하여 사용자 중심의 서비스를 구현해 나가겠습니다.</p>
								</div>
							</div>
						</div>

						<div>
							<div class="box">
								<div class="image fit">
									<img src="images/pic03.jpg" alt="" />
								</div>
								<div class="content">
									<header class="align-center">
										<h2>문화 포크 주요서비스</h2>
										<p>문화 검색 /추천 /공유 등 다양한 서비스를 제공합니다.</p>
									</header>
									<hr />
									<p> 문화 정보 검색서비스 : 한 문화 정보와 소식, 각종 자료를 분야별로 편리하게 찾아볼 수 있도록 서비스<br>
										문화혜택 서비스 : 문화가 있는 날에 참여한 전국의 문화시설과 혜택 정보를 제공 초대 · 할인 이벤트 문화예술단체의 활성화를 위한 티켓 할인이벤트와 초대 이벤트를 제공 문화릴레이티켓 국공립 예술단체의 '이전 관람 티켓'을 소지하면 공연 예매 시 동반 1인까지 할인 혜택을 주는 티켓할인협력 서비스로 문화포털에서 확인 가능<br>
										문화 정보 공유 서비스 : 공 및 민간 문화시설, 단체의 문화 정보는 문화포털에 직접 등록 및 공유 가능
									</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper style3">
				<div class="inner">

					<header class="align-center">
						<h4>고객센터 : 010-XXXX-XXXX / 02-XXX-XXXX<br>
							오시는길 : 서울시 마포구 합정동 구공탄곱창 건물 11호<br>
							제작지원 : xxx xxx 소종원  유동준  김다애  김희수<br>
						</h4><br>
					
					<div id="footlist">
					<ul>
                    <li>회사소개</li>
                    <li>인재채용</li>
                    <li>제휴제안</li>
                    <li>이용약관</li>
                    <li>개인정보처리방침</li>
                    <li>청소년보호정책</li>
                    <li>회사소개</li>
                    <li>인재채용</li>
                    <li>이용약관</li>
                    <li>(주)비트캠프</li>
                    </ul>
 					</div>
					</header>

				</div>
			</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>