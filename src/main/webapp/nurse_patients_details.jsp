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
<title>Patients</title>
</head>



<script>
function onClickPatient() {
	        location.href = "patients";
	    
}
function onClickVitalSign() {
	        location.href = "vital_signs";
	    
}
function onClickCheck() {
	        location.href = "vital_signs";
	    
}

// function onClickNewVitalSign() {
// 	var table = $('#patients_tbl').DataTable();
	 
// 	var data = table
// 	    .rows()
// 	    .data();
    
//    // $("#document_vs").val(data[0][1]);
    

// }

// var table = $('#patients_tbl').DataTable();

// $('#patients_tbl tbody').on( 'click', 'td', function () {
//     alert( 'Clicked on cell in visible column: '+table.cell( this ).index().columnVisible );
// } );

// $(document).ready( function () {
// 	var table = $('#patients_tbl').DataTable();
// 	    $("#patients_tbl tbody").on('click', '.btn-floating', function() {
// 	        alert('Row index:' + $(this).closest('tr').prevAll().length );
// 	    });                      
// 	} );

// var table = $('#patients_tbl').DataTable();

// $('#patients_tbl tbody').on( 'click', 'tr', function () {
//     console.log( table.row( this ).data() );
//     alert(table.row( this ).data() );
// } );

// $('#patients_tbl tbody').on( 'click', 'tr', function () {
// 	var table = $('#patients_tbl').DataTable();
	 
// 	var data = table
// 	    .rows()
// 	    .data();
// 	var data = table.row( this ).data();
//     alert(data[0]);

// } );

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, options);
  });

  // Or with jQuery

//   $(document).ready(function(){
//     $('.fixed-action-btn').floatingActionButton();
//   });
</script>


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
				<h5 class="indigo-text">Patients</h5>
			</div>
			<div class="row">
			<div class="col-md-6">
<!-- 				<a class="btn-floating btn-large waves-effect waves-light blue"><i -->
<!-- 							class="material-icons right">add</i></a> -->
<!-- 							</div> -->
							
						<button class="waves-effect waves-light btn modal-trigger rigth" data-target="modal1">New</button>
						
			</div>
			</div>


			<div class="container">
				<div class="row valign-wrapper">
					<div class="col s10 offset-s1 valign">
						
						<div class="row">
							<div class="col s12">
								<table id="patients_tbl" class="display highlight" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Document</th>
											<th>Name</th>
											<th>Age</th>
											<th>Status</th>
											<th></th>
											
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Age</th>
											<th>Status</th>
											<th></th>
										</tr>
									</tfoot>
									<tbody>
											<c:forEach items="${patients}" var="patient">
											<tr id="row-${patient.codPatient}">
												<td>${patient.name}</td>
												<td>${patient.document}</td>
												<td>${patient.birthDate}</td>
												<td>${patient.status}</td>
											<td>
												 <div class="table-data-feature">
													 <a class="btn-floating btn-small waves-effect waves-light blue"><i class="material-icons">edit</i></a>
													 <a class="btn-floating btn-small waves-effect waves-light red"><i class="material-icons">delete</i></a>
													  <a class="btn-floating btn-small waves-effect waves-light green modal-trigger" onClick="onClickNewVitalSign()" href="#modal2"><i class="material-icons">add</i></a>
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
	
	<!-- Modal Structure -->
  <div id="modal1" class="modal">
    <div class="modal-content">
      <h4>New Patient</h4>

      <div class="row">
        <form class="col s12" action="new_patient" method="post">
        
        <div class="row">
            <div class="input-field col s12">
              <input id="document" name="document" type="text" class="validate"  required="" aria-required="true">
              <label for="document">Document</label>
            </div>
          </div> 
        
          <div class="row modal-form-row">
            <div class="input-field col s12">
              <input id="patient_name" name="patient_name" type="text" class="validate"  required="" aria-required="true">
              <label for="patient_name">Name</label>
            </div>
          </div>
                
          <div class="row">
            <div class="input-field col s12">
              <input id="birthdate" name="birthdate" type="text"  placeholder="dd/mm/yyyy" class="validate"  required="" aria-required="true">
              <label for="birthdate">Birthdate</label>
            </div>
          </div>    
          
          <div class="input-field col s12">
        <button class="btn waves-effect waves-light" type="submit" name="action">Create</button>
      </div>
                   
        </form>
      </div>
    </div>
<!--     <div class="modal-footer"> -->
<!--       <a class=" modal-action modal-close waves-effect waves-green btn-flat">Submit</a> -->
<!--     </div> -->
  </div>
  
  <!-- Modal New vital Sign -->
  <div id="modal2" class="modal">
    <div class="modal-content">
      <h4>New Vital Sign Check</h4>

      <div class="row">
        <form class="col s12" action="nurse-new_patient-vital-sign" method="post">
        
        <div class="row">
            <div class="input-field col s12">
              <input id="heart_rate" name="heart_rate" type="text" class="validate">
              <label for="heart_rate">Heart rate (bpm)</label>
            </div>
          </div> 
        
          <div class="row modal-form-row">
            <div class="input-field col s12">
              <input id="blood_systolic" name="blood_systolic" type="text" class="validate">
              <label for="blood_systolic">Blood preasure - Systolic (Hg)</label>
            </div>
          </div>
                
          <div class="row modal-form-row">
            <div class="input-field col s12">
              <input id="blood_diastolic" name="blood_diastolic" type="text" class="validate">
              <label for="blood_diastolic">Blood preasure - Diastolic (Hg)</label>
            </div>
          </div>
          <input id="document_vs" name="document_vs" type="hidden" class="validate">
           <div class="input-field col s12">
        <button class="btn waves-effect waves-light" type="submit" name="action">Create</button>      
        </form>
      </div>
    </div>
<!--     <div class="modal-footer"> -->
<!--       <a class=" modal-action modal-close waves-effect waves-green btn-flat">Submit</a> -->
<!--     </div> -->
  </div>
	
	

	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

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
  
//   function addNewVitalSign(){
// 	  $('#vs_document').value('1232131');
//   }
  
//   function deletePatient(){
// 	  alert("New vital sign");
//   }
  
//   function updatePatient(){
// 	  alert("Nnew vital sign");
//   }

</script>

</html>