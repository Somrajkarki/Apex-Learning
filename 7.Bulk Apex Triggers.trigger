//Write triggers that operate on collections of sObjects.
//Write triggers that perform efficient SOQL and DML operations.
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    // List to hold tasks to be inserted
    List<Task> tasksToInsert = new List<Task>();

    // Iterate through the Trigger.new list
    for (Opportunity opp : Trigger.new) {
        // Check if the opportunity stage is Closed Won and it wasn't closed won before
        if (opp.StageName == 'Closed Won' && (Trigger.isInsert || (Trigger.isUpdate && Trigger.oldMap.get(opp.Id).StageName != 'Closed Won'))) {
            // Create a new Task associated with the Opportunity
            Task newTask = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            // Add the task to the list to be inserted
            tasksToInsert.add(newTask);
        }
    }

    // Insert all tasks in a single DML operation
    if (!tasksToInsert.isEmpty()) {
        insert tasksToInsert;
    }
}