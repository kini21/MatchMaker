<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#datepicker {
	/* background-color: #dd4b39 !important;
	border: 0px;
	width: 70px; */
}
</style>



<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
	
		<li class="active"><a href="#tab_1" data-toggle="tab">검색</a></li>
		<li><a href="#tab_2" data-toggle="tab">방목록</a></li>
		<li><a href="#tab_3" data-toggle="tab">대화방</a></li>
		
		<li class="pull-right">
			<i type="button" class="close" style="margin-top:8px;margin-right:8px" onclick="closeSbar()">&times;</i>
		</li>
	</ul>
	<div class="tab-content">
		
		<div class="tab-pane" id="tab_4">
		  <div class="box">
            <div class="box-header">
              <h3 id="mname" class="box-title"></h3> <small id="state" class="label bg-green"></small>
              <div>
              	<span id="begintime"></span> ~ <span id="endtime"></span> 
              	<a class="pull-right">
              		<button type="button" class="back btn btn-default btn-xs"><i class="fa fa-reply"></i> 뒤로 </button>
              	</a>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-condensed" >
                <thead>
                  <tr>
                    <th width="20%">홈</th>
                    <th width="20%">역활</th>
                    <th width="20%">상태</th>
                    <th width="20%">농구점수</th>
                    <th width="20%">신뢰점수</th>
                  </tr>
                </thead>
                <tbody id="home">
                </tbody>
              </table>
              <br>
              <table class="table table-condensed" >
                <thead>
                  <tr>
                    <th width="20%">어웨이</th>
                    <th width="20%"></th>
                    <th width="20%"></th>
                    <th width="20%"></th>
                    <th width="20%"></th>
                  </tr>
                </thead>
                <tbody id="away">
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
		</div>

		<div class="tab-pane" id="tab_0">
			<!-- Box Comment -->
			<div class="box-widget">
				<div class="box-header with-border">
					<div class="user-block">
						<img class="img-circle" src="/resources/img/court-icon.jpg"	alt="court Image"> 
						<span id="cname" class="username"></span>
						<span id="cno" class="pull-right badge bg-green"></span>
						<span id="address" class="description"></span>
					</div>
					<!-- /.user-block -->
				</div>
				<!-- /.box-header -->
				<div class="box-body">

					<!-- <img alt="코트 사진" width="200" height="200"></img> -->
					<div class="pull-right"><button type="button" class="back btn btn-default btn-xs"><i class="fa fa-reply"></i> 뒤로 </button></div>
					<p><b>코트 상세</b></p>
					<p id="ccontent"></p>
					<!-- Social sharing buttons -->
					<button type="button" id="likeCourt" class="btn btn-default btn-xs">
						<i class="fa fa-thumbs-o-up"></i> Like
					</button>
					<span class="pull-right text-muted">Likes <span id="liked"></span> - Comments <span id="replycnt"></span></span>
					
				</div>
				<!-- /.box-body -->

				<div class="box-footer box-comments">
					<!-- 댓글들이 들어가는 공간 -->
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!-- /.tab-pane -->
		
		
		<div class="tab-pane active" id="tab_1">
			<div id="search-header" class="row" style="padding-left:15px;padding-right:15px">
				<div style="padding-bottom:5px">
			      <select id="court-search" class="form-control">
			        <option value="C" selected="selected">코트</option>
			        <option value="G">게임</option>
			      </select>
			    </div>
			    
			   	<button id="getAll">전체 검색</button>
			   	
			   	<button id="detail">상세 검색</button>
			   	
			   	<button id="date-search">날짜 검색</button>
			   	
			   	<div id="date-space" hidden>
					<p>예약기간: <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2"></p>
			   	</div>
			   	
			   	<div id="detail-space" hidden>
			   		<form id="radio-free">
			   			<input name="free" type="radio" value="Y"> 무료
			   			<input name="free" type="radio" value="N"> 유료
			   		</form>
			   		<form id="radio-full">
			   			<input name="full" type="radio"  value="Y"> 풀코트
			   			<input name="full" type="radio"  value="N"> 하프코트
			   		</form>
			   		<form id="radio-park">
			   			<input name="parking" type="radio" value="Y"> 주차가능
			   			<input name="parking" type="radio" value="N"> 주차불가
			   		</form> 
			   		<form id="radio-shower">
			   			<input name="shower" type="radio" value="Y"> 샤워가능 
			   			<input name="shower" type="radio" value="N"> 샤워불가
			   		</form>
			   		<form id="radio-outer">
			   			<input name="outer" type="radio" value="Y"> 야외
			   			<input name="outer" type="radio" value="N"> 실내
			   		</form>
			   		<form id="radio-ground">
			   			<input name="ground" type="radio" value="D"> 흙
			   			<input name="ground" type="radio" value="U"> 우레탄
			   			<input name="ground" type="radio" value="A"> 아스팔트
			   			<input name="ground" type="radio" value="R"> 고무
			   		</form>
			   	</div>
			    
			    <div style="padding-bottom:5px">
			      <select id="distance" class="form-control">
			        <option value="1000" selected="selected">1km</option>
			        <option value="2000">2km</option>
			        <option value="3000">3km</option>
			        <option value="input">직접 입력</option>
			      </select>
			      <input type="hidden" id="dis-input" placeholder="단위: km">
			    </div>
			    
			    <div style="padding-bottom:5px">  
			      <div class="input-group input-group-sm">
			        <input id="keyword" type="text" class="form-control" style="height:34px" placeholder="'내위치'를 검색해보세요.">
			        <span class="input-group-btn">
			          <button id="searchMap" type="button" class="btn btn-info btn-flat" style="height:34px" onclick="searchPlaces()">검색</button>
			        </span>
			      </div>
			    </div>
			</div>
			
			<div id="search-body">
				<!-- 코트 목록이 들어가는 공간 -->
			</div>
			
			<div class="box-footer" style="padding:0px">
				<button id="moreCourts" type="button" class="btn btn-default btn-block btn-sm" style="display:none">더 보기</button>
			</div>
		</div>
		
		
		<div class="tab-pane" id="tab_2">
			
			<!-- 방 목록 시작 -->
			<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title">생성된 방 목록</h3>
					<button id="getRooms" type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
					<div class="pull-right">
						<button data-target="#createRoom" data-toggle="modal" type="button" class="btn btn-warning btn-flat">만들기</button>
					</div>
				</div>
				<!-- /.box-header -->
				
				<!-- 방 생성 공간 -->
				<div id="roomSpace" class="box-body" style="overflow-y:auto;min-height:220px">
				</div>
				<!-- 방 생성 공간 끝 -->
				
				<div class="box-footer" style="border-top:0px">
					<div>
						<select id="detail-room">
							<option value="rname" selected="selected">방 이름</option>
							<option value="ruser">접속 회원</option>
							<option value="cno">코트 번호</option>
							<option value="usercnt">게임 종류</option>
							<option value="time">기간</option>										
						</select>
						<div>기간: <input type="text" id="datepicker3"> ~ <input type="text" id="datepicker4"></div>
					</div>
					<div class="input-group">
						<div class="input-group-btn">
							<button id="search-room" type="button" class="btn btn-danger">검색</button>
						</div>
						<!-- /btn-group -->
						<input id="room-keyword" type="text" class="form-control">
					</div>
				</div>
			</div>
			<!-- 방 목록 끝 -->
		</div>
		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_3">
			<!-- 채팅 공간 -->
			<div class="box box-danger direct-chat direct-chat-danger">
				<div class="box-header with-border">
					<h3 id="room-name" class="box-title">대기실</h3>
					
					<div class="box-tools pull-right">
						<!-- 접속한 인원 목록 버튼 -->
						<button type="button" class="btn btn-box-tool"
							data-toggle="tooltip" title="회원" data-widget="chat-pane-toggle">
							<i class="fa fa-comments"></i>
						</button>
						<span id="reser-btn-group" style="display:none">
							<button id="reserve" class="btn btn-primary btn-flat btn-xs">예약</button>
						</span>						
						<span id="exit-btn-group" style="display:none">
							<button id=teamChange class="btn btn-success btn-flat btn-xs">팀 변경</button>
							<button id="exit" class="btn btn-warning btn-flat btn-xs">나가기</button>
						</span>
					</div>
				</div>
				<!-- /.box-header -->
			
				<div id="msgbox" class="box-body" style="overflow-y:hidden">

					<!-- 대화가 생성되는 곳 -->
					<div class="direct-chat-messages" style="min-height:220px"></div>
					<!-- /대화가 생성되는 곳 -->

					<!-- 접속한 인원들 -->
					<div class="direct-chat-contacts">
					  	<div id="waitUserlist"></div>
						<div id="roomUserlist">
							<div>
								<span><b>Home</b></span>
								<div class="home">
								</div>
							</div>							
							<div>
								<span><b>Away</b></span>
								<div class="away">
								</div>
							</div>
						</div>
					</div>
					<!-- /접속한 인원들 -->

				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<div class="input-group">

						<!-- 메시지 입력 공간 -->
						<input type="text" id="message" placeholder="메시지를 입력해주세요."
							class="form-control">

						<!-- 전송 버튼 -->
						<span class="input-group-btn"> <a id="send"
							class="btn btn-danger btn-flat">전송</a>
						</span>

					</div>
				</div>
				<!-- /.box-footer-->
			</div>
			<!-- 채팅 공간 끝 -->
		</div>
		<!-- /.tab-pane -->
	</div>
	<!-- /.tab-content -->
</div>