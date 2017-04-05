<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check your schedule</title>
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- fullcalendar -->
<link href='resources/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='resources/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<!-- icheck -->
<link href="resources/assets/css/skins/all.css" rel="stylesheet">
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
<!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lt IE 9]> <script src="dist/html5shiv.js"></script> <![endif]-->
</head>
<body class="page-header-fixed ">
<div class="page-header navbar navbar-fixed-top">
  <!-- BEGIN HEADER INNER -->
  <div class="page-header-inner ">
    <!-- BEGIN LOGO -->
    <div class="page-logo"> <a href="main"> <img class="logo-default" alt="logo" src="resources/assets/images/miyou_main.png"> </a> </div>
    <div class="library-menu"> <span class="one">-</span> <span class="two">-</span> <span class="three">-</span> </div>
    <!-- END LOGO -->
    <!-- BEGIN TOP NAVIGATION MENU -->
	<%@ include file="header.jspf"%>
    <!-- END TOP NAVIGATION MENU -->
  </div>
  <!-- END HEADER INNER -->
</div>
<div class="clearfix"> </div>
<div class="page-container">
  <!-- Start page sidebar wrapper -->
	<%@ include file="side.jspf"%>
  <!-- End page sidebar wrapper -->
  <!-- Start page content wrapper -->
  <div class="page-content-wrapper">
    <div class="page-content" >
      <div class="row wrapper border-bottom page-heading">
        <div class="col-lg-12">
          <h2> Calendar </h2>
          <ol class="breadcrumb">
            <li> <a href="main">Home</a> </li>
            <li> <a> Page Layouts </a> </li>
            <li class="active"> <strong>Calendar</strong> </li>
          </ol>
        </div>
      </div>
      <div class="wrapper-content ">
        <div class="row">
          <div class="col-lg-3">
            <div class="ibox float-e-margins">
              <div class="ibox-title">
                <h5>Draggable Events </h5>
                <div class="ibox-tools"> <a data-target="#demo1"  data-toggle="collapse" class="collapse-link"> <i class="fa fa-chevron-up"></i> <i class="fa fa-chevron-down"></i> </a> <a  class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-wrench"></i> </a>
                  <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">Config option 1</a> </li>
                    <li><a href="#">Config option 2</a> </li>
                  </ul>
                  <!-- /dropdown-menu -->
                  <a class="close-link"> <i class="fa fa-times"></i> </a> </div>
                  <!-- ibox-tools -->
              </div>
              <!-- / ibox-title -->
              <div id="demo1" class="ibox-content collapse in">
                <div class="demo-container">
                  <div class="widgets-container">
                    <p>Drag a event and drop into callendar.</p>
                                      
                  <!-- Drag a event list-->
                    <div id='external-events'>
                      <div class='fc-event'>My Event 1</div>
                      <div class='fc-event'>My Event 2</div>
                      <div class='fc-event'>My Event 3</div>
                      <div class='fc-event'>My Event 4</div>
                      <div class='fc-event'>My Event 5</div>
                      <p>
                        <input type='checkbox' id='drop-remove' />
                        <label for='drop-remove'>remove after drop</label>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="ibox float-e-margins">
              <div  class="ibox-content collapse in">
                <div class="demo-container">
                  <div class="widgets-container">
                    <div class="ibox-content">
                      <h2>FullCalendar</h2>
                      is a jQuery plugin that provides a full-sized, drag &amp; drop calendar like the one below. It uses AJAX to fetch events on-the-fly for each month and is
                      easily configured to use your own feed format (an extension is provided for Google Calendar).
                      <p> <a target="_blank" href="http://arshaw.com/fullcalendar/">FullCalendar documentation</a> </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="ibox float-e-margins">
              <div id="demo2" class="ibox-content collapse in">
                <div class="demo-container">
                  <div class="widgets-container">
                                      
                  <!-- Full Calendar -->
                    <div id='calendar'></div>
                    <div style='clear:both'></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
<!-- start footer -->
<%@ include file="footer.jspf"%>
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
<!-- slimscroll js -->
<script type="text/javascript" src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
<!-- icheck -->
<script src="resources/assets/js/vendor/icheck.js"></script>
<!-- fullcalendar -->
<script src='resources/assets/js/vendor/lib/moment.min.js'></script>
<script src='resources/assets/js/vendor/lib/jquery-ui.custom.min.js'></script>
<script src='resources/assets/js/vendor/fullcalendar.min.js'></script>
<!-- main js -->
<script src="resources/assets/js/main.js"></script>
<script>

  $(document).ready(function() {
	$(this).toggleClass("active");
	$('body').toggleClass('page-sidebar-closed'); 
	
    $('#drop-remove').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue'
    });

    /* initialize the external events
    -----------------------------------------------------------------*/

    $('#external-events .fc-event').each(function() {

        // store data so the calendar knows to render an event upon drop
        $(this).data('event', {
            title: $.trim($(this).text()), // use the element's text as the event title
            stick: true // maintain when user navigates (see docs on the renderEvent method)
        });

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true, // will cause the event to go back to its
            revertDuration: 0 //  original position after the drag
        });

    });

    /* initialize the calendar
          -----------------------------------------------------------------*/
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        height: 500,
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function() {
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        events: [{
                title: 'All Day Event',
                start: new Date(y, m, 1)
            },
            {
                title: 'Long Event',
                start: new Date(y, m, d - 5),
                end: new Date(y, m, d - 2)
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d - 3, 16, 0),
                allDay: false
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d + 4, 16, 0),
                allDay: false
            },
            {
                title: 'Meeting',
                start: new Date(y, m, d, 10, 30),
                allDay: false
            },
            {
                title: 'Lunch',
                start: new Date(y, m, d, 12, 0),
                end: new Date(y, m, d, 14, 0),
                allDay: false
            },
            {
                title: 'Birthday Party',
                start: new Date(y, m, d + 1, 19, 0),
                end: new Date(y, m, d + 1, 22, 30),
                allDay: false
            },
            {
                title: 'Click for Google',
                start: new Date(y, m, 28),
                end: new Date(y, m, 29),
                url: 'http://google.com/'
            }
        ]
    });

});       

</script>
</body>
</html>
