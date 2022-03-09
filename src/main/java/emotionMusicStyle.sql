//////////////////
// emotion table
//////////////////

/********** select **********/
select * from emotion;

/********** drop sequence **********/
drop sequence seq_emotion_no;

/********** create sequence **********/
create sequence seq_emotion_no
start with 1 increment by 1;

/********** insert into emotion **********/
insert into emotion 
values(seq_emotion_no.nextval, '외로운');
insert into emotion 
values(seq_emotion_no.nextval, '심심한');
insert into emotion 
values(seq_emotion_no.nextval, '슬픈');

insert into emotion 
values(seq_emotion_no.nextval, '충만한');
insert into emotion 
values(seq_emotion_no.nextval, '편안한');

insert into emotion 
values(seq_emotion_no.nextval, '즐거운');
insert into emotion 
values(seq_emotion_no.nextval, '희망찬');
insert into emotion 
values(seq_emotion_no.nextval, '황홀한');
insert into emotion 
values(seq_emotion_no.nextval, '용감한');

insert into emotion 
values(seq_emotion_no.nextval, '불안한');
insert into emotion 
values(seq_emotion_no.nextval, '무력한');

insert into emotion 
values(seq_emotion_no.nextval, '화난');
insert into emotion 
values(seq_emotion_no.nextval, '상처입은');
insert into emotion 
values(seq_emotion_no.nextval, '회의적인');

//////////////////////
// music table
//////////////////////

/********** select music **********/
select * from music;

/********** create sequence **********/
create sequence seq_music_no
start with 1 increment by 1;

/********** insert into music **********/
insert into music
values(seq_music_no.nextval, 1, 'chilled acoustic indie folk', 'Lesm', 'chilled-acoustic-indie-folk-instrumental-background-music-for-videos-5720');
insert into music
values(seq_music_no.nextval, 1, 'slow motion', 'abc', 'bensound-slowmotion');
insert into music
values(seq_music_no.nextval, 1, 'moden chillout', 'abc', 'penguinmusic-modern-chillout-12641');
insert into music
values(seq_music_no.nextval, 1, 'this minimal technology', 'abc', 'this-minimal-technology-12327');
insert into music
values(seq_music_no.nextval, 1, 'town', 'abc', 'town-10169');
insert into music
values(seq_music_no.nextval, 2, 'relax and sleep', 'Anton Vlasov', 'relax-and-sleep-18565');
insert into music
values(seq_music_no.nextval, 2, 'the cradle of your soul', 'lemonmusicstudio', 'the-cradle-of-your-soul-15700');
insert into music
values(seq_music_no.nextval, 2, 'spirit blossom', 'RomanBelov', 'spirit-blossom-15285');
insert into music
values(seq_music_no.nextval, 2, 'everything feels new', 'EvgenyBardyzha', 'everything-feels-new-15241');
insert into music
values(seq_music_no.nextval, 3, 'moment', 'abc', 'moment-14023');
insert into music
values(seq_music_no.nextval, 3, 'better days', 'abc', 'bensound-betterdays');
insert into music
values(seq_music_no.nextval, 3, 'tomorrow', 'abc', 'bensound-tomorrow');
insert into music
values(seq_music_no.nextval, 3, 'emotional piano sad background music', 'Lesfm', 'emotional-piano-sad-background-music-for-videos-5688');
insert into music
values(seq_music_no.nextval, 4, 'jazzy abstract beat', 'abc', 'jazzy-abstract-beat-11254');
insert into music
values(seq_music_no.nextval, 4, 'embrace', 'abc', 'embrace-12278');
insert into music
values(seq_music_no.nextval, 4, 'tenderness', 'abc', 'bensound-tenderness');
insert into music
values(seq_music_no.nextval, 5, 'both of us', 'abc', 'both-of-us-14037');
insert into music
values(seq_music_no.nextval, 5, 'morning garden', 'abc', 'morning-garden-acoustic-chill-15013');
insert into music
values(seq_music_no.nextval, 6, 'sunny', 'abc', 'moment-14023');
insert into music
values(seq_music_no.nextval, 6, 'energy', 'abc', 'bensound-energy');
insert into music
values(seq_music_no.nextval, 6, 'whale', 'nct dream', 'whale');
insert into music
values(seq_music_no.nextval, 7, 'let it go', 'abc', 'let-it-go-12279');
insert into music
values(seq_music_no.nextval, 7, 'going higher', 'abc', 'bensound-goinghigher');
insert into music
values(seq_music_no.nextval, 9, 'indie folk king around here', 'abc', 'indie-folk-king-around-here-15045');
insert into music
values(seq_music_no.nextval, 9, 'melodic techno', 'abc', 'melodic-techno-03-extended-version-moogify-9867');
insert into music
values(seq_music_no.nextval, 10, 'into the night', 'abc', 'into-the-night-20928');
insert into music
values(seq_music_no.nextval, 10, 'caves of dawn', 'abc', 'caves-of-dawn-10376');
insert into music
values(seq_music_no.nextval, 11, 'rest of the fallen', 'GuilhermeBernardes', 'rest-of-the-fallen-10378');
insert into music
values(seq_music_no.nextval, 11, 'fluidity', 'abc', 'fluidity-100-ig-edit-4558');
insert into music
values(seq_music_no.nextval, 12, 'don’t you think  lose', 'abc', 'dont-you-think-lose-16073');
insert into music
values(seq_music_no.nextval, 12, 'ever flowing', 'abc', 'ever-flowing-12277');

