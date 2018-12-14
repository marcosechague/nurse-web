package py.com.nurseapp.dao;

import java.util.List;

import py.com.nurseapp.client.model.PatientDto;
import py.com.nurseapp.client.model.PatientResponse;
import py.com.nurseapp.client.model.PatientVitalSignResponse;
import py.com.nurseapp.client.model.VitalSign;
import py.com.nursepp.client.ApiException;

public interface PatientDao {

	public List<PatientResponse> getPatients(String name, String document, String status) throws ApiException;
	
	public List<PatientVitalSignResponse> getPatientVitalSignHistory(String document) throws ApiException;
	
	public void createPatient(PatientDto patientDto) throws ApiException;
	
	public void createPatientVitalSign(Integer idPatient, String codVitalSign, Integer valueVitalSign) throws ApiException;
	
	public List<VitalSign> getVitalSigns() throws ApiException;
}
