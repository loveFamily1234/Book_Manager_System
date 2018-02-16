package Book_Manager_System_Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.hibernate.dialect.function.VarArgsSQLFunction;

import com.Cargos;
import com.cargosService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class CargosAction extends ActionSupport{

	//Map<String, Cargos> list;
	public String pageSize;
	public String pageNumber;

	

	

	public void getCargosTemp() throws IOException{
         List<Cargos> list = cargosService.getCargos();
         System.out.println( pageNumber+" "+pageSize);
         
//	   	 JSONObject json=new JSONObject();
//		    Cargos cargos=new Cargos();
//			cargos.setCargoNumber("sdf");
//			cargos.setCargoName("dsfdsf");
//			cargos.setModel("dsf");
//			cargos.setSize("dsf");
//			cargos.setWeight("sdfdsf");
//			cargos.setId("dsfsd");
//		     json.accumulate("cargos", cargos);
 //       JSONArray arr = JSONArray.fromObject(list);

         Map<String,Object> map = new HashMap<String,Object>();
      
                     map.put("total", 100);
      
                     map.put("rows",list);
         
         
          
//         String a="{}"
		     ServletActionContext.getResponse().setContentType("application/json;charset=UTF-8");
            PrintWriter out = ServletActionContext.getResponse().getWriter(); 
            JSONObject json = JSONObject.fromObject(map);
            System.out.println(json.toString());
            out.println(json);
            out.flush(); 
            out.close(); 
    }





	public String getPageSize() {
		return pageSize;
	}





	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}





	public String getPageNumber() {
		return pageNumber;
	}





	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}
	

//	public Map<String, Cargos> getList() {
//		return list;
//	}
//
//
//	public void setList(Map<String, Cargos> list) {
//		this.list = list;
//	}





	

}