///////////////////////////
// style table
///////////////////////////

/********** delete style data **********/
delete from style;

/********** select style **********/
select * from style;

/**********drup sequence  **********/
drop sequence seq_style_no;

/********** create sequence **********/
create sequence seq_style_no
start with 1 increment by 1;

/********** insert into style **********/
insert into style
values(seq_style_no.nextval, 1, '#f905fb,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 1, '#ff7dfe,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 1, '#ffcaff,NanumPen');
insert into style
values(seq_style_no.nextval, 2, '#8c8cff,NanumBarunPen');
insert into style
values(seq_style_no.nextval, 2, '#5151ff,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 2, '#0000c8,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 3, '#a5dbff,NanumPen');
insert into style
values(seq_style_no.nextval, 3, '#59bdff,NanumBarunPen');
insert into style
values(seq_style_no.nextval, 3, '#0089e0,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 4, '#ffffb1,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 4, '#ffff54,NanumPen');
insert into style
values(seq_style_no.nextval, 4, '#ffe854,NanumBarunPen');

insert into style
values(seq_style_no.nextval, 5, '#ff7d00,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 5, '#ffa854,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 5, '#ffc48c,NanumPen');
insert into style
values(seq_style_no.nextval, 6, '#9adcffv,NanumBarunPen');
insert into style
values(seq_style_no.nextval, 6, '#fff89a,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 6, '#ffb2a6,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 7, '#029268,NanumPen');
insert into style
values(seq_style_no.nextval, 7, '#01c897,NanumBarunPen');
insert into style
values(seq_style_no.nextval, 7, '#ffd366,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 9, '#640707,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 9, '#89100e,NanumPen');
insert into style
values(seq_style_no.nextval, 9, '#e83b15,NanumBarunPen');

insert into style
values(seq_style_no.nextval, 10, '#0f1960,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 10, '#30a4ff,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 10, '#01ffdd,NanumPen');
insert into style
values(seq_style_no.nextval, 11, '##e2dea9,NanumBarunPen');
insert into style
values(seq_style_no.nextval, 11, '##e2dea9,NanumGothicEco');
insert into style
values(seq_style_no.nextval, 11, '#eeeeee,NanumMyeongjo');
insert into style
values(seq_style_no.nextval, 12, '#161e3c,NanumPen');
insert into style
values(seq_style_no.nextval, 12, '#d82249,NanumBarunPen');
insert into style
values(seq_style_no.nextval, 12, '#6fbf8b,NanumGothicEco');

//////////////////////////
// genre
//////////////////////////
insert into genre
values('987', '과학');
insert into genre
values('55889', '에세이');
insert into genre
values('1', '소설/시/희곡');
insert into genre
values('656', '인문학');
insert into genre
values('2105', '고전');
insert into genre
values('517', '예술/대중문화');
insert into genre
values('336', '자기계발');

--#전체 출력--
select *
from genre;

//////////////////
// books
//////////////////

insert into books
values(9791189327156, '물고기는 존재하지 않는다', '룰루 밀러', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=284657330', 987);
insert into books
values(9791197037153, '작은 별이지만 빛나고 있어', '소윤', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=280389330', 55889);
insert into books
values(9791166686603, '다섯 번째 감각', '김보영', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=287367114', 1);
insert into books
values(9791160804751, '자유로부터의 도피', '에리히 프롬', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=250111513', 656);
insert into books
values(9788932039459, '나를 마릴린 먼로라고 하자', '한정현', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=289253350', 1);

insert into books
values(9788936438715, '백의 그림자', '황정은', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=287791901', 1);
insert into books
values(9788932474632, '인간과 사진', '제프 다이어', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=290087728', 517);
insert into books
values(9791192085104, '동물은 어떻게 슬퍼하는가', '바버라 J. 킹', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=289172502', 656);
insert into books
values(9788925578804, '슈퍼 해빗', '케이티 밀크먼', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=289173060', 336);
insert into books
values(9791164051519, '생각은 어떻게 행동이 되는가', '데이비드 바드르', 'https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=287744195', 656);

/******* 확인 *********
select * 
from genre, books
where genre.genre_no = books.genre_no;