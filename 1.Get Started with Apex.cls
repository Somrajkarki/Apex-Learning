public class StringListTest {
    public static List<String> generateStringList(Integer num) {
        // Initialize the list to hold the formatted strings
        List<String> resultList = new List<String>();
        
        // Iterate from 0 to num - 1 to generate the required strings
        for (Integer i = 0; i < num; i++) {
            // Add the formatted string to the list
            resultList.add('Test ' + i);
        }
        
        // Return the list of formatted strings
        return resultList;
    }
}
