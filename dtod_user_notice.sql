show user;

desc tab;
-- 회원 테이블 시작 ======================================================================================
-- 잘못 만들었다면 member 테이블과 시퀀스 삭제
drop table member;
drop SEQUENCE MEMBER_IDX_SEQ;

-- admin 계정 insert 해주기
INSERT INTO member (id, address, birth, call, email, gender, name, password) VALUES ('admin', '구로구', '1120', '01012345678', 'dtod@gmail.com', 'm', '술결지기', 'admin');

-- insert가 잘 됐는지 확인하기
select * from member;

-- 위의 것들을 다 했다면 커밋하기
commit;
-- 회원 테이블 끝 ========================================================================================

-- 공지사항 테이블 ===========================================================================================
-- 테이블 생성이 잘 됐는지 확인
desc notice;

-- 잘못 만들었다면 아래 drop 해주기
drop table notice;
drop sequence NOTICE_IDX_SEQ_GEN;

-- insert 1번 ---------------------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate) 
    values(NOTICE_IDX_SEQ_GEN.nextval, 
                '술결: <개인정보처리방침> 개정 안내', 
                '안녕하세요. 술결입니다.

술결 <개인정보처리방침>에 아래와 같은 내용이 개정되어 안내해 드리니, 이용에 참고하여 주시기 바랍니다.

- 개정 시행일자: 2023년 2월 24일
- 개정 내용
1. 개인정보의 처리 위탁 업체 추가((주)네이버페이, (주)센드버드코리아)
2. "마케팅 및 광고"와 "맞춤형 서비스 제공"의 분리
3. 서비스 개선을 위한 통계의 목적으로 술결파티 이용 시 대화 내역 수집 및 보관(1년 후 또는 탈퇴 시 파기)


(변경 전)
제 5조 개인정보의 수집목적 및 이용목적

1항. 회사는 수집한 개인정보를 다음의 목적으로 활용합니다.
3) 마케팅 및 광고에 활용
- 신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스 유효성 확인, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 및 광고성 정보와 참여기회 제공

4) 맞춤 서비스 제공, 서비스 유지·관리 및 품질 향상, 신규 서비스 요소 발굴 및 개선 등
- 회사는 본 서비스의 일환으로 회원에게 앱푸시 등의 방법으로 맞춤형 콘텐츠를 추천할 수 있습니다. 회원은 언제든지 앱푸시 설정을 통하여 이를 거절할 수 있습니다.

(변경 후)
제 5조 개인정보의 수집목적 및 이용목적

1항. 회사는 수집한 개인정보를 다음의 목적으로 활용합니다.

3) 마케팅 및 광고에 활용
광고 게재, 앱푸시 등의 방법으로 맞춤형 콘텐츠의 추천, 이벤트 및 광고성 정보와 참여기회 제공 등을 위하여 접속 빈도, 회원의 서비스 이용에 대한 통계 등 개인정보를 이용합니다. 앱푸시의 경우 회원은 언제든지 앱푸시 설정을 통하여 이를 거절할 수 있습니다.

4) 맞춤형 서비스 제공에 활용
신규 서비스 개발 및 콘텐츠 추천 등 맞춤형 서비스 제공, 서비스 유지·관리 및 품질 향상, 통계학적 특성에 따른 서비스 제공 등의 방법으로 맞춤형 콘텐츠를 추천, 서비스 유효성 확인 등을 위하여 접속 빈도, 회원의 서비스 이용에 대한 통계 등 개인정보를 이용합니다.


(추가)
제 3조 수집하는 개인정보의 항목범위 및 수집 방법

2항. 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
7) 술결파티 이용 시 생성된 대화 내역은 서비스 개선을 위한 통계의 목적으로 수집할 수 있습니다.


제 9조 개인정보의 보관기간 및 이용기간

3항. 술결파티 이용 시 생성된 대화 내역은 서비스 품질 개선의 목적으로 1년간 보관되며, 그 후 즉시 파기됩니다.


제 7조 개인정보의 처리 위탁 및 국외 이전

1항. 개인정보의 처리 위탁은 아래와 같습니다.
9) 간편 결제를 통한 결제 대행
- 수탁업체: (주) 네이버파이낸셜
- 위탁업무 내용: 서비스 계약 이용을 위한 결제 처리 및 결제 도용 방지

