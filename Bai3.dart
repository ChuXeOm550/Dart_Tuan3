import 'dart:io';


class Employee{
  late String ID;
  late String fullName;
  late String birthDay;
  late double Phone;
  late String Email;
  late int employeeType;


  void nhapInfoEmployee(){
    stdout.write("Nhập ID: ");
    ID=stdin.readLineSync()!;

    stdout.write("Nhập tên đầy đủ: ");
    fullName=stdin.readLineSync()!;

    stdout.write("Nhập ngày sinh: ");
    birthDay=stdin.readLineSync()!;

    stdout.write("Nhập số điện thoại: ");
    Phone=double.parse(stdin.readLineSync()!);

    stdout.write("Nhập Email: ");
    Email=stdin.readLineSync()!;

    do{
      stdout.write("Nhập loại nhân viên (0.Experience / 1.Fresher / 2.Intern): ");
      employeeType=int.parse(stdin.readLineSync()!);
    }while(employeeType<0||employeeType>2);
  }

  void ShowInfo(){
    print("ID: $ID");
    print("Tên nhân viên: $fullName");
    print("Ngày sinh: $birthDay");
    print("Số điện thoại: $Phone");
    print("Email: $Email");
    if(employeeType==1)
      print("Loại nhân viên: Experience");
    else if(employeeType==2)
      print("Loại nhân viên: Fresher");
    else
      print("Loại nhân viên: Intern");
    
  }
}

class Experience extends Employee{
  late int ExplnYear;
  late String ProSkill;

  @override
  void nhapInfoEmployee(){
    super.nhapInfoEmployee();

    stdout.write("Nhập số năm kinh nghiệm: ");
    ExplnYear=int.parse(stdin.readLineSync()!);

    stdout.write("Nhập kĩ năng chuyên môn: ");
    ProSkill=stdin.readLineSync()!;
  }

  @override
  void ShowInfo(){
    super.ShowInfo();

    print("Số năm kinh nghiệm: $ExplnYear");
    print("Kĩ năng chuyên môn: $ProSkill");
  }
}

class Fresher extends Employee{
  late String GraduationDate;
  late String GraduationRank;
  late String Education;

  @override
  void nhapInfoEmployee(){
    super.nhapInfoEmployee();
    stdout.write("Nhập thời gian tốt nghiệp: ");
    GraduationDate=stdin.readLineSync()!;

    stdout.write("Nhập loại tốt nghiệp: ");
    GraduationRank=stdin.readLineSync()!;

    stdout.write("Nhập tên trường: ");
    Education=stdin.readLineSync()!;
  }

  @override
  void ShowInfo(){
    super.ShowInfo();

    print("Thời gian tốt nghiệp: $GraduationDate");
    print("Xếp loại tốt nghiệp: $GraduationRank");
    print("Tên trường: $Education");

  }
}

class Intern extends Employee{
  late String Majors;
  late int Semester;
  late String universityName;


  @override
  void nhapInfoEmployee(){
    super.nhapInfoEmployee();

    stdout.write("Nhập ngành đang học: ");
    Majors=stdin.readLineSync()!;

    stdout.write("Nhập học kì thứ: ");
    Semester=int.parse(stdin.readLineSync()!);

    stdout.write("Nhập tên trường: ");
    universityName=stdin.readLineSync()!;
  }

  @override
  void ShowInfo(){
    super.ShowInfo();

    print("Chuyên ngành đang học: $Majors");
    print("Học kì thứ: $Semester");
    print("Tên trường: $universityName");

  }
}

class Certificate {
  late String certificateID;
  late String certificateName;
  late String certificateRank;
  late String certificateDate;


  void showInfo() {
    print('Certificate ID: $certificateID');
    print('Certificate Name: $certificateName');
    print('Certificate Rank: $certificateRank');
    print('Certificate Date: $certificateDate');
  }
}

class Company{
  List<Employee> employees =[];

  //Thêm nhân viên
  void addEmployee(Employee employee){
    employees.add(employee);
    print("Thêm nhân viên thành công");
    print("-------------------------------");
  }

