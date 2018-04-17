<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<common:head>
	<meta charset="UTF-8">
	<title>이용 내역 등록</title>
	<style type="text/css">
		* { margin:0; padding:0; box-sizing: border-box; }
		*:after { content: ""; display: block; clear: both; }


		body { background-color: #fff ! important; }

		.container { width: 600px; padding: 30px; }
		
		#ADD_FORM { width: 100%; height: 100%; }
		
		.input_container { width: 100%; height: 100%; margin-top: 10px; }
		.input_container:first-child { margin-top: 0; }

		.input_container label { float: left; }
		.input_container input, .select { float:right; width: 400px; height: 30px; padding: 5px; }

		.btn_container { float: right; }
		.btn_container button { width: 80px; height: 30px; border: 0; background-color: #fff; border: 1px solid #000; cursor: pointer; transition: .3s; }
		.btn_container button:hover { background-color: #000; color:#fff; }

		.input_container2 { width: 100%; }
		#SEARCH_FORM { width: 80%; margin:auto; margin-bottom: 20px; }

		.search_input { width: 350px; height: 30px; padding: 5px; }
		.m_button { width: 70px; height: 30px; border:0; background-color: #3498db; float: right; color:#fff; transition: .3s; font-size: 14px ! important; }

		.m_button:hover { background-color: #1565C0; }

		input[name=use_date] { width: 85%; float:left; }
		.m_right { float:right; width: 74%; }

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
				<label>서비스 구분:</label>
				<select class="select input" type="text" name="type">
					<option value="0" selected>법인대리</option>
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
				<input class="input" type="number" name="cost" required>
			</div>
			<div class="input_container">
				<label>추가료:</label>
				<input class="input" type="number" name="add_cost">
			</div>
			<div class="input_container">
				<label>콜수수료:</label>
				<input class="input" type="number" name="add_tax">
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
		var cor_idx = Number('<%=request.getParameter("cor_idx")%>');
		var svc_idx = Number('<%=request.getParameter("svc_idx")%>');
		var login_id = '<%=request.getParameter("login_id")%>';

		var selected = false;

		$('input[name=cor_idx]').val(cor_idx);
		$('input[name=sub_cor_idx]').val(svc_idx);
		function addResult(data) {
			$.ajax({
			    url: '//${cms_api_domain}/1.0/svc/history/add_result',
			    type: 'post',
			    dataType: 'json',
			    async: false,
			    contentType: 'application/json',
			    beforeSend: function(jqXHR, setting) {
			            jqXHR.setRequestHeader('x-api-key', 'SpammerGoHome');
			    },
			    data:JSON.stringify({login_id: login_id, data: data}),
			    success: function(data) {
			    	console.log(data);
			    	window.opener.loadList();
			    	window.close();
			    }
			})
		}
		$('#ADD_FORM').on('submit', function(e) {
			e.preventDefault();

			if(selected == false) {
				alert("회원을 선택해주세요").
				return;
			}

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

				obj[target.attr("name")] = target.val();
			})

			addResult(obj);

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

			$('.input').removeAttr('disabled');
			selected = true;
		}
		function initialize() {
			$('.input').attr('disabled', 'disabled');
			PK_COMN.toDatePicker('.date');

			validate.toDatePicker($('input[name=use_date]'));
			validate.dateToToday($('input[name=use_date]'));
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

		// validate.addElement($('input[name=cost]'), {number: true, required: true});
	</script>
</body>
</html>
