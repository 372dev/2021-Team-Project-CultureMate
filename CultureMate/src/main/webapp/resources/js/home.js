$(document).ready(ajaxCall("m")).ready(ajaxCall("p")).ready(ajaxCall("c"));

$('#musicalReloc').on('click', function() {
	reloc('musical');
});
$('#playReloc').on('click', function() {
	reloc('play');
});
$('#classicReloc').on('click', function() {
	reloc('classic');
});
	
function ajaxCall(genre) {
	$.ajax({
		type : "GET",
		async: false,
		url : "/cm/show/ajaxBoList",
		data : {
			"genre" : genre,
		},
		error : function(error) {
			console.log("ajax-error : " + error);
		},
		success : function(result) {
			console.log("ajax-success");
			if(result) {
				var toAdd = '';
				if(result == null) {
					console.log("result == null");
					toAdd += "<div><p>박스 오피스에 일시적으로 접근이 불가합니다. 관리자에게 문의해 주세요.</p>";
				} else {
					console.log("result != null");
					toAdd += '<div class="boTitle"><h2 class="titleFont">' + result[0].cate + ' 주간 박스 오피스</h2>'
					toAdd += '<button type="button" class="btn btn-secondary btn-lg btnFont" id="'
						+ (result[0].cate == "뮤지컬" ? "musical" : (result[0].cate == "연극" ? "play" : "classic"))
						+ 'Reloc">더 보기</button></div>';
					toAdd += '<div class="ListDiv">';
					for(i = 0; i < 5; i++) {
						toAdd += '<div class="card">';
						toAdd += '<div class="cardImgWrapper" onclick="location.href=\'' + '${ path }/show/restview?name=' + result[i].mt20id + '\';">';
						toAdd += '<img src="http://www.kopis.or.kr' + result[i].poster + '" class="card-img-top" alt="' + result[i].prfnm + '">';
						toAdd += '</div>';
						toAdd += '<div class="card-body">';
						toAdd += '<h5 class="card-title">' + result[i].prfnm + '</h5>';
						toAdd += '<p class="card-text subTitle">' + result[i].prfplcnm + '</p>';
						toAdd += '<p class="card-text">' + result[i].prfpd + '</p>';
						toAdd += '</div>';
						toAdd += '</div>';
					}
				}
				toAdd += '</div>';
				$("#boContainer").append(toAdd);
			}
		}
	});
}

function reloc(genre) {
	if(genre != null) {
		window.location.replace("${ path }/show/boList?genre=" + genre);
	}
}