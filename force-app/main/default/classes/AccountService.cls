public with sharing class AccountService {
    
    // Method to get a single Account by Id
    public static Account getAccountById(Id accountId) {
        // Query standard fields
        Account acc = [
            SELECT Id, Name, Industry, Phone, Website
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];
        return acc;
    System.debug('Data');
    }
    
    // Method to get a list of Accounts (example: first 10)
    public static List<Account> getAccounts() {
        List<Account> accounts = [
            SELECT Id, Name, Industry, Phone, Website
            FROM Account
            LIMIT 10
        ];
        return accounts;
    }
}
