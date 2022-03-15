// 최신순 인기순 버튼 클릭
// 최신순
$('#latest-order').on('click',function(){
    console.log('클릭');

    $('#latest-order').attr('class','txt-b');
    $('#best-order').attr('class','');

    var bookno = $('#bookno').data();

    $.ajax({
        url : "${pageContext.request.contextPath}/bookdetail?bookNo=",
        type : "get",
        contentType : "application/json",
        data : {bookno: bookno},

        dataType : "json",
        success : function(latest){
        /*성공시 처리해야될 코드 작성*/



        },

        error : function(XHR, status, error) {
        console.error(status + " : " + error);
        }
    });
    
});

// 인기순
$('#best-order').on('click',function(){
    console.log('클릭');

    $('#best-order').attr('class','txt-b');
    $('#latest-order').attr('class','');

});

//-------------------------------------------------------------
//북마크 제거
$('#delete-bookmark').on('click', function(){
    console.log('-mark 클릭');

	var markresult = $('#delete-bookmark').data('markresult');
	var userNo = $('#delete-bookmark').data('userno');
	var bookNo = $('#delete-bookmark').data('bookno');
	
	console.log(markresult);

	//북마크 제거 요청(delete)
	$.ajax({
		url : "bookdetail/bookmark",
		type : "get",
		contentType : "application/json",
		data : {'markresult': markresult,
				'userNo': userNo,
				'bookNo': bookNo
				},
		
		dataType : "json",
		success : function(result){
			/*성공시 처리해야될 코드 작성*/

		},
		
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
    
});

//===============[플레이리스트 서평추가 모달]==========================
//-------------------------------------------------------------

$('#playlist-add').on('click', function(){

	console.log('추가 클릭');

	$('#review-add').modal('show'); 
	
	$(document).ready(function(){
		
		/* 리스트 요청*/
		fetchList();
		
		console.log('리스트 요청');
		
	});


})

//리스트 그리기
function fetchList(){
	
	$.ajax({
		url : "reviewModalList",
		type : "post",
		
		dataType : "json",
		success : function(reviewList){
		/*성공시 처리해야될 코드 작성*/
			console.log(reviewList);
			
			//객체 리스트 돌리기(화면 출력)
			for(var i = 0; i<reviewList.length; i++){
				//그리기
				render(reviewList[i]);
			}
		
		},
		error : function(XHR, status, error) {
		console.error(status + " : " + error);
		}
		
	});
	
	
}


function render(reviewVo){
	
	var str = '';
	str +='	<li> ';
	str +='		<div class="review-card"> ';
	str +=' 		<p class="bookname">'+reviewVo.bookTitle+'</p> ';
	str +=' 		<p class="review-content">'+reviewVo.reviewContent+'</p> ';
	str +=' 		<span class="tag">#'+reviewVo.emoName+'</span> ';
	str +=' 		<button class="checkBtn"> ';
	str +=' 			<i class="fa-solid fa-circle-check"></i> ';
	str +=' 		</button> ';
	str +=' 	</div> ';
	str +=' </li> ';
	
	$('#reviewAll').append(str);

}



// 더보기, 서평 공유하기
$('#shr_review').on('click',function(){
    console.log('클릭');

    $('#myModal').modal('show');

});

//더보기, 플리 추가
$('#add_pli').on('click',function(){
    console.log('클릭');

    $('#modal_playlist').modal('show');

});


//플레이리스트 삭제
$('#playlist-delete').on('click', function () {
    console.log('클릭');
    $('#myModal').modal('show');
});

// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('JAVASCRIPT_KEY');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());

function kakaoShare() {
    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: '카카오공유하기 시 타이틀',
            description: '카카오공유하기 시 설명',
            imageUrl: '카카오공유하기 시 썸네일 이미지 경로',
            link: {
            mobileWebUrl: '카카오공유하기 시 클릭 후 이동 경로',
            webUrl: '카카오공유하기 시 클릭 후 이동 경로',
            },
        },
        buttons: [
            {
                title: '웹으로 보기',
                link: {
                mobileWebUrl: '카카오공유하기 시 클릭 후 이동 경로',
                webUrl: '카카오공유하기 시 클릭 후 이동 경로',
                },
            },
        ],
        // 카카오톡 미설치 시 카카오톡 설치 경로이동
        installTalk: true,
    })
}


