//Apex class that returns both contacts and leads based on a parameter

public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchString) {
        // Construct the SOSL query to search for contacts and leads
        String soslQuery = 'FIND :searchString IN NAME FIELDS RETURNING Contact (Id, FirstName, LastName), Lead (Id, FirstName, LastName)';
        
        // Execute the SOSL query and store the results
        List<List<sObject>> searchResults = Search.query(soslQuery);

        // Return the list of lists containing contacts and leads
        return searchResults;
    }
}