  //Sửa thông tin nhân viên
  void updateEmployee(String Id, Employee updatedEmployee) {
    for (int i = 0; i < employees.length; i++) {
      if (Id == employees[i].ID) {
        employees[i] = updatedEmployee;
        print('Cập nhật thành công nhân viên: ${updatedEmployee.fullName}');
        print("----------------------------");
        return;
      }
    }
    print("Không tồn tại nhân viên có ID: $Id");
    print("----------------------------");
  }

  //Xóa nhân viên
  void deleteEmployee(String Id){
    for(int i=0;i< employees.length;i++){
      if(Id==employees[i].ID){
        employees.removeAt(i);
        print("Đã xóa thành công nhân viên có ID: $Id");
        print("----------------------------");           
        return;
      }
    }
    print("Không tồn tại nhân viên có ID: $Id");
    print("----------------------------");
  }

  //Tìm nhân viên theo loại
  void searchEmployees(int employee_type){
    for(int i=0;i<employees.length;i++){
      if(employee_type==employees[i].employeeType)
        employees[i].ShowInfo();
        print("----------------------------");
    }
    print("----------------------------");
  }

  //In toàn bộ nhân viên
  void displayAll(){
    for(int i=0;i<employees.length;i++){
      employees[i].ShowInfo();
      print("----------------------------");
    }
    print("----------------------------");
  }
}

void main(){
  Company company =Company();
  bool Runing =true;

  while(Runing){
      print("----Quản lí nhân viên-----");
      print("1. Thêm nhân viên");
      print("2. Sửa nhân viên");
      print("3. Xóa nhân viên");
      print("4. Tìm nhân viên");
      print("5. Thoát");
      stdout.write("Chọn chức năng: ");
      int choice =int.parse(stdin.readLineSync()!);
      
      switch(choice){
        case 1:
          stdout.write('Chọn loại nhân viên (0: Experience, 1: Fresher, 2: Intern): ');
          int? employeeType = int.parse(stdin.readLineSync()!);
        
          if (employeeType == 0) {
            Experience exp =Experience();
            exp.nhapInfoEmployee();
            company.addEmployee(exp);
          } else if (employeeType == 1) {
            Fresher fre =Fresher();
            fre.nhapInfoEmployee();
            company.addEmployee(fre);
          } else if (employeeType == 2) {
            Intern itn = Intern();
            itn.nhapInfoEmployee();
            company.addEmployee(itn);
          } else {
            print('Lựa chọn không hợp lệ!');
          }
          break;

        case 2:
          print('Nhập ID nhân viên cần sửa:');
          String id = stdin.readLineSync()!;
          stdout.write('Chọn loại nhân viên (0: Experience, 1: Fresher, 2: Intern):');
          int? newType = int.parse(stdin.readLineSync()!);
          
          if (newType == 0) {
            Experience exp =Experience();
            exp.nhapInfoEmployee();
            company.updateEmployee(id, exp);
          } else if (newType == 1) {
            Fresher fre =Fresher();
            fre.nhapInfoEmployee();
            company.updateEmployee(id, fre);
          } else if (newType == 2) {
            Intern itn = Intern();
            itn.nhapInfoEmployee();
            company.updateEmployee(id, itn);
          } else {
            print('Lựa chọn không hợp lệ!');
          }
          break;

        case 3:
          stdout.write('Nhập ID nhân viên cần xóa:');
          String Id = stdin.readLineSync()!;
          company.deleteEmployee(Id);
          break;

        case 4:
          stdout.write('Nhập loại nhân viên (0: Experience, 1: Fresher, 2: Intern):');
          int? type = int.parse(stdin.readLineSync()!);
          company.searchEmployees(type);
          break;

        case 5:
          Runing=false;
          print("Đang thoát");
          print("-----------------------------");

        case 6:
          print("-----DANH SÁCH NHÂN VIÊN-----");
          company.displayAll();
          break;
      }
  }
}

