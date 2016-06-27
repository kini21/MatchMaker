<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../include/header.jsp"></jsp:include>


	  <div class="content-wrapper">
        <div class="container">
        
          <div class="col-xs-12 col-sm-12">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">게시판 이름</h3>             
              </div>
              <!-- /.box-header -->
              
              <div class="box-body no-padding">
                <div class="mailbox-controls">
                  <!-- Check all button -->
                </div>
                <div class="table-responsive mailbox-messages">
                  <table class="table table-hover table-striped">
                    <thead>
                      <tr>
                        <th width="10%">글번호</th>
                        <th width="50%">제목</th>
                        <th width="10%">작성자</th>
                        <th width="10%">날짜</th>
                        <th width="10%">조회수</th>
                        <th width="10%">추천수</th>
                      </tr>
                    </thead>
                    
                    <tbody>

                    <tr>
                      <td>12345</td>
                      <td>1</td>
                      <td>1</td>
                      <td>3</td>
                      <td>3</td>
                      <td>5</td>
                    </tr>

                    <tr>
                      <td>12345</td>
                      <td>1</td>
                      <td>1</td>
                      <td>3</td>
                      <td>3</td>
                      <td>5</td>
                    </tr>
    
                    </tbody>
                  </table>
                  <!-- /.table -->
                </div>
                <!-- /.mail-box-messages -->
              </div>
              <!-- /.box-body -->
              
              <div class="box-footer no-padding">
                <div class="mailbox-controls">
					
					<div class="row">
						<div align="center">페이지 여기에</div>
					</div>
					
					<div class="row">
	                  <div class="col-sm-2 col-xs-3">
	                  	<button class="btn btn-primary btn-sm">글쓰기</button>
	                  </div>
	                  
					  <div class="col-sm-offset-6 col-sm-4 col-md-offset-7 col-md-3 col-xs-9">
						<div class="input-group input-group-sm">
	                		<input type="text" class="form-control">
	                    	<span class="input-group-btn">
	                      		<button type="button" class="btn btn-info btn-flat">검색</button>
	                    	</span>
	             		</div>
	              	  </div>
			      </div>
					
                </div>
              </div>
            </div>
  
          </div>
 		
 		  <div class="col-xs-12 col-sm-4">
           <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">최다 추천수</h3>
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding" style="display: block;">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
         </div>
        
          <div class="col-xs-12 col-sm-4">
           <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">최다 조회수</h3>
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding" style="display: block;">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
         </div>
        
         <div class="col-xs-12 col-sm-4">
           <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">최다 댓글수</h3>
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding" style="display: block;">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
                <li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
         </div>

        </div>
      </div>


<jsp:include page="../include/footer.jsp"></jsp:include>