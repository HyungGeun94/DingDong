package kr.co.dingdong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dingdong.domain.Alarm;
import kr.co.dingdong.repository.AlarmRepository;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private AlarmRepository alarmRepository;

	@Override
	public int insert(Alarm alarm) {
		return alarmRepository.insert(alarm);
	}

	@Override
	public List<Alarm> listById(String id) {
		return alarmRepository.listById(id);
	}

	@Override
	public int countNotRead(String id) {
		return alarmRepository.countNotRead(id);
	}

	@Override
	public Alarm findByIdx(int idx) {
		return alarmRepository.findByIdx(idx);
	}

	@Override
	public int read(int idx) {
		return alarmRepository.read(idx);
	}

}
