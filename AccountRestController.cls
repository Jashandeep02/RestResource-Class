@RestResource(urlMapping='/accountApi')
global class AccountRestController {

    @HttpPost
    global static String createAccount(String name, String phone, String email, String address) {
        CustomAccount__c acc = new CustomAccount__c(Name = name, Phone__c = phone, Email__c = email, Address__c = address);
        insert acc;
        return acc.Id;
    }
}