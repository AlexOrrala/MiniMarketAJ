package Aspectos;

import java.io.File;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Date;

import org.aspectj.lang.reflect.MethodSignature;

import DVMarket.*;

public aspect BusquedaProducto {
	pointcut busqueda(): call(* Compra.buscar*(..) );
	
	before() : busqueda(){
		String nombre = "";
		MethodSignature signature = (MethodSignature) thisJoinPoint.getSignature();
	    String methodName = signature.getMethod().getName();
	    String ObjectName = signature.getMethod().getClass().getName();
		Date date = new Date();
		
		
		
		try{
            File dir = new File("");
            dir.mkdir();
            File file = new File(dir,"file3");
            PrintWriter objPrintWriter = new PrintWriter(file);
            file.createNewFile();
            objPrintWriter.print(ObjectName +"\n");
            objPrintWriter.print(methodName +"\n");
            objPrintWriter.print(date.toString()+"\n");
            
            objPrintWriter.close();
        }catch(Exception x){
        }
		
	}
	


}
