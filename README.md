# **MOCA** 

_**모**여서 **카**페가자_
 
회원이 등록한 일정 중 비어있는 시간, 예를 들어, _'공강'_, _'개인 휴식 시간'_ 과 같은 때에    
해당 시각의 할인 일정이 있는 **카페의 할인 정보**를 **회원에게 제공**하며,  
**회원 간 모임**을 만들어 함께 **카페 예약**까지 할 수 있는 시스템  

> 한국기술직업교육전문학교에서 20일간 진행한 최종 4인 프로젝트입니다.

<br/>

|**개발환경**|-|-|**기능**|-|
|---|---|---|---|---|
|JAVA 8|BootStrap||회원|Security를 활용하여 로그인|
|STS 3|JQuery|||일정 등록 및 관리|
|Spring MVC Project||||모임 생성 및 카페 예약|
|Spring Security|||카페|할인 목록|
|Spring Web Socket||||좋아요|
|MySQL|||리뷰|
|MyBatis|||게시판|공지 게시판|
|HikariCP||||카페 목록|
|Kakao map|Google Calendar||실시간|채팅 및 알림|



<br/>
<br/>

## 구현 목표와 기능

**사용자 편의성에 최선을 다하기!**
- 최대한 ajax 사용
- Rest API
- 오픈 소스 사용
- 직접 테이블 생성
- 무한 스크롤 
- 다양한 검색 조건 활용

**구현 목록**
- 카페 목록 무한스크롤
- 카페 상세 페이지
- 카페 조건 별 검색
- 카페 좋아요 


<br/>
<br/>

## 담당 파트 : CAFE

<br/>

