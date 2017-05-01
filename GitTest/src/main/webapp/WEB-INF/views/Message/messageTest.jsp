<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sent Messages</title>
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

<link href="resources/assets/css/messageTest.css" rel="stylesheet">

<!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lt IE 9]> <script src="dist/html5shiv.js"></script> <![endif]-->

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script>

$(function(){
	$.ajax({
		 type : "get"
	     , url : "logoutCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "login";
	    	 }
	     }
	});
});

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
</script>

</head>
<body class="page-header-fixed ">
	<!-- Modal -->
	<div>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Send som mail</h4>
				</div>
				<div class="modal-body">
					<div>
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-md-3" class="control-label">Modtagere:</label>
								<div class="col-md-9">
									<div class="to-dropdown">
										<span class="label label-info dropdown-toggle"
											data-toggle="dropdown" aria-expanded="false"> to: <span
											class="caret"></span>
										</span>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">cc:</a></li>
											<li><a href="#">bcc:</a></li>
										</ul>
									</div>
									<input id="mailadr" name="mailadr"
										class="typeahead form-control" type="text"
										placeholder="mail-adresse" data-provide="typeahead" />
									<div class="modtagere">
										<div class="to">
											<div class="to-dropdown">
												<span class="label label-info dropdown-toggle"
													data-toggle="dropdown" aria-expanded="false"> to: <span
													class="caret"></span>
												</span>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">cc:</a></li>
													<li><a href="#">bcc:</a></li>
												</ul>
											</div>
											Beta Cykler
											<beta @cykler.dk> <span
												class="pull-right icon-remove-sign"></span>
										</div>
										<div class="to">
											<div class="to-dropdown">
												<span class="label label-info dropdown-toggle"
													data-toggle="dropdown" aria-expanded="false"> bcc: <span
													class="caret"></span>
												</span>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">to:</a></li>
													<li><a href="#">cc:</a></li>
												</ul>
											</div>
											Rasmus Lock Fuglsang
											<rlf @logiva.dk> <span
												class="pull-right icon-remove-sign"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3" class="control-label">Emne:</label>
								<div class="col-md-9">
									<input class="typeahead form-control" type="text"
										placeholder="Emne" data-provide="typeahead"
										value="Spørgsmål vedr. faktura 55123 på 6.789,-" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3" class="control-label">Besked:</label>
								<div class="col-md-9">
									<div class="">
										<div class="btn-toolbar" data-role="editor-toolbar"
											data-target="#editor">
											<div class="btn-group">
												<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
													class="icon-bold"></i></a> <a class="btn" data-edit="italic"
													title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
												<a class="btn" data-edit="strikethrough"
													title="Strikethrough"><i class="icon-strikethrough"></i></a>
												<a class="btn" data-edit="underline"
													title="Underline (Ctrl/Cmd+U)"><i
													class="icon-underline"></i></a>
											</div>

											<div class="btn-group">
												<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
													class="icon-undo"></i></a> <a class="btn" data-edit="redo"
													title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
											</div>
										</div>
										<div id="editor">
											Hej mr. X<br /> Der lader til at være udfordringer ... <br />
											<b><u>Fakturaer:</u></b>
											<p></p>
											<table>
												<thead>
													<tr>
														<th>Leverandør</th>
														<th>Beløb</th>
														<th>Ansvarlig</th>
														<th>Link</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>Beta Cykler</td>
														<td>6.789,-</td>
														<td>SVS</td>
														<td><a href="#">Detaljer</a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3" class="control-label">Dokumenter:</label>
								<div class="col-md-9">
									<div class="row">
										<div class="col-sm-6">
											<div class="checkbox">
												<input type="checkbox" name="att" value="Original01.pdf"
													checked> Original01.pdf</input>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="checkbox">
												<input type="checkbox" name="att" value="regnskab.xls">
												regnskab.xls</input>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="checkbox">
												<input type="checkbox" name="att" value="faktura02.tif">
												introduction.docx</input>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuller</button>
					<button type="button" class="btn btn-primary">Send</button>
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
	<!-- icheck -->
	<script src="resources/assets/js/vendor/icheck.js"></script>
	<!-- slimscroll js -->
	<script type="text/javascript"
		src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="resources/assets/js/main.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var callbacks_list = $('.demo-callbacks ul');
							$('input.iCheck')
									.on(
											'ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed',
											function(event) {
												callbacks_list
														.prepend('<li><span>#'
																+ this.id
																+ '</span> is '
																+ event.type
																		.replace(
																				'if',
																				'')
																		.toLowerCase()
																+ '</li>');
											}).iCheck({
										checkboxClass : 'icheckbox_square-red',
										radioClass : 'iradio_square-grey',
										increaseArea : '20%'
									});
						});
	</script>
	<script>
		$(function() {
			$('#editor').wysiwyg();
			$('#launch').click();
		});
		
		$(document).on('click', '.to .icon-remove-sign', function() {
			  $(this).parent().remove();
			})
			function addMail(val) {
			       if (val) {
			           var to = $('<div class="to"><span class="addr"></span><span class="pull-right icon-remove-sign"></span></div>');
			           to.find('.addr').text(val);
			           $('.modtagere').append(to);
			       }
			}
			$('#mailadr').keydown(function(e)  {
			   if (e.keyCode == 13) {
			       var val = $('#mailadr').val();
			       addMail(val);
			   } 
			});


			var substringMatcher = function(strs) {
			  return function findMatches(q, cb) {
			    var matches, substrRegex;
			 
			    // an array that will be populated with substring matches
			    matches = [];
			 
			    // regex used to determine if a string contains the substring `q`
			    substrRegex = new RegExp(q, 'i');
			 
			    // iterate through the pool of strings and for any string that
			    // contains the substring `q`, add it to the `matches` array
			    $.each(strs, function(i, str) {
			      if (substrRegex.test(str)) {
			        // the typeahead jQuery plugin expects suggestions to a
			        // JavaScript object, refer to typeahead docs for more info
			        var div = $('<div></div>');
			        div.text(str);
			        matches.push({ display: div.text(), value: str});
			      }
			    });
			    cb(matches);
			  };
			};
			 
			var data = [
			    'Rasmus Fuglsang <rlf@logiva.dk>', 
			    'Stark Århus <aarhus@stark.dk>', 
			    'Jens Wulf <jeww@logiva.dk>', 
			    'mtm@logiva.dk', 
			    'Beta Cykler <beta@cykler.dk>',
			    'Stark Kbh <kbh@stark.dk>',
			    'Marianne Hünesen <mh@logiva.dk>'
			];
			 
			$('#mailadr').typeahead({
			  hint: true,
			  highlight: true,
			  minLength: 1
			},
			{
			  name: 'mails',
			  displayKey: "value",
			  source: substringMatcher(data),
			  templates: {
			      empty: '<i>Ingen adresser matcher</i>',
			      suggestion: Handlebars.compile('<p>{{display}}</p>')
			  }
			});
			$('#mailadr').on('typeahead:selected', function(e,item) {
			    addMail(item.value);
			    return item;
			});
	</script>
</body>
</html>