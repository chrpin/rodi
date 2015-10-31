package com.fluidops.rdb2rdfbench.datastructures;

public class ComaCorrespondence {
	private String nameSQLEntity, nameOntoEntity;
	private String typeSQLEntity, typeOntoEntity;
	private double confidence;
	private SQLENTITYKIND sqlKind;
	private int idSQLEntity, idOntoEntity;
	private ONTOLOGYENTITYKIND ontoKind;
	private String tableName;
	
	public ComaCorrespondence(String nameSQLEntity, String nameOntoEntity, int idSQLEntity, int idOntoEntity, 
			double confidence, ONTOLOGYENTITYKIND ontoKind, SQLENTITYKIND sqlKind){
		this.nameSQLEntity = nameSQLEntity;
		this.nameOntoEntity = nameOntoEntity;
		this.idSQLEntity = idSQLEntity;
		this.idOntoEntity = idOntoEntity;
		this.confidence = confidence;
		this.sqlKind = sqlKind;
		this.ontoKind = ontoKind;
	}
	
	public ComaCorrespondence(String nameSQLEntity, String nameOntoEntity, int idSQLEntity, 
			int idOntologyEntity, String typeSQLEntity, String typeOntoEntity, double confidence, 
			ONTOLOGYENTITYKIND ontoKind, SQLENTITYKIND sqlKind){
		this(nameSQLEntity,nameOntoEntity,idSQLEntity,idOntologyEntity, confidence, ontoKind, sqlKind);

		this.typeSQLEntity = typeSQLEntity;
		this.typeOntoEntity = typeOntoEntity;
	}
	
	public ComaCorrespondence(String nameSQLEntity, String nameOntoEntity, int idSQLEntity, 
			int idOntologyEntity, String typeSQLEntity, String typeOntoEntity, double confidence, 
			ONTOLOGYENTITYKIND ontoKind, SQLENTITYKIND sqlKind, String tableName){
		this(nameSQLEntity,nameOntoEntity,idSQLEntity,idOntologyEntity, confidence, ontoKind, sqlKind);

		this.typeSQLEntity = typeSQLEntity;
		this.typeOntoEntity = typeOntoEntity;
		this.tableName = tableName;
	}
	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("Mapping " + sqlKind + "-" + ontoKind + " => ");
		sb.append("\"" + nameSQLEntity + "\"" + 
				(sqlKind == SQLENTITYKIND.TABLE ? "" : ":"+ typeSQLEntity) + 
				" <=> " + "\"" + nameOntoEntity + "\"" + 
				(sqlKind == SQLENTITYKIND.TABLE ? "" : ":"+ typeOntoEntity) + 
				" (" + confidence + ")");
		return sb.toString();
	}
	
	public String getTableName(){
		return tableName;
	}
	
	public double getConfidence() {
		return confidence;
	}

	public String getTypeSQLEntity() {
		return typeSQLEntity;
	}

	public String getTypeOntoEntity() {
		return typeOntoEntity;
	}

	public String getNameOntoEntity() {
		return nameOntoEntity;
	}

	public String getNameSQLEntity() {
		return nameSQLEntity;
	}

	public SQLENTITYKIND getSQLKind() {
		return sqlKind;
	}

	public ONTOLOGYENTITYKIND getOntologyKind() {
		return ontoKind;
	}

	public int getIdSQLEntity() {
		return idSQLEntity;
	}

	public int getIdOntoEntity() {
		return idOntoEntity;
	}

	public enum SQLENTITYKIND {
	       TABLE, COLUMN;
	}
	
	public enum ONTOLOGYENTITYKIND {
	       CLASS, DATAPROP, OBJPROP;
	}
	
//	public boolean isFunctional(){
//		return "functional".equalsIgnoreCase(typeOntoEntity);
//	}
	
	public boolean isInverseFunctional(){
		return "inverse functional".equalsIgnoreCase(typeOntoEntity);
	}
}