10) 기술제공 및 지원
- 수탁업체: ㈜센드버드코리아
- 위탁업무 내용: 채팅 솔루션 기술제공 및 지원 등
- 개인정보 보유, 이용기간 : 6개월 이내 저장 후 즉시 파기



변경 적용일인 2023년 2월 24일 전까지 별도 의사표시가 없을 경우 <개인정보처리방침> 변경 사항에 동의하신 것으로 간주됩니다.

앞으로도 술결은 회원님들의 개인 정보를 안전하게 관리하기 위해 최선을 다하며, 편리하고 안정적인 서비스로 회원님들의 성원에 보답하겠습니다.

감사합니다.
술결 팀 드림', 
                '술결지기', 
                sysdate, sysdate);
                
-- insert 2번 -------------------------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate) 
    values(NOTICE_IDX_SEQ_GEN.nextval, 
                '술결 모바일 앱(iOS) 최소 지원 버전 업데이트 안내', 
                '안녕하세요. 술결입니다.

회원님들에게 안정적인 서비스를 제공해 드리기 위해 왓챠 모바일앱(iOS) 1.24.0, 왓챠 tvOS 1.2.0 버전부터는 iOS 15 이상의 버전에서 서비스를 이용하실 수 있는 점 안내 드립니다.

일정 수준 이상의 사용자 경험을 위해, iOS 15 미만을 사용하고 계신 분들께서는 iOS를 최신 버전으로 업데이트하신 후 이용해 주시길 바랍니다.

관련하여 문의사항이 있으신 경우 왓챠 고객센터로 연락 주시면 도움 드리겠습니다.

감사합니다.
술결 팀 드림', 
                '술결지기',
                sysdate, sysdate);
  
-- insert 3번 -------------------------------------------------------------------------             
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate) 
    values(NOTICE_IDX_SEQ_GEN.nextval, 
                '술결 PC 웹 브라우저 최소 지원 버전 업데이트 안내', 
                '안정적인 서비스 환경을 위해 12월 5일 부터 PC 웹 브라우저의 Widevine CDM이 업데이트될 예정이에요. 이로 인해 버전 107 미만의 브라우저에서는 재생이 불가해요.

사용 중인 웹 브라우저의 현재 버전 확인 후 최신 버전으로 업데이트해 주세요.

크롬: 주소창에 chrome://settings/help 입력 후 확인
웨일: 주소창에 whale://help 입력 후 확인
엣지: 주소창에 edge://settings/help 입력 후 확인
파이어폭스: 주소창에 about:preferences#general 입력 > Firefox 업데이트에서 확인

관련하여 궁금하신 점은 고객센터로 문의해 주세요.', 
                '술결지기',
                sysdate, sysdate);

-- insert 4번  -----------------------------------------------------------------------           
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate) 
    values(NOTICE_IDX_SEQ_GEN.nextval, 
                '술결, 크롬캐스트 기능 지원!', 
                '오래 기다리셨죠? 알아요...
드디어 술결에 크롬캐스트 기능이 추가되었어요!

술결에 매주 업데이트 되는 좋은 영화, 드라마들을 이제 크롬캐스트로 TV에서도 마음껏 감상해 보세요 :)
(크롬캐스트는 TV의 HDMI 포트에 연결해 사용하는 장치로, 크롬캐스트에 대한 자세한 내용은 이곳을 눌러 확인해보세요. Google Cast 기능이 있는 Android TV 기기들에서도 사용할 수 있어요.)

크롬캐스트를 이용하기 위해선 술결를 최신 버전으로 업데이트하셔야 해요.
아래 버튼을 눌러 스토어로 들어간 다음, "업데이트" 버튼이 상단에 있다면 업데이트 해주세요.

이제, 큰 화면에서 더욱 풍부하게 즐기세요.', 
                '술결지기',
                sysdate, sysdate);                

