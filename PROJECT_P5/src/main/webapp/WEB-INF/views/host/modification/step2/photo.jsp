<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/p5/css/reset.css" />
<style type="text/css">
#wrap {
   width: 90%;
   max-width: 1100px;
   margin: 0 auto;
   text-align: center;
   vertical-align: middle;
}

img {
   opacity: 1;
}

img:hover {
   opacity: 0.7;
}

.photoList {
   
}

.photoList img:first-child {
   width: 900px;
   height: 600px;
   border: 5px solid;
   border-color: #eb2b55;
   margin-top: 0px;
   margin-bottom: 10px;
   overflow: hidden;
   border-radius: 0px;
}

.addPhoto.last {
    border: 3px #eb2b55 outset !important;
    overflow: hidden !important;
    border-radius: 10px !important;
    box-sizing: border-box;
}

.photoList img {
   width: 300px;
   height : 200px;
   margin: 5px 0;
   overflow: hidden;
   object-fit: cover;
   object-position: center;   
   border: 1.5px #bbb dashed;
   border-radius: 15px;
}

.photoList img:last-child {
   width: 300px;
   height: 200px;
}

#mainPhoto {
   width: 910px;
   background: #eb2b55;
   top: 65px;
   /* bottom: -600px; */ 
   margin : 0 auto;
   color: white;
   font-size: 25px;
   font-weight: bolder;
   margin: 0 auto; color : white; font-size : 25px; font-weight : bolder;
   padding: 20px 0;
}

.photoButton {
   display: inline-grid;
   position: absolute;
}

.photoButton button:hover {
   opacity: 0.8;
}

.photoButton button {
   width: 40px;
    height: 40px;
    position: relative;
    left: -55px;
    top: 45px;
    margin: 2px;
    background: #333;
    color: white;
    border: none;
    opacity: 1;
}

.photoButton.first button {
    width: 80px;
    height: 80px;
    position: relative;
    left: -100px;
    bottom: 0px;
    top: 420px;
    margin: 5px;
}

/* 슬라이드 */

/* modalImgSlide */
.modalImgSlide {
   display: none;
   background: black;
   background: rgb(0, 0, 0, 0.8);
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%; 
   height: 100%;
   overflow: auto;
   background: black;
}

.modalImg {
   display: none;
   text-align: center;
}


.modalImg img {
   max-width: 500px;
   cursor: pointer;
   transition: 0.3s;
   padding-top: 0.5%;
}

.modalImg img {
   width: 100%;
   height: 600px;
   min-width: 600px;
   max-width: 900px;
}


.modalImgSlideButton {
   color: white;
}

.modalImgSlideButton {
   text-align: center;
   margin: 15px;
}

.prev, .next {
   cursor: pointer;
   padding: 10px;
   font-weight: bold;
   font-size: 20px;
   border-radius: 0 3px 3px 0;
}

.next {
   left: 550px;
   border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
   background: rgba(0, 0, 0, 0.5);
}

.modalImgNumber {
   color: white;
}

.modalImgNumber {
   font-size: 12px;
   top: 0px;
   padding-top: 0.5%;
}

.modalImgThumbnails {
   width: 100%;
   min-width: 500px;
   margin: 0 auto;
}

.modalImgThumbnails {
   width: 90%;
   margin: 0 auto;
}

.modalImgThumbnails:after {
   content: "";
   display: table;
   clear: both;
}

.modalImgThumbnail.active img, .modalImgThumbnail img:hover {
   opacity: 1;
}

.modalImgThumbnail img {
   cursor: pointer;
   float: left;
   opacity: 0.6;
   object-fit: cover;
   object-position: center;
   width: 20%;
   height: 100px;
}



</style>
</head>
<body>

