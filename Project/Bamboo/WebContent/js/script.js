// 회원가입 할 때 비밀번호 일치 확인
$(function(){
    $('#password').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#password_check').keyup(function(){

        if($('#password').val() != $('#password_check').val()){
          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
          $('#chkNotice').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice').html('비밀번호 일치함<br><br>');
          $('#chkNotice').attr('color', '#199894b3');
        }

    });
});

// 검색창 눌렀을 때 shadow 효과
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
        $(this).children("ul").stop().slideDown("slow");
    },
    function() {
        $(this).children("ul").stop().slideUp("slow");
    }
);