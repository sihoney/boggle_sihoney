
//===============[플레이리스트 서평추가 모달]===============================
//변수선언
//- 모달 페이징 요청
var crtPage = 1;
var reviewChkBoxArr = [];
//===============[플레이리스트 모달 ready/close]==========================
/*모달 ready*/
$('#playlist-add').on('click', function(){

	console.log('추가 클릭');
	
	$('#review-add').modal({backdrop: 'static', keyboard: false});
	$('#review-add').modal('show'); 

	/* 페이지 리스트 요청*/
	fetchList();
	console.log('리스트 요청');
	
	renderPaging();
	console.log('페이지 요청');

})

/*모달창 닫기*/
$('.modal-close').on('click', function(){
	
	$('#review-add').modal('hide');
	$('#reviewAll').empty();
	
	crtPage = 1;

})

//===============[데이터 요청]=========================================
//페이지 클릭 해당 버튼 리스트 요청
$('#addModal-pagination').on('click','.page-link',function(){
	
	console.log('클릭 페이지');
	crtPage = $(this).data('crtpage');
	console.log(crtPage);
	
	$('#reviewAll').empty();
	fetchList();
})
	

//데이터 요청(페이지,리스트)
function fetchList(){

	console.log("요청:"+crtPage);
	
	$.ajax({
		url : "modalListPage",
		type : "post",
		data : {crtPage: crtPage},
		
		dataType : "json",
		success : function(playlistMap){
		/*성공시 처리해야될 코드 작성*/
			console.log(playlistMap.modalList);
			
			renderPaging(playlistMap,crtPage);
			
			//객체 리스트 돌리기(화면 출력)
			for(var i = 0; i<playlistMap.modalList.length; i++){
				//그리기
				render(playlistMap.modalList[i]);
			}
		
		},
		error : function(XHR, status, error) {
		console.error(status + " : " + error);
		}
		
	});
	
	
}

//검색 내용 요청
function getSearch(){
	console.log('검색요청');
	
	var inputTxt = $('#reviewSearch').val();
	console.log('검색:'+inputTxt);
	
	$.ajax({
		url : "reviewSearch",
		type : "post",
		data : {SearchTxt: inputTxt},
		
		dataType : "json",
		success : function(searchResult){
			/*성공시 처리해야될 코드 작성*/
			
			console.log('검색결과:'+searchResult);
			
			//기존 데이터 지워짐(리스트,페이징)
			$('#reviewAll').empty();
			$('#addModal-pagination').html('');
			
			if(searchResult == ''){
				$('#reviewAll').html('<li>검색 결과가 없습니다</li>')
			}else{
				//검색 결과 리스팅
				for(var i =0; i<searchResult.length; i++){
					render(searchResult[i]);
				}
			}

			$('#reviewSearch').val('');
			
		},
		error : function(XHR, status, error) {
		console.error(status + " : " + error);
		}
	});
	
	
}

//체크박스 등록 요청
function addCheck(reviewChkBoxArr){
	
	console.log('체크박스 등록 요청');
	
	$.ajax({
		url : "addReviews",
		type : "post",
		data : {reviewChkBoxArr: reviewChkBoxArr},
		
		dataType : "json",
		success : function(result){
		/*성공시 처리해야될 코드 작성*/
		
		},
		
		error : function(XHR, status, error) {
		console.error(status + " : " + error);
		}
	});
	
}


$('.addReviewBtn').on('click', function(){
	
	console.log('선택 등록 버튼 클릭');
	
	var playlistNo = $('.glyphicon-check');
	
	for(let item of playlistNo) { 
		var reivewVo = item.dataset;
		reviewChkBoxArr.push(reivewVo);
		console.log(reviewChkBoxArr);
	};
	
})

//===============[화면 출력]===================================================
//해당 페이지 서평 리스트
function render(modalList){
	
	console.log(modalList);
	
	var str = '';
	str +='	<li> ';
	str +='		<div class="review-card"> ';
	str +=' 		<p class="bookname">'+modalList.bookTitle+'</p> ';
	str +=' 		<p class="review-content">'+modalList.reviewContent+'</p> ';
	str +=' 		<span class="tag">#'+modalList.emoName+'</span> ';
	str +=' 		<span class="glyphicon glyphicon-unchecked btn-check" aria-hidden="true" data-playlistno="'+modalList.playlistNo+'" data-reviewno="'+modalList.reviewNo+'"></span> ';
	str +=' 	</div> ';
	str +=' </li> ';
	
	$('#reviewAll').append(str);

}

//플리 모달 페이징
function renderPaging(playlistMap,crtPage){
	
	console.log(playlistMap);
	console.log("checkpage:"+crtPage);
	
	var str = '';
	if(playlistMap.prev == true){
		str += ' <li class="page-item"> ';
		str += ' 	<a class="page-link" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a> ';
		str += ' </li> ';
	}
	
	for(var i = playlistMap.startPageBtnNo; i<=playlistMap.endPageBtnNo; i++){
		/*현재페이지는 active 버튼데이터(요청한 파라미터) == 받아온 페이지*/
		if(i == crtPage){
			str += ' <li class="page-item active"><a class="page-link" data-crtpage="'+i+'">'+i+'</a></li> ';
		}else{
			str += ' <li class="page-item"><a class="page-link" data-crtpage="'+i+'">'+i+'</a></li> ';
		}
		
	}

	if(playlistMap.next == true){
		str += ' <li class="page-item"> ';
		str += ' 	<a class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a> ';
		str += ' </li> ';
	}
	
	$('#addModal-pagination').html(str);
	
}

//===============[event]==========================================================
//-------------------------------------------------------------
//모달 서평추가 체크박스 선택
$('#reviewAll').on('click','.glyphicon-unchecked', function(){
	console.log('unchecked 버튼 클릭');
	
	$(this).attr('class','glyphicon glyphicon-check btn-check');
})

//모달 서평 체크박스 취소
$('#reviewAll').on('click','.glyphicon-check', function(){
	console.log('check 버튼 클릭');
	
	$(this).attr('class','glyphicon glyphicon-unchecked btn-check')

})


//--------------------------------------------------------------
//키워드 검색
$('#reviewSearch').keydown(function(keyNum){
	
	if(keyNum.keyCode == 13){
		
		console.log('엔터!');
		
		//검색 내용 요청
		getSearch();
		
	}
	
})







