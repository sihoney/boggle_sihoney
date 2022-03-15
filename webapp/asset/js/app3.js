let array = [
    {
        bookNo: 9791189327156,
		emoNo: 1,
		nickname: "가짜정우성",
		reviewContent: "우리가 어류에 대해 해온 일이 바로 이와 똑같다. 수많은 미묘한 차이들을 “어류”라는 하나의 단어 아래 몰아넣은 것이다.",
		reviewNo: 1,
		styleName: "#f905fb,NanumGothicEco"
    },
    {
        bookNo: 9791197037153,
		emoNo: 1,
		nickname: "니모먹는스폰지밥",
		reviewContent: "취향이 없을 때의 나는 무기력하고 나약했다. 상대의 결정만을따르면서 모든 선택에서 물러나길 밥 먹듯 했다. 그러다 문득, 나를잃고 있다는 생각이 머릿속을 스쳤다. 오로지 타인만을 위했던 행동이 나를 버리는 일이었다는 걸 깨닫게 된 것이다.",
		reviewNo: 2,
		styleName: "#ff7dfe,NanumMyeongjo"
    },
    {
        bookNo: 9791166686603,
		emoNo: 1,
		nickname: "구직중입니다",
		reviewContent: "세상은 원래부터 기괴하고 무섭고 아름답고 당황스러웠다. 그동안 우리는 두꺼운 습관의 담요를 뒤집어 쓰고 이를 무시하고 있었을 뿐이다. 그리고 김보영의 단편들을 읽는 것은 그 담요를 은근슬적 떨구는 과정이다. ",
		reviewNo: 3,
		styleName: "#ffcaff,NanumPen"
    }
];

let projectName = "/bookproject"

let songs = [
    {
        title: "chilled-acoustic-indie-folk-instrumental-background-music-for-videos-5720",
        singer: "Lesfm",
        file: projectName + "/asset/music/chilled-acoustic-indie-folk-instrumental-background-music-for-videos-5720.mp3"
    },
    {
        title: "moment-14023",
        singer: "SergeQuadrado",
        file: projectName + "/asset/music/moment-14023.mp3"
    },
    {
        title: "both-of-us-14037",
        singer: "madirfan",
        file: projectName + "/asset/music/both-of-us-14037.mp3"
    },
    {
        title: "morning-garden-acoustic-chill-15013",
        singer: "Olexy",
        file: projectName + "/asset/music/morning-garden-acoustic-chill-15013.mp3"
    }
]

const container = document.querySelector(".container");
const slideContainer = document.querySelector(".slide-container");
const upBtn = document.querySelector(".upBtn");
const downBtn = document.querySelector(".downBtn");
const autoModeBtn = document.querySelector(".autoModeBtn");
const closeBtn = document.querySelector(".close-btn");
const sideBar = document.querySelector(".sidebar");
const sidebarToggle = document.querySelector(".fa-bars");
let navLinks = document.querySelector(".links")
let sidebarBtn = document.querySelector(".sidebarBtn")

let bgmPrevBtn = document.querySelector(".prevArrow")
let bgmNextBtn = document.querySelector(".nextArrow")
let singer = document.querySelector(".singer")
let songTitle = document.querySelector(".song-title")
const playBtn = document.querySelector(".playBtn")
const audioEle = document.querySelector(".audioEle")

let bgmPagination = document.querySelector(".bgm-pagination")
//let emoTags = document.querySelectorAll(".emoTag")
let randomBtn = document.querySelector(".randomBtn")
let dim = document.querySelector(".dim")
//const playlistStatic = document.querySelector(".static")
// const playlistAddModal = document.querySelector(".playlistAddModal")
const modalBackground = document.querySelector(".modal-background")
const reviewModalBackground = document.querySelector(".review-modal-background");
const modalCloseBtn = document.querySelector(".modal-closeBtn")
const addReviewModal = document.querySelector(".addReviewModal")
const reviewModalCloseBtn = addReviewModal.querySelector(".modal-closeBtn") // 2개 있다
//const reviewAddBtns
const modal = document.querySelector(".messageModal")

const addPlaylistForm = document.querySelector(".addPlaylist")

let slideIndex = 0;
let slides;
let interval
let timeout;
let url

let bgmIndex = 0;
let play = false;
let clickCnt = 0;

