<%@page import="com.yolo.model.Schedule_detailVO"%>
<%@page import="com.yolo.model.Bookmark_areaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yolo.model.Content_detailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		//캘린더 수정페이지 이동ㄹ
		$("#updateBtn").click(function() {
			$("#updateDetailForm").submit();
		});

	
		
		//캘린더로 돌아가기
		$("#cancelBtn").click(function() {
			history.back();
		});

		  $("#btn-scheDetailAdd").click(function(){
		      	$("#btnScheDetailAdd").submit();
		      });

		  $("#btn-scheDetailDel").click(function(){
			  
		      	$("#btnScheDetailAdd").attr("action","${pageContext.request.contextPath}/scheDetail/btnScheDetailDel");
		      	$("#btnScheDetailAdd").submit();
		      });
	});
</script>

<style>
<%@ include file="/css/scheduleView.css" %>
</style>


<div class="row">
	<div class="col-sm-11 col-sm-offset-1  form-group">
		<h2>일정 상세보기</h2>
	</div>
</div>
<!--row End -->



<div class="row">
		<div class="col-sm-4 col-sm-offset-8 form-group ">
	  		<form id="btnScheDetailAdd" method="post" action="${pageContext.request.contextPath}/scheDetail/btnScheDetailAdd" >
		  		<button type="button" id="btn-scheDetailAdd" class="btn btn-info">
					일정추가
		  		</button>
		  		<button type="button" id="btn-scheDetailDel" class="btn btn-info">
					일정삭제
		  		</button>
		  		<input type="hidden" value="${detail_seq}" name="delDetailSeq">
	  		</form>
  		</div>

	<div class="form-group">
		<div class="btn-center top-marginSize20">
			<c:forEach items="${shceDetailList }" var="item" step="1">
				<button type="button" class="btn btn-fresh">
					<a
						href="${pageContext.request.contextPath}/scheDetail/scheDetailPage?detail_seq=${item.detail_seq }">${item.detail_step}
						일차 보기</a>
				</button>
			</c:forEach>
		</div>
	</div>
</div>
<!-- row End -->

<div class="wrapper">
	<div class="row">
		<div class="col-sm-12 form-group bordar-line">
			<div class="row bs-wizard" style="border-bottom: 0;">
				<%if(request.getAttribute("contentList")!=null){
					List<Content_detailVO> contentList= (List<Content_detailVO>)request.getAttribute("contentList");
				for(Content_detailVO vo :contentList){
					if(vo.getContent_title().equals("1")){
						%>
						<div class="col-xs-4 bs-wizard-step complete">
							<div class="text-center bs-wizard-stepnum"><%=vo.getContent_content() %></div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#" class="bs-wizard-dot"></a>
						</div>
					<%
					}
				}
					%>
						
						
									</div>
								</div>
							</div>
							<!-- row End -->
						</div>
						<!-- wrapper End -->
						
						
						
						
						
					
					
					<%
					for(Content_detailVO vo :contentList){
						if(vo.getContent_title().equals("2")){
					if(vo.getContent_title().equals("2")){
						if(vo.getContent_shape().equals("01")){
							%>
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="form-group">
										<div>
											<div class="col-sm-1">
												<img src="${pageContext.request.contextPath}/upload/map.png">
											</div>
											<div class="col-sm-7">
												<h3><%=vo.getContent_content() %></h3>
											</div>
										</div>
									</div>
									<!-- form-group End -->
								</div>
								<!--row End-->
							<%
						}//end 01
						else if(vo.getContent_shape().equals("02")){
							%>
							<div class="row">&nbsp;</div>
							<div class="row">
								<div class="form-group">
									<div>
										<div class="col-sm-1">
											<img src="${pageContext.request.contextPath}/upload/list.png">
										</div>
										<div class="col-sm-7">
											<h3><%=vo.getContent_content() %></h3>
										</div>
									</div>
								</div>
								<!-- form-group End -->
							</div>
							<!--row End-->
							
							
							<%
						}
						else if(vo.getContent_shape().equals("03")){
							if(request.getAttribute("bookmarkList")!=null){
								List<Bookmark_areaVO> bookmarkList =(List<Bookmark_areaVO>)request.getAttribute("bookmarkList");
								
								for(Bookmark_areaVO bookVO :bookmarkList){
									if(bookVO.getContentid().equals(vo.getContent_content())){
										%>
										
										<div class="row">&nbsp;</div>
							<div class="row">
								<div class="form-group">
									<div>
										<div class="col-sm-1">
											<img src="${pageContext.request.contextPath}/upload/bookmark.png">
										</div>
										<div class="col-sm-7">
											<div class="col-md-4">
										      <div class="thumbnail">
										        <a href="/w3images/lights.jpg" target="_blank">
										          <img src="<%=bookVO.getFirstimage2() %>" width="150px;" height="150px;" alt="Lights" style="width:100%">
										          <div class="caption">
										            <p><a href="/yoloCoaster/basicInfo/basicInfo?contentid=<%=bookVO.getContentid()%>">
										        	<%=bookVO.getTitle() %></a></p>
										          </div>
										        </a>
										      </div>
										    </div>
										</div>
									</div>
								</div>
								<!-- form-group End -->
							</div>
							<!--row End-->
										
										
										<%
										
									}
								}
								
							}
							////////////여기서 부터라네
							
							
							%>
							
							
							
							<%
						}
					}
				}
				%>


				
				
				<%}
				}//first if
					%>
					
					