<%-- <%@include file="../headerStep.jsp"%> --%>
   <div id="wrap">
         
      <div class="photoUpload">
      
         <!-- <label for="photoFiles">
            <img src="img/imgUpload.png" alt="" class="addPhoto" width="900px" height="600px"/>
          </label> -->
          
         <!-- <div id="mainPhoto">대표 이미지</div>
         <div class="photoList">
            <img src="img/bedroom.jpg" alt="" class="inputPhoto" />
            <img src="img/berry.jpg" alt="" class="inputPhoto" />
            <img src="img/flower.jpg" alt="" class="inputPhoto" />
            <img src="img/coffee.jpg" alt="" class="inputPhoto" />
            <img src="img/bread.jpg" alt="" class="inputPhoto" />
            <img src="img/hair.png" alt="" class="inputPhoto" />
            <img src="img/away.jpg" alt="" class="inputPhoto" />
            
         <label for="photoFiles">
            <img src="img/imgUpload2.png" alt="" class="addPhoto" />
         </label>
         </div> -->
         
      </div> <!-- photoUpload end -->
      
      
      <form id="uploadPhoto">
   		 <input type="hidden" id="hostId" name="hostId" value="${hostId }" />
         <input type="file" id="photoFiles" name="photoFiles" multiple
          accept="image/*" style="display: none" />
      </form>
      
      
      <div class="modalImgSlide">
         <!-- 사진 데이터 입력 시 반목문으로  >  .modalImgSlide[0] 아래로 append
         <div class="modalImg">
            <div class="modalImgNumber">(i값)/(전체 사진 갯수값)</div>
            <img src="이미지 링크" onclick="modalOff()">
         </div> -->

       <div class="modalImg">
            <div class="modalImgNumber">1 / 8</div>
            <img src="/p5/img/bedroom.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">2 / 8</div>
            <img src="/p5/img/berry.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">3 / 8</div>
            <img src="/p5/img/flower.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">4 / 8</div>
            <img src="/p5/img/coffee.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">5 / 8</div>
            <img src="/p5/img/bread.jpg" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">6 / 8</div>
            <img src="/p5/img/hair.png" onclick="modalOff()">
         </div>
         <div class="modalImg">
            <div class="modalImgNumber">7 / 8</div>
            <img src="/p5/img/away.jpg" onclick="modalOff()">
         </div>

         <div class="modalImgSlideButton">
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
         </div>

         <div class="modalImgThumbnails">
            <div class="modalImgThumbnail"></div>
         </div>
         
      </div> <!-- modalImgSlide end -->

   </div>
   <!-- wrap end -->
   <a href="../hostingStatus?hostId=${hostId }">이전</a>
        <a href="description?hostId=${hostId }">다음</a>

<script>

	// 2단계의 헤더 내용을 변경한다. 
	
	//2단계를 설명하는 설명문을 넣음. 
	var stepDescription = $('.step1-description');
	stepDescription.empty(); // 값을 지우고
	stepDescription.text('2단계 : 상세정보를 입력하세요'); // 값을 넣고

	/// nav안에 있는 내용을 지움
	$('nav *').remove();

	//nav grid를 다시 설정
	var nav = $('nav');

	//3칸씩 전체 넓이에 맞춰서 균등분할
	nav.css('grid-template-columns', 'repeat(3,1fr)');

	//nav의 내용에 2단계 tab을 추가
	nav.append(
		'<a  class="step1-tab" href="./modifyPhoto.jsp" id="tabPhoto">사진등록</a>'
		+ '<a  class="step1-tab" href="./modifyDescription.jsp" id="tabDescription">숙소설명</a>'
		+ '<a  class="step1-tab" href="./modifyTitle.jsp" id="tabTitle">숙소명</a>'
	);
	
	// 사진등록 페이지라면 
	$('#tabPhoto').css('background','#bbb');
	
	
</script>
<script type="text/javascript">

