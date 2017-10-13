package cn.news.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringtoDateConverter implements Converter<String, Date> {

	@Override
	public Date convert(String arg0) {
		Date date = null;
		if (arg0 != "") {
			try {
				System.out.println(arg0);
				date = new SimpleDateFormat("yyyy-MM-dd").parse(arg0);
				System.out.println(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return date;
	}
}
