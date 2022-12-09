// 회원가입 시 비밀번호 일치 확인
$(function(){
    $('#password').keyup(function() {
      $('#password_check_p').html('');
    });

    $('#password_check_input').keyup(function() {

        if($('#password').val() != $('#password_check_input').val()){
          $('#password_check_p').html('비밀번호가 일치하지 않습니다.');
          $('#password_check_p').css('color', '#e30000');
        } else{
          $('#password_check_p').html('비밀번호가 일치합니다.');
          $('#password_check_p').css('color', '#7DB249');
        }

    });
});

// 검색창을 눌렀을 때 shadow 효과
$("#search_box").click (
    function() {
        $(this).css('box-shadow', '0px 3px 10px 0.1px #999');
    }
);

$("#login_btn").hover (
    function() {
        $(this).css('box-shadow', '0px 3px 10px 0.1px #999');
    }
);

// 메뉴창에 hover 했을 때 slide 효과
$(".mainMenu > li").hover (
    function() {
        $(this).children("#major_type").stop().slideDown("slow");
    },
    function() {
        $(this).children("#major_type").stop().slideUp("slow");
    }
);

// 댓글 수정 시 textarea로 변환 효과
function answerEdit(postId, answer_idx, acontent){
	$('#comment'+answer_idx).html('<textarea name="editTextarea">' + acontent + '</textarea>');
	$('#editBtn' + answer_idx).after("<button id='okBtn'>확인</button>");
	$('#editBtn' + answer_idx).remove();
	$("#deleteBtn" + answer_idx).remove();
	$("#okBtn").attr("formaction", "/commentEdit?postId=" + postId + "&commentId=" + answer_idx);
    
    $('#abt'+answer_idx).html(
        "<a onclick='answerEditSave("+answer_idx+")' id='btnEdit'>완료</a> "
    );
}

// 로그인 화면 애니메이션
let container = document.getElementById('container')

toggle = () => {
  container.classList.toggle('sign-in')
  container.classList.toggle('sign-up')
}

setTimeout(() => {
  container.classList.add('sign-in')
}, 200)