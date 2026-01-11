// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

//DummyJSONCallout.getDummyJSONUserFromId('1');

Contact testContact = new Contact(
    FirstName = 'John',
    LastName = 'Doe',
    Email = 'john.doe@example.com',
    Phone = '+123456789'
);
insert testContact;
Set<Id> contactIds = new Set<Id>{testContact.Id};
DummyJSONCallout.postCreateDummyJSONUser(contactIds);
System.debug('Contact after callout: ' + contactIds);