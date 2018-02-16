package com;

import java.util.ArrayList;

public class cargosService {
public static ArrayList<Cargos> getCargos(){
	ArrayList<Cargos> temp=new ArrayList<>();
	for(int i=0;i<5;i++){
		Cargos cargos=new Cargos();
		cargos.setCargoNumber("sdf"+i);
		cargos.setCargoName("dsfdsf"+i);
		cargos.setModel("dsf"+i);
		cargos.setSize("dsf"+i);
		cargos.setWeight("sdfdsf"+i);
		cargos.setId("dsfsd"+i);
		temp.add(cargos);
	}
	return temp;
}
}
