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
	           //     System.out.println("dt1��dt2��");
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
		    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // ���ڸ�ʽ
		    Date dt = dateFormat.parse(date); // ָ������
		   	long time = dt.getTime(); // �õ�ָ�����ڵĺ�����
		    day = day*24*60*60*1000; // Ҫ���ϵ�����ת���ɺ�����
		    time+=day; // ��ӵõ��µĺ�����
		    
		    Date result= new Date(time); // ��������ת��������
		    
	        String dateNowStr = dateFormat.format(result);
	        return dateNowStr;
		  }
}