function apply(){
      $(".photoList").sortable({
            items: "img:not(.addPhoto)",

            // 정렬 후(내용 변동이 있으 시에)에 시행
         update: function(event, ui){
            var sortResult = $(".photoList").sortable("toArray", {attribute:"data-id"});
            updateHostPhotoSort(sortResult);
         }
      });

   var menu = '<span class="photoButton first">'
      + '<button onclick="deleteHostPhoto($(this).parent().prev().attr(\'data-id\'), $(this).parent().prev().attr(\'data-order\'))">'
        + '<i class="fas fa-trash-alt fa-2x"></i></button>'
      + '<button onclick="modalOn($(this).parent().prev().index())"><i class="fas fa-external-link-alt fa-2x"></i></button></span>';
   var menu2 = '<span class="photoButton">'
        + '<button onclick="changeCoverImage($(this).parent().prev().attr(\'data-order\'))">'
        + '<i class="fas fa-check"></i></button>'
      + '<button onclick="deleteHostPhoto($(this).parent().prev().attr(\'data-id\'), $(this).parent().prev().attr(\'data-order\'))">'
        + '<i class="fas fa-trash-alt"></i></button>'
      + '<button onclick="modalOn($(this).parent().prev().index())"><i class="fas fa-external-link-alt"></i></button></span>';
      
   $(".inputPhoto").on({
      'mouseover': function() {
         if($(this).index()=="0"){
            $(".photoButton").detach();
            $(this).after(menu);      
         } else {
            $(".photoButton").detach();
            $(this).after(menu2);   
         }
      },
      'click': function() {
         if($(this).index()=="0"){
            $(".photoButton").detach();
            $(this).after(menu);      
         } else {
            $(".photoButton").detach();
            $(this).after(menu2);   
      }
   }
      })
}    
     
       /* 이미지 슬라이드 */
       var slideIndex = 1;
       showSildes(slideIndex);

       function showSildes(n) {
          var i;

          var Mslides = document.getElementsByClassName("modalImg");
          var MslidesList = document.getElementsByClassName("modalImgSlide");
          var Mthumb = document.getElementsByClassName("modalImgThumbnail");
          var MthumbList = document.querySelector(".modalImgThumbnails");

          if (n > Mslides.length) {
             slideIndex = 1;
          }
          if (n < 1) {
             slideIndex = Mslides.length;
          }

          for (var i = 0; i < Mthumb.length; i++) {
             Mthumb[i].className = Mthumb[i].className.replace(" active", "");
             Mthumb[i].style.display = "none";
          }

          for (var i = 0; i < Mslides.length; i++) {
             Mslides[i].style.display = "none";
          }

          Mslides[slideIndex - 1].style.display = "block";

          MthumbList.innerHTML = "";

          for (var i = -3; i < 2; i++) {
             if (slideIndex + i < 0) {
                MthumbList.innerHTML += '<div class="modalImgThumbnail"><img src="'
                      + Mslides[slideIndex + i + Mslides.length].getElementsByTagName("img")[0].src
                      + '" onclick="currentSlide('
                      + (slideIndex + i + Mslides.length + 1) + ')" /></div>';
             } else if (slideIndex + i >= Mslides.length) {
                MthumbList.innerHTML += '<div class="modalImgThumbnail"><img src="'
                      + Mslides[slideIndex + i - Mslides.length].getElementsByTagName("img")[0].src
                      + '" onclick="currentSlide('
                      + (slideIndex + i - Mslides.length + 1) + ')" /></div>';
             } else {
                MthumbList.innerHTML += '<div class="modalImgThumbnail"><img src="'
                      + Mslides[slideIndex + i].getElementsByTagName("img")[0].src
                      + '" onclick="currentSlide('
                      + (slideIndex + i + 1)
                      + ')" /></div>';
             }
          }
          Mthumb[2].className += " active";
       }
       
       function plusSlides(n) {
          showSildes(slideIndex += n);
       }

       function currentSlide(n) {
          showSildes(slideIndex = n);
       }

       /* 모달 이미지 */
       function modalOn(n) {
          var a = parseInt(n) + 1;
          slideIndex = a;
          showSildes(slideIndex);
          var modalImgSlide = document.getElementsByClassName("modalImgSlide");
          modalImgSlide[0].style.display = "block";
       }

       function modalOff() {
          var modalImgSlide = document.getElementsByClassName("modalImgSlide");
          modalImgSlide[0].style.display = "none";
       }
       
