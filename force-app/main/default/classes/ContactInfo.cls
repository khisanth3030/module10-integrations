public with sharing class ContactInfo{
	public String jsonUserId;	//1
	public String firstName;	//Johnny
	public String lastName;	//Test
	public String email;	//test@example.com
	public String phone;	//+123456789
	public String birthDate;	//1990-01-01
	public cls_address address;
	class Cls_address {
		public String street;	//123 Test St
		public String city;	//Test City
		public String postalCode;	//12345
		public String state;	//TS
		public String country;	//Testland
	}
	public static ContactInfo parse(String json){
		return (ContactInfo) System.JSON.deserialize(json, ContactInfo.class);
	}

}