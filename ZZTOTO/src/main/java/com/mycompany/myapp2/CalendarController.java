package com.mycompany.myapp2;

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

import com.mycompany.domain.Crop_calendar;
import com.mycompany.domain.DateData;
import com.mycompany.mapper.PestMapper;

@Controller
public class CalendarController {

	@Autowired
	private PestMapper mapper;

	@RequestMapping(value = "notification.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {

		Calendar cal = Calendar.getInstance();
		DateData calendarData;

		// �˻� ��¥
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null);
		}
		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		// �˻� ��¥ ��

		// �޷µ����Ϳ� �ֱ� ���� �迭 �߰�
		/* Calendar[][] calendar_data_arr = new Calendar[32][4]; */
		/*
		 * if (Schedule_list.isEmpty() != true) { int j = 0; for (int i = 0; i <
		 * Schedule_list.size(); i++) { int date =
		 * Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).
		 * substring( String.valueOf(Schedule_list.get(i).getSchedule_date()).length() -
		 * 2, String.valueOf(Schedule_list.get(i).getSchedule_date()).length())); if (i
		 * > 0) { int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i
		 * - 1).getSchedule_date()) .substring(String.valueOf(Schedule_list.get(i -
		 * 1).getSchedule_date()).length() - 2, String.valueOf(Schedule_list.get(i -
		 * 1).getSchedule_date()).length())); if (date_before == date) { j = j + 1;
		 * schedule_data_arr[date][j] = Schedule_list.get(i); } else { j = 0;
		 * schedule_data_arr[date][j] = Schedule_list.get(i); } } else {
		 * schedule_data_arr[date][j] = Schedule_list.get(i); } } }
		 */

		// �������� �޷� ������ ����Ʈ�� ������ ���� ����
		// �ϴ� ���� �ε������� �ƹ��͵� ���� ������ ����
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null);
			dateList.add(calendarData);
		}

		// ��¥ ����
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today");
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		// �޷� ��� �� �����ͷ� ����
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);

		// �迭�� ����
		model.addAttribute("dateList", dateList);
		model.addAttribute("today_info", today_info);
		return "notification";
	}

	// ������ �߰� ���
	@RequestMapping(value = "schedule_add.do", method = RequestMethod.GET)
	public String schedule_add(Crop_calendar calendar, RedirectAttributes rttr) {
		String url = "redirect:calendar.do";

		mapper.schedule_add(calendar);
		String message = "�������� ��ϵǾ����ϴ�";

		rttr.addFlashAttribute("message", message);
		return url;
	}

}
