package com.fluidops.utils.testbed;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SQLTable {
	private List<String> pkAttributes;
	//private Map<SQLTable,Set<String>> fkAttributesMap;
	private Map<SQLTable,List<RelationalReference>> fkByTableMap;
	private Map<String,String> attrib2TypeMap;
	private String fstAttr;
	
	private String name;
	private SQLSchema schema;

	private String [] legalTypes = {"integer","boolean","date","text","geocoord"};
	private String [] legalTypePrefixes = {"numeric","charactervarying","character"};
	
	private int invalidTypesCount = 0;
	
	public SQLTable(SQLSchema schema, String name){
		this.schema = schema;
		this.name = name.replace("\"", "");
		init();
//		System.out.println("Table " + name + " created");
	}
	
	private void init(){
		pkAttributes = new ArrayList<>();
		fkByTableMap = new HashMap<>();
		attrib2TypeMap = new HashMap<>();
	}
	
//	public boolean addFKAttribute(String attribute, SQLTable table){
//		
//		System.out.println("FK of attribute " + attribute + " to table \"" + table + "\"");
//		attribute = sanitizeString(attribute);
//		
//		if(fkAttributesMap.containsKey(table))
//			return fkAttributesMap.get(table).add(attribute);
//
//		Set<String> attributesSet = new HashSet<>();
//		attributesSet.add(attribute);
//		return fkAttributesMap.put(table,attributesSet) != null;
//	}

	public List<RelationalReference> getFKForColumn(String attr, boolean isReferring){
		attr = sanitizeString(attr);
		List<RelationalReference> l = new LinkedList<>();
		for (List<RelationalReference> rl : fkByTableMap.values())
			for (RelationalReference fk : rl)
				if(isReferring && fk.getReferencingAttributes().contains(attr))
					l.add(fk);
				else if(!isReferring && fk.getReferredAttributes().contains(attr))
					l.add(fk);
		return l;
	}
	
	public static void sanitize(List<String> l){
		for (int i = 0; i < l.size(); i++) {
			String s = l.get(0);
			l.remove(i);
			l.add(sanitizeString(s));
		}
	} 
	
	public void addFK(List<String> referencingAttributes, SQLTable table, 
			List<String> referredAttributes){
		sanitize(referencingAttributes);
		sanitize(referredAttributes);
		
		List<RelationalReference> listRef = null;
		
		if(fkByTableMap.containsKey(table))
			listRef = fkByTableMap.get(table);
		else
			listRef = new LinkedList<>();
//		if(this.name.equals("hasConflictOfInterest"))
//			System.out.println();
		listRef.add(new RelationalReference(this, table, 
				new LinkedList<>(referencingAttributes), 
				new LinkedList<>(referredAttributes)));
		
//		if(table.getPKAttributes().size() > 1 || referencingAttributes.size() > 1 || referredAttributes.size() > 1)
//			System.out.println("FK added: " + ref);
		
		fkByTableMap.put(table, listRef);
	}
	
	public boolean addAttribute(String attribute, String type){
		attribute = sanitizeString(attribute);
		String [] toBeRem = {"default","notnull","check",","};
		for (String s : toBeRem) {
			int idx = type.toLowerCase().indexOf(s); 
			if(idx > 0)
				type = type.substring(0, idx);
		}
		
		boolean isValid = false;
		
		for (String lt : legalTypes) {
			if(type.equalsIgnoreCase(lt)){
				isValid = true;
				break;
			}
		}
		
		if(!isValid){
			for (String ltp : legalTypePrefixes) {
				if(type.toLowerCase().startsWith(ltp)){
					isValid = true;
					break;
				}
			}
		}
		
//			System.out.println("Attribute " + attribute + " of type " + type + " added");
		
		if(isValid){
			if(fstAttr == null)
				fstAttr = attribute;
			return attrib2TypeMap.put(attribute, type) != null;
		}
		
		invalidTypesCount++;
		return false;
	}

	public static String sanitizeString(String s){
		return s.replace("\"", "").replace(",", "");
	}
	
	public boolean addPKAttributes(List<String> attributes){		
		boolean res = true;
		for (String attribute : attributes)
			pkAttributes.add(sanitizeString(attribute));

//		System.out.println("PK attribute " + pkAttributes + " added to table \"" + this.getName() + "\"");

		return res;
	}
	
	public String getName(){
		return name;
	}

	public int countAttributes(){
		return attrib2TypeMap.keySet().size();
	}
	
	public int getInvalidTypesCount(){
		return invalidTypesCount;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((schema == null) ? 0 : schema.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SQLTable other = (SQLTable) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (schema == null) {
			if (other.schema != null)
				return false;
		} else if (!schema.equals(other.schema))
			return false;
		return true;
	}

	@Override
	public String toString(){
		return getName() + " " + countAttributes() + " attribute(s)";
	}

	public Set<String> getAttributes() {
		return attrib2TypeMap.keySet();
	}

	public String getFirstAttribute(){
		return fstAttr;
	}
	
	public List<String> getPKAttributes() {
		if(pkAttributes.isEmpty())
			return null;

		return Collections.unmodifiableList(pkAttributes);
	}
	
	public Map<SQLTable,List<RelationalReference>> getFKMap(){
		return fkByTableMap;
	}
	
	public int getNumberDistinctRefTables(){
		return fkByTableMap.keySet().size();
	}
	
	// If this column inside table A happens to also be a FK pointing to table B, 
	// it would effectively mean a match to the join path 
	// “A JOIN B ON A.name_of_column = B.key_column_of_b”.
	public boolean isCompatibleWithColumnToObjPropMapping(String matchedAttr){
		if(getNumberDistinctRefTables() != 1)
			return false;
		
		if(attrib2TypeMap.keySet().size() != 2)
			return false;

		SQLTable [] refTables = getFKMap().keySet().toArray(new SQLTable[0]);
		
		if(getFKMap().get(refTables[0]).size() != 1)
			return false;		
		
		RelationalReference fk = getFKMap().get(refTables[0]).get(0);
				
		if(fk.getReferencingAttributes().size() != 1 || 
				fk.getReferredAttributes().size() != 1)
			return false;
	
		if(!fk.getReferencingAttributes().get(0).equalsIgnoreCase(
				sanitizeString(matchedAttr)))
			return false;
		
		return true;
	}
	
	private int appendSelectRenamed(StringBuilder sb, SQLTable t, int id){
		for (String attr: t.attrib2TypeMap.keySet())
			if(this == t && t.getPKAttributes().contains(attr))
				sb.append("\"" + t.name + "\".\"" + attr + "\",");
			else
				sb.append("\"" + t.name + "\".\"" + attr + "\" as \"" + ++id + "\",");
		return id;
	}
	
	public String getSelectConditionForColumnToObjPropMapping(){
		SQLTable [] refTables = getFKMap().keySet().toArray(new SQLTable[0]);
		RelationalReference fk = getFKMap().get(refTables[0]).get(0);		
		
		SQLTable refTab = fk.getReferredTable();
		StringBuilder sb = new StringBuilder();
		int id = 0;

		id = appendSelectRenamed(sb, this, id);
		appendSelectRenamed(sb, refTab, id);
		
		sb.deleteCharAt(sb.length()-1);
		
		return sb.toString();
	}
	
	public String getJoinConditionForColumnToObjPropMapping(){
		SQLTable [] refTables = getFKMap().keySet().toArray(new SQLTable[0]);
		RelationalReference fk = getFKMap().get(refTables[0]).get(0);		
		
		SQLTable refTab = fk.getReferredTable();
		
		return "\"" + this.name + "\" JOIN \"" + refTab.name + "\" ON \"" + 
			this.name + "\".\"" + fk.getReferencingAttributes().get(0) + "\" = \"" + 
			refTab.name + "\".\"" + fk.getReferredAttributes().get(0) + "\"";
	}
	
	public boolean isCompatibleWithTableToObjPropMapping(){
		if(getNumberDistinctRefTables() != 2)
			return false;
		
		SQLTable [] refTables = getFKMap().keySet().toArray(new SQLTable[0]);
		
		if(getFKMap().get(refTables[0]).size() != 1)
			return false;
		
		if(getFKMap().get(refTables[1]).size() != 1)
			return false;
		
		RelationalReference fk1 = getFKMap().get(refTables[0]).get(0);
		RelationalReference fk2 = getFKMap().get(refTables[1]).get(0);
		
		if(fk1.getReferencingAttributes().size() != 1 || 
				fk1.getReferredAttributes().size() != 1)
			return false;
		
		if(fk2.getReferencingAttributes().size() != 1 || 
				fk2.getReferredAttributes().size() != 1)
			return false;
		
		return true;
	}
	
	public String getSelectConditionForTableToObjPropMapping(){
		
		SQLTable [] refTables = getFKMap().keySet().toArray(new SQLTable[0]);
		RelationalReference fk1 = getFKMap().get(refTables[0]).get(0);
		RelationalReference fk2 = getFKMap().get(refTables[1]).get(0);
		
		SQLTable refTab1 = fk1.getReferredTable();
		SQLTable refTab2 = fk2.getReferredTable();

		StringBuilder sb = new StringBuilder();
		
		int id = 0;
		id = appendSelectRenamed(sb, this, id);
		id = appendSelectRenamed(sb, refTab1, id);
		appendSelectRenamed(sb, refTab2, id);
				
		sb.deleteCharAt(sb.length()-1);
		
		return sb.toString();
	}
	
	public String getJoinConditionForTableToObjPropMapping(){
		SQLTable [] refTables = getFKMap().keySet().toArray(new SQLTable[0]);
		RelationalReference fk1 = getFKMap().get(refTables[0]).get(0);
		RelationalReference fk2 = getFKMap().get(refTables[1]).get(0);
		
		SQLTable refTab1 = fk1.getReferredTable();
		SQLTable refTab2 = fk2.getReferredTable();
				
		return "\"" + this.name + "\"" + " JOIN \"" + refTab1.name + "\" ON \"" + 
			this.name + "\".\"" + fk1.getReferencingAttributes().get(0) + "\" = \"" + 
			refTab1.name + "\".\"" + fk1.getReferredAttributes().get(0) + 
			"\" JOIN \"" + refTab2.name + "\" ON \"" + 
			this.name + "\".\"" + fk2.getReferencingAttributes().get(0) + "\" = \"" + 
			refTab2.name + "\".\"" + fk2.getReferredAttributes().get(0) + "\"";
	}
	
	public String getPKAttributesForTurtle(){
		if(pkAttributes.isEmpty())
			return null;

		StringBuilder sb = new StringBuilder();
		for (String attr : pkAttributes)
			sb.append("-{\"" + attr + "\"}");
		sb.deleteCharAt(0);
		return sb.toString();
	}
}