-- insert 5번 --------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate)
    values(notice_idx_seq_gen.nextval,
                '술결 서비스 이용약관 개정',
                '안녕하세요. 술결입니다.

술결 서비스 약관이  아래와 같이 개정되어 안내 드리니, 이용에 참고하여 주시기 바랍니다.

1. 개정 시행일자 : 2018년 10월 31일

2. 세부 개정 내용

7조 (미성년자 이용계약에 관한 특칙)(추가)
- 회사는 만 19세 이하의 미성년이용자가 유료서비스를 이용하고자 하는 경우에 부모 등 법정 대리인의 동의를 얻거나, 계약체결 후 추인을 얻지 않으면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있다는 내용을 계약체결 전에 고지하는 조치를 취합니다. 다만, 미성년자가 속임수로써 자기를 성년자로 믿게 하거나 법정대리인의 동의가 있는 것으로 믿게 한 경우에는 취소할 수 없습니다.
- 전 항과 관련하여 당사자가 미성년자인지 여부는 결제가 진행된 모바일 기기, 결제 실행자의 정보, 결제 수단의 명의자 등을 근거로 하여 종합적으로 판단합니다. 또한 회사는 정당한 취소권의 행사인지 여부를 확인하기 위하여 미성년자 및 법정대리인임을 증명할 수 있는 서류의 제출을 요청할 수 있습니다.

13조 2항 유료서비스 예약 변경, 즉시 변경 등(개정)
- 예약 변경의 경우, 회원이 변경 요청한 달의 이용기간이 만료되는 날까지 기존 구매/가입한 이용권을 이용할 수 있으며, 이용기간 만료일 익일부터 변경 요청한 이용권으로 변경 적용됩니다. 다만 타사 계정을 결제 수단으로 사용하여 결제한 경우 해당 타사의 정책을 따릅니다.

14조 10항 유료서비스 이용 중 회원 탈퇴(개정)
- 유료서비스를 이용 중인 유료회원이 탈퇴하는 경우 해당 이용권은 즉시 해지되며 환불은 불가능합니다. 이 경우 유료회원의 정보와 왓챠플레이 이용내용은 관련 법령이 정하는 경우를 제외하고는 왓챠 약관 및 이 약관에 따라 처리됩니다. 다만 타사 계정을 결제 수단으로 사용하여 구독한 경우, 해당 타사를 통해서 해지해야 할 수도 있습니다. 

변경된 술결 서비스 이용약관 내용에 대한 문의사항이 있으신 경우, 술결 고객센터(dtod@gmail.com)로 문의 주시면 친절하게 안내해드리겠습니다.
더욱 편리하고 안정적인 서비스로 회원님의 성원에 보답하겠습니다.

감사합니다.

술결 팀 드림',
            '술결지기',
            sysdate, sysdate);
 
 -- insert 6번 ------------------------------------------------------------------------       
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate)
    values(notice_idx_seq_gen.nextval,
                '<리틀 드러머 걸: 감독판> 전 세계 최초 공개!',
                '박찬욱 감독의 첫 드라마 <리틀 드러머 걸: 감독판>
3월 29일 오직 술결에서, 전 세계 최초 공개합니다. 

# 존 르 카레 소설 원작 
“청소년 시절부터 존 르 카레의 오랜 팬이었다. "리틀 드러머 걸"을 읽자마자 존 르 카레의 작품 중 가장 위대한 작품이라고 결론 내릴 수 있었다.” 
박찬욱 감독이 오랫동안 열망한 거장의 문학, 그 방대한 서사를 온전히 담아낸 6부작 미니시리즈가 드디어 술결에 도착했어요. 

# 박찬욱 감독이 선택한 배우, 완벽한 앙상블 
<레이디 맥베스>의 플로렌스 퓨, <빅 리틀 라이즈>의 알렉산더 스카스가드, <셰이프 오브 워터>의 마이클 섀넌 등 실력파 배우들이 완성한 강렬한 연기 앙상블, 기대하셔도 좋아요.

# 오직술결에서만, 감독판 공개!
“술결은 <리틀 드러머 걸: 감독판>을 제약 없이 그대로 보여줄 수 있는 플랫폼이자, 내 작품을 가장 좋아할 사람들에게 잘 보여줄 수 있는 곳이다" 
감독판은 방송판과 비교하여 여러 제한에 따라 제외된 다수의 장면을 포함하고 있으며, 음악과 색, 카메라 앵글 하나까지 감독의 연출 의도를 온전히 담아낸 버젼이에요. 

박찬욱 감독의 놀라운 미니시리즈 데뷔작,
지금 바로 술결에서 만나보세요.',
            '술결지기',
            sysdate, sysdate);

