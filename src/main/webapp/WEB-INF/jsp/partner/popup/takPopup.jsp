<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<common:head>
		<title>ParkingOn ___Admin</title>
		<style type="text/css">
			* { margin: 0; padding: 0; box-sizing: border-box; font-size: 14px; }
			*:after { display: block; clear: both; content:""; }
			body { background-color: #fff; }

			.ml10 { margin-left: 10px; }
			
			.popup_container { width: 600px; height: 720px; margin:auto; margin-top: 10px; }
			.cl { display: block; }
			.select_box {
				display: inline-block;
			}
			.select_box .select {
				width: 120px;
			    height: 40px;
				border: 1px solid #E9DDDD;
			}
			select:disabled { background-color: #ddd; }
			option:disabled { color:#ddd; }

			input::-webkit-input-placeholder { color: #aaa; }
			.input_box { display: inline-block; }
			.input_box .input { width: 156px; height: 40px; padding: 5px; border: 1px solid #E9DDDD; font-size: 16px; }
			.k_btn:before{
			  content:'';
			  height:100%;
			  display:inline-block;
			}
			.k_btn{
			  background:#1AAB8A;
			  color:#fff;
			  border:none;
			  position:relative;
			  height:40px;
			  font-size:1.2em;
			  width: 120px;
			  padding:0 5px;
			  cursor:pointer;
			  transition:800ms ease all;
			  outline:none;
			  text-align: center;
			}
			.k_btn:hover{
			  background:#fff;
			  color:#1AAB8A;
			}
			.k_btn:before,.k_btn:after{
			  content:'';
			  position:absolute;
			  top:0;
			  right:0;
			  height:2px;
			  width:0;
			  background: #1AAB8A;
			  transition:400ms ease all;
			}
			.k_btn:after{
			  right:inherit;
			  top:inherit;
			  left:0;
			  bottom:0;
			}
			.k_btn:hover:before,.k_btn:hover:after{
			  width:100%;
			  transition:800ms ease all;
			}
			.element_conatiner {
				border-bottom: 1px solid #ddd;
			}
			.element_conatiner:last-child {
				border-bottom: 0;
			}
			.left_container {
				width: 20%;
				float:left;
				display: inline-block;
				height: 71px;
				padding: 28px;
				border-right: 1px solid #ddd;
				text-align: center;
			}
			.right_container {
				width: 80%;
				height: 71px;
				padding: 15px;
				display: inline-block;
			}

			.btn_x1 { width: 60px; }
			.input_box .input_x3 { width: 145px; }
			.input_box .input_x2 { width: 156px; }
			.input_box .input_x1 { width: 380px; }

			.ok_container {
				float:right;
				margin-right: 10px;
			}

			.for_input { cursor:pointer; }
		</style>
	</common:head>
	<body>
		<div class="popup_container">
			<div class="element_conatiner">
				<div class="left_container">
					구분
				</div>
				<div class="right_container">
					<div class="select_box">
						<select class="select" id="type">
							<option value="1">대리운전</option>
							<option value="2">탁송</option>
							<option value="3">ddd</option>
						</select>
					</div>
					<div class="select_box ml10">
						<select class="select" id="call_type">
							<option value="0">일반</option>
							<option value="1">법인</option>
							<option value="2">비회원</option>
						</select>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					접수상태
				</div>
				<div class="right_container">
					<div class="select_box">
						<select class="select" id="state">
							<option value=1000>접수</option>
							<option value=1005>배차</option>
							<option value=1006>재배차</option>
							<option value=1015>완료</option>
							<option value=1060>취소</option>
						</select>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					고객 정보
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input" id="phone_number" type="text">
						<button class="k_btn btn_x1 copy">Copy</button>
					</div>
					<div class="input_box">
						<input class="input" id="nickname" type="text">
						<button class="k_btn btn_x1 copy">Copy</button>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					출발지
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input input_x1" id="title" type="text">
						<button class="k_btn btn_x1 copy">Copy</button>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					경유지
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input input_x3" id="t1_title" type="text">
						<input class="input input_x3" id="t2_title" type="text">
						<input class="input input_x3" id="t3_title" type="text">
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					도착지
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input input_x1" id="u_title" type="text">
						<button class="k_btn btn_x1 copy">Copy</button>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					기사 정보
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input" id="driver_phone_number" type="text" placeholder="전화번호">
						<button class="k_btn btn_x1 copy">Copy</button>
					</div>
					<div class="input_box">
						<input class="input" id="driver_name" type="text" placeholder="이름">
						<button class="k_btn btn_x1 copy">Copy</button>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					요금
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input" id="cost" type="number" step="1000">
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					적요
				</div>
				<div class="right_container">
					<div class="input_box">
						<input class="input input_x1" id="waiting" type="text">
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					선택
				</div>
				<div class="right_container">
					<div class="input_box">
						<input id="stick" type="checkbox" name="">
						<label class="for_input" id="" for="stick">스틱</label>
						<input id="ot" type="checkbox" name="">
						<label class="for_input" id="" for="ot">정장</label>
					</div>
				</div>
			</div>
			<div class="element_conatiner">
				<div class="left_container">
					
				</div>
				<div class="right_container">
					<div class="ok_container">
						<button id="BTN_CANCLE" class="k_btn">취소</button>
						<button id="BTN_OK" class="k_btn">저장</button>
					</div>
				</div>
			</div>
		</div>
	</body>

<script type="text/javascript">
var idx = Number('<%=request.getParameter("idx")%>');
var to_state = Number('<%=request.getParameter("to_state")%>');

var m_data = null;
var update_options = {
	 title: "",
	 t1_title: "",
	 t2_title: "",
	 t3_title: "",
	 u_title: "",
	 driver_phone_number: "",
	 driver_name: "",
	 cost: 0,
	 waiting: ""
}


function getData(idx, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/getData', 'post', {idx: idx} , function(data) {
		callback(data.body);
	}, function(error) {
		alert(error);
	});
}
function modifyData(idx, callback) {
	update_options.idx = idx;
	PKOAjax.request('//${cms_api_domain}/1.0/partner/update', 'post', update_options , function(data) {
		callback(data.body);
	}, function(error) {
		alert(error);
	});
}
function updateState(idx, state, callback) {
	PKOAjax.request('//${cms_api_domain}/1.0/partner/updateState', 'post', {idx: idx, state: state} , function(data) {
		callback(data.body);
	}, function(error) {
		alert(error);
	})
}
function changeState(state) {
	$('input, select, opiton').removeAttr('disabled');
	$('#type').attr('disabled', 'disabled');
	$('#call_type').attr('disabled', 'disabled');
	$('#phone_number').attr('disabled', 'disabled');
	$('#nickname').attr('disabled', 'disabled');
	switch(m_data.state) {
		case STATE_FIND_DRIVER :
			$('option[value=1006]').attr('disabled', 'disabled')
			$('option[value=1015]').attr('disabled', 'disabled')
		break;
		case STATE_CONNECTED_DRIVER :
		break;
		case STATE_CHANGE_DRIVER :
			$('option[value=1005]').attr('disabled', 'disabled')
		break;
		case STATE_CANCEL :
		case STATE_CANCEL_BY_ADMIN :
		case STATE_CANCEL_BY_DRIVER :
			$('option[value=1006]').attr('disabled', 'disabled')
			$('option[value=1015]').attr('disabled', 'disabled')
		break;
		default :
			$('#state').find('option').attr('disabled', 'disabled');
			$('option[value=1015]').removeAttr('disabled')
		break;
	}

	switch(Number(state)) {
		case STATE_FIND_DRIVER:
			$('#driver_phone_number').attr('disabled', 'disabled');
			$('#driver_name').attr('disabled', 'disabled');
			$('#cost').attr('disabled', 'disabled');
		break;
		case STATE_CONNECTED_DRIVER:

		break
	}
}
function initialize() {
	getData(idx, function(data) {
		$('#type').val(data.type).prop('selected', true);
		$('#call_type').val(data.call_type).prop('selected', true);

		var state = data.state;

		if(state >= 1050) { state = 1060 }
		$('#state').val(state).prop('selected', true);

		console.log("to: "+to_state);

		if(to_state != 0) {
			$('#state').val(to_state).prop('selected', true);
		}

		$('#phone_number').val(data.phone_number);
		$('#nickname').val(data.nickname);


		$('#title').val(data.title);
		$('#t_1title').val(data.t_1title);
		$('#t_2title').val(data.t_2title);
		$('#t_3title').val(data.t_3title);
		$('#u_title').val(data.u_title);


		$('#driver_phone_number').val(data.driver_phone_number);
		$('#driver_name').val(data.driver_name);


		$('#cost').val(data.cost);
		$('#waiting').val(data.waiting);

		m_data = data;
		changeState($('#state').val());
	})
}

$('#BTN_CANCLE').on('click', function(e) {
	window.close();
})
$('.copy').on('click', function() {
	var temp = $('<input>');
	$('body').append(temp);
	temp.val($(this).siblings('input').val()).select();
	document.execCommand('copy');
	alert('copy!!!');
	temp.remove();
})

$('#state').change(function() {
	changeState($(this).val());
})

$('#BTN_OK').on('click', function() {
	update_options.title 				= $('#title').val();
	update_options.t1_title 			= $('#t1_title').val();
	update_options.t2_title 			= $('#tt2_titleitle').val();
	update_options.t3_title 			= $('#t3_title').val();
	update_options.u_title 				= $('#u_title').val();
	update_options.driver_phone_number 	= $('#driver_phone_number').val();
	update_options.driver_name 			= $('#driver_name').val();
	update_options.cost 				= $('#cost').val();
	update_options.waiting 				= $('#waiting').val();

	console.log($('#driver_name').val());
	switch(m_data.state) {
		case STATE_FIND_DRIVER :
			switch(Number($('#state').val())) {
				case STATE_FIND_DRIVER :
				case STATE_CANCEL_BY_ADMIN :
					modifyData(idx, function(data) {
						updateState(idx, Number($('#state').val()), function(data) {
							alert("수정 완료");
							window.opener.loadList();
							window.close();
						})
					})
				break;
				case STATE_CONNECTED_DRIVER :
					if(update_options.driver_name.trim() != ""
						&& update_options.driver_name.trim() != "") {
						modifyData(idx, function(data) {
							updateState(idx, STATE_CONNECTED_DRIVER, function(data) {
								alert("수정 완료");
								window.opener.loadList();
								window.close();
							})
						})
					}
					else {
						alert("배차를 하려면 기사정보를 입력해주세요")
					}
				break;
			}
		break;
		case STATE_CONNECTED_DRIVER :
			switch(Number($('#state').val())) {
				case STATE_CHANGE_DRIVER :
					if(update_options.driver_name.trim() != ""
						&& update_options.driver_name.trim() != "") {
						modifyData(idx, function(data) {
							updateState(idx, STATE_CHANGE_DRIVER, function(data) {
								alert("수정 완료");
								window.opener.loadList();
								window.close();
							})
						})
					}
					else {
						alert("재배차를 하려면 기사정보를 입력해주세요")
					}
				break;
				default:
					modifyData(idx, function(data) {
						updateState(idx, Number($('#state').val()), function(data) {
							alert("수정 완료");
							window.opener.loadList();
							window.close();
						})
					})
				break;
			}
		break;
		case STATE_CHANGE_DRIVER :
			modifyData(idx, function(data) {
				updateState(idx, Number($('#state').val()), function(data) {
					alert("수정 완료");
					window.opener.loadList();
					window.close();
				})
			})
		break;
		case STATE_CANCEL :
		case STATE_CANCEL_BY_ADMIN :
		case STATE_CANCEL_BY_DRIVER :
			switch(Number($('#state').val())) {
				case STATE_CONNECTED_DRIVER :
					if(update_options.driver_name.trim() != ""
						&& update_options.driver_name.trim() != "") {
						modifyData(idx, function(data) {
							updateState(idx, STATE_CONNECTED_DRIVER, function(data) {
								alert("수정 완료");
								window.opener.loadList();
								window.close();
							})
						})
					}
					else {
						alert("배차를 하려면 기사정보를 입력해주세요")
					}
				break;
				default: 
					modifyData(idx, function(data) {
						updateState(idx, Number($('#state').val()), function(data) {
							alert("수정 완료");
							window.opener.loadList();
							window.close();
						})
					})
				break;
			}
		break;
	}
})
initialize();
</script>
</html>