using app.changemaker from '../db/cmk';
service CmkService {

 entity Customer
	as projection on changemaker.Customer;

 entity Project
	as projection on  changemaker.Project;

 entity LookupTable
	as projection on changemaker.LookupTable;

}