-- insert 7번 -----------------------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate)
    values(notice_idx_seq_gen.nextval,
                '<킬링 이브> 술결 공개!',
                ' 각종 유명 상들을 휩쓴 화제작!
2019 골든 글로브 여우주연상을 거머쥔 산드라 오, BAFTA 여우주연상을 받은 조디 코머, BAFTA 베스트 드라마 시리즈에 선정! 세간의 주목을 받으며, 각종 유명상을 휩쓸고 온 화제작이에요. 

대중에게 인정받은 최고의 작품!
로튼 토마토 신선도 지수 96%, IMDB 평점 8.3으로 대중에게 작품성까지 인정받은 작품이에요. 위트있는 대사와 심장 쫄깃한 전개로 많은 시청자들을 사로잡았어요!

기존 첩보물에서 볼 수 없었던 경쾌하고 세련된 추적 스릴러, 지금 바로 술결에서 감상하세요!

술결 팀 드림',
            '술결지기',
            sysdate, sysdate);

-- insert 8번 -----------------------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate)
    values(notice_idx_seq_gen.nextval,
                '술결 프리미엄 이용권 출시!',
                '술결, 이제 프리미엄으로 즐기세요! 
온 가족이 모두, Ultra HD 4K 화질로 이용하실 수 있습니다.

프리미엄 이용권은 최대 Ultra HD 4K 화질로 4대의 디바이스에서 동시 재생 가능하며, 100개의 영상을 다운로드하여 저장할 수 있어요.

지금 마이페이지 설정에서 이용권 상세 정보 확인하고
프리미엄 이용권으로 업그레이드 해보세요! 

고맙습니다.
술결 팀 드림',
            '술결지기',
            sysdate, sysdate);
            
-- insert 9번 ------------------------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate)
    values(notice_idx_seq_gen.nextval,
                'CPT 스토어 종료 및 CPT 프로젝트 중단 안내',
                '안녕하세요 CPT 스토어를 운영하는 콘텐츠 프로토콜 팀입니다.
지속되는 암호화폐 규제에 대한 불확실성과 사업적인 전망의 부족으로 인하여 CPT 프로젝트가 중단될 예정임을 공지드립니다.

CPT 프로젝트가 중단됨에 따라, 기존에 보유하고 계신 CPT와 CPT 리워드는 소멸될 예정이며,
아래 방법에 따라 현재 보유하고 있는 CPT를 저희에게 보내주시면, 정해진 비율에 따라 이더리움 암호화폐(ETH)로 교환해드립니다.

>>보유한 CPT와 CPT 리워드를 ETH로 교환하는 방법 관련하여 아래 안내를 확인 부탁드립니다:
?
ETH 지급 절차와 관련된 문의 사항은 dtod@gmail.com으로 부탁드립니다.
**현 시점 이후로 CPT 스토어에서 타 상품과의 교환은 불가하며, 2023년 11월 29일 오후 1시에 CPT 스토어도 종료될 예정입니다.

지금까지 CPT 스토어와 콘텐츠 프로토콜 프로젝트를 지지해주신 모든 분들께 감사드립니다.
콘텐츠 프로토콜 팀 드림',
            '술결지기',
            sysdate, sysdate);

-- insert 10번 -----------------------------------------------------------------------------------
insert into notice(nobno, notitle, nocontent, nowriter, nodate, noupdate)
    values(notice_idx_seq_gen.nextval,
                '종료 예정작 공지 방식 변경 안내',
                '안녕하세요, 술결입니다.
종료 예정작 공지 관련하여 안내드립니다.

콘텐츠 권리사의 요청으로 종료되는 작품을 더 정확하고 빠르게 안내하기 위해 공지 방식을 아래와 같이 변경합니다.

[변경 전]
종료 6일 전, 콘텐츠 개별 페이지 내 표기
매월 공지사항을 통한 종료작 타이틀 안내

[변경 후]
종료 14일 전, 콘텐츠 개별 페이지 내 표기
종료 예정작의 추천 로직을 통해 홈 리스트 개인화 노출

술결은 더 좋은 콘텐츠와 서비스를 제공할 수 있도록 계속 노력하겠습니다.

고맙습니다.
술결 팀 드림',
            '술결지기',
            sysdate, sysdate);
          
-- insert 한 내용들을 배로 늘려주는 작업
insert into notice (nobno, notitle, nocontent, nowriter, nodate, noupdate)
(SELECT NOTICE_IDX_SEQ_GEN.nextval, notitle, nocontent, nowriter, nodate, noupdate from notice);

-- 값이 잘 들어갔는지 확인하기
select * from NOTICE;

-- 위의 작업들을 다 했다면 commit 해주기
commit;
-- 공지사항 테이블 끝 =======================================================================================