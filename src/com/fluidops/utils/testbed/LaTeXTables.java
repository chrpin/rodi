package com.fluidops.utils.testbed;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class LaTeXTables {

	
	String[] schemas = new String[]{"cmt", "sigkdd", "conference"};
	
	
	String[] variants = new String[]{"renamed", "structured_ci", "mixed", "denormalized_ci", "noconstraints_ci"};
	
			
	
	
	public LaTeXTables() throws FileNotFoundException{
		
		//Scores scores = readAverage("cmt", "renamed");
		//System.out.println(scores);
		
		//createAveragesTable();
		createAdjustedNamingTable();
		//createCleanedHierarchiesTable();
		
		
	}
	
	public String createFileName(String schema, String variant){
			
		return System.getProperty("user.dir") + "/reports/paper/tabular_" + schema + "_" + variant + "_konclude.txt";
		
	}
	
	public Scores readAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "All (AVG)");
	}
	
	
	public Scores readClassAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "class (AVG)");
	}
	
	
	public Scores readAttributeAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "attrib (AVG)");
	}

	
	public Scores readLinkAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "link (AVG)");
	}
	
	
	public Scores readManyToOneLinkAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "n-1 (AVG)");
	}
	
	public Scores readOneToOneAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "1-1 (AVG)");
	}
	
	
	
	public Scores readNoFKAverage(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "nofk (AVG)");
	}
	
	
	public Scores readDenorm(String schema, String variant) throws FileNotFoundException{
		return readScore(schema, variant, "denorm (AVG)");
	}
	
	
	public Scores readScore(String schema, String variant, String lineIdent) throws FileNotFoundException{
		
		ReadFile reader = new ReadFile(createFileName(schema, variant));

		String line;
		String[] elements;
		
		Scores scores = new Scores();		
		while ((line = reader.readLine())!=null){
			
			if (line.startsWith(lineIdent)){			
				elements = line.split("\\|");
							
				scores.precision = Double.valueOf(elements[1]);
				scores.recall = Double.valueOf(elements[2]);
				if (elements[3].equals("NaN"))
					scores.fmeasure = 0.0;
				else
					scores.fmeasure = Double.valueOf(elements[3]);
					
			}
		}
		
		return scores;
		
	}
	
	
	
	
	
	public void createAveragesTable() throws FileNotFoundException{
		
		System.out.println("\\setlength{\\tabcolsep}{3.7pt}");
		System.out.println("\\begin{table}[tb]");
		System.out.println("\\caption{Average results for the different schema versions (scenarios)}");
		System.out.println("\\label{tab:averages}");
		System.out.println("\\begin{center}");
		//System.out.println("\\begin{tabular}{ | c || c | c | c || c | c | c || c | c | c | }");
		System.out.println("\\begin{tabular}{ | c || c | c | c || c | c | c |}");
		System.out.println("\\hline");
		  
		System.out.println("\\multirow{2}{*}{\\textbf{Scenario}}");
		System.out.println("& \\multicolumn{3}{c||}{\\textbf{Optique Boots.}}");
		System.out.println("& \\multicolumn{3}{c|}{\\textbf{IncMap}} \\\\\\cline{2-7}");
		//System.out.println("& \\multicolumn{3}{c|}{\\textbf{IncMap}}");		  
		//System.out.println("& \\multicolumn{3}{c|}{\\textbf{morph-RDB}} \\\\\\cline{2-10}");
		System.out.println("& \\textbf{P} & \\textbf{R} & \\textbf{F}"); 
		System.out.println("& \\textbf{P} & \\textbf{R} & \\textbf{F}");
		//System.out.println("& \\textbf{P} & \\textbf{R} & \\textbf{F}");
		System.out.println("\\\\\\hline\\hline");
		System.out.println("\n");
		
		Scores scores;
		
		scores = readAverage("cmt", "structured_ci");		
		System.out.println("CMT cleaned hierarchies");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);	
		System.out.println("& & & %For IncMap");
		//System.out.println("& - & - & - %For Morph");
		
		System.out.println("\\\\");
		
		
		scores = readAverage("conference", "structured_ci");
		System.out.println("CONFERENCE cleaned hierarchies");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);
		System.out.println("& & & %For IncMap");
		//.out.println("& - & - & - %For Morph");
		System.out.println("\\\\");
		
		scores = readAverage("sigkdd", "structured_ci");
		System.out.println("SIGKDD cleaned hierarchies");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		//System.out.println("& - & - & - %For Morph");
		System.out.println("\\\\\\hline\\hline");
		
		
		
		scores = readAverage("cmt", "renamed");
		System.out.println(" CMT adjusted naming");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		//morph
		//scores = readAverage("cmt", "renamed_mysql");
		//System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);
		
		System.out.println("\\\\");
		
		scores = readAverage("conference", "renamed");		
		System.out.println("CONFERENCE adjusted naming");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		//morph
		//scores = readAverage("conference", "renamed_mysql");
		//System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);

		System.out.println("\\\\");
		
		scores = readAverage("sigkdd", "renamed");
		System.out.println("SIGKDD adjusted naming");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		//morph
		//scores = readAverage("sigkdd", "renamed_mysql");
		//System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);

		
		System.out.println("\\\\\\hline\\hline");
		  
		scores = readAverage("sigkdd", "mixed");
		System.out.println("SIGKDD combined case");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		
		
		System.out.println("\\\\\\hline\\hline");
		
		scores = readAverage("conference", "noconstraints_ci");
		System.out.println("CONFERENCE missing FKs");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		
		
		System.out.println("\\\\\\hline\\hline");
		
		scores = readAverage("cmt", "denormalized_ci");
		System.out.println("CMT denormalized");
		System.out.format("& %.3f & %.3f & %.3f%n", scores.precision, scores.recall, scores.fmeasure);		
		System.out.println("& & & %For IncMap");
		System.out.println("\\\\\\hline\n");
		
		
		System.out.println("\\end{tabular}");
		System.out.println("\\end{center}");
		System.out.println("\\end{table}");
		
		
		
	}
	
	
	
	
	public void createAdjustedNamingTable() throws FileNotFoundException{
		
		System.out.println("\\setlength{\\tabcolsep}{3.7pt}");
		System.out.println("\\begin{table}[tb]");
		System.out.println("\\caption{Average F-measure results for the `adjusted naming' schema versions. " +
				"'C' stands for queries about classes, 'D' stands for queries involving data properties and 'O' stands for queries involving object properties}");
		System.out.println("\\label{tab:rename}");
		System.out.println("\\begin{center}");
		//System.out.println("\\begin{tabular}{ | c || c | c | c || c | c | c || c | c | c | }");
		System.out.println("\\begin{tabular}{ | c || c | c | c || c | c | c |}");
		System.out.println("\\hline");
		  
		System.out.println("\\multirow{2}{*}{\\textbf{Adjusted naming}}");
		System.out.println("& \\multicolumn{3}{c||}{\\textbf{Optique Boots.}}");
		//System.out.println("& \\multicolumn{3}{c||}{\\textbf{IncMap}}");		                         
		//System.out.println("& \\multicolumn{3}{c|}{\\textbf{morph-RDB}} \\\\\\cline{2-10}");
		System.out.println("& \\multicolumn{3}{c|}{\\textbf{IncMap}} \\\\\\cline{2-7}");
		System.out.println("& \\textbf{C} & \\textbf{D} & \\textbf{O}"); 
		System.out.println("& \\textbf{C} & \\textbf{D} & \\textbf{O}");
		//System.out.println("& \\textbf{C} & \\textbf{D} & \\textbf{O}");
		System.out.println("\\\\\\hline\\hline");
		System.out.println("\n");
		
		Scores scoresC;
		Scores scoresA;
		Scores scoresL;
		
		scoresC = readClassAverage("cmt", "renamed");
		scoresA = readAttributeAverage("cmt", "renamed");
		scoresL = readLinkAverage("cmt", "renamed");
		System.out.println("CMT");
		System.out.format("& %.3f & %.3f & %.3f%n", scoresC.fmeasure, scoresA.fmeasure, scoresL.fmeasure);		
		System.out.println("& & & %For IncMap");
		//morph
		//scoresC = readClassAverage("cmt", "renamed_mysql");
		//scoresA = readAttributeAverage("cmt", "renamed_mysql");
		//scoresL = readLinkAverage("cmt", "renamed_mysql");
		//System.out.format("& %.3f & %.3f & %.3f%n", scoresC.fmeasure, scoresA.fmeasure, scoresL.fmeasure);	
		
		System.out.println("\\\\");
		
		
		scoresC = readClassAverage("conference", "renamed");
		scoresA = readAttributeAverage("conference", "renamed");
		scoresL = readLinkAverage("conference", "renamed");
		
		System.out.println("CONFERENCE");
		System.out.format("& %.3f & %.3f & %.3f%n", scoresC.fmeasure, scoresA.fmeasure, scoresL.fmeasure);		
		System.out.println("& & & %For IncMap");
		//morph
		//scoresC = readClassAverage("conference", "renamed_mysql");
		//scoresA = readAttributeAverage("conference", "renamed_mysql");
		//scoresL = readLinkAverage("conference", "renamed_mysql");
		//System.out.format("& %.3f & %.3f & %.3f%n", scoresC.fmeasure, scoresA.fmeasure, scoresL.fmeasure);	
		System.out.println("\\\\");
		
		scoresC = readClassAverage("sigkdd", "renamed");
		scoresA = readAttributeAverage("sigkdd", "renamed");
		scoresL = readLinkAverage("sigkdd", "renamed");
		System.out.println("SIGKDD");
		System.out.format("& %.3f & %.3f & %.3f%n", scoresC.fmeasure, scoresA.fmeasure, scoresL.fmeasure);		
		System.out.println("& & & %For IncMap");
		//morph
		//scoresC = readClassAverage("sigkdd", "renamed_mysql");
		//scoresA = readAttributeAverage("sigkdd", "renamed_mysql");
		//scoresL = readLinkAverage("sigkdd", "renamed_mysql");
		//System.out.format("& %.3f & %.3f & %.3f%n", scoresC.fmeasure, scoresA.fmeasure, scoresL.fmeasure);
		
		
		
		System.out.println("\\\\\\hline\n");
		
		
		System.out.println("\\end{tabular}");
		System.out.println("\\end{center}");
		System.out.println("\\end{table}");
		
		
		
	}
	
	
	
	
	public void createCleanedHierarchiesTable() throws FileNotFoundException{
		
		System.out.println("\\setlength{\\tabcolsep}{3.7pt}");
		System.out.println("\\begin{table}[tb]");
		System.out.println("\\caption{Average F-measure results for the `cleaned hierarchies' schema versions. " +
				"1-1 and n-1 stands for queries involving 1-1 or n-1 mappings among classes and tables, respectively}");
		System.out.println("\\label{tab:rename}");
		System.out.println("\\begin{center}");
		System.out.println("\\begin{tabular}{ | c || c | c || c | c | }");
		System.out.println("\\hline");
		  
		System.out.println("\\multirow{2}{*}{\\textbf{Cleaned hierarchies}}");
		System.out.println("& \\multicolumn{2}{c||}{\\textbf{Optique Boots.}}");		                       
		System.out.println("& \\multicolumn{2}{c|}{\\textbf{IncMap}} \\\\\\cline{2-5}");
		System.out.println("& \\textbf{1-1} & \\textbf{n-1}"); 
		System.out.println("& \\textbf{1-1} & \\textbf{n-1}");
		System.out.println("\\\\\\hline\\hline");
		System.out.println("\n");
		
		Scores scores1;
		Scores scoresN;
		
		
		scores1 = readOneToOneAverage("cmt", "structured_ci");
		scoresN = readManyToOneLinkAverage("cmt", "structured_ci");
		
		System.out.println("CMT");
		System.out.format("& %.3f & %.3f%n", scores1.fmeasure, scoresN.fmeasure);		
		System.out.println("& & %For IncMap");
		//System.out.println("& & & %For Morph");
		
		System.out.println("\\\\");
		
		
		scores1 = readOneToOneAverage("conference", "structured_ci");
		scoresN = readManyToOneLinkAverage("conference", "structured_ci");
		
		
		System.out.println("CONFERENCE");
		System.out.format("& %.3f & %.3f%n", scores1.fmeasure, scoresN.fmeasure);		
		System.out.println("& & %For IncMap");
		//System.out.println("& & & %For Morph");
		System.out.println("\\\\");
		
		scores1 = readOneToOneAverage("sigkdd", "structured_ci");
		scoresN = readManyToOneLinkAverage("sigkdd", "structured_ci");
		
		System.out.println("SIGKDD");
		System.out.format("& %.3f & %.3f%n", scores1.fmeasure, scoresN.fmeasure);		
		System.out.println("& & %For IncMap");
		//System.out.println("& & & %For Morph");
		
		
		
		System.out.println("\\\\\\hline\n");
		
		
		System.out.println("\\end{tabular}");
		System.out.println("\\end{center}");
		System.out.println("\\end{table}");
		
		
		
	}
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		try {
			
			new LaTeXTables(); 
			
			       
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}
	
	
	
	
	protected class Scores {
		
		public double precision=0.0;
		
		public double recall=0.0;
		
		public double fmeasure=0.0;
		
		public String toString(){
			return precision + " " + recall + " " + fmeasure;
		}
		
	}
	
	
	/**
	 * This program reads a text file line by line, using a BufferedReader
	 * 
	 */
	protected class ReadFile  {
		
		private BufferedReader rBuffer=null;
		
		
		public ReadFile (InputStream isr_file) throws Exception {
			
			//try {
				rBuffer = new BufferedReader(new InputStreamReader(isr_file));
			//}
			//catch (Exception e) {
	    	//	e.printStackTrace();
	    	//}
		}
		
		public ReadFile (String fstring) throws FileNotFoundException{

			//System.err.println(fstring);
		    
			File file = new File(fstring);
			//System.out.print("File " +  file.exists());
			
		    if (file.exists()){
		    	try {
		    		rBuffer = new BufferedReader(new FileReader(fstring));    
		    
		    	}	    	 
		    	catch (IOException e) {
		    		e.printStackTrace();
		    	}
		    }
		    else {
		    	throw new FileNotFoundException("The file '"+ fstring + "' doesn't exist.");
		    	//new Exception("The file '"+ fstring + "' doesn't exist.");
		    	
		    }
		}
		
		public String readLine(){
			try {
				return rBuffer.readLine();
	    
	    	}  
	    	catch (Exception e) {
	    		System.err.println("An error occurred reading the file: " + e.getMessage());
	    		e.printStackTrace();
	    	}
	    	return "";
	    	


		}
		
		public void closeBuffer(){
			try {
				rBuffer.close();
			}
			catch (IOException e) {
	    		e.printStackTrace();
	    	}
		}
		
		

			
	}
	
	
}
