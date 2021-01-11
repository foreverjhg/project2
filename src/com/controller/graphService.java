package com.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
		System.out.println(result);
		
		
		List<Map<String, String>>listmean = dao.selectmean(pHm);
	
		String sitename = listmean.get(0).get("SITE_NAME");
		String mean = String.valueOf(listmean.get(0).get("MAX_MEAN"));
		
		if (listmean.size()>0) {
			response.sendRedirect("graph.jsp?category="+sitename+"&"+"mean="+mean);
		}
		
	}
	
	public String createCSV(List<Map<String, String>>list) {
	    try {
	    	
	    	String filepath = getServletContext().getRealPath("") + File.separator + "csv\\";
	        String filename = "aster_data.csv";
	        
	        File tarf = new File(filepath + filename);
	        System.out.println(filepath + filename);
	        
	        tarf.createNewFile();
	        BufferedWriter outwriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(tarf),"UTF8"));
	   
	        String str = "id,order,score,weight,color,label\n";
	        
	        String[] colors = {"#9E0041","#E1514B","#F47245","#FB9F59","#FEC574","#FAE38C","#EAF195","#9CD6A4","#4D9DB4","#4776B4"};
	        String[] weights = {"0.5","1","1","1","1","1","0.5","0.5","1","0.5"};
	        String[] ids = {"A","B","C","D","E","F","G","H","I","J"};
	        
	        for(int i=0; i<list.size(); i++) {
	        	  str += ids[i]+","+(i+1)+","+String.valueOf(list.get(i).get("REPLY_SCORE"))+","+weights[i]+","+colors[i]+","+list.get(i).get("SITE_CONTENTS")+"\n";
	        }
	        outwriter.write(str);
	        outwriter.close();
	        
	        return "Csv file Successfully created";
	    } catch(Exception e) {
	        return e.toString();
	    }
	}
}
