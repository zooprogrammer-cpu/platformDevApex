Company ashconsulting = new Company(); 
ashconsulting.companyName = 'Ash Consulting';
ashconsulting.ceo = 'Ash Basnyat';
ashconsulting.employeeCount = 6;
ashconsulting.revenue = 1000000;

ashconsulting.addNewCustomer('Bob Mendrik', 'www.bobmendrik.com', 'bobmendrik@gmail.com', 123213123123L);
ashconsulting.addNewCustomer('Gene Heckler', 'www.geneheckler.com', 'geneheckler@gmail.com', 12234443646L);

ashconsulting.getAllCustomers();