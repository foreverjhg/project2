package com.controller;

import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.GraphDAO;


@WebServlet("/graphService")
public class graphService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		Calendar time = Calendar.getInstance();
		String format_time1 = format1.format(time.getTime());
		System.out.println(format_time1);
		
		String category = request.getParameter("category");
		
		System.out.println("카테고리"+category);
		
		HashMap pHm = new HashMap();
		
		pHm.put("category", category.toLowerCase());
		pHm.put("date", format_time1);
		
		GraphDAO dao = new GraphDAO();
		
		List<Map<String, String>>list = dao.selectScore(pHm);
		
		String result = createCSV(list);
		
		List<Map<String, String>>listmean = dao.selectmean(pHm);
		
		System.out.println(listmean.size());
	}
	
	public String createCSV(List<Map<String, String>>list) {
	    try {
	        String filename = "C:\\Users\\dk\\Desktop\\project2\\project2\\WebContent\\csv\\aster_data.csv";
	        FileWriter fw = new FileWriter(filename);
	        fw.append("id");fw.append(',');fw.append("order");fw.append(',');fw.append("score");fw.append(',');fw.append("weight");fw.append(',');fw.append("color");fw.append(',');fw.append("label");fw.append('\n');
	        fw.append("A");fw.append(',');fw.append("1");fw.append(',');fw.append(String.valueOf(list.get(0).get("REPLY_SCORE")));fw.append(',');fw.append("0.5");fw.append(',');fw.append("#9E0041");fw.append(',');fw.append(list.get(0).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("B");fw.append(',');fw.append("2");fw.append(',');fw.append(String.valueOf(list.get(1).get("REPLY_SCORE")));fw.append(',');fw.append("1");fw.append(',');fw.append("#E1514B");fw.append(',');fw.append(list.get(1).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("C");fw.append(',');fw.append("3");fw.append(',');fw.append(String.valueOf(list.get(2).get("REPLY_SCORE")));fw.append(',');fw.append("1");fw.append(',');fw.append("#F47245");fw.append(',');fw.append(list.get(2).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("D");fw.append(',');fw.append("4");fw.append(',');fw.append(String.valueOf(list.get(3).get("REPLY_SCORE")));fw.append(',');fw.append("1");fw.append(',');fw.append("#FB9F59");fw.append(',');fw.append(list.get(3).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("F");fw.append(',');fw.append("5");fw.append(',');fw.append(String.valueOf(list.get(4).get("REPLY_SCORE")));fw.append(',');fw.append("1");fw.append(',');fw.append("#FEC574");fw.append(',');fw.append(list.get(4).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("G");fw.append(',');fw.append("6");fw.append(',');fw.append(String.valueOf(list.get(5).get("REPLY_SCORE")));fw.append(',');fw.append("1");fw.append(',');fw.append("#FAE38C");fw.append(',');fw.append(list.get(5).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("H");fw.append(',');fw.append("7");fw.append(',');fw.append(String.valueOf(list.get(6).get("REPLY_SCORE")));fw.append(',');fw.append("0.5");fw.append(',');fw.append("#EAF195");fw.append(',');fw.append(list.get(6).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("I");fw.append(',');fw.append("8");fw.append(',');fw.append(String.valueOf(list.get(7).get("REPLY_SCORE")));fw.append(',');fw.append("0.5");fw.append(',');fw.append("#9CD6A4");fw.append(',');fw.append(list.get(7).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("J");fw.append(',');fw.append("9");fw.append(',');fw.append(String.valueOf(list.get(8).get("REPLY_SCORE")));fw.append(',');fw.append("1");fw.append(',');fw.append("#4D9DB4");fw.append(',');fw.append(list.get(8).get("SITE_CONTENTS"));fw.append('\n');
	        fw.append("K");fw.append(',');fw.append("10");fw.append(',');fw.append(String.valueOf(list.get(9).get("REPLY_SCORE")));fw.append(',');fw.append("0.5");fw.append(',');fw.append("#4776B4");fw.append(',');fw.append(list.get(9).get("SITE_CONTENTS"));fw.append('\n');
	        
	        
	        
	        
	        
	        fw.close();

	        return "Csv file Successfully created";
	    } catch(Exception e) {
	        return e.toString();
	    }
	}
}
