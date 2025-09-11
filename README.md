<img width="100" height="100" alt="스크린샷 2024-04-16 오후 8 29 36" src="https://github.com/HyungGeun94/DingDong/assets/152036928/9067724e-1eb8-435c-a226-27d27f588f82"> 

# DingDong

프로젝트 기간 : 2024/1/23 ~ 2024/03/08(45일)

조원: 전형근, 임새별, 김지혜, 한승현, 황정우

주제 : 개발자 커뮤니티 클론 코딩 (OKKY)

특징 : spring legacy 기반 mybatis,jsp,xml 프로젝트

---


## 구현 기능

**전형근:** 게시판 전체적인 구성 (좋아요, 싫어요, 스크랩, 페이징, 검색, 신고 등)

~~임새별: 관리자, 회원, 예약, 결제, 쪽지, 알림~~  

~~김지혜: 예약, 리뷰~~  

~~한승현: 계층형 댓글~~  

~~황정우: 프론트엔드~~


---


## 구현 화면


<img src="https://github.com/HyungGeun94/DingDong/assets/152036928/b7583708-a3ca-4867-87fa-8aa154602849" width="400" height="300">
<img src="https://github.com/HyungGeun94/DingDong/assets/152036928/66988f61-5fef-4854-8597-de9b14b77eae" width="400" height="300">
<img src="https://github.com/HyungGeun94/DingDong/assets/152036928/1289aff2-d057-4620-96ef-55a1b6a57bc7" width="400" height="300">
<img src="https://github.com/HyungGeun94/DingDong/assets/152036928/32171336-7116-4183-91f1-13d10d778103" width="400" height="300">


---
## 전체 ERD
  
<img src="https://github.com/HyungGeun94/DingDong/assets/152036928/1e85df8c-09ab-4ae9-8d11-b46cee168e99" width="500" height="300">

## JOB LIST ( 게시판 파트 - 전형근 )


<img src="https://github.com/HyungGeun94/DingDong/assets/152036928/0555c741-23d8-4296-9668-398cebf59ef1" width="500" height="300">





## MyBatis Mapper ( 게시판 부분 쿼리)

