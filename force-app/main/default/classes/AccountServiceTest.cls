@isTest
private class AccountServiceTest {
    
    @testSetup
    static void setupData() {
        // Create sample Accounts for testing
        List<Account> accList = new List<Account>();
        accList.add(new Account(Name = 'Test Account 1', Industry = 'Technology', Phone = '1234567890', Website = 'www.test1.com'));
        accList.add(new Account(Name = 'Test Account 2', Industry = 'Finance', Phone = '9876543210', Website = 'www.test2.com'));
        insert accList;
    }
    
    @isTest
    static void testGetAccountById() {
        // Query one of the test accounts
        Account acc = [SELECT Id FROM Account LIMIT 1];
        
        // Call the method
        Account result = AccountService.getAccountById(acc.Id);
        
        // Assertions
        System.assertNotEquals(null, result, 'Account should not be null');
        System.assertEquals(acc.Id, result.Id, 'Returned Account Id should match');
        System.assertNotEquals(null, result.Name, 'Account Name should not be null');
    }
    
    @isTest
    static void testGetAccounts() {
        // Call the method
        List<Account> results = AccountService.getAccounts();
        
        // Assertions
        System.assertNotEquals(null, results, 'Result list should not be null');
        System.assert(results.size() > 0, 'Result list should contain accounts');
        
        // Check fields
        for (Account acc : results) {
            System.assertNotEquals(null, acc.Name, 'Account Name should not be null');
        }
    }
}
