<html>

<head>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
<!--   <style> -->

<!--   </style> -->
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
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, options);
  });

  // Or with jQuery

  $(document).ready(function(){
    $('.fixed-action-btn').floatingActionButton();
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
    <li><a class="btn-floating blue" href="http://178.62.17.200:8080/nurseapp-web/nurse/vital_signs"><i class="material-icons">info_outline</i></a></li>
  </ul>
</div>
      
  <div class="section"></div>
  <main>
    <center>
<!--       <img class="responsive-img" style="width: 250px;" src="https://i.imgur.com/ax0NCsK.gif" /> -->
      <div class="section"></div>

      <h4 class="indigo-text">Hi!</h4>
      <h5 class="indigo-text">You want to work with :</h5>  
      <div class="section"></div>

      <div class="container">
        <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">
          <form class="col s12" >
            <a class="waves-effect waves-light btn-large" id="btn-patient" onclick="onClickPatient()" >Patients</a>
            </form>
          <form class="col s12"  >
            <a class="waves-effect waves-light btn-large" id="btn-vital-sign"  onclick="onClickVitalSign()">Vital signs</a>
          </form>
<!--            <form class="col s12"  > -->
<!--             <a class="waves-effect waves-light btn-large" id="btn-check-vital-sign"  onclick="onClickCheck()">Check Vital Signs</a> -->
<!--           </form> -->
        </div>
      </div>
    </center>

    <div class="section"></div>
    <div class="section"></div>
  </main>

  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</body>

</html>

