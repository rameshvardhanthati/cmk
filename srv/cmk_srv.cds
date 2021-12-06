using app.changemaker from '../db/cmk';
service CmkService {

 entity Customer
	as projection on changemaker.Customer;

 entity Project
	as projection on  changemaker.Project;

 entity Employee
	as projection on changemaker.Employee;

entity Company
	as projection on changemaker.Company;

 entity Gender
	as projection on changemaker.cmk.common.Gender;

 entity ProjectStatus
	as projection on changemaker.cmk.common.ProjectStatus;

 entity SAPSystem
	as projection on changemaker.cmk.common.SAPSystem;

}
