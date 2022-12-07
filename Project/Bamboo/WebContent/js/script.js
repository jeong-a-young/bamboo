// 회원가입 시 비밀번호 일치 확인
$(function(){
    $('#password').keyup(function() {
      $('#pwdCheck').html('');
    });

    $('#password_check').keyup(function() {

        if($('#password').val() != $('#password_check').val()){
          $('#pwdCheck').html('비밀번호가 일치하지 않습니다.');
          $('#pwdCheck').css('color', '#e30000');
        } else{
          $('#pwdCheck').html('비밀번호가 일치합니다.');
          $('#pwdCheck').css('color', '#7DB249');
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
function answerEdit(answer_idx, acontent){
	$('#comment'+answer_idx).html('<textarea>' + acontent + '</textarea>');
    
    $('#abt'+answer_idx).html(
        "<a onclick='answerEditSave("+answer_idx+")' id='btnEdit'>완료</a> "
    );
}