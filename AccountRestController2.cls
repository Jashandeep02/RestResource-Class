@RestResource(urlMapping='/accountApi/*')
global class AccountRestController2 {

    @HttpGet
    global static CustomAccount__c getAccount() {
        String accountId = RestContext.request.requestURI.substringAfterLast('/');
        return [SELECT Id, Name, Phone__c, Email__c, Address__c FROM CustomAccount__c WHERE Id = :accountId LIMIT 1];
    }
    
    @HttpPatch
    global static void updateAccount(String name, String phone, String email, String address) {
        String accountId = RestContext.request.requestURI.substringAfterLast('/');
        CustomAccount__c acc = [SELECT Id, Name, Phone__c, Email__c, Address__c FROM CustomAccount__c WHERE Id = :accountId LIMIT 1];
        acc.Name = name;
        acc.Phone__c = phone;
        acc.Email__c = email;
        acc.Address__c = address;
        update acc;
    }
    
    @HttpDelete
    global static void deleteAccount() {
        String accountId = RestContext.request.requestURI.substringAfterLast('/');
        CustomAccount__c acc = [SELECT Id FROM CustomAccount__c WHERE Id = :accountId LIMIT 1];
        delete acc;
    }
}