//**************************** 백엔드 기능.. ***********************************************************
$(window).bind("pageshow", function (event) {
		$.ajax({
			type : "POST",
			url : "/p5/ajax/isIdentified",
			data : "hostId=" + $('#hostId').val(),
			success : function(result){
				if(!result){
					alert("접근 권한이 없는 페이지입니다.");
					location.replace("/p5"); // 홈으로 이동
				}
			},	
			error : function(){
				alert("접근 권한 확인에 실패..");
			}
		}); // AJAX-END
});
$(function(){
	
   // 화면에 사진 출력
   showHostPhoto();
   
   // 파일 드롭 다운
    fileDropDown();
});


   // 사진 출력
function showHostPhoto(){
   var hostPhoto = $(".photoUpload");
   var hostPhotoModal = $(".modalImgSlide");
   
   $.ajax({
      type: "POST",
      url: '/p5/ajax/getHostPhotoList',
      data: 'hostId=' + $('#hostId').val(),
      async: true,
      success: function (photoList) {
         if(!photoList.length){ // 출력할 사진이 없다면
            hostPhoto.empty(); // 비우고
            
               // 큰 버튼 하나만
            var result =
               '   <label for="photoFiles">   '
                  +'      <img src="/p5/img/imgUpload.png" alt="" class="addPhoto" width="900px" height="600px"/>   '
                  +'    </label>   '
                   ;
              
               hostPhoto.append(result); // 영역에 생성
            
         } else { // 출력할 게 있으면
            hostPhoto.empty(); // 비우고
            hostPhotoModal.empty(); // modal 역시 비움

            
            
//************************** 머리 ***************************************      
               // 사진
            var photoResult =
               '   <div id="mainPhoto">대표 이미지</div>   '
                +'     <div class="photoList">   '
                ;
             
                // modal
             var modalResult = '';
//************************** 머리-END **********************************      


//************************** 몸통 제조(반복문) ********************************
                // 사진 개수
            var total = photoList.length;
            $.each(photoList, function(i, photo){
               // 화면에 출력되는 사진
               photoResult +=
                 '   <img src="' + photo.path + '" alt="' + photo.originalName + '"'
                 +'   data-id="' + photo.id + '" data-order="' + photo.sortOrder + '" class="inputPhoto" />   '
                 ;
                 
                 i++;
                 // modal의 사진
               modalResult +=
               '   <div class="modalImg">   '
                  +'      <div class="modalImgNumber">' + i + '/' + total + '</div>   '
                  +'      <img src="' + photo.path + '" onclick="modalOff()">   '
                  +'   </div>   '
                  ;
                 });
//************************** 몸통 제조(반복문)-END ********************************      


//******************************** 꼬리 달기 ****************************************
            photoResult +=
            '   <label for="photoFiles">   '
            +'      <img src="/p5/img/imgUpload2.png" alt="" class="addPhoto last" />   '
            +'   </label>   '
            +'   </div>   '
            ;
              
            modalResult +=
            '   <div class="modalImgSlideButton">   '
             +'        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>   '
             +'        <a class="next" onclick="plusSlides(1)">&#10095;</a>   '
             +'    </div>   '
             +'  <div class="modalImgThumbnails">   '
             +'         <div class="modalImgThumbnail"></div>   '
               +'  </div>      '
            ;
//******************************** 꼬리 달기-END ****************************************               
               
               
               // 내용 갱신
            hostPhoto.append(photoResult);
            hostPhotoModal.append(modalResult);
            
         } // else-END
         
         apply(); // 기능 적용**
      },
      error: function (e) {
         alert("통신 실패..");
      }
   });
} // showHostPhoto-END




   // 선택 파일 업로드
