public with sharing class ContactHelper extends TriggerHandler{
    public ContactHelper() {

    

    }

    public override void beforeInsert() {
        
			//Set<String> ids = new Set<String>();
			for(Contact con : Trigger.new){
		
				if(con.DummyJSON_Id__c == null){
					Integer randomId = Math.mod(Math.abs(Crypto.getRandomInteger()), 101);
					con.DummyJSON_Id__c = randomId.toString();
				}
				Integer dummyId = Integer.valueOf(con.DummyJSON_Id__c);		
				if(dummyId <= 100){
					DummyJSONCallout.getDummyJSONUserFromId(con.DummyJSON_Id__c);
				}
			}			
           
            
    }
    public override void beforeUpdate() {
        
			// call your before update handler
			//When a contact is updated
			// if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
			Set<String> ids = new Set<String>();
			for(Contact con : Trigger.new){
				Integer dummyId = Integer.valueOf(con.DummyJSON_Id__c);	
				if(dummyId > 100){
					ids.add(con.Id);
					
				}
			}
			//DummyJSONCallout.postCreateDummyJSONUser(ids);
       
        
    }

}