<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>


<link rel="stylesheet" href="../../css/photoUpload.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
 
 </head>
  <script>
//이미지 정보들을 담을 배열   

var sel_files = [];   
var files;
var i=0;
var a;
var index;
var b;

$(document).ready(function() {   

    $("#picture").on("change", handleImgFileSelect);   

});    



function fileUploadAction() {   

    console.log("fileUploadAction");   

    $("#picture").trigger('click');   

}   



function handleImgFileSelect(e) {   

    // 이미지 정보들을 초기화   

    sel_files = [];   

/*     $(".imgs_wrap").empty();   */ 

$('label.sub-upload').empty();


 files = e.target.files;   

 var filesArr= Array.prototype.slice.call(files);   

   index=0;

      

    filesArr.forEach(function(f) {   

        if(!f.type.match("image.*")) {   

            alert("확장자는 이미지 확장자만 가능합니다.");   

            return;   

        }   



        sel_files.push(f);   



        var reader = new FileReader();   



        reader.onload = function(e) {   
        	 $("label[class='sub-upload']").remove();   
        	 b=f.name;

            var html = "<a href=\"javascript:void(0);\" draggable=\"true\"ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='"+a+"' width=\"150px\" height=\"180px\" ></a>";
        	
            html+="<label for='picture' class='sub-upload'></label>";
         

            $(".imgs-wrap").append(html);   
            $(".imgs-wrap").css("height","100%");   
a=e.target.result;

console.log(sel_files);
            index++;  
       i=1;
       if(i==1){
    	   
    	   $('label.main.photo').hide()
    		
    	   $('i').hide();
    	
    	
    	  
    	   
       }
       else if(i==0){
    	   
    	   $('label.main.photo').show()
   		
    	   $('i').show();  
       }
       

        }   

        reader.readAsDataURL(f);   

    });   

}   



function deleteImageAction(index) {   

    console.log("index : "+index);   

    console.log("sel length : "+sel_files.length);   



    sel_files.splice(index, 1);   



    var img_id = "#img_id_"+index;   

    $(img_id).remove();    

}   



function fileUploadAction() {   

    console.log("fileUploadAction");   

    $("#picture").trigger('click');   

}   



function submitAction() {   

    console.log("업로드 파일 갯수 : "+sel_files.length);   

    var data = new FormData();   



    for(var i=0, len=sel_files.length; i<len; i++) {   

        var name = "image_"+i;   

        data.append(name, sel_files[i]);   

    }   

    data.append("image_count", sel_files.length);   

    if(sel_files.length < 1) {   

        alert("한개이상의 파일을 선택해주세요.");   

        return;   

    }              

    var xhr = new XMLHttpRequest();   

    xhr.open("POST","./register4.jsp");   

    xhr.onload = function(e) {   

        if(this.status == 200) {   

            console.log("Result : "+e.currentTarget.responseText);   

        }   

    }   

    xhr.send(data);   

}

 function allowDrop(ev) {
	   ev.preventDefault();
	}

	function drag(ev) {
	   ev.dataTransfer.setData("img",ev.target.id);
	}


	function drop(ev) {
		 ev.preventDefault();
		   $('p').remove();
		   var p=document.createElement("p");
		  
		  
		/*   p.innerHTML="<a href=\"javascript:void(0);\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + a + "\" data-file="+b+"' class='selProductFile' title='클릭하시면 제거됩니다' width=\"150px\" height=\"180px\" ></a>"; */
		  console.log(p);
		  console.log(sel_files);
		  var fileReader = new FileReader();
		  
		  fileReader.readAsDataURL(sel_files);
		  fileReader.onload = function(e) {
			  p.innerHTML="<a href=\"javascript:void(0);\" ondrop=\"drop(event)\" ondragover=\"allowDrop(event)\"onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file="+b+"' class='selProductFile' title='b' width=\"150px\" height=\"180px\" ></a>";
		    console.log(e.target.result);
		  }
/* 		   var data = ev.vdataTransfer.getData("img");  */

			
		   ev.target.appendChild(p);
		
	   }
	</script>
<body>
<progress value="50" max="100"></progress>
<div id="wrap">
<!-- <form action="/upload-target" class="dropzone"></form> -->
<form action="description" method="post" enctype="multipart/form-data">
               
           <div class="upload_List_Block">
                  
                  <div class="upload_List_Title">사진</div>
                  
               <div id="div1" ondrop="drop(event)" ondragover="allowDrop(event)" style="border:1px solid black; width:1100px;height: 350px;"></div>


<div ondrop="drop(event)" ondragover="allowDrop(event)" style="border: 1px solid red; height: 300px">

 -->
<!-- 
<img src="../../img/plus.png" alt="" id="drag1" draggable="true" ondragstart="drag(event)" width="128" height="128" />
<img src="../../img/p5.png" alt="" id="drag2" draggable="true" ondragstart="drag(event)" width="128" height="128" /> -->
                  <div class="upload_List_Input">
                     <div class="input_wrap">
                        <div class="imgs-wrap">
                           <img id="img" />
                        </div>
                        <a href="javascript:" onclick="fileUploadAction();" class="my_button"></a>  
                      <div class="upload-photo">
                     <input type="file" id="picture" multiple="multiple"/>
                     <i class="fa fa-camera fa-2x"></i><label class="main photo" for="picture">사진업로드</label>
                     </div>
                  </div>
               </div>
               <input type="submit" value="다음" />
               </form>
               <a href="facilities">이전</a>
               <!-- <a href="description">다음</a> -->
</body>

</html>