$("#photoFiles").on("change", function(){
   if(!$('#photoFiles').val()){
      return;
   }
   
   var formData = new FormData($('#uploadPhoto')[0]);
   addHostPhoto(formData);
   
   $('#photoFiles').val(""); // 초기화
});

   
   
   // 파일 드롭 다운
function fileDropDown(){
    var dropZone = $(".photoUpload");
    //Drag기능
    dropZone.on('dragenter',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('dragleave',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#FFFFFF');
    });
    dropZone.on('dragover',function(e){
        e.stopPropagation();
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#E3F2FC');
    });
    dropZone.on('drop',function(e){
        e.preventDefault();
        // 드롭다운 영역 css
        dropZone.css('background-color','#FFFFFF');
         
        var files = e.originalEvent.dataTransfer.files;
        
        if(files != null) {
            if(files.length < 1){
                alert("파일이 없습니다.");
                return;
            }
            
               // 확장자 유효성 검사
            for(i=0; i<files.length; i++){
               if(!files[i].type.match("image/*")) {
                    alert("이미지 파일만 가능합니다.");   
                    return;   
                }
            }
        } else {
            alert("에러..");
        }
        
        var formData = new FormData();
        formData.append('hostId', $('#hostId').val());
        for(i=0; i<files.length; i++){
           formData.append('photoFiles', files[i]);
        }
        
        addHostPhoto(formData);
    });
}
       

   // 사진 추가(서버와 DB에 저장)
function addHostPhoto(formData){
   $.ajax({
      
      type: "POST",
      url: '/p5/ajax/addHostPhoto',
      enctype: 'multipart/form-data', // 필수 
      data: formData, // 필수 
      processData: false, // 필수 
      contentType: false, // 필수
      cache: false,
      async: false,
      success: function (result) {
         if(result){ // 성공
            showHostPhoto(); // 사진 갱신
         } else{
            alert("사진 추가 실패..");
         }
      },
      error: function (e) {
         alert("통신 실패");
      }
   });
}


   // 사진 삭제
function deleteHostPhoto(photoId, photoOrder){
	   var params = {
   			photoId : photoId,
   			photoOrder : photoOrder,
 			photoCount : $(".inputPhoto").length,
			hostId : $('#hostId').val()
	   }
 //   alert(JSON.stringify(params));
   $.ajax({
      type: "POST",
      url: '/p5/ajax/deleteHostPhoto',
      data: params,
      async: false,
      success: function (result) { // boolean 결과
         if(result){ // 성공
            showHostPhoto(); // 사진 갱신
         } else{
            alert("사진 삭제 실패..");
         }
      },
      error: function (e) {
         alert("통신 실패");
      }
   });
}       
     
   // 정렬 결과를 DB에 적용
function updateHostPhotoSort(sortResult){
   
   $.ajax({
      type: "POST",
      url: '/p5/ajax/updateHostPhotoSort',
      data: 'sortResult=' + sortResult,
      async: false,
      success: function (result) { // boolean 결과
//         alert(result);
         showHostPhoto(); // 사진 갱신
      },
      error: function (e) {
         alert("통신 실패");
      }
   });
}
   
   // 대표 이미지 바꾸기
function changeCoverImage(choiceOrder){
   var choiceId = $('img[data-order="' + choiceOrder + '"]').attr("data-id");
   var coverId = $('img[data-order="1"]').attr("data-id");
   
   var params = { // 보따리
      choiceId : choiceId, // 선택 이미지의 ID
      coverId : coverId, // 대표 이미지의 ID
      choiceOrder : choiceOrder // 선택 이미지의 순번
   }
   
   $.ajax({
      type: "POST",
      url: '/p5/ajax/changeCoverImage',
      data: params,
      async: false,
      success: function (result) { // boolean 결과
    	  if(result){
         	showHostPhoto(); // 사진 갱신
    	  } else{
   		  	alert("대표 이미지 바꾸기 실패..");
    	  }
      
      },
      error: function (e) {
         alert("통신 실패");
      }
   });
}
       
     
   </script>
</body>

</html>