|Controller & DAO & View| Service & VO|
|---|---|
|![image](https://user-images.githubusercontent.com/107228166/196018534-2d276ca7-458b-4ca9-b0b3-24c12c38fd61.png)|![cafe2](https://user-images.githubusercontent.com/107228166/195884834-1c1b36b3-58a7-4e67-8b77-1d55166ebd98.png)|

<br/>

MVC 패턴에 맞춰 패키지를 구성하고 클래스를 작성  


<br/>
<br/>

## 데이터베이스

<br/>

![EERDiagram](https://user-images.githubusercontent.com/107228166/195885219-0b464bdc-3365-4c3f-953b-db71e092166d.png)

<details>
    <summary>테이블 생성문 보기</summary>

    CREATE TABLE `tbl_cafe`(
        no INT AUTO_INCREMENT,							
        name VARCHAR(45) NOT NULL,
        post VARCHAR(45) NOT NULL,
        addr VARCHAR(45) NOT NULL,
        addr_detail VARCHAR(45) NOT NULL,
        owner_no INT NOT NULL,
        regdate TIMESTAMP NOT NULL DEFAULT now(),		
        likenum INT DEFAULT 0,
        content VARCHAR(200),
        photo_url VARCHAR(100),
        tag VARCHAR(45),
        flag VARCHAR(45),
        PRIMARY KEY(no),								
        FOREIGN KEY(owner_no) REFERENCES tbl_member(no)	
    );

    CREATE TABLE IF NOT EXISTS `tbl_cafe_like`(		
        cno INT,
        mno INT,
        PRIMARY KEY(cno,mno),
        FOREIGN KEY(cno) REFERENCES tbl_cafe(no),
        FOREIGN KEY(mno) REFERENCES tbl_member(no)
    );

    CREATE TABLE `tbl_cafe_menu`(
        no INT AUTO_INCREMENT,
        cafe_no INT NOT NULL,
        name VARCHAR(45) NOT NULL,
        price VARCHAR(45) NOT NULL,
        discount VARCHAR(45) NOT NULL,
        photo_url VARCHAR(100),
        PRIMARY KEY(no),
        FOREIGN KEY(cafe_no) REFERENCES `tbl_cafe`(no)
    );
</details>

<br/>

좋아요 기능을 구현할 때, **카페와 멤버 테이블은 N:M 관계**이다.  
논리적으로는 회원 'Spring'은  카페 'Acafe', 'Bcafe', 'Ccafe' 를  
좋아요해도 아무 이상 없지만, 테이블에선 카페와 멤버 두 테이블 모두  
구분되는 자원이 **기본 키 제약으로 인하여 단 하나만 존재해야 된다**.  
테이블에서는 ['Acafe', 'Bcafe', 'Ccafe'] 와 같은 **배열도 저장할 수 없는 것으로 안다**.  
그러므로 다대다 관계를 해소하기 위한 `tbl_cafe_like` 테이블을 생성했다.  

기본 키를 `likeno` 컬럼으로 하지말고, `cno`,`mno` 컬럼을  
복합 키로 생성했어도 될 것 같다.  

<br/>
<br/>

## PPT 자료와 설명

**전체 PPT 보기** : https://prezi.com/view/tRGqEhVyhtKWkLSLz04l/

<!-- 카페 메인 페이지 -->
![image](https://user-images.githubusercontent.com/107228166/196025562-6ffba116-5795-43e4-bcc8-f69e11a696c3.png)
<br/>

<!-- 카페 메인 페이지 설명 -->
![image](https://user-images.githubusercontent.com/107228166/196025581-b1684863-677f-4860-8cf8-bd3836c25b19.png)
<br/>

<!-- 카페 상세 페이지 -->
![image](https://user-images.githubusercontent.com/107228166/196025606-49e07020-0fa3-4cb4-a1a3-6731a29e1675.png)
<br/>

<!-- 카페 상세 페이지 위치, 메뉴, 리뷰 -->
![image](https://user-images.githubusercontent.com/107228166/196025626-5e0f63ce-1b0d-4a60-8d5f-d173709eb14b.png)
<br/>

<!-- 카페 상세 페이지 위치 API 설명 -->
![image](https://user-images.githubusercontent.com/107228166/196025629-7f5b3e41-6d6b-40c7-97f2-f59a37095335.png)
<br/>

<!-- 카페 상세 페이지 메뉴 설명 -->
![image](https://user-images.githubusercontent.com/107228166/196025642-dca0a6cd-876f-4c3d-9e40-d4f5fbb63db1.png)
<br/>

<!-- 조건별 검색 기능 구현 -->
![image](https://user-images.githubusercontent.com/107228166/196025651-1a06892e-d44e-4ca5-b5ed-bc836b830fcd.png)
<br/>

**CafeProvider.class**

마이바티스에서 Provider를 사용하여 동적 쿼리 작성  

```java
public class CafeProvider {
    public String searchListByCri(CafeSearchVO vo) {
        // 완성된 SQL 객체는 toString 으로 반환하고,
        // 마이바티스가 이 SQL문을 실행 함.
        SQL sql = new SQL();

        // 정적 쿼리 미리 작성
        sql.SELECT("C.*", "S.start_date", 
          "S.end_date", "S.start_time", "S.end_time")
        .FROM("tbl_cafe C")
        .LEFT_OUTER_JOIN("tbl_cafe_schedule S 
                            on C.no = S.cno");
		
        // 검색의 기준이되는 객체, sql 객체 인자로 전달.
        // 동적 쿼리 sql을 만드는 메소드
        buildSqlByCafeSearchCri(sql, vo);
		
        // 일정한 수의 목록 출력을 위한 정적 쿼리
        sql.OFFSET("#{index}").LIMIT(4);	
        return sql.toString();
    }
	
    private void buildSqlByCafeSearchCri(SQL sql,CafeSearchVO vo){ 
        
        String addr = vo.getAddr_detail();
        String startDate = vo.getStart_date();
		
        // 검색시 주소로 작성했을 경우
        // Spring 에서 제공하는 StringUtils 클래스 사용
        // Not Null, Not Blank, Not White Space Only
        // 텍스트 존재 여부 확인.
        if(StringUtils.hasText(addr)) {
            sql.WHERE("C.addr_detail 
                LIKE CONCAT('%',#{addr_detail},'%')");
        }

	// 검색시 날짜로 입력했을 경우
        // 위의 주소가 있더라도 return 하지 않고
        // 날짜 검색 조건까지 적용할 수 있도록 구성
        // 시작 날짜만을 검증하고 조건문을 추가해줌.
        if(StringUtils.hasText(startDate)) {
            sql.WHERE("S.start_date <= #{start_date}",
                    "S.end_date >= #{end_date}",
                    "#{start_time} between 
                        (S.start_time and S.end_time)");
        }   
    }
}
```

<!-- 좋아요 기능 구현 -->
![image](https://user-images.githubusercontent.com/107228166/196025670-6a842883-5694-411d-ab7e-e09700c3763f.png)
<br/>
<br/>

**CafeLikeServiceImpl.update**

```java
// 데이터베이스 접근이 2회 이상 일어나므로
// 하나의 트랜잭션에 묶어서 처리
@Transactional
@Override

// 하트 눌렀을 경우 좋아요 update 처리
public void update(CafeLikeVO vo) {
    
    // 카페 번호와 회원 번호로 like 테이블 조회
    CafeLikeVO clvo = cafeLikeDao.likeCheck(vo);
    
    // 1) 한 번도 누르지 않은 사람인지 확인
    if(clvo == null) {
        cafeLikeDao.insertLike(vo);
        cafeDao.updatelikenum(vo.getCno());
        return;
    }
    
    // 2) 한 번 눌렀던 사람이라면 테이블에서 수정
    if(isChecked(clvo)) {
        cafeLikeDao.cancel(clvo);
        cafeDao.cancellikenum(vo.getCno());
    } else {
        cafeLikeDao.update(clvo);
        cafeDao.updatelikenum(vo.getCno());
    }
}

// 좋아요 체크 여부 검증
private boolean isChecked(CafeLikeVO vo) {
    return vo.getLike_check() == 1;
}
```

<!-- 좋아요를 눌렀을 때, 누른 상태에서 다시 눌러 해제할 때 상황을 간략히 설명 -->
**cafeDetail.jsp**
```java
// 좋아요 클릭 했을때의 view
// 좋아요 수, 아이콘 수정위해 PATCH문 사용  
$.ajax({
    url : "${path}/cafe/api/",
    method : "PATCH",
    data : {
        cno : cno,
        mno : mno
    },
    dataType : "text",
    success : function(result){
        // 하트를 이미 눌렀을 경우
        // 빈하트로 바꿔주고 라이크 수를 -1 시킴
        if($('#likeIcon').hasClass("bi-heart-fill")){
                $("#likeIcon").text(currentLikeNum - 1);}
        // 하트 누르지 않은 경우
        // 채운하트로 바꿔주고 라이크 수를 +1 시킴        
        else {$("#likeIcon").text(Number(currentLikeNum) + 1);}
        
        $('#likeIcon').toggleClass("bi-heart-fill bi-heart");
    }
}); 

```

<!-- 무한 스크롤 기능 구현 -->
![image](https://user-images.githubusercontent.com/107228166/196025684-a488f847-3ac3-4044-a400-ed77bc88fac1.png)
<br/>

<!-- 무한 스크롤 주요 코드 -->
![image](https://user-images.githubusercontent.com/107228166/196025696-41d4bf80-29d3-4268-b434-1379c5fd9634.png)
<br/>
<br/>

**cafeMain.jsp**
```java
//무한스크롤 view

$(function(){

    // 불러올 페이지
    var page =1;

    // 마우스 스크롤 시 실행되는 jQuery 함수
    $(window).scroll(function(){

    // window 객체 사용해서 값 구함
    let scrollTop = $(window).scrollTop();
    let windowHeight = $(window).height();
    let documentHeight = $(document).height();

    // 화면의 높이 + 스크롤 윗부분이 위치하고 있는 높이가
    // 문서 전체의 높이보다 크거나 같으면 데이터를 불러옴
    if(scrollTop + windowHeight+1 >= documentHeight){

        // 인덱스 값 4개씩 증가시킴
        index +=4;
    
        // 검색 조건 버튼을 눌렀을 경우 카페리스트를 다르게 출력하기 위해
        // 버튼 속성을 가져옴
        let btnid = $("#submit").attr("data-id");

        // 검색 버튼 눌렀을 경우
         if(btnid=="true"){
        // 검색조건에 따른 카페 리스트만 출력
            getCafeSearchList();

        // 검색 버튼 누르지 않은 경우      
         } else {
        // 카페 전체 리스트 출력
            getCafeList();
            }
        }
    }) 
});		
```
