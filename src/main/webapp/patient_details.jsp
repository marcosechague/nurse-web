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
<title>history vital signs</title>
</head>

<body>

<div class="fixed-action-btn">
  <a class="btn-floating btn-large red">
    <i class="large material-icons">mode_edit</i>
  </a>
  <ul>
    <li><a class="btn-floating red" href="http://178.62.17.200:8080/nurseapp-web/"><i class="material-icons">home</i></a></li>
    <li><a class="btn-floating yellow darken-1" href="http://178.62.17.200:8080/nurseapp-web/nurse/patients" ><i class="material-icons">person_add</i></a></li>
    <li><a class="btn-floating blue" href="http://178.62.17.200:8080/nurseapp-web/nurse/vital_signs"><i class="material-icons">info_outline</i></a></li>
  </ul>
</div>

	<div class="section"></div>
	<div class="content">

		<main>
		<center>
			<div class="row">
				<h5 class="indigo-text">Check history of vital signs</h5>
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
								<table id="patients_tbl" class="display highlight" cellspacing="0"
									width="100%">
									<thead>
										<tr>
											<th>Date</th>
											<th>Vital Sign</th>
											<th>Value</th>
											<th>Condition</th>
											<th></th>

										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Date</th>
											<th>Vital Sign</th>
											<th>Value</th>
											<th>Condition</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach items="${vitalSigns}" var="vitalSign">
											<tr id="row-${vitalSign.id}">
												<td>${vitalSign.registerDate}</td>
												<td>${vitalSign.vitalSign.description}</td>
												<td>${vitalSign.valueVitalSign}</td>
												<td>${vitalSign.condition}</td>
												<td>
												<td>
													<div class="table-data-feature">
														 <a class="btn-floating btn-small waves-effect waves-light red"><i
															class="material-icons">delete</i></a>
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
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

</body>

<script type="text/javascript">

$(document).ready(function() {
    $('#patients_tbl').DataTable({
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
  
  function addNewVitalSign(){
	  $('#vs_document').value('1232131');
  }
  
  function deletePatient(){
	  alert("Nuevo vital sign");
  }
  
  function updatePatient(){
	  alert("Nuevo vital sign");
  }
  
//   window.onload = function () {

// 	  var options = {
// 	  	animationEnabled: true,  
// 	  	title:{
// 	  		text: "Monthly Sales - 2017"
// 	  	},
// 	  	axisX: {
// 	  		valueFormatString: "MMM"
// 	  	},
// 	  	axisY: {
// 	  		title: "Sales (in USD)",
// 	  		prefix: "$",
// 	  		includeZero: false
// 	  	},
// 	  	data: [{
// 	  		yValueFormatString: "$#,###",
// 	  		xValueFormatString: "MMMM",
// 	  		type: "spline",
// 	  		dataPoints: [
// 	  			{ x: new Date(2017, 0), y: 25060 },
// 	  			{ x: new Date(2017, 1), y: 27980 },
// 	  			{ x: new Date(2017, 2), y: 33800 },
// 	  			{ x: new Date(2017, 3), y: 49400 },
// 	  			{ x: new Date(2017, 4), y: 40260 },
// 	  			{ x: new Date(2017, 5), y: 33900 },
// 	  			{ x: new Date(2017, 6), y: 48000 },
// 	  			{ x: new Date(2017, 7), y: 31500 },
// 	  			{ x: new Date(2017, 8), y: 32300 },
// 	  			{ x: new Date(2017, 9), y: 42000 },
// 	  			{ x: new Date(2017, 10), y: 52160 },
// 	  			{ x: new Date(2017, 11), y: 49400 }
// 	  		]
// 	  	}]
// 	  };
// 	  $("#chartContainer").CanvasJSChart(options);

// 	  }


window.onload = function () {

var options = {
	exportEnabled: true,
	animationEnabled: true,
	title:{
		text: "Vital signs"
	},
	subtitles: [{
		text: ""
	}],
	axisX: {
		title: "Dates"
	},
	axisY: {
		title: "Values",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC",
		includeZero: false
	},
// 	axisY2: {
// 		title: "Profit in USD",
// 		titleFontColor: "#C0504E",
// 		lineColor: "#C0504E",
// 		labelFontColor: "#C0504E",
// 		tickColor: "#C0504E",
// 		includeZero: false
// 	},
	toolTip: {
		shared: true
	},
	legend: {
		cursor: "pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "spline",
		name: "Blood preasure - systolic",
		showInLegend: true,
		xValueFormatString: "MMM YYYY",
		yValueFormatString: "#,##0 Units",
		dataPoints: [
			{ x: new Date(2016, 0, 1),  y: 120 },
			{ x: new Date(2016, 1, 1), y: 135 },
			{ x: new Date(2016, 2, 1), y: 144 },
			{ x: new Date(2016, 3, 1),  y: 103 },
			{ x: new Date(2016, 4, 1),  y: 93 },
			{ x: new Date(2016, 5, 1),  y: 129 },
			{ x: new Date(2016, 6, 1), y: 143 },
			{ x: new Date(2016, 7, 1), y: 156 },
			{ x: new Date(2016, 8, 1),  y: 122 }
		]
	},
	{
		type: "spline",
		name: "Blood preasure - diastolic",
		axisYType: "secondary",
		showInLegend: true,
		xValueFormatString: "MMM YYYY",
		yValueFormatString: "$#,##0.#",
		dataPoints: [
			{ x: new Date(2016, 0, 1),  y: 19034.5 },
			{ x: new Date(2016, 1, 1), y: 20015 },
			{ x: new Date(2016, 2, 1), y: 27342 },
			{ x: new Date(2016, 3, 1),  y: 20088 },
			{ x: new Date(2016, 4, 1),  y: 20234 },
			{ x: new Date(2016, 5, 1),  y: 29034 },
			{ x: new Date(2016, 6, 1), y: 30487 },
			{ x: new Date(2016, 7, 1), y: 32523 },
			{ x: new Date(2016, 8, 1),  y: 20234 }
		]
	},
	{
		type: "spline",
		name: "Heart rate",
		axisYType: "secondary",
		showInLegend: true,
		xValueFormatString: "MMM YYYY",
		yValueFormatString: "$#,##0.#",
		dataPoints: [
			{ x: new Date(2016, 0, 1),  y: 19034.5 },
			{ x: new Date(2016, 1, 1), y: 20015 },
			{ x: new Date(2016, 2, 1), y: 27342 },
			{ x: new Date(2016, 3, 1),  y: 20088 },
			{ x: new Date(2016, 4, 1),  y: 20234 },
			{ x: new Date(2016, 5, 1),  y: 29034 },
			{ x: new Date(2016, 6, 1), y: 30487 },
			{ x: new Date(2016, 7, 1), y: 32523 },
			{ x: new Date(2016, 8, 1),  y: 20234 }
		]
	}
	]
};
$("#chartContainer").CanvasJSChart(options);

function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else {
		e.dataSeries.visible = true;
	}
	e.chart.render();
}

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, options);
  });

  // Or with jQuery

//   $(document).ready(function(){
//     $('.fixed-action-btn').floatingActionButton();
//   });

}
</script>
</html>
















