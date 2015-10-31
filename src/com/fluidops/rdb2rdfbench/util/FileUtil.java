package com.fluidops.rdb2rdfbench.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

public class FileUtil {

	public static void writeStringToFile(String str, String filePath){
		PrintWriter tmpASP;
		try {
			tmpASP = new PrintWriter(filePath);
			tmpASP.print(str);
			tmpASP.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static String readStringFromFile(String filePath){
		BufferedReader br = null;
		StringBuilder sb = null;
		try {
			br = new BufferedReader(new FileReader(new File(filePath)));
			sb = new StringBuilder();
			String line = br.readLine();

			while (line != null) {
				sb.append(line);
				sb.append('\n');
				line = br.readLine();
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}
}
