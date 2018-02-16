package Method;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Method {
	 public static int compare_date(String DATE1, String DATE2) {
	        
	        
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	//            System.out.println();
	            if (dt1.getTime() > dt2.getTime()) {
	                return -1;
	            } else if (dt1.getTime() < dt2.getTime()) {
	           //     System.out.println("dt1在dt2后");
	                return 1;
	            } else {
	                return 0;
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return 0;
	    }
	   public static int differentDays(String date1,String date2)
	    {
		   long difference = 0;
		   DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
           try {
				Date dt1 = df.parse("2012-2-2");
				Date dt2 = df.parse("2016-2-5");
		        difference =  (dt1.getTime()-dt2.getTime())/86400000;
           }catch (Exception e) {
			// TODO: handle exception
		}
		    return (int) Math.abs(difference);  
	    }
	   public static String addDate(String date,long day) throws ParseException {
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 日期格式
		    Date dt = dateFormat.parse(date); // 指定日期
		   	long time = dt.getTime(); // 得到指定日期的毫秒数
		    day = day*24*60*60*1000; // 要加上的天数转换成毫秒数
		    time+=day; // 相加得到新的毫秒数
		    
		    Date result= new Date(time); // 将毫秒数转换成日期
		    
	        String dateNowStr = dateFormat.format(result);
	        return dateNowStr;
		  }
}
