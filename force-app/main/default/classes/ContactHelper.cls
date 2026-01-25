public with sharing class ContactHelper extends TriggerHandler{
    public ContactHelper() {

    

    }

    public override void beforeInsert() {
		// When a contact is inserted
		// if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value
	
		//When a contact is inserted
		// if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API
		Schema.SObjectType objType = Trigger.new.getSObjectType();
        if (objType == Schema.Contact.SObjectType) { // Check if it's an Account    SObjectType
            List<Contact> contacts = (List<Contact>)Trigger.new; // Cast the whole list

			
			for(Contact con : contacts){
		
				if(con.DummyJSON_Id__c == null){
					Integer randomId = Math.mod(Math.abs(Crypto.getRandomInteger()), 101);
					con.DummyJSON_Id__c = randomId.toString();
				}
				Integer dummyId = Integer.valueOf(con.DummyJSON_Id__c);		
				if(dummyId <= 100 && 
				( con.DummyJSON_Last_Updated__c < date.today())){
					DummyJSONCallout.getDummyJSONUserFromId(con.DummyJSON_Id__c);
				}
			}			
		}   
            
    }
    public override void beforeUpdate() {
        
			// call your before update handler
			//When a contact is updated
			// if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
			Set<String> ids = new Set<String>();

			Schema.SObjectType objType = Trigger.new.getSObjectType();
			if (objType == Schema.Contact.SObjectType) { // Check if it's an Account    SObjectType
				List<Contact> contacts = (List<Contact>)Trigger.new; // Cast the whole list
	
			for(Contact con : contacts){
				Integer dummyId = Integer.valueOf(con.DummyJSON_Id__c);	
				if(dummyId > 100 ){
					DummyJSONCallout.postCreateDummyJSONUser(con.Id);
					
				}
			}
			
		}
        
    }

}