// index에서 스크롤 시 header 변환
// Navbar shrink function
var navbarShrink = function () {
    const navbarCollapsible = document.body.querySelector('#indexNav');
    if (!navbarCollapsible) {
        return;
    }
    if (window.scrollY === 0) {
        navbarCollapsible.classList.remove('navbar-shrink')
    } else {
        navbarCollapsible.classList.add('navbar-shrink')
    }

};

// Shrink the navbar 
navbarShrink();

// Shrink the navbar when page is scrolled
// 스크롤 시 navbarShrink 안에 든 함수를 호출
document.addEventListener('scroll', navbarShrink);

// Activate Bootstrap scrollspy on the main nav element
const mainNav = document.body.querySelector('#indexNav');
if (mainNav) {
    new bootstrap.ScrollSpy(document.body, {
        target: '#indexNav',
        offset: 74,
    });
};

// Collapse responsive navbar when toggler is visible
const navbarToggler = document.body.querySelector('.navbar-toggler');
const responsiveNavItems = [].slice.call(
    document.querySelectorAll('#navbarResponsive .nav-link')
);
responsiveNavItems.map(function (responsiveNavItem) {
    responsiveNavItem.addEventListener('click', () => {
	    if (window.getComputedStyle(navbarToggler).display !== 'none') {
	        navbarToggler.click();
	    }
	});
});


// member 기능에서 input 클릭 시 변환
const inputs = document.querySelectorAll(".input");

function addcl(){
  let parent = this.parentNode.parentNode;
  parent.classList.add("focus");
}

function remcl(){
  let parent = this.parentNode.parentNode;
  if(this.value == ""){
    parent.classList.remove("focus");
  }
}

inputs.forEach(input => {
  input.addEventListener("focus", addcl);
  input.addEventListener("blur", remcl);
});

// 비밀번호 일치 여부 문구 출력
$(function(){
    $('#password_input').keyup(function() {
      $('#password_check_p').html('');
    });

    $('#password_check_input').keyup(function() {
        if($('#password_input').val() != $('#password_check_input').val()){
          $('#password_check_p').html('비밀번호가 일치하지 않습니다.');
          $('#password_check_p').css('color', '#e30000');
        } else{
          $('#password_check_p').html('비밀번호가 일치합니다.');
          $('#password_check_p').css('color', '#7DB249');
        }
    });
});

// 댓글 수정 시 textarea로 변환 효과
function editReply(postId, replyId, replyContent){
	console.log(postId, replyId, replyContent);
	$('#reply' + replyId).html('<form method="post"><textarea name="editContent">' + replyContent + '</textarea><button class="viewControlBtn" id="ok_btn">확인</button></form>');
	$('#edit_btn' + replyId).remove();
	$("#delete_btn" + replyId).remove();
	$("#ok_btn").attr("formaction", "/replyEdit?postId=" + postId + "&replyId=" + replyId);
}