-- 지브리 테이블
create table movierent(
	no			number		primary key,
	name 		varchar2(150)	not null,
	category 	number		not null,
	price 		number		not null,
	usepeople 	number		not null,
	casting 	varchar2(150),
	img 		varchar2(50),
	info 		varchar2(500)
);

select * from ghiblirent;
drop table movierent;

-- DB에 데이터 추가
insert into movierent values(1,'올빼미',1,14900,3,
                            '류준열, 유해진','img01.jpg','맹인이지만 뛰어난 침술 실력을 지닌 ‘경수’는
                            어의 ‘이형익’에게 그 재주를 인정받아 궁으로 들어간다.');
insert into movierent values(2,'젠틀맨',1,14900,4,'주지훈,박성웅,최성은','img02.jpg','지금 제가 검사인 상황...인 거죠?”');
insert into movierent values(3,'압꾸정',1,9900,2,
                            '마동석, 정경호, 오나라, 최병모','img03.jpg',
                            '샘솟는 사업 아이디어와 타고난 말빨의 압구정 토박이 ‘대국’(마동석)은
                            한때 잘나가던 실력 TOP 성형외과 의사 ‘지우’(정경호)를 만나게 된다.');
insert into movierent values(4,'데시벨',3,7920,1,'
                            김래원, 이종석, 정상훈, 박병은, 이상희, 조달환, 차은우, 이민기',
                            'img04.jpg','거대한 굉음과 함께 단독 주택이 폭발했다는 뉴스 속보가 전해진다.');
insert into movierent values(5,'동감',1,10890,5,'
                            여진구, 조이현, 김혜윤, 나인우, 배인혁','img05.jpg','
                            1999년, 용은 첫눈에 반하게 된 한솔을 사로잡기 위해
                            친구에게 HAM 무전기를 빌린다.');
insert into movierent values(6,'지옥의 화원',1,9900,11,'
                            나가노 메이, 히로세 아리스','img06.jpg',
                            '압도적 격투 능력만 있다면 최강의 여직원으로 칭송 받는 대양아치의 시대...');
insert into movierent values(7,'크리스마스 캐럴',2,10890,6,'박진영, 김영민, 김동휘, 송건희, 허동원','img07.jpg','크리스마스 아침, 쌍둥이 동생 ‘월우’가 죽은 채로 발견된다');
insert into movierent values(8,'폴: 600미터',3,10890,8,'그레이스 펄튼, 버지니아 가드너','img08.jpg',    
                            '지상에서 가장 높은 600m 타워
                            내려갈 단 하나의 길이 끊겼다!');
insert into movierent values(9,'같은 속옷을 입는 두 여자',1,5000,3,
                            '임지호, 양말복, 정보람','img09.jpg',
                            '여느 날과 다름없이 다투던 중,
                            마트 주차장에서 ‘수경’이 탄 차가 ‘이정’을 덮치는 사고가 발생한다.');
insert into movierent values(10,'자백',2,7920,8,
                            '소지섭, 김윤진, 나나','img10.jpg',
                            '불륜 사실을 폭로하겠다는 협박을 받고 향한 호텔에서 의문의 습격을 당한 유민호(소지섭).
                            정신을 차려보니 함께 있던 김세희(나나)는 죽어있고, 범인은 흔적도 없이 사라졌다.');
insert into movierent values(11,'한산 리덕스',1,9900,21,
                            '박해일, 변요한, 안성기, 손현주, 김성규, 김성균, 김향기, 택연, 공명, 박지환, 조재윤',
                            'img11.jpg','임진왜란 발발 후 15일만에 한양을 빼앗긴 절체절명의 위기에 놓인 조선.');
insert into movierent values(12,'공조2: 인터내셔날',3,10890,1,
                            '현빈, 유해진, 윤아, 다니엘 헤니, 진선규','img12.jpg',
                            '남한으로 숨어든 글로벌 범죄 조직을 잡기 위해...');
insert into movierent values(13,'리멤버',1,10890,23,
                            '이성민, 남주혁','img13.jpg',
                            '뇌종양 말기, 80대 알츠하이머 환자인 한필주. 일제강점기 때 친일파들에게 가족을 모두 잃었다.');
insert into movierent values(14,'인생은 아름다워',1,7920,3,'류승룡, 염정아, 박세완, 옹성우','img14.jpg',
                            '무뚝뚝한 남편 ‘진봉’과 무심한 아들 딸을 위해 헌신하며 살아온 ‘세연’은
                            어느 날 자신에게 시간이 얼마 남지 않았다는 것을 알게 된다.');
insert into movierent values(15,'헤어질 결심',2,6435,6,
                            '박해일, 탕웨이, 이정현, 고경표','img15.jpg',
                            '담당 형사 해준(박해일)은 사망자의 아내 서래(탕웨이)와 마주하게 된다');
insert into movierent values(16,'정직한 후보2',3,9900,1,'라미란, 김무열, 윤경호','img16.jpg',
                            '서울시장 선거에서 떨어지며 쫄딱 망한 백수가 된 주상숙은
                            우연히 바다에 빠진 한 청년을 구한 일이 뉴스를 타며
                            고향에서 화려한 복귀의 기회를 잡는다');
insert into movierent values(17,'육사오(6/45)',3,7623,3,
                            '고경표, 이이경, 음문석, 박세완, 이순원, 곽동연, 김민호','img17.jpg',
                            '우연히 1등 당첨 로또를 주운 말년 병장 ‘천우’.
                            심장이 터질듯한 설렘도 잠시, 순간의 실수로 바람을 타고 군사분계선을 넘어간 로또.');
insert into movierent values(18,'경관의 피',1,5720,18,'조진웅, 최우식, 박희순, 권율, 박명훈','img18.jpg',
                            '광역수사대 반장 강윤(조진웅)의 팀에
                            어느 날 뼛속까지 원칙주의자인 신입경찰 민재(최우식)가 투입된다.');
insert into movierent values(19,'이상한 나라의 수학자',1,5720,3,
                            '최민식, 김동휘','img19.jpg',
                            '학문의 자유를 갈망하며 탈북한 천재 수학자 이학성(최민식)');
insert into movierent values(20,'브로커',2,7700,2,
                            '송강호, 강동원, 배두나, 아이유, 이주영','img20.jpg',
                            '세탁소를 운영하지만 늘 빚에 시달리는 상현(송강호)과
                            베이비 박스 시설에서 일하는 보육원 출신의 동수(강동원).');
insert into movierent values(21,'대무가',3,7623,1,
                            '박성웅, 양현민, 류경수, 서지유, 정경호','img21.jpg',
                            '유아독존 신빨 대신 술빨로 버티는 40대 마성의 무당');

commit;

-- 예약 정보 테이블 
create table moviereserve(
	reserveno	number		primary key,
	no			number		not null,
	id			varchar2(50)	not null,
	qty			number		not null,
	dday		number		not null,
	rday		varchar2(50)	not null,
	usein		number		not null,
	usewife		number		not null,
	useseat		number		not null,
	usenavi		number		not null
);

-- 시퀀스 만들기
CREATE SEQUENCE  moviereserve_seq  MINVALUE 1 MAXVALUE 9999 INCREMENT BY 1 START WITH 63 NOCACHE  NOORDER  NOCYCLE;



select * from movierent natural join moviereserve
where sysdate < to_date(rday,'YYYY-MM-DD') AND id='abc';
