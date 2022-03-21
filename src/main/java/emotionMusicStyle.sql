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




ALTER TABLE style
ADD imgurl varchar2(1000);

ALTER TABLE style
ADD videourl varchar2(1000);

UPDATE style
SET imgurl='${pageContext.request.contextPath}/asset/img/reviewcard/rainywindow'
where style_no = 1;
UPDATE style
SET imgurl='${pageContext.request.contextPath}/asset/img/reviewcard/rainyday'
where style_no = 2;
UPDATE style
SET imgurl='${pageContext.request.contextPath}/asset/img/reviewcard/puppy1'
where style_no = 3;
UPDATE style
SET imgurl='${pageContext.request.contextPath}/asset/img/reviewcard/puppy2'
where style_no = 4;
UPDATE style
SET imgurl='${pageContext.request.contextPath}/asset/img/reviewcard/moon'
where style_no = 5;

UPDATE style
SET videourl='https://vod-progressive.akamaized.net/exp=1647852285~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1351%2F9%2F231759069%2F820068934.mp4~hmac=d7ba763ced6e65dacece593e63ba3bafb2fbc666d0e2919443d23bed96bf4a0d/vimeo-prod-skyfire-std-us/01/1351/9/231759069/820068934.mp4?filename=Graphic+-+11722.mp4'
where style_no = 1;
UPDATE style
SET videourl='https://vod-progressive.akamaized.net/exp=1647852788~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1563%2F7%2F182817488%2F600609303.mp4~hmac=6ba7e83e155f6b9d733a643c926970bef66be7b42120c06e3c901e4ad77e9056/vimeo-prod-skyfire-std-us/01/1563/7/182817488/600609303.mp4?filename=Rainy+Day+-+5278.mp4'
where style_no = 2;
UPDATE style
SET videourl='https://vod-progressive.akamaized.net/exp=1648011624~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2141%2F27%2F685705714%2F3163162730.mp4~hmac=717c2c1698781f30c6a87d148fe45f41ba3a96e66af419198b327f0fc015bb69/vimeo-prod-skyfire-std-us/01/2141/27/685705714/3163162730.mp4'
where style_no = 3;
UPDATE style
SET videourl='https://vod-progressive.akamaized.net/exp=1647852920~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F947%2F7%2F179738694%2F586744338.mp4~hmac=c7c6925cff84805d0983b6bfc341f8a8ad26419a30ed154da1cafd82f58a410d/vimeo-prod-skyfire-std-us/01/947/7/179738694/586744338.mp4?filename=Puppy+-+4740.mp4'
where style_no = 4;
UPDATE style
SET videourl='https://vod-progressive.akamaized.net/exp=1647853002~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1426%2F16%2F407130953%2F1743906140.mp4~hmac=feb1df573750cf3c396914be37f25d2d662163e35f3bfd94fbaf2e709b31a7d5/vimeo-prod-skyfire-std-us/01/1426/16/407130953/1743906140.mp4?filename=Moon+-+35455.mp4'
where style_no = 5;
