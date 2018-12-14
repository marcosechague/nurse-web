<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<html>
<head>
<meta charset="utf-8">
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
	

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Vital signs</title>
</head>


<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, options);
  });
  
</script>


<body>



<div class="fixed-action-btn">
  <a class="btn-floating btn-large red">
    <i class="large material-icons">mode_edit</i>
  </a>
  <ul>
    <li><a class="btn-floating red" href="http://178.62.17.200:8080/nurseapp-web/"><i class="material-icons">home</i></a></li>
    <li><a class="btn-floating yellow darken-1" href="http://178.62.17.200:8080/nurseapp-web/nurse/patients" ><i class="material-icons">person_add</i></a></li>
<!--     <li><a class="btn-floating blue" href="http://localhost:8080/nurseapp-web/nurse/vital_signs"><i class="material-icons">info_outline</i></a></li> -->
  </ul>
</div>

	<div class="section"></div>
	<div class="content">

		<main>
		<center>
			<div class="row">
				<h5 class="indigo-text">Vital signs table info</h5>
			</div>
			<div class="row">
				<div class="col-md-6">
					<!-- 				<a class="btn-floating btn-large waves-effect waves-light blue"><i -->
					<!-- 							class="material-icons right">add</i></a> -->
					<!-- 							</div> -->

					<!-- 						<button class="waves-effect waves-light btn modal-trigger" data-target="modal1">New</button> -->

				</div>
			</div>


			<div class="container">
				<div class="row valign-wrapper">
					<div class="col s10 offset-s1 valign">

						<div class="row">
							<div class="col s12">
								<table id="vitalsigns_tbl" class="display highlight" cellspacing="0"
									width="100%">
									<thead>
										<tr>
											<th>Vital Sign</th>
											<th>Min value</th>
											<th>Max value</th>
											<th>Age from</th>
											<th>Age to</th>
											<th></th>

										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Vital Sign</th>
											<th>Min value</th>
											<th>Max value</th>
											<th>Age from</th>
											<th>Age to</th>
											<th></th>

										</tr>
									</tfoot>
									
									<tbody>
										<c:forEach items="${vitalSigns}" var="vitalSign">
											<tr id="row-${vitalSign.idVitalSign}">
												<td>${vitalSign.description}</td>
												<td>${vitalSign.minRange}</td>
												<td>${vitalSign.maxRange}</td>
												<td>${vitalSign.minAge}</td>
												<td>${vitalSign.maxAge}</td>
												<td>
													<div class="table-data-feature">
														 <a class="btn-floating btn-small waves-effect waves-light red"><i
															class="material-icons" onclick="onClickDelete()">delete</i></a>
													</div>

												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
			</div>

		</center>
		</main>
	</div>


	<div id="chartContainer" style="height: 300px; width: 100%;"></div>



	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<!-- 	<script type="text/javascript" -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script> -->
<!-- 	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script> -->
<!-- 	<script type="text/javascript" -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script> -->
<!-- 	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script> -->
<!-- 	<script src=" https://code.jquery.com/jquery-3.3.1.js"></script> -->
</body>


<script type="text/javascript">


$(document).ready(function() {
    $('#vitalsigns_tbl').DataTable({
      "language": {
                    "sProcessing":     "Processing...",
                    "sLengthMenu":     "Mostrar _MENU_ registros",
                    "sZeroRecords":    "No data founds",
                    "sEmptyTable":     "No data available in this table",
                    "sInfo":           "Showing records from _START_ to _END_ of a total of _TOTAL_ records",
                    "sInfoEmpty":      "Showing records from 0 to 0 of a total of 0 records",
                    "sInfoFiltered":   "(filtering a total of _MAX_ records)",
                    "sInfoPostFix":    "",
                    "sSearch":         "Search:",
                    "sUrl":            "",
                    "sInfoThousands":  ",",
                    "sLoadingRecords": "Loading...",
                    "oPaginate": {
                        "sFirst":    "First",
                        "sLast":     "Last",
                        "sNext":     "Next",
                        "sPrevious": "Previous"
                    },
                    "oAria": {
                        "sSortAscending":  ": Activate to order the column ascending",
                        "sSortDescending": ": Activate to order the column descending"
                    }
                }
    });
  $("select").val('10');
  $('select').addClass("browser-default");
  $('select').material_select();
} );

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
  });


</script>

</html>
















