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
let randomCheckBtn = document.querySelector(".randomCheckBtn")
let dim = document.querySelector(".dim")
const playlistStatic = document.querySelector(".static")
// const playlistAddModal = document.querySelector(".playlistAddModal")
const modalBackground = document.querySelector(".modal-background")
const reviewModalBackground = document.querySelector(".review-modal-background");
const modalCloseBtn = document.querySelector(".modal-closeBtn")
const addReviewModal = document.querySelector(".addReviewModal")
const reviewModalCloseBtn = addReviewModal.querySelector(".modal-closeBtn")
const reviewAddBtns = addReviewModal.querySelectorAll(".reviewAddBtn")
const modal = document.querySelector(".messageModal")

let counter = 0;
let slides;
let interval
let timeout;

let bgmCounter = 0;
let play = false;
let clickCnt = 0;

let modeToggle = true;
let heartToggle = false;

let url

window.addEventListener("DOMContentLoaded", function(){
	console.log("dom content loaded")
	
	url = location.href + "/getemotion"
	
	fetch(url)
	.then(response => response.json())
	.then(data => {
		renderEmoTag(data)
		
		let emoTags = document.querySelectorAll(".emoTag")
		
		for(let emoTag of emoTags) {
			emoTag.onclick = function() {
				for(let tag of emoTags) {
					tag.classList.remove("checked")
				}
				
				emoTag.classList.add("checked")
				
				// 사이드 바 닫히고 플레이리스트 로드
			    sideBar.classList.remove("show-sidebar");

			    dim.classList.remove("show-dim")
			
			    dim.addEventListener("transitionend", function(){
			        this.classList.toggle("unstaged")
			        this.removeEventListener("transitionend", arguments.callee)
			    })

				loadReviewList(emoTag.id)
			}
		}
	})
})

/* 감정버튼 클릭시, 서평 리스트 불러오기 */
function loadReviewList(emoNo) {
	url = location.href + "/getReviewListByEmo" + "?emoNo="+emoNo ;
	
	fetch(url, {
		method: "POST", 
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify({
			emoNo: emoNo
		})
	}).then(response => response.json())
	.then(data => {
		console.log(data)

		slideContainer.innerHTML = ''
		
		renderNewArray(data)
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
    
            if(bgmCounter > 0) {
                bgmCounter--
        
                updatePaging()
            } else {
                bgmCounter = songs.length - 1
        
                updatePaging()
            }
        }
    } else {
        if(bgmCounter > 0) {
            bgmCounter--
    
            updatePaging()
        } else {
            bgmCounter = songs.length - 1
    
            updatePaging()
        }
    }
})

function moveNextBgm(){
    if(bgmCounter < songs.length - 1) {
        bgmCounter++

        updatePaging()        
    } else {
        bgmCounter = 0

        updatePaging() 
    }
}

bgmNextBtn.addEventListener("click", moveNextBgm)

/* 서평 추가 모달의 아이콘 plus --> check */
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

/* 모달 > 새 플레이리스트 추가 */
playlistStatic.onclick = function(e){
    modalBackground.classList.toggle("show-modal")
}

/* 모달 닫기 버튼 */
reviewModalCloseBtn.onclick = function() {
    reviewModalBackground.classList.remove("show-modal")
}

modalCloseBtn.onclick = function(){
    modalBackground.classList.remove("show-modal")
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
    counter--;
    carousel();
})

downBtn.addEventListener("click", function(){
    counter++;
    carousel();
})

/* 슬라이드 keyup, keydown */
window.addEventListener("keydown", function(e) {
    if(e.key == 'ArrowUp') {
        counter--;
        carousel();
    }
})

window.addEventListener("keydown", function(e) {
    if(e.key == 'ArrowDown') {
        counter++;
        carousel();
    }
})

/* 슬라이드 전환 방식 변경 */
autoModeBtn.onclick = function(){
    changeMode()
}

window.addEventListener("keydown", function(e){ 
    if(e.key == 'Enter') {
        changeMode()
    }
})


/* 랜덤 체크 버튼에 toggle 기능 주기 */
randomCheckBtn.onclick = function(e) {
    let classList = e.path[0].classList
    
    if(classList[1] == 'fa-check') {
        randomCheckBtn.innerHTML = '<i class="fa-solid fa-circle-check"></i>'
    } else {
        randomCheckBtn.innerHTML = '<i class="fa-solid fa-check"></i>'
    }
}

