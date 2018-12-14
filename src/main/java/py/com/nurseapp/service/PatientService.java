package py.com.nurseapp.service;

import java.util.List;

import py.com.nurseapp.client.model.PatientResponse;
import py.com.nurseapp.client.model.PatientVitalSignResponse;
import py.com.nurseapp.client.model.VitalSign;

public interface PatientService {

	public List<PatientVitalSignResponse> getPatientVitalSignHistory(String document);

	public PatientResponse getPatient(String name, String document, String status);
	
	public List<PatientResponse> getPatients(String name, String document, String status);
	
	public void createPatient(String name, String document, String status);
	
	public void createPatientVitalSign(String document,Integer herts, Integer systolic, Integer diastolic);

	public List<VitalSign> getVitalSigns();
	
	
}
