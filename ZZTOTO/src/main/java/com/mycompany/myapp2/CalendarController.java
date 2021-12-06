package com.mycompany.myapp2;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.domain.DateData;
import com.mycompany.domain.Schedule;
import com.mycompany.mapper.PestMapper;

@Controller
public class CalendarController {

	@Autowired
	private PestMapper mapper;

	@RequestMapping(value = "notification.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {

		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		System.out.println(dateData);
		// notification.jsp > input태그에서 사용하기위한 날짜
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		String today_date = format.format(cal.getTime());

		// 날짜 검색
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		// 날짜 검색 끝

		// 달력데이터에 넣기 위한 배열 추가
		ArrayList<Schedule> Schedule_list = mapper.schedule_list(dateData);
		System.out.println(Schedule_list.size());
		Schedule[][] schedule_data_arr = new Schedule[32][4];

		if (Schedule_list.isEmpty() != true) {
			int j = 0;
			for (int i = 0; i < Schedule_list.size(); i++) {
				/*
				 * int date =
				 * Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).
				 * substring( String.valueOf(Schedule_list.get(i).getSchedule_date()).length() -
				 * 2, String.valueOf(Schedule_list.get(i).getSchedule_date()).length()));
				 */
				int date = Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).substring(8, 10));
				System.out.println(Schedule_list.get(i).getSchedule_date());
				System.out.println(date);
				if (i > 0) {
					/*
					 * int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i -
					 * 1).getSchedule_date()) .substring(String.valueOf(Schedule_list.get(i -
					 * 1).getSchedule_date()).length() - 2, String.valueOf(Schedule_list.get(i -
					 * 1).getSchedule_date()).length()));
					 */
					int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).substring(8, 10));
					if (date_before == date) {
						j = j + 1;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					} else {
						j = 0;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					}
				} else {
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			}
		}

		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작
		// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			Schedule[] schedule_data_arr3 = new Schedule[4];
			schedule_data_arr3 = schedule_data_arr[i];
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", schedule_data_arr3);
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", schedule_data_arr3);
			}
			dateList.add(calendarData);
		}

		// 달력 빈곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}
		for(int i=0;i<dateList.size();i++) {
			System.out.println(dateList.get(i));
			System.out.println(dateList.get(i).getSchedule_data_arr()[0]);
		}

		// 배열에 담음
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열(객체 바인딩)
		model.addAttribute("today_info", today_info);

		return "notification";
	}

	// 스케줄 추가 기능
	@RequestMapping(value = "schedule_add.do", method = RequestMethod.GET)
	public String schedule_add(Schedule schedule, RedirectAttributes rttr) {
		int count = mapper.before_schedule_add_search(schedule);
		String message = "";
		String url = "redirect:notification.do";

		if (count >= 4) {
			message = "스케줄은 최대 4개만 등록 가능합니다.";
		} else {
			mapper.schedule_add(schedule);
			message = "스케줄이 등록되었습니다";
		}

		rttr.addFlashAttribute("message", message);
		return url;
	}

}
