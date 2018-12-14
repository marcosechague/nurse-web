package py.com.nurseapp.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import py.com.nurseapp.client.model.PatientDto;
import py.com.nurseapp.client.model.PatientResponse;
import py.com.nurseapp.client.model.PatientVitalSignResponse;
import py.com.nurseapp.client.model.VitalSign;
import py.com.nurseapp.dao.PatientDao;
import py.com.nurseapp.service.PatientService;
import py.com.nursepp.client.ApiException;

@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientDao patientDao;

	@Override
	public PatientResponse getPatient(String name, String document, String status) {
		try {
			List<PatientResponse> patients = patientDao.getPatients(name, document, status);
			if (patients.size() == 0)
				return null;
			return patients.get(0);
		} catch (ApiException e) {
			throw new RuntimeException();
		}
	}

	@Override
	public List<PatientVitalSignResponse> getPatientVitalSignHistory(String document) {
		try {
			List<PatientVitalSignResponse> pvs = patientDao.getPatientVitalSignHistory(document);
			return pvs;
		} catch (ApiException e) {
			throw new RuntimeException();
		}

	}

	@Override
	public List<PatientResponse> getPatients(String name, String document, String status) {
		try {
			List<PatientResponse> patients = patientDao.getPatients(name, document, status);
			if (patients.size() == 0)
				return null;
			return patients;
		} catch (ApiException e) {
			throw new RuntimeException();
		}
	}

	@Override
	public void createPatient(String name, String document, String birthdate)  {
		PatientDto patientDto = new PatientDto();
		patientDto.setDocument(document);
		patientDto.setName(name);

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		//only for check
		try {
			formatter.parse(birthdate);
		} catch (ParseException e) {
			throw new RuntimeException();
		}
		patientDto.setBithDate(birthdate);
		try {
			patientDao.createPatient(patientDto);
		} catch (ApiException e) {
			throw new RuntimeException();
		}
		
	}

	@Override
	public void createPatientVitalSign(String document, Integer herts, Integer systolic, Integer diastolic) {
			List<PatientResponse> patients;
			try {
				patients = patientDao.getPatients(null, document, null);
				if (patients.size() == 0)
					throw new RuntimeException();
			} catch (ApiException e) {
				throw new RuntimeException();
			}
			
			PatientResponse patient =  patients.get(0);
			
			String codHerts = "HBE";
			String codSystolic = "HBE";
			String codDiastolic = "HBE";
			
			try {
				patientDao.createPatientVitalSign(patient.getCodPatient(), codHerts, herts);
				patientDao.createPatientVitalSign(patient.getCodPatient(), codSystolic, systolic);
				patientDao.createPatientVitalSign(patient.getCodPatient(), codDiastolic, diastolic);
			} catch (ApiException e) {
				throw new RuntimeException();
			}
	}

	@Override
	public List<VitalSign> getVitalSigns() {
		try {
			List<VitalSign> vitalSigns = patientDao.getVitalSigns();
			return vitalSigns;
		} catch (ApiException e) {
			throw new RuntimeException();
		}
	}

}
