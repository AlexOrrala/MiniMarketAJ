package Aspectos;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import DVMarket.Compra;

public aspect SalidaProductos {
	pointcut callBorrarItem(): call(* Compra.borrarItem(..));
	before () throws Throwable :callBorrarItem() {
		String nameArchivo= "market.txt";
		FileWriter archivo = null;
		Date date =new Date();
		if(!(new File(nameArchivo)).exists() ){
			try {
				archivo= new FileWriter(nameArchivo);
			} catch (IOException e) {
				System.out.println("An error occurred.");
				e.printStackTrace();
			}
		}
		
		archivo.write("Borrar Item"+date.toString());
		
	}
	
	
}
