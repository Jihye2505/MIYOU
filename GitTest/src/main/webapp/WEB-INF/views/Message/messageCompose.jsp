<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Compose your message</title>
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- mailbox -->
<link href="resources/assets/css/mailbox.css" rel="stylesheet">
<!-- slimscroll -->
<link href="resources/assets/css/jquery.slimscroll.css" rel="stylesheet">
<!-- Fontes -->
<link href="resources/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/assets/css/simple-line-icons.css" rel="stylesheet">
<!-- all buttons css -->
<link href="resources/assets/css/buttons.css" rel="stylesheet">
<!-- adminbag main css -->
<link href="resources/assets/css/main.css" rel="stylesheet">
<!-- aqua black theme css -->
<link href="resources/assets/css/aqua-black.css" rel="stylesheet">
<!-- media css for responsive  -->
<link href="resources/assets/css/main.media.css" rel="stylesheet">
<!-- icheck -->
<link href="resources/assets/css/skins/all.css" rel="stylesheet">
<!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lt IE 9]> <script src="dist/html5shiv.js"></script> <![endif]-->

<!-- Le styles -->
   <!-- <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap.no-responsive.no-icons.min.css" rel="stylesheet"> -->
   <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/cupertino/jquery-ui.css" rel="stylesheet">
    <link href="resources/assets/css/inputosaurus.css" rel="stylesheet">
   <!-- <link href="http://google-code-prettify.googlecode.com/svn/trunk/src/prettify.css" rel="stylesheet"> -->
    <style>
      /* body {
        padding-top: 60px; 
      }*/
     h2, h3{
        margin : 40px 0 5px;
     }
     h3{
        border-bottom : 1px solid #ddd;
        color : #655;
        line-height : 30px;
     } */
     .muted.text-right{
        padding-right : 16%;
        text-align : right;
     }
    /*  section{
        margin-left : 20px;
     } */
     .markup a{
        text-decoration : none;
     }
     .markup div{
        display : none;
     }
      section.examples p{
        color : #777;
      }
      section.examples ul{
            margin : 5px 0;
      }
      section.examples article:first-child h3{
         margin-top : 10px;
      }
        #options li{
         color : #944;
      }
      #options li span{
         font-family : Monaco, Courier;
         color : #666;
         font-size : 80%;
      }
      #options li p{
         color : #222;
      }
      input.original{
         width : 350px;
      }
      
      
.badgebox
{
    opacity: 0;
}

.badgebox + .badge
{
    text-indent: -999999px;
    width: 27px;
}

.badgebox:focus + .badge
{
    box-shadow: inset 0px 0px 5px;
}

.badgebox:checked + .badge
{
   text-indent: 0;
}
   
</style>

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script>

$(function(){
	$.ajax({
		 type : "get"
	     , url : "lockCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "lockscreen";
	    	 }
	     }
	});
});

	function formCheck() {
		var to = document.getElementById('widget2').value;
		var content = document.getElementById('editor').value;
		if(to == '' || content == ''){
			alert("Please input appropriately.");
			
			return false;
		}
		return true;
	}
</script>

