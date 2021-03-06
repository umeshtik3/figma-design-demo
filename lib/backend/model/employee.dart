import 'dart:convert';

const String dbStatus = 'status';
const String dbEmployeeInfo = 'data';
const String dbID = 'id';
const String dbEmpName = 'employee_name';
const String dbDOB = 'dob';
const String dbDOJ = 'doj';
const String dbDepartment = 'dept';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

class Employee {
  String? status;
  List<EmployeeInfo>? employeeInfo;
  Employee({this.status, this.employeeInfo});

  factory Employee.fromJson(Map<String, dynamic> jsonData) {
    final status = jsonData[dbStatus];
    final listOfEmployeeInfo = List<EmployeeInfo>.from(
        jsonData[dbEmployeeInfo]!.map((e) => EmployeeInfo.fromJson(e)));
    return Employee(status: status, employeeInfo: listOfEmployeeInfo);
  }
}

class EmployeeInfo {
  int? empId;
  String? empName;
  String? dateOfBirth;
  String? dateOfJoining;
  Departments? department;

  EmployeeInfo(
      {this.empId,
      this.empName,
      this.dateOfBirth,
      this.dateOfJoining,
      this.department});

  factory EmployeeInfo.fromJson(Map<String, dynamic> jsonData) {
    final employeeId = jsonData[dbID];
    final employeeName = jsonData[dbEmpName];
    final dateOfBirth = jsonData[dbDOB];
    final dateOfJoining = jsonData[dbDOJ];
    final department = deparmentValues.map[jsonData[dbDepartment]];
    return EmployeeInfo(
        empId: employeeId,
        empName: employeeName,
        dateOfBirth: dateOfBirth,
        dateOfJoining: dateOfJoining,
        department: department);
  }
}

enum Departments { operations, hr, marketing, finance, sales,purchase }

final deparmentValues = EnumValues({
  'Operations': Departments.operations,
  'HR': Departments.hr,
  'Sales': Departments.sales,
  'Marketing': Departments.marketing,
  'Finance': Departments.finance
});

class EnumValues<T> {
  Map<String, T> map;

  EnumValues(this.map);
}
