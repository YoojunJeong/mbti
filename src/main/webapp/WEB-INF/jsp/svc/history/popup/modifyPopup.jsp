<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<common:head>
	<meta charset="UTF-8">
	<title>이용 내역 수정</title>
	<style type="text/css">
		* { margin:0; padding:0; box-sizing: border-box; }
		*:after { content: ""; display: block; clear: both; }


		body { background-color: #fff ! important; }

		.container { width: 600px; padding: 30px; }
		
		#ADD_FORM { width: 100%; height: 100%; }
		
		.input_container { width: 100%; height: 100%; margin-top: 10px; }
		.input_container:first-child { margin-top: 0; }

		.input_container label { float: left; }
		.input_container input , .select { float:right; width: 400px; height: 30px; padding: 5px; }

		.btn_container { float: right; }
		.btn_container button { width: 80px; height: 30px; border: 0; background-color: #fff; border: 1px solid #000; cursor: pointer; transition: .3s; }
		.btn_container button:hover { background-color: #000; color:#fff; }

		.input_container2 { width: 100%; }
		#SEARCH_FORM { width: 80%; margin:auto; margin-bottom: 20px; }

		.search_input { width: 350px; height: 30px; padding: 5px; }
		.m_button { width: 70px; height: 30px; border:0; background-color: #3498db; float: right; color:#fff; transition: .3s; font-size: 14px ! important; }

		.m_button:hover { background-color: #1565C0; }

		input[name=use_date] { width: 85%; float:left; }
		.m_right  { float:right; width: 74%; }

		.input-group-addon { height: 30px; }
	</style>
</common:head>
<body>
	<div class="container">
		<form id="SEARCH_FORM" action="#" method="post">
			<div class="input_container2">
				<input type="text" class="search_input search" name="search_txt" placeholder="이름, 사번, 전화번호">
				<button type="submit" class="m_button search">검색</button>
			</div>
		</form>
		<form id="ADD_FORM" action="#" method="post">
			<input class="input" type="hidden" name="cor_idx" value="">
			<input class="input" type="hidden" name="sub_cor_idx" value="">
			<div class="input_container">
				<label>고객명:</label>
				<input class="input" type="text" name="cust_name" readonly>
			</div>
			<div class="input_container">
				<label>사번:</label>
				<input class="input" type="text" name="cust_no" readonly>
			</div>
			<div class="input_container">
				<label>고객전화번호:</label>
				<input class="input" type="text" name="phone_number" readonly>
			</div>
			<div class="input_container">
				<label>서비스구분:</label>
				<select class="select input" type="text" name="type">
					<option value="0">법인대리</option>
					<option value="1">모범택시</option>
					<option value="2">퀵서비스</option>
				</select>
			</div>
			<div class="input_container date">
				<label>*접수일:</label>
				<div class="m_right">
					<input class="input" type="text" name="use_date">
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
			<div class="input_container t">
				<label>*접수시간(hh:mm:ss):</label>
				<input class="input" type="text" name="use_time" placeholder="hh:mm:ss">
			</div>
			<div class="input_container">
				<label>*출발지 :</label>
				<input class="input" type="text" name="start_addr">
			</div>
			<div class="input_container">
				<label>경유지:</label>
				<input class="input" type="text" name="route_addr">
			</div>
			<div class="input_container">
				<label>대기시간:</label>
				<input class="input" type="text" name="waiting_time">
			</div>
			<div class="input_container">
				<label>*도착지:</label>
				<input class="input" type="text" name="finish_addr">
			</div>
			<div class="input_container">
				<label>*기본료:</label>
				<input class="input" type="text" name="cost" required>
			</div>
			<div class="input_container">
				<label>추가료:</label>
				<input class="input" type="text" name="add_cost">
			</div>
			<div class="input_container">
				<label>콜수수료:</label>
				<input class="input" type="text" name="add_tax">
			</div>
			<div class="input_container">
				<label>기사ID:</label>
				<input class="input" type="text" name="driver_id">
			</div>
			<div class="input_container">
				<label>기사성명:</label>
				<input class="input" type="text" name="driver_name">
			</div>
			<div class="input_container">
				<label>비고:</label>
				<input class="input" type="text" name="memo">
			</div>
			
			<div class="input_container">
				<div class="btn_container">
					<button class="input" id="CANCLE" type="button">취소</button>
					<button type="submit">저장</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		var login_id = '<%=request.getParameter("login_id")%>';
		var upload_idx = '<%=request.getParameter("upload_idx")%>';
		var cor_idx = '<%=request.getParameter("cor_idx")%>';

		function loadPreData() {
			$.ajax({
			    url: '//${cms_api_domain}/1.0/svc/history/upload_result',
			    type: 'post',
			    dataType: 'json',
			    async: false,
			    contentType: 'application/json',
			    beforeSend: function(jqXHR, setting) {
			            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
			    },
			    data:JSON.stringify({upload_idx: upload_idx}),
			    success: function(data) {
			    	console.log(data);

			    	if(data.body.req_id != 0) { alert("수정할 수 없는 데이터입니다."); window.close(); }
			    	$('input[name=cust_name]').val(typeof data.body.cust_name == "undefined" ? "" : data.body.cust_name);
			    	$('input[name=cust_no]').val(typeof data.body.cust_no == "undefined" ? "" : data.body.cust_no);
			    	$('input[name=phone_number]').val(typeof data.body.phone_number == "undefined" ? "" : data.body.phone_number);
			    	
			    	if(typeof data.body.type != "undefined") {
			    		$('option[value="'+data.body.type+'"]').attr("selected", "selected");
			    	}

			    	$('input[name=use_date]').val(typeof data.body.use_date == "undefined" ? "" : data.body.use_date);
			    	$('input[name=use_time]').val(typeof data.body.use_time == "undefined" ? "" : data.body.use_time);
			    	$('input[name=start_addr]').val(typeof data.body.start_addr == "undefined" ? "" : data.body.start_addr);
			    	$('input[name=route_addr]').val(typeof data.body.route_addr == "undefined" ? "" : data.body.route_addr);
			    	$('input[name=waiting_time]').val(typeof data.body.waiting_time == "undefined" ? "" : data.body.waiting_time);
			    	$('input[name=finish_addr]').val(typeof data.body.finish_addr == "undefined" ? "" : data.body.finish_addr);
			    	$('input[name=cost]').val(typeof data.body.cost == "undefined" ? "" : data.body.cost.toLocaleString());
			    	$('input[name=add_cost]').val(typeof data.body.add_cost == "undefined" ? "" : data.body.add_cost.toLocaleString());
			    	$('input[name=add_tax]').val(typeof data.body.add_tax == "undefined" ? "" : data.body.add_tax.toLocaleString());
			    	$('input[name=driver_id]').val(typeof data.body.driver_id == "undefined" ? "" : data.body.driver_id);
			    	$('input[name=driver_name]').val(typeof data.body.driver_name == "undefined" ? "" : data.body.driver_name);
			    	$('input[name=memo]').val(typeof data.body.memo == "undefined" ? "" : data.body.memo);

			    }
			})
		}
		function modifyResult(data) {
			$.ajax({
			    url: '//${cms_api_domain}/1.0/svc/history/modify_result',
			    type: 'post',
			    dataType: 'json',
			    async: false,
			    contentType: 'application/json',
			    beforeSend: function(jqXHR, setting) {
			            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
			    },
			    data:JSON.stringify({login_id: login_id, upload_idx: upload_idx, data: data}),
			    success: function(data) {
			    	console.log(data);

			    	window.opener.loadList();
			    	window.close();
			    }
			})
		}
		$('#ADD_FORM').on('submit', function(e) {
			e.preventDefault();

			var time = $('input[name=use_time]').val().split(':');
			var t = time[0];
			var m = time[1];
			var s = time[2];

			if(t >  23) {
				alert("시간은 23시간까지 입력 가능합니다.");
				return;
			}
			if(m > 59) {
				alert('분은 59분 까지 입력 가능합니다.');
				return;
			}
			if(s > 59) {
				alert("초는 59초 까지 입력 가능합니다.");
				return;
			}
			
			var obj = {};

			$('.input').each(function(idx, elem) {
				var target = $(elem);

				if(target.attr("name") == "cost" || target.attr("name") == "add_cost" || target.attr("name") == "add_tax") {
					obj[target.attr("name")] = target.val().replace(/\,/gi,"")
				}
				else {
					obj[target.attr("name")] = target.val();
				}
			})

			modifyResult(obj);

			window.close();
		})
		// corpPopup
		function openPopup() {
			if(typeof corpPopup === "undefined" || corpPopup.closed) {
				corpPopup = window.open("/svc/history/popup/userPopup?cor_idx="+cor_idx, "userPopup", "status=1,width=600,height=610");
			}
			else {
		        corpPopup.close();
		        corpPopup = window.open("/svc/history/popup/userPopup?cor_idx="+cor_idx, "userPopup", "status=1,width=600,height=610");
			}
		}
		function loadData(name, no_in_company, phone_number) {
			$('input[name=cust_name]').val(name);
			$('input[name=cust_no]').val(no_in_company);
			$('input[name=phone_number]').val(phone_number);

			// $('.input').removeAttr('disabled');
			// selected = true;
		}
		function initialize() {
			PK_COMN.toDatePicker('.date');
			loadPreData();
		}
		$('.search').on('click', function(e) {
			e.preventDefault();
			openPopup();

		})
		$('#CANCLE').on('click', function(e) {
			e.preventDefault();

			window.close();
		})
		initialize();
		validate.addElement($('input[name=use_time]'), {required: true, pattern:"[0-9]{2}:[0-9]{2}:[0-9]{2}"})
		validate.toDatePicker($('input[name=use_date]'));

		validate.addElement(
			[$('input[name=use_date]'),  $('input[name=start_addr'), $('input[name=finish_addr]')], 
			{ required: true, number: true, kor: true, eng: true, special: true, space: true, number: true }
		)

		validate.addElement(
			[$('input[name=cost]'), $('input[name=add_cost]'), $('input[name=add_tax')],
			{ myReg: "0-9\\," }
		)

		// validate.addElement($('input[name=cost]'), {number: true, required: true});
	</script>
</body>
</html>