</head>
<body class="page-header-fixed ">
   <%@ include file="../header.jspf"%>
   <div class="clearfix"></div>
   <div class="page-container">
      <!-- Start page sidebar wrapper -->
      <%@ include file="../side.jspf"%>
      <!-- Start page content wrapper -->
      <div class="page-content-wrapper">
         <div class="page-content">

            <div class="wrapper-content ">
               <div class="row">
                  <%@ include file="messageSide.jspf"%>
                  <div class="col-lg-10 animated fadeInRight">
                     <div class="mail-box-header">

                        <h2>Compose Message</h2> 
                     </div>
                     <div class="mail-box">
                        <form method="post" class="form-horizontal" action="sendMessage">
                           <div class="mail-body">

                              <div class="form-group">
                                  
                                 <label class="col-sm-2 control-label">To:</label>
                                  
                                 <div class="col-sm-10">
      <article>
      <c:choose>
	      <c:when test="${toUser == null}">
	      	<input type="text" id="widget2" />
	      </c:when>
	      <c:otherwise>
	      	<input type="text" value="${toUser}" id="widget2"  name='receiver_num'/>
	      </c:otherwise>
      </c:choose>
         <div class="markup">
            <div>
               <input type="text" id="widget2_reflect" class="original" value="${toUser}" disabled="disabled" />
               <div id="forToList"></div>
            </div>
         </div>
      </article>
                                 </div>
                                 <span id="findResult">

                                 </span>
                              </div>
                              
                           </div>

                           <div class="mail-text">

                              <!-- <form class="form-horizontal form-bordered"
                              action="sendMessage" method="post"> -->
                              <div class="note-editor   panel-default">
                                 <div class="btn-toolbar note-toolbar panel-heading"
                                    data-role="editor-toolbar" data-target="#editor">
                                    <div class="btn-group">
                                       <a class="btn dropdown-toggle btn-default"
                                          data-toggle="dropdown" title="Font"><i
                                          class="fa fa-font"></i><b class="caret"></b></a>
                                       <ul class="dropdown-menu">
                                       </ul>
                                    </div>
                                    <div class="btn-group">
                                       <a class="btn dropdown-toggle btn-default"
                                          data-toggle="dropdown" title="Font Size"><i
                                          class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                                       <ul class="dropdown-menu">
                                          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                                          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                                          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                                       </ul>
                                    </div>
                                    <div class="btn-group">
                                       <a class="btn btn-default" data-edit="bold"
                                          title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a> <a
                                          class="btn btn-default" data-edit="italic"
                                          title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                                       <a class="btn btn-default" data-edit="strikethrough"
                                          title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                                       <a class="btn btn-default" data-edit="underline"
                                          title="Underline (Ctrl/Cmd+U)"><i
                                          class="fa fa-underline"></i></a>
                                    </div>
                                    <div class="btn-group">
                                       <a class="btn btn-default" data-edit="insertunorderedlist"
                                          title="Bullet list"><i class="fa fa-list-ul"></i></a> <a
                                          class="btn btn-default" data-edit="insertorderedlist"
                                          title="Number list"><i class="fa fa-list-ol"></i></a> <a
                                          class="btn btn-default" data-edit="outdent"
                                          title="Reduce indent (Shift+Tab)"><i
                                          class="fa fa-outdent"></i></a> <a class="btn btn-default"
                                          data-edit="indent" title="Indent (Tab)"><i
                                          class="fa fa-indent"></i></a>
                                    </div>
                                    <div class="btn-group">
                                       <a class="btn btn-default" data-edit="justifyleft"
                                          title="Align Left (Ctrl/Cmd+L)"><i
                                          class="fa fa-align-left"></i></a> <a class="btn btn-default"
                                          data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
                                          class="fa fa-align-center"></i></a> <a class="btn btn-default"
                                          data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
                                          class="fa fa-align-right"></i></a> <a class="btn btn-default"
                                          data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
                                          class="fa fa-align-justify"></i></a>
                                    </div>
                                    <div class="btn-group">
                                       <a class="btn dropdown-toggle btn-default"
                                          data-toggle="dropdown" title="Hyperlink"><i
                                          class="fa fa-link"></i></a>
                                       <div class="dropdown-menu input-append">
                                          <input class="span2" placeholder="URL" type="text"
                                             data-edit="createLink" />
                                          <button class="btn btn-default" type="button">Add</button>
                                       </div>
                                       <a class="btn btn-default" data-edit="unlink"
                                          title="Remove Hyperlink"><i class="fa fa-cut"></i></a>

                                    </div>

                                    <div class="btn-group">
                                       <a class="btn btn-default"
                                          title="Insert picture (or just drag & drop)"
                                          id="pictureBtn"><i class="fa fa-picture-o"></i></a> <input
                                          type="file" data-role="magic-overlay"
                                          data-target="#pictureBtn" data-edit="insertImage" />
                                    </div>
                                    <div class="btn-group">
                                       <a class="btn btn-default" data-edit="undo"
                                          title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a> <a
                                          class="btn btn-default" data-edit="redo"
                                          title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                                    </div>
                                    <input type="text" data-edit="inserttext" id="voiceBtn"
                                       x-webkit-speech="">
                                 </div>

                                 <!-- <div id="editor">hi hello it's me</div> -->
                                 <!-- <input type="text" name="content" id="editor"> -->
                                 <textarea rows="100" cols="147" name="content" id="editor" style="resize: none; width: 95%;"></textarea>
                              </div>

                           </div>
                        <div class="mail-body text-right tooltip-demo">
                              <!-- <i class="fa fa-reply"></i> -->
                              <label for="warning" class="btn btn-warning">Notice <input type="checkbox" id="warning" class="badgebox" value="R" name="notice" onclick="save(this)"><span class="badge">&check;</span></label>
                              <input type="submit" value="Send" class="btn aqua btn-primary" onclick="return formCheck();">
                        </div>
                        </form>
                        <div class="clearfix"></div>

                     </div>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </div>

   <!-- Go top -->
   <a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
   <!-- Go top -->
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="resources/assets/js/vendor/jquery.min.js"></script>

   <!-- bootstrap js -->
   <script src="resources/assets/js/vendor/bootstrap.min.js"></script>

   <script type="text/javascript"
      src="resources/assets/js/vendor/bootstrap-wysiwyg.js" charset="UTF-8"></script>
   <script type="text/javascript"
      src="resources/assets/js/vendor/jquery.hotkeys.js" charset="UTF-8"></script>

   <!-- icheck -->
   <script src="resources/assets/js/vendor/icheck.js"></script>

   <!-- slimscroll js -->
   <script type="text/javascript"
      src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
   <!-- main js -->
   <script src="resources/assets/js/main.js"></script>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
   
   <script src="resources/assets/js/inputosaurus.js"></script>

   <script>
      $('#widget2').inputosaurus({
         width : '67%',
         autoCompleteSource : ${toList },
         activateFinalResult : true,
         change : function(ev){
            $('#widget2_reflect').val(ev.target.value);
            var forToList = document.getElementById("forToList");
            forToList.innerHTML="<input type='text' hidden='hidden' value="+ev.target.value+">";
         }
      });
   
      $('.markup').on('click', 'a', function(ev){ $(ev.currentTarget).next('div').toggle();});
      
      function save(obj) {
         if($("input:checkbox[id='warning']").is(":checked")==true){
            obj.value = 'N';
         } 
      }
      
   </script>
</body>
</html>