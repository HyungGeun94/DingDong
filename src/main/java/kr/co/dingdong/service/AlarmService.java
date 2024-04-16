package kr.co.dingdong.service;

import java.util.List;

import kr.co.dingdong.domain.Alarm;

public interface AlarmService {
	
	int insert(Alarm alarm);
	List<Alarm> listById(String id);
	int countNotRead(String id);
	Alarm findByIdx(int idx);
	int read(int idx);

}
