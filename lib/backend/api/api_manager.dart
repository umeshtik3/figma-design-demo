import 'package:demo/backend/model/employee.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static var client = http.Client();
  final url = Uri.parse('https://dev.geekyworks.com/exercises/employee.json');
  Future<List<EmployeeInfo>?> fetchData() async {
    http.Response response = await client.get(url);
    Employee employee = Employee();
    List<EmployeeInfo>? employeeInfo;
    try {
      if (response.statusCode == 200) {
        String jsonString = response.body;
        employee = employeeFromJson(jsonString);
        if (employee.status == "success") {
          employeeInfo = employee.employeeInfo;
        }
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return employeeInfo;
  }

  List<EmployeeInfo>? sortedList(String? sortedOn, List<EmployeeInfo>? list) {
    if (sortedOn != null) {
      switch (sortedOn) {
        case 'Operations':
          {
            return list
                ?.where(
                    (element) => element.department == Departments.operations)
                .toList();
          }

        case 'HR':
          {
            return list
                ?.where((element) => element.department == Departments.hr)
                .toList();
          }

        case 'Finance':
          {
            return list
                ?.where((element) => element.department == Departments.finance)
                .toList();
          }
        case 'Purchase':
          {
            return list
                ?.where((element) => element.department == Departments.purchase)
                .toList();
          }
        case 'Marketing':
          {
            return list
                ?.where(
                    (element) => element.department == Departments.marketing)
                .toList();
          }
        default:
      }
    }
    return list;
  }
  
}
