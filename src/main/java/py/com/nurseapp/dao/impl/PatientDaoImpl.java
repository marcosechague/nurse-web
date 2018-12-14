package py.com.nurseapp.dao.impl;

import java.time.format.DateTimeParseException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.squareup.okhttp.OkHttpClient;

import py.com.nurseapp.client.api.PatientControllerApi;
import py.com.nurseapp.client.api.VitalSignControllerApi;
import py.com.nurseapp.client.model.PatientDto;
import py.com.nurseapp.client.model.PatientResponse;
import py.com.nurseapp.client.model.PatientVitalSignDto;
import py.com.nurseapp.client.model.PatientVitalSignResponse;
import py.com.nurseapp.client.model.ResponsePatientListDto;
import py.com.nurseapp.client.model.ResponsePatientVitalSignListDto;
import py.com.nurseapp.client.model.ResponseVitalSignListDto;
import py.com.nurseapp.client.model.VitalSign;
import py.com.nurseapp.configuration.NurseAppProperties;
import py.com.nurseapp.dao.PatientDao;
import py.com.nursepp.client.ApiClient;
import py.com.nursepp.client.ApiException;

@Repository
public class PatientDaoImpl implements PatientDao{
	
	 private ApiClient apiClient;
	 private PatientControllerApi patientClient;
	 private VitalSignControllerApi vitalSignCient;

	    private NurseAppProperties properties;

	    public PatientDaoImpl(NurseAppProperties properties) {
	    	this.properties = properties;
	        apiClient = new ApiClient();
	        apiClient.setBasePath(properties.getApiEndpoint());
	        OkHttpClient httpClient = apiClient.getHttpClient();
//	        apiClient.getHttpClient().setReadTimeout(Long.parseLong(properties.getApiGenericTimeout()),TimeUnit.MINUTES);
	        apiClient.setHttpClient(httpClient);
	        patientClient = new PatientControllerApi(apiClient);
	        vitalSignCient = new VitalSignControllerApi(apiClient);
	    }

	@Override
	public List<PatientVitalSignResponse> getPatientVitalSignHistory(String document) throws ApiException {
		ResponsePatientVitalSignListDto response = patientClient.getPatientsVitalSignUsingGET(properties.getApiKey(), document);
		return response.getPatientVitalSigns();
	}

	@Override
	public List<PatientResponse> getPatients(String name, String document, String status) throws ApiException {
		ResponsePatientListDto response = patientClient.getPatientsUsingGET(properties.getApiKey(), name, document, status);
		return response.getPatients();
	}

	@Override
	public void createPatient(PatientDto patientDto) throws ApiException {
		try {
			patientClient.createPatientUsingPOST(properties.getApiKey(), patientDto);
		}catch(DateTimeParseException e) {
			System.out.println("Parse date, no problem");
			
		}	
	}

	@Override
	public void createPatientVitalSign(Integer idPatient, String codVitalSign, Integer valueVitalSign)
			throws ApiException {
		try {
			PatientVitalSignDto dto = new PatientVitalSignDto();
			dto.idPatient(idPatient);
			dto.codVitalSign(codVitalSign);
			dto.valueVitalSign(valueVitalSign);
			patientClient.createHistoryPatientVitalSignUsingPOST(properties.getApiKey(), dto);
		}catch(DateTimeParseException e) {
			System.out.println("Parse date, no problem");
			
		}	

	}

	@Override
	public List<VitalSign> getVitalSigns() throws ApiException {
		ResponseVitalSignListDto vitalSign = vitalSignCient.getVitalSignsUsingGET(properties.getApiKey(),null, null, null, null, null, null, null);
		return vitalSign.getVitalSign();
	}


}
