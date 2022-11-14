LeadSchedulable leadSchedulableInstance = new LeadSchedulable();
String cronExp = '00 30 03 ? * MON';

String jobId = System.schedule('Sample Job', cronExp, leadSchedulableInstance);
System.debug(jobId); 