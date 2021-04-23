<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


 <h3>1:1 문의</h3>
 	<form action='${path}/help/qnareply' method="POST">
    <div class="">
        <div id="recipient">
            <label style="font-size: large;">작성자</label>
            <input type="text" name="userId" value="${ loginMember.userId }" readonly>

    
        </div>
     <!--   <div id="recipient">
            <label style="font-size: large;">문의제목</label>
           
            <input type="text" name="" value="">
        </div> -->  
        <div id="attachFile">
            <label for="formFile" class="form-label">문의내용</label>
            <input class="wirte_file" type="file" id="writeimg" style="width: fit-content;">
        </div>
    </div>

        <div id="msgBody">
            <textarea cols="92" rows="15" placeholder="내용을 입력해주세요."
            style="resize: none;"  name="qnaReContent"></textarea>
        </div>
       

        <input type="button" value="취소">
        <input type="submit" value="저장하기">
 </form>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>