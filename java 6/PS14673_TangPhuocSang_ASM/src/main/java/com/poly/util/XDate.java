package com.poly.util;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Service;

@Service
public class XDate {
	public String convertToPattern(Date yourdate, String pattern) {
		return new SimpleDateFormat(pattern).format(yourdate);
	}
}
