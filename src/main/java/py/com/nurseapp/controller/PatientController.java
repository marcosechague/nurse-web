package py.com.nurseapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import py.com.nurseapp.client.model.PatientResponse;
import py.com.nurseapp.client.model.PatientVitalSignResponse;
import py.com.nurseapp.client.model.VitalSign;
import py.com.nurseapp.service.PatientService;

@Controller
public class PatientController {

	private static final String VIEWER_ERROR_PAGE = "error";
	
    private static final String VIEWER_DOCUMETN_NUMBER = "patient";
    
    private static final String VIEWER_NURSE_MENU= "nurse";
    
    private static final String VIEWER_NURSE_PATINTS= "nurse_patients_details";
    
    private static final String VIEWER_NURSE_VITAL_SIGNS= "nurse_vital_sign";
    
    private static final String VIEWER_PATIENT_DETAILS = "patient_details";
    
    private static final String GO_TO_NURSE_PATIENTS = "redirect:/nurse/patients";
    
    

    @Autowired
    private PatientService patientService;
    
    @GetMapping("patient/step-1")
    public String patient(Model model) {
        return VIEWER_DOCUMETN_NUMBER;
    }
    
    @GetMapping("nurse/step-1")
    public String nurse(Model model) {
        return VIEWER_NURSE_MENU;
    }
    
    @GetMapping("nurse/patients")
    public String nursePatients(Model model) {
    	List<PatientResponse> patient = patientService.getPatients(null, null, null);
    	model.addAttribute("patients",patient);
        return VIEWER_NURSE_PATINTS;
    }
    
    @GetMapping("nurse/vital_signs")
    public String nurseVitalSign(Model model) {
    	List<VitalSign> vitalSigns = patientService.getVitalSigns();
    	model.addAttribute("vitalSigns",vitalSigns);
        return VIEWER_NURSE_VITAL_SIGNS;
    }
    
    @PostMapping("patient/document")
    public String patientDocument(Model model, HttpServletRequest request) {
    	String document = request.getParameter("document");
    	PatientResponse patient = patientService.getPatient(null, document, null);
    	if (patient == null) {
    		return VIEWER_ERROR_PAGE;
    	}
    	model.addAttribute("patient",patient);
    	
    	List<PatientVitalSignResponse> vitalSigns  = patientService.getPatientVitalSignHistory(document);
    	model.addAttribute("vitalSigns",vitalSigns);
        
    	return VIEWER_PATIENT_DETAILS;
    }
    
    @PostMapping("nurse/patients")
    public String nursePatients(Model model, HttpServletRequest request) {    	
    	List<PatientVitalSignResponse> vitalSigns  = patientService.getPatientVitalSignHistory(null);
    	model.addAttribute("vitalSigns",vitalSigns);
        
    	return VIEWER_DOCUMETN_NUMBER;
    }
    
    @PostMapping("nurse/new_patient")
    public String nurseNewPatient(Model model, HttpServletRequest request) {    	
    	String document = request.getParameter("document");
    	String name = request.getParameter("patient_name");
    	String birthdate = request.getParameter("birthdate");
    	patientService.createPatient(name, document, birthdate);

    	return GO_TO_NURSE_PATIENTS;
    }
    
    @PostMapping("nurse/nurse-new_patient-vital-sign")
    public String nurseNewPatientVitalSign(Model model, HttpServletRequest request) {    	
    	Integer heartRate = Integer.parseInt(request.getParameter("heart_rate"));
    	Integer systolic = Integer.parseInt(request.getParameter("blood_diastolic"));
    	Integer distolic = Integer.parseInt(request.getParameter("blood_systolic"));
    	String document =request.getParameter("document_vs");
    	
    	//TODO DOCUMEMT
    	patientService.createPatientVitalSign("123456", heartRate, systolic, distolic);

    	return GO_TO_NURSE_PATIENTS;
    }

}