let autoMode = false;
let heartToggle = false;

let musicList
let emoTags

let logStatus = document.querySelector(".login").getAttribute("data-logstatus")
let userNo
let reviewNo

/* 화면 로드 후 첫 화면 (감정버튼, 서평리스트, 음악리스트 + [로그인] 나의 플레이리스트) */
window.addEventListener("DOMContentLoaded", function(){
	
	/*******************************************************
	 디폴트 랜덤 리스트 + 음악 리스트 불러와서 출력 (감정 태그와 같이 호출!)
	********************************************************/
	
	
	/**************************
	 감정 태그 출력 & 이벤트 추가하기 
	***************************/
	url = location.href + "/getemotion"

	fetch(url)
	.then(response => response.json())
	.then(data => {
		/* 감정 태그 출력 후 click 이벤트 추가 */
		renderEmoTag(data)
		
		emoTags = document.querySelectorAll(".emoTag")
		
		for(let emoTag of emoTags) {
			
			/* 감정 태그 클릭시 */
			emoTag.onclick = function() {

				slideIndex = 0

				for(let tag of emoTags) {
					tag.classList.remove("checked")
				}
				emoTag.classList.add("checked")
				
				// 사이드 바 닫힘
			    sideBar.classList.remove("show-sidebar");
			    dim.classList.remove("show-dim")
			
			    dim.addEventListener("transitionend", function(){
			        this.classList.toggle("unstaged")
			        this.removeEventListener("transitionend", arguments.callee)
			    })
				// 감정태그에 해당하는 서평, 음악 리스트 불러오기 + 자동 전환 & 음악 재생
				loadReviewMusicList(emoTag.id, "emotion")
				
				emoTag.blur()
				slideContainer.click()
			}
		}			
	})
		
	/***************************
	 사이드바 > 마이 플레이리스트 출력 
	****************************/	
	if(logStatus === "login") {
		userNo = document.querySelector(".login").getAttribute("data-userNo")
		
		url = location.href + "/getMyPlaylist?userNo=" + userNo
	
		fetch(url)
		.then(response => response.json())
		.then(data => {
			
			renderPlaylist(data, "sidebar")
		})
	}
		
})

/* 슬라이드 keyup, keydown */
window.addEventListener("keydown", function(e) {
    if(e.key == 'ArrowUp') {
        slideIndex--;
        carousel();
    }
})

window.addEventListener("keydown", function(e) {
    if(e.key == 'ArrowDown') {
        slideIndex++;
        carousel();
    }
})

/* 슬라이드 Enter 이벤트리스너 추가 */
window.addEventListener("keydown", enterEventHandler)

function enterEventHandler(e) {
	if(e.key == 'Enter') {
        changeMode()
    }
}