```xml
<!--    생성(c)-->

    <insert id="insert">
        <selectKey keyProperty="boardNum" resultType="int" order="AFTER">
            SELECT MAX(board_num) FROM community_board
        </selectKey>

        insert into community_board (title, content, nickname, id,membership,category)

        values (#{title},#{content},#{nickname},#{id},#{membership},#{category});

    </insert>
<!--    읽기(r)-->

    <select id="read" resultType="CommunityVO">
        select board_num, title, content, c.nickname, c.id, c.reg_date, views, reply, good, bad, notice, edit, edit_date, c.del, c.del_date, c.report, c.jjim, shareurl, membership, category, blind, m.profile,m.idx as member_idx
		from community_board c
        join member m
        on c.id = m.id
        where c.del=0 and c.notice = 0 and c.blind=0 and board_num=#{boardNum}
    </select>



<!--    수정(U)-->

    <update id="update">
        update community_board
        set title=#{title},content=#{content},notice=#{notice},edit=1,edit_date=now(),del=#{del},del_date=#{delDate},membership=#{membership},category=#{category}
        where board_num=#{boardNum}
    </update>

    <update id="goodPlus">
        update community_board
        set good=good+1
        where board_num=#{goodPlus}

    </update>

    <update id="goodDown">
        update community_board
        set good=good-1
        where board_num=#{goodDown}

    </update>

    <update id="badPlus">
        update community_board
        set bad=bad+1
        where board_num=#{badPlus}

    </update>

    <update id="badDown">
        update community_board
        set bad=bad-1
        where board_num=#{badDown}

    </update>

    <insert id="jjimUp" parameterType="kr.co.dingdong.domain.JjimDTO" >

        insert into community_jjim ( board_num, member_idx, jjim)
        values (#{boardNum},#{memberIdx},1);

    </insert>

    <update id="jjimCountUp">
        update community_board
        set jjim=jjim+1
        where board_num=#{boardNum}

    </update>

    <update id="jjimCountDown">
        update community_board
        set jjim=jjim-1
        where board_num=#{boardNum}

    </update>

    <delete id="jjimDelete" parameterType="kr.co.dingdong.domain.JjimDTO">
        delete from community_jjim
        where board_num = #{boardNum} and member_idx = #{memberIdx}
    </delete>

<!--    삭제(d)라고 쓰고 업데이트라고 부른다.-->
    <delete id="delete">

        update community_board
        set del=1, del_date=now()
        where board_num=#{boardNum}

    </delete>




<!-- 리스트(L)-->

    <select id="count" parameterType="hashMap" resultType="int">

        select count(board_num) from community_board

        where del=0 and notice=0 and blind=0 and


        <if test='searchType.equals("title")'>
            title like concat('%',#{keyword},'%')
        </if>

        <if test='searchType.equals("content")'>
            content like concat('%',#{keyword},'%')
        </if>

        <if test='searchType.equals("title_content")'>
            title like concat('%',#{keyword},'%') or content like concat('%',#{keyword},'%')
        </if>

        <if test='searchType.equals("id")'>
            id like concat('%',#{keyword},'%')
        </if>


    </select>


    <select id="onePage" parameterType="hashMap" resultType="CommunityVO">

        select * from community_board
        where del=0 and notice=0 and blind=0 and


        <if test='searchType.equals("title")'>
            title like concat('%',#{keyword},'%')
        </if>

        <if test='searchType.equals("content")'>
            content like concat('%',#{keyword},'%')
        </if>

        <if test='searchType.equals("title_content")'>
            title like concat('%',#{keyword},'%') or content like concat('%',#{keyword},'%')
        </if>

        <if test='searchType.equals("id")'>
            id like concat('%',#{keyword},'%')
        </if>
				
        order by board_num desc
        limit #{displayPost},#{postNum};
    </select>

    <update id="views">
        update community_board
        set views=views+1
        where board_num=#{boardNum}

    </update>



	<select id="listAll" resultType="CommunityVO">
		select board_num, title, content, c.nickname, c.id, c.reg_date, views, reply, good, bad, notice, edit, edit_date, c.del, c.del_date, c.report, jjim, shareurl, membership, category, blind,m.profile, m.profile from community_board c
		join member m
		on c.id = m.id
		where c.del=0 and c.notice = 0 and c.blind=0
		order by reg_date desc
        limit 5
	</select>

    <select id="listAllByviews" resultType="CommunityVO">
        select board_num, title, content, c.nickname, c.id, c.reg_date, views, reply, good, bad, notice, edit, edit_date, c.del, c.del_date, c.report, jjim, shareurl, membership, category, blind, m.profile, m.idx as member_idx from community_board c
        join member m
        on c.id = m.id
        where c.del=0 and c.notice = 0 and c.blind=0
        order by views desc
        limit 5
    </select>

    <select id="listAllBygood" resultType="CommunityVO">
        select board_num, title, content, c.nickname, c.id, c.reg_date, views, reply, good, bad, notice, edit, edit_date, c.del, c.del_date, c.report, jjim, shareurl, membership, category, blind, m.profile, m.idx as member_idx from community_board c
        join member m
        on c.id = m.id
        where c.del=0 and c.notice = 0 and c.blind=0
        order by good desc
        limit 5
    </select>

    <select id="listAllBynotice" resultType="CommunityVO">
        select board_num, title, content, c.nickname, c.id, c.reg_date, views, reply, good, bad, notice, edit, edit_date, c.del, c.del_date, c.report, jjim, shareurl, membership, category, blind, m.profile, m.idx as member_idx from community_board c
        join member m
        on c.id = m.id
        where c.del=0 and c.notice = 1 and c.blind=0
        order by reg_date desc
        limit 5
    </select>

    <select id="jjimCheck" parameterType="kr.co.dingdong.domain.JjimDTO" resultType="int">
        select count(*) from community_jjim where member_idx=#{memberIdx} and board_num=#{boardNum}


    </select>

    <select id="jjimList" parameterType="int" resultType="kr.co.dingdong.domain.CommunityVO">


        select c.title,c.content,c.nickname,c.id,c.reg_date,c.views,c.reply,c.good,c.bad,c.notice,c.edit,c.edit_date,c.del,c.del_date,c.report,
        c.jjim,c.shareurl,c.membership,c.category,c.blind,c.profile,j.member_idx,j.idx,c.board_num, m.idx as member_idx
        from community_board c join community_jjim j on c.board_num = j.board_num where c.del=0 and c.notice=0 and c.blind=0 and j.member_idx=#{memberIdx} order by reg_date desc;

    </select>

    <insert id="report" parameterType="kr.co.dingdong.domain.ReportDTO">

        INSERT INTO community_report
        (board_num, reporter, reportee, context)
        VALUES (#{boardNum},#{reporter},#{reportee},#{context});
    </insert>



    <update id="reportupdate">
        UPDATE community_board
        SET	report=report+1
        WHERE board_num = #{boardNum}
    </update>
    
      <select id="noticeRead" resultType="CommunityVO">
        select board_num, title, content, a.nickname, c.id, c.reg_date, views, reply, good, bad, notice, edit, edit_date, c.del, c.del_date, c.report, jjim, shareurl, membership, category, blind, a.profile from community_board c
        join admin a
        on c.id = a.id
        where board_num=#{boardNum}
    </select>
    
	<select id="reporterCheck" parameterType="kr.co.dingdong.domain.ReportDTO" resultType="int">
        select count(*) from community_report where reporter=#{reporter} and board_num=#{boardNum}

    </select>
```

## 사용 도구

![Spring](https://img.shields.io/badge/spring_5.2.6_RELEASE-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white)



<img src="https://img.shields.io/badge/java 11-%23ED8B00?style=for-the-badge&logo=openjdk&logoColor=white">


<img src="https://img.shields.io/badge/mysql 8.0.33 -4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">

  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">

  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">

  <img src="https://img.shields.io/badge/jquery_latest -0769AD?style=for-the-badge&logo=jquery&logoColor=white">

  ![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat_9.0.84-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black)

  ![Bootstrap](https://img.shields.io/badge/bootstrap_5.0.2-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)




### 회고록
[![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)](https://purple-indigo-578.notion.site/DingDong-03fd42e685d54caaa6ed16234d1891f1)