function renderMsg(){
    clearTimeout(timeout)

    modal.classList.toggle("opaque")
    modal.classList.toggle("unstaged")

    timeout = setTimeout(function(){
        modal.classList.toggle("opaque")

        modal.addEventListener("transitionend", function(){
            this.classList.toggle("unstaged")
    
            this.removeEventListener("transitionend", arguments.callee)
        })
    }, 2000)
}

function changeMode(){

    renderMsg()

    if(modeToggle == true) { // 자동 전환 모드
        console.log("auto toggle true")

        autoCarousel()

        modeToggle = !modeToggle
    } else {                // 수동 전환 모드
        console.log("auto toggle false")

        clearInterval(interval)

        // if(counter > 0) {
        //     upBtn.style.display = "block";
        // } else {
        //     upBtn.style.display = "none";
        // }
        // downBtn.style.display = "block"

        navLinks.style.visibility = 'visible'
        sidebarBtn.style.visibility = 'visible'
        autoModeBtn.style.display = 'block'

        modeToggle = !modeToggle

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
            counter++
            carousel()
        },
        4000
    )
    
}

function carousel() {
    console.log("counter: " + counter)

    if(counter == slides.length) {
        renderNewArray(array);
    }

    if(modeToggle === true) {
        if(counter > 0) {
            upBtn.style.display = "block";
        } else {
            upBtn.style.display = "none";
        }
        downBtn.style.display = "block"        
    }

    slides.forEach(slide => {
        slide.style.transform = `translateY(-${counter * 100}%)`;
    })
}

function render(item) {
	
	console.log(item)
	
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

	a.setAttribute("href", location.href.substring(0, 34) + "bookdetail?bookNo=" + item.bookNo)

    slide.classList.add("slide");
    btnContainer.classList.add("btn-container");
    /*
    slide.onclick = function(){
        clearInterval(interval)
    }
    */
    review.textContent = item.reviewContent;
    username.textContent = item.nickname;
    slide.style.backgroundColor = color
	review.style.fontFamily = fontFamily;
    heartBtn.innerHTML = '좋아요<i class="fa-regular fa-heart"></i>';
    addBtn.innerHTML = '플레이리스트<i class="fa-solid fa-plus"></i>';

    heartBtn.onclick = function(e){
        console.log("좋아요")

        if(heartToggle === false) {
            heartBtn.innerHTML = '좋아요<i class="fa-solid fa-heart"></i>'
        } else {
            heartBtn.innerHTML = '좋아요<i class="fa-regular fa-heart"></i>'
        }

        heartToggle = !heartToggle
    }

    addBtn.onclick = function(){
        reviewModalBackground.classList.toggle("show-modal")
    }

    review.classList.add("review");
    username.classList.add("username");
    btnContainer.classList.add("slideBtnContainer");
    heartBtn.classList.add("heartBtn");
    addBtn.classList.add("addBtn");
	a.classList.add("reviewLink")

	a.append(review)

    btnContainer.append(heartBtn, addBtn);
    slide.append(a, username, btnContainer);
    
    slideContainer.append(slide)
    container.append(slideContainer);
}

function updatePaging() {

    // 바로 재생되게 하기
    if(play === true) { // 재생되고 있는 음악 멈춤
        audioEle.pause() 
    }

    // audio 객체 업데이트, 음악 시작, 아이콘 업데이트
    singer.textContent = songs[bgmCounter].singer
    songTitle.textContent = songs[bgmCounter].title
    audioEle.src = songs[bgmCounter].file

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

    dots[bgmCounter].classList.add("active")
}

function renderBgmPaging(count) {

    let ul = document.createElement("ul")

    for(let index = 0; index < count; index++){
        let div = document.createElement("div")
        let li = document.createElement("li")

        div.classList.add("dot")
        if(index == bgmCounter) {
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

    slides.forEach((slide, index) => {
        slide.style.top = `${index * 100}%`;
    })
}

function init() {
    /*** 서평 슬라이드 화면 출력 및 나열 ***/
    renderNewArray(array)

    upBtn.style.display = "none";

    /*** sidebar bgm 정보 넣기 ***/
    singer.textContent = songs[bgmCounter].singer
    songTitle.textContent = songs[bgmCounter].title
    audioEle.src = songs[bgmCounter].file

    /*** sidebar bgm pagination 화면 출력하기 ***/
    let songsCnt = songs.length;

    renderBgmPaging(songsCnt)

}

init();