package com.fluidops.rdb2rdfbench.db.rel;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class SQLSchema extends HashMap<String,SQLTable> {

	private static final long serialVersionUID = 1L;
	private String name;
	
	public SQLSchema(String name){
		this.name = name;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = prime * ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		SQLSchema other = (SQLSchema) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	
	public boolean isColumnInsideTable(String col, String tab){
		return getTablesForColumnName(col).contains(getTableFromTableName(tab));
	}
	
	public boolean isColumnInsideTable(String col, SQLTable tab){
		return getTablesForColumnName(col).contains(tab);
	}
	
	public Set<SQLTable> getTablesForColumnName(String column){
		Set<SQLTable> res = new HashSet<>();

		String colLow = column.toLowerCase();
		
		for (SQLTable t : this.values()) {
			for (String attr : t.getAttributes()) {
				if(colLow.equals(attr.toLowerCase())){
					res.add(t);
					break;
				}
			}
		}
		
		return res;
	}
	
	public SQLTable getTableFromTableName(String tableName){
		SQLTable res = this.get(tableName);
		if(res == null)
			res = this.get(tableName.toLowerCase());
		return res;
	} 
	
	@Override
	public String toString(){
		int c = 0, invalid = 0;
		for (SQLTable t : this.values()) {
			c+=t.countAttributes();
			invalid+=t.getInvalidTypesCount();
		}
		return this.values().size() + " table() with " + c + " attribute(s)" + 
				(invalid > 0 ? (", " + invalid + " invalid") : "");
	}
}
