package com.fluidops.utils.testbed;

import java.util.List;

public class RelationalReference {

	private SQLTable referrerTable, referredTable;
	private List<String> referencingAttributes;
	private List<String> referredAttributes;
	
	public RelationalReference(SQLTable referrerTable, SQLTable 
			referredTable, List<String> referencingAttributes, 
			List<String> referredAttributes){
		this.referrerTable = referrerTable;
		this.referredTable = referredTable;
		this.referencingAttributes = referencingAttributes;
		this.referredAttributes = referredAttributes;
	}

	public SQLTable getReferrerTable() {
		return referrerTable;
	}

	public SQLTable getReferredTable() {
		return referredTable;
	}

	public List<String> getReferencingAttributes() {
		return referencingAttributes;
	}

	public List<String> getReferredAttributes() {
		return referredAttributes;
	}
	
	@Override
	public String toString(){
		return referrerTable.getName() + " " + referencingAttributes + " -> " 
				+ referredTable.getName() + " " + referredAttributes;
	}
}