/* 모달 > 새 플레이리스트 추가 */
addPlaylistForm.addEventListener("submit", function(e){
	e.preventDefault()
	
	let playlistTitle = this.playlistTitle.value

	let obj = {
		userNo : userNo,
		playlistName : playlistTitle
	}
	
	url = location.href + "/addNewPlaylist"
	
	fetch(url, {
		method: "POST",
		headers: {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(obj)
	}).then(response => response.json())
	.then(data => {
		
		/* 새 플리 추가 후 화면 플레이리스트 초기화 */
		document.querySelector(".playlist-box").querySelector("ul").innerHTML = ""
		document.querySelector(".playlist-list").innerHTML = ""
		
		userNo = document.querySelector(".login").getAttribute("data-userNo")
		
		url = location.href + "/getMyPlaylist?userNo=" + userNo
		
		fetch(url)
		.then(response => response.json())
		.then(data => {
			
			renderPlaylist(data, "modal")
			renderPlaylist(data, "sidebar")
		})
		
	})
	
	document.querySelector(".addPly-input").value = null
})

function renderPlaylist(list, loca) {
	
	/* 화면 출력 */
	if(loca === "sidebar") { /*********** 사이드바 플레이리스트 ************/
		
		//////////////////
		// 플레이리스트 렌더 
		//////////////////
		for(let item of list) {
			
			let li2 = document.createElement("li")
			let p2 = document.createElement("p")
			
			p2.innerText = item.playlistName
			
			li2.setAttribute("data-playlistNo", item.playlistNo)
			li2.classList.add("playlistBtn")
			
			li2.append(p2)
			document.querySelector(".playlist-list").append(li2)
		}
		
		//////////////////
		// 이벤트 리스너 넣기 
		//////////////////
		const playlistBtns = document.querySelectorAll(".playlistBtn")

		for(let plybtn of playlistBtns) {
			
			plybtn.onclick = function(e){
				let playlistNo = e.path[1].getAttribute("data-playlistno")
				
				// 현재 서평 + 음악 초기화
				slideIndex = 0
				
				// 사이드 바 닫힘
			    sideBar.classList.remove("show-sidebar");
			    dim.classList.remove("show-dim")
			
			    dim.addEventListener("transitionend", function(){
			        this.classList.toggle("unstaged")
			        this.removeEventListener("transitionend", arguments.callee)
			    })		
		
				// 클릭한 플레이리스트 서평 리스트 + 음악 목록 db에서 가져오기
				loadReviewMusicList(playlistNo, "playlist")
				
			}
		}
		
		
	} else { /*********** 모달 플레이리스트 ************/
	
		//////////////////
		// 플레이리스트 렌더 
		//////////////////
		for(let item of list) {

			let li = document.createElement("li")
			let p = document.createElement("p")
			let btn = document.createElement("button")
			
			p.innerText = item.playlistName
			
			if(item.cnt == 0) { // 지금 서평 플레이리스트에 추가 안했음
				btn.innerHTML = '<i class="fa-solid fa-plus"></i>'
			} else { // 추가했음
				btn.innerHTML = '<i class="fa-solid fa-check"></i>'
			}
			
			li.setAttribute("data-playlistNo", item.playlistNo)
			
			li.classList.add("playlist-li")
			btn.classList.add("reviewAddBtn")
			
			li.append(p, btn)
		
			document.querySelector(".playlist-box").querySelector("ul").append(li)
		}
		
		/////////////////////
		// 이벤트 리스너 넣기 
		/////////////////////
		const reviewAddBtns = addReviewModal.querySelectorAll(".reviewAddBtn")
		
		for(let addBtn of reviewAddBtns) {
		    addBtn.onclick = function(e){
	
				let icon = e.path[0].classList[1]

				////// DB 변경 ///////
				let playlistNo = e.path[2].dataset.playlistno
				reviewNo = slides[slideIndex].getAttribute("data-reviewNo")
						
				url = location.href + "/addReviewToPly"
					
				let obj = {
					playlistNo: playlistNo,
					reviewNo : reviewNo,
					icon: icon
				}
				
				fetch(url, {
					method: "POST", 
					headers: {
						"Content-Type" : "application/json"
					},
					body : JSON.stringify(obj)
				}).then(response => response.json())
				.then(data => {
					//console.log(data)
				})
				
				////// 화면 ICON 변경 ///////				
		        if(icon == 'fa-plus') { // 저장할 때
		            addBtn.innerHTML = '<i class="fa-solid fa-check"></i>'
		        } else { // 삭제할 때
		            addBtn.innerHTML = '<i class="fa-solid fa-plus"></i>'
		        }
		    }
		}
	}
}

/* 랜덤 버튼 클릭시 */
randomBtn.onclick = function() {
	console.log("you clicked random button")
	
	slideIndex = 0
	
	/* random number 생성 --> random emoNo 생성 */
	let randomEmoNo = Math.ceil(Math.random() * emoTags.length)
	
	// 감정 태그 checked 다 제거
	for(let tag of emoTags) {
		tag.classList.remove("checked")
	}
	
	// 사이드 바 닫힘
    sideBar.classList.remove("show-sidebar");
    dim.classList.remove("show-dim")

    dim.addEventListener("transitionend", function(){
        this.classList.toggle("unstaged")
        this.removeEventListener("transitionend", arguments.callee)
    })
	
	loadReviewMusicList(randomEmoNo, "emotion")
	
	/* 적용 안됨 */
	randomBtn.blur()
	window.focus()
}

/* 서평, 음악 리스트 로드 & 자동 전환 및 음악 재생 */
function loadReviewMusicList(no, sort) {
	
	if("emotion" === sort) {
		console.log("sort by emotion")
		
		url = location.href + "/reviewListByEmo?emoNo=" + no
			
	}
	else if("playlist" === sort) {
		console.log("sort by playlistNo")
		
		url = location.href + "/reviewListByEmo?playlistNo=" + no
	}
	
	fetch(url)
	.then(response => response.json())
	.then(data => {
		
		let musicTotalCnt = data.musicTotalCnt;
		let reviewList = data.reviewList;
		musicList = data.musicList;
		
		// 먼저 현재 있던 슬라이드들 삭제
		slideContainer.innerHTML = ""
		
		// 슬라이드 출력
		renderNewArray(reviewList)
		
		// music 첫 번째 출력
		bgmIndex = 0
		
	    singer.textContent = musicList[bgmIndex].artist
	    songTitle.textContent = musicList[bgmIndex].musicTitle
	    audioEle.src = "/bookproject/asset/music/" + musicList[bgmIndex].musicPath + ".mp3"
		
		// 예전 paging 삭제
		bgmPagination.innerHTML = ""
		
		// bgm paging
		renderBgmPaging(musicTotalCnt)
		
		// 자동 전환 carousel, 음악 재생
		interval = null
		timeout = null
		slideIndex = 0;
		changeMode()
		
		play = true
		audioEle.play()
		playBtn.innerHTML = '<i class="fa-solid fa-pause"></i>'
	})
}

/* 감정태그 목록 불러오기 */
function renderEmoTag(arr) {
	for(let item of arr) {
		let btn = document.createElement("button")
		btn.classList.add("emoTag")
		btn.id = item.emoNo
		btn.textContent = item.emoName
		
		document.querySelector(".tag-box").append(btn)
	}
}

// 노래 끝났을 때 자동으로 다음 노래로 넘어감
audioEle.addEventListener("ended", function(){
    console.log("ended")

    moveNextBgm()
})

// audio play & pause
playBtn.onclick = function(){

    if(play === false) { // 음악 재생

        audioEle.play()

        playBtn.innerHTML = '<i class="fa-solid fa-pause"></i>'

        play = !play;
    } else {
        //bgmCurrentTime = audioEle.currentTime

        audioEle.pause()

        playBtn.innerHTML = '<i class="fa-solid fa-play"></i>'

        play = !play;
    }
    
}

/* bgm carousel 기능 */
bgmPrevBtn.addEventListener("click", function(){
    
    if(play === true) {
        clickCnt++

        if(clickCnt === 1 ) { // 처음부터 재생
            audioEle.currentTime = 0
    
        } else if(clickCnt === 2) { // 전으로 넘어가기
            clickCnt = 0
    
            if(bgmIndex > 0) {
                bgmIndex--
        
                updateBgm()
            } else {
                bgmIndex = musicList.length - 1
        
                updateBgm()
            }
        }
    } else {
        if(bgmIndex > 0) {
            bgmIndex--
    
            updateBgm()
        } else {
            bgmIndex = musicList.length - 1
    
            updateBgm()
        }
    }
})

bgmNextBtn.addEventListener("click", moveNextBgm)

function moveNextBgm(){
	
    if(bgmIndex < musicList.length - 1) {
        bgmIndex++

        updateBgm()        
    } else {
        bgmIndex = 0

        updateBgm() 
    }
}


/* 서평 추가 모달의 아이콘 plus --> check */
/*
for(let addBtn of reviewAddBtns) {
    addBtn.onclick = function(e){

        let classlist = e.path[0].classList

        if(classlist[1] == 'fa-plus') {
            addBtn.innerHTML = '<i class="fa-solid fa-check"></i>'
        } else {
            addBtn.innerHTML = '<i class="fa-solid fa-plus"></i>'
        }
    }
}
*/

/* 모달 > 새 플레이리스트 추가 */
/*
playlistStatic.onclick = function(){
    modalBackground.classList.toggle("show-modal")
}
*/

/* 모달 닫기 버튼 */
reviewModalCloseBtn.onclick = function() {
    reviewModalBackground.classList.remove("show-modal")
}

modalCloseBtn.onclick = function(){
    modalBackground.classList.remove("show-modal")
	
	/* 삭제한 enter key event 리스너 다시 더하기 */
	window.addEventListener("keydown", enterEventHandler)
}

/* 사이드 바 열기, 닫기 */
sidebarToggle.addEventListener("click", function() {
    sideBar.classList.toggle("show-sidebar");

    dim.classList.toggle("unstaged")
    dim.classList.toggle("show-dim")
})

closeBtn.addEventListener("click", function() {
    sideBar.classList.remove("show-sidebar");

    dim.classList.toggle("show-dim")

    dim.addEventListener("transitionend", function(){
        this.classList.toggle("unstaged")
        this.removeEventListener("transitionend", arguments.callee)
    })
})

dim.onclick = function(){
    sideBar.classList.remove("show-sidebar");

    dim.classList.remove("show-dim")

    dim.addEventListener("transitionend", function(){
        this.classList.toggle("unstaged")
        this.removeEventListener("transitionend", arguments.callee)
    })
}

/* 슬라이드 위아래 버튼 */
upBtn.addEventListener("click", function(){
    slideIndex--;
    carousel();
})

downBtn.addEventListener("click", function(){
    slideIndex++;
    carousel();
})

/* 슬라이드 전환 방식 변경 */
autoModeBtn.onclick = function(){
    changeMode()
}

function renderMsg(){
    clearTimeout(timeout)

    modal.classList.add("opaque")
    modal.classList.remove("unstaged")

    timeout = setTimeout(function(){
        modal.classList.remove("opaque")

        modal.addEventListener("transitionend", function(){
            this.classList.add("unstaged")
    
            this.removeEventListener("transitionend", arguments.callee)
        })
    }, 2000)
}

function changeMode(){

    renderMsg()

    if(autoMode === false) { // 자동 전환 모드
        console.log("auto toggle true")
	
		audioEle.play()
		playBtn.innerHTML = '<i class="fa-solid fa-pause"></i>'
		play = !play;

        autoCarousel()

        autoMode = !autoMode
    } else {                // 수동 전환 모드
        console.log("auto toggle false")

		audioEle.pause()
		playBtn.innerHTML = '<i class="fa-solid fa-play"></i>'
		play = !play;

        clearInterval(interval)

        navLinks.style.visibility = 'visible'
        sidebarBtn.style.visibility = 'visible'
        autoModeBtn.style.display = 'block'

        autoMode = !autoMode

        carousel()
    }
}

function autoCarousel(){
    
    upBtn.style.display = "none";
    downBtn.style.display = "none";
    autoModeBtn.style.display = 'none';

    navLinks.style.visibility = 'hidden'
    sidebarBtn.style.visibility = 'hidden'

    interval = setInterval(
        function(){
            slideIndex++
            carousel()
        },
        4000
    )
    
}

function carousel() {
    console.log("slideIndex: " + slideIndex)

    if(slideIndex == slides.length) { 
        renderNewArray(array);
    }

    if(autoMode === false) { // 수동모드 경우
        if(slideIndex > 0) {
            upBtn.style.display = "block";
        } else {
            upBtn.style.display = "none";
        }
        downBtn.style.display = "block"        
    }

    slides.forEach(slide => {
        slide.style.transform = `translateY(-${slideIndex * 100}%)`;
    })
}

function render(item) {
	
	let styles = item.styleName.split(",")
	let color = styles[0]
	let fontFamily = styles[1]
	
    const slide = document.createElement("div");
    const review = document.createElement("p");
    const username = document.createElement("p");
    const btnContainer = document.createElement("div");
    const heartBtn = document.createElement("button");
    const addBtn = document.createElement("button");
	const a = document.createElement("a")
	
	if(logStatus === "login") {

		a.setAttribute("href", location.href.substring(0, 34) + "bookdetail?bookNo=" + item.bookNo)		
	}
	
	a.classList.add("reviewLink")
	
    slide.classList.add("slide");
    btnContainer.classList.add("btn-container");
	review.classList.add("review");
    username.classList.add("username");
    btnContainer.classList.add("slideBtnContainer");
    heartBtn.classList.add("heartBtn");
    addBtn.classList.add("addBtn");

    review.textContent = item.reviewContent;
    username.textContent = item.nickname;
    slide.style.backgroundColor = color
	review.style.fontFamily = fontFamily;
    heartBtn.innerHTML = '좋아요<i class="fa-regular fa-heart"></i>';
    addBtn.innerHTML = '플레이리스트<i class="fa-solid fa-plus"></i>';
	slide.setAttribute("data-reviewNo", item.reviewNo)

	/* 로그아웃 상태인 경우, 클릭시 로그인 페이지로 이동 */
	if(logStatus === "logout") { 
		heartBtn.onclick = function() {
			location.href = location.href.substring(0, 34)+'user/loginForm'
		}
		
		addBtn.onclick = function() {
			location.href = location.href.substring(0, 34)+'user/loginForm'
		}
	}
	else {
	    heartBtn.onclick = function(){
	        console.log("좋아요")
	
	        if(heartToggle === false) {
	            heartBtn.innerHTML = '좋아요<i class="fa-solid fa-heart"></i>'
	        } else {
	            heartBtn.innerHTML = '좋아요<i class="fa-regular fa-heart"></i>'
	        }
	
	        heartToggle = !heartToggle
	    }
		
		/* 서평 플리에 추가 모달 버튼 (reviewNo, playlistNo, userNo)*/
	    addBtn.onclick = function(){

			userNo = document.querySelector(".login").getAttribute("data-userNo")
			reviewNo = slides[slideIndex].getAttribute("data-reviewno")

			url = location.href + "/getMyPlaylistModal"
		
			let obj = {
				userNo: userNo,
				reviewNo: reviewNo
			}

			fetch(url, {
				method: "POST", 
				headers: {
					"Content-Type" : "application/json"
				},
				body : JSON.stringify(obj)})
			.then(response => response.json())
			.then(data => {
				
				/* 초기화 */
				document.querySelector(".playlist-box").querySelector("ul").innerHTML = ""
				
				renderPlaylist(data, "modal")
				
		        reviewModalBackground.classList.toggle("show-modal")

				/* 모달이 나오면 window가 Enter event 못 감지하도록 */
				window.removeEventListener("keydown", enterEventHandler)
			})
	    
		}
	}
	
    btnContainer.append(heartBtn, addBtn);
	
	a.append(review)
    slide.append(a, username, btnContainer);
    
    slideContainer.append(slide)
    container.append(slideContainer);
}

function updateBgm() {

    // 바로 재생되게 하기
    if(play === true) { // 재생되고 있는 음악 멈춤
        audioEle.pause() 
    }

    // audio 객체 업데이트 (음악 시작, 아이콘 업데이트)
    singer.textContent = musicList[bgmIndex].artist
    songTitle.textContent = musicList[bgmIndex].musicTitle
    audioEle.src = "/bookproject/asset/music/" + musicList[bgmIndex].musicPath + ".mp3"

    // play 상태에서 next btn 누르면 play
    // pause 상태에서 next btn 누르면 pause 상태로 넘어감
    if(play === true) {
        audioEle.play()
        playBtn.innerHTML = '<i class="fa-solid fa-pause"></i>'
    }

    // 해당 페이지 위치를 페이징에 반영하기
    let dots = document.querySelectorAll(".dot");

    for(let dot of dots) {
        dot.classList.remove("active")
    }

    dots[bgmIndex].classList.add("active")
}

function renderBgmPaging(count) {

    let ul = document.createElement("ul")

    for(let index = 0; index < count; index++){
        let div = document.createElement("div")
        let li = document.createElement("li")

        div.classList.add("dot")
        if(index == bgmIndex) {
            div.classList.add("active")
        }

        li.append(div)
        ul.append(li)
    }

    bgmPagination.append(ul)
}

function renderNewArray(array) {
    for(let item of array) {
        render(item)
    }

    slides = document.querySelectorAll(".slide")
	
	/* 새로운 서평 슬라이드 추가하는 방식 바꾸기! */
    slides.forEach((slide, index) => {
        slide.style.top = `${index * 100}%`;
    })
}

function init() {
    /*** 서평 슬라이드 화면 출력 및 나열 ***/
    renderNewArray(array)

    upBtn.style.display = "none";

    /*** sidebar bgm 정보 넣기 ***/
    singer.textContent = songs[bgmIndex].singer
    songTitle.textContent = songs[bgmIndex].title
    audioEle.src = songs[bgmIndex].file

    /*** sidebar bgm pagination 화면 출력하기 ***/
    let songsCnt = songs.length;

    renderBgmPaging(songsCnt)

}

init();