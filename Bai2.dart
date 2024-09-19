//import 'dart:async';
//import 'dart:ffi';
import 'dart:io';

class taiLieu{
  late String maTaiLieu;
  late String tenXB;
  late int soXB;

  void nhapInfoSach(){
    stdout.write("Nhập mã sách: ");
    maTaiLieu=stdin.readLineSync()!;

    stdout.write("Nhập tên nhà xuất bản: ");
    tenXB=stdin.readLineSync()!;

    stdout.write("Nhập số bản phát hành: ");
    soXB=int.parse(stdin.readLineSync()!);
  }
  
  void hienThi(){
    print("Mã: $maTaiLieu");
    print("Tên nhà xuất bản: $tenXB");
    print("Số bản phát hành: $soXB");
  }
}

class Sach extends taiLieu{
  late String tenTacGia;
  late int soTrang;

  @override
  void nhapInfoSach(){
    super.nhapInfoSach();
    stdout.write("Nhập tên tác giả: ");
    tenTacGia=stdin.readLineSync()!;
    stdout.write("Nhập số trang: ");
    soTrang=int.parse(stdin.readLineSync()!);
  }

  @override
  void hienThi(){
    super.hienThi();
    print("Tên tác giả: $tenTacGia");
    print("Số trang: $soTrang");
  }
}

class TapChi extends taiLieu{
  late int soPhatHanh;
  late int thangPhatHanh;

  @override
  void nhapInfoSach(){
    super.nhapInfoSach();
    stdout.write("Nhập số phát hành: ");
    soPhatHanh=int.parse(stdin.readLineSync()!);
    do{
      stdout.write("Nhập tháng phát hành: ");
      thangPhatHanh=int.parse(stdin.readLineSync()!);
    }while(thangPhatHanh<1||thangPhatHanh>12); 
  }

  @override
  void hienThi(){
    super.hienThi();
    print("Số phát hành: $soPhatHanh");
    print("Tháng phát hành: $thangPhatHanh");
  }
}

class Bao extends taiLieu{
  late int ngayPhatHanh;

  @override
  void nhapInfoSach(){
    super.nhapInfoSach();
    do{
      stdout.write("Nhập ngày phát hành: ");
      ngayPhatHanh=int.parse(stdin.readLineSync()!);
    }while(ngayPhatHanh<1||ngayPhatHanh>31); 
  }
  
  @override
  void hienThi(){
    super.hienThi();
    print("Ngày phát hành: $ngayPhatHanh");
  }
}

class listTaiLieu{
  List<taiLieu> docs = [];

  //Thêm tài liệu
  void addTaiLieu(taiLieu documents){
    docs.add(documents);
    print("Thêm thành công");
    print("----------------------------");  
  }

  //Xóa tài liệu
  void deleteTaiLieu(String Id){
    for(int i=0;i<docs.length;i++){
      if(Id==docs[i].maTaiLieu){
        docs.removeAt(i);
        print("Đã xóa thành công tài liệu có mã: $Id");
        print("----------------------------");       
      }
    }
  }

  //Hiển thị tài liệu
  void displayTaiLieu(String Id){
    for(int i=0;i<docs.length;i++){
      if(Id==docs[i].maTaiLieu){
        docs[i].hienThi();
        print("--------------------------");
      }
    }
  }

  //Tìm tài liệu theo loại
  void searchTaiLieu(Type loaiTaiLieu){
    for(var tai_lieu in docs){
      if(tai_lieu.runtimeType==loaiTaiLieu){
        tai_lieu.hienThi();
        print("--------------------------");
      }
    }
  }


  //Thông tin tài liệu
  void thongTinTaiLieu(){
    for(int i=0;i<docs.length;i++){
      docs[i].hienThi();
      print("--------------------");
    }
  }

}

void main(){
  listTaiLieu list_tai_lieu = listTaiLieu();
  bool Runing=true;

  while(Runing){
      print("----Quản lí tài liệu-----");
      print("1. Thêm tài liệu");
      print("2. Xóa tài liệu");
      print("3. Hiển thị tài liệu");
      print("4. Tìm tài liệu");
      print("5. Thoát");
      stdout.write("Chọn chức năng: ");
      int choice =int.parse(stdin.readLineSync()!);
      
      switch(choice){
        case 1: 
          stdout.write("Chọn phương tiện(1.Sách, 2.Tạp chí. 3.Báo): ");
          int loaiTaiLieu=int.parse(stdin.readLineSync()!);

          if(loaiTaiLieu==1){
            Sach sach =Sach();
            sach.nhapInfoSach();
            list_tai_lieu.addTaiLieu(sach);
          }
          else if(loaiTaiLieu==2){
            TapChi tapchi = TapChi();
            tapchi.nhapInfoSach();
            list_tai_lieu.addTaiLieu(tapchi);
          }else if(loaiTaiLieu==3){
            Bao bao=Bao();
            bao.nhapInfoSach();
            list_tai_lieu.addTaiLieu(bao);
          }else
            break;

        case 2:
          stdout.write("Nhập mã tài liệu muốn xóa: ");
          String xoaID=stdin.readLineSync()!;
          list_tai_lieu.deleteTaiLieu(xoaID);

        case 3:
          stdout.write("Nhập mã tài liệu muốn hiển thị: ");
          String hienthiID=stdin.readLineSync()!;
          list_tai_lieu.displayTaiLieu(hienthiID);

        case 4:
          stdout.write("Nhập loại tài liệu muốn tìm (1.Sách / 2.Tạp chí / 3.Báo): ");
          int? loaiTaiLieu=int.parse(stdin.readLineSync()!);
          if(loaiTaiLieu==1)
            list_tai_lieu.searchTaiLieu(Sach);
          else if(loaiTaiLieu==2)
            list_tai_lieu.searchTaiLieu(TapChi);
          else if(loaiTaiLieu==3)
            list_tai_lieu.searchTaiLieu(Bao);
          else
            break;
          
        case 5:
          Runing=false;
          print("Đang thoát");
          print("-----------------------------");        

        // case 6:
        //   print("-----Thông tin các loại sách-----");
        //   list_tai_lieu.thongTinTaiLieu();   
      }
  }
}
