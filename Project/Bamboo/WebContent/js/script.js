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

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
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
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
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
});

