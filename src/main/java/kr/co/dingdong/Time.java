package kr.co.dingdong;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;

import kr.co.dingdong.domain.CommunityVO;

public class Time {
	
	public static void calculateTimeDifference(List<CommunityVO> list){
		// 문자열을 Timestamp 객체로 변환
		Timestamp timestamp;
		for (int i=0; i<list.size(); i++){
			 timestamp = Timestamp.valueOf(list.get(i).getRegDate());
			LocalDateTime currentTime = LocalDateTime.now();
			LocalDateTime postTime = timestamp.toLocalDateTime();

			Duration duration = Duration.between(postTime, currentTime);
			long minutes = duration.toMinutes();
			long hours = duration.toHours();
			long days = duration.toDays();
			long year = days/365;


			if(year>1 ){
				list.get(i).setRegDate(year +"년 전");
			}
			else if (days > 0) {
				list.get(i).setRegDate(days +"일 전");

			} else if (hours > 0) {
				list.get(i).setRegDate(hours +"시간 전");
			} else {
				list.get(i).setRegDate(minutes +"분 전");
			}
		}
	}

}