<%if(request.getAttribute("contentList")!=null){ 
List<Content_detailVO> contList = (List<Content_detailVO>) request.getAttribute("contentList");
int res =0;
	for (int i = 0; i < contList.size(); i++) {
		if (contList.get(i).getContent_shape().equals("04")) {
			res = 1;
	
		}
	}
	if(res!=0){
%>
<div class="row">&nbsp;</div>
	<div class="col-sm-1">
		<img src="${pageContext.request.contextPath}/upload/photo.png">
	</div>
<div class="row">&nbsp;</div>
<div class="row">

	<div id="myCarousel" class="carousel slide col-sm-offset3 col-sm-6" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<%
				
				List<Content_detailVO> photoList = new ArrayList();
				for (int i = 0; i < contList.size(); i++) {
					if (contList.get(i).getContent_shape().equals("04")) {
						photoList.add(contList.get(i));
					}
				}
			%>

			<%
				for (int i = 0; i < photoList.size(); i++) {
					String phtoStr = photoList.get(i).getContent_content();
					if (i == 0) {
			%>
			<li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
			<%
				} else {
			%>
			<li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
			<%
				}
				}
			%>


		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">



			<%
				for (int i = 0; i < photoList.size(); i++) {
					String phtoStr = photoList.get(i).getContent_content();
					if (i == 0) {
			%>
			<div class="item active">
				<img
					src="${pageContext.request.contextPath}/upload/imageFolder/<%=phtoStr %>"
					style="width: 100%; height: 300px;">
			</div>
			<%
				} else {
			%>
			<div class="item">
				<img
					src="${pageContext.request.contextPath}/upload/imageFolder/<%=phtoStr %>"
					style="width: 100%; height: 300px;">
			</div>
			<%
				}
				}
			%>


		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
<%
			}
		}
	
%>
</div>





<div class="row">
	<div class="form-group line-heightSize">
		<form id="updateDetailForm"
			action="${pageContext.request.contextPath}/scheDetail/insertSche"
			method="get">
			<input type="hidden" id="detail_seq" name="detail_seq" value="${detail_seq}">
			<div class="col-sm-2 col-sm-offset-5">
					<%if(request.getAttribute("shceDetailList")!=null){
						List<Schedule_detailVO> shceDetailList= (List<Schedule_detailVO>)request.getAttribute("shceDetailList");
					if(request.getAttribute("contentList")!=null){
					%>
					<%}else if(shceDetailList.size()>0){
						
					%>
						<button type="button" id="updateBtn" class="btn btn-success form-control">작성하기</button>
					
					
						
					<%}else{} }%>
			</div>
		</form>

	</div>
</div>

<!-- row End -->


