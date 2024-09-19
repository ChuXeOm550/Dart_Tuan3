
import 'dart:io';

class Xe{
  late String ID;
  late String hangSX;
  late int namSX;
  late double giaBan;
  late String mauXe;


  //Xe(this.ID, this.hangSX, this.namSX, this.giaBan, this.mauXe);

  void NhapInfo(){
    stdout.write("Nhập Id xe: ");
    ID=stdin.readLineSync()!;

    stdout.write("Nhập hãng sản xuất: ");
    hangSX=stdin.readLineSync()!;

    stdout.write("Nhập năm sản xuất: ");
    namSX=int.parse(stdin.readLineSync()!);

    stdout.write("Nhập giá bán: ");
    giaBan=double.parse(stdin.readLineSync()!);

    stdout.write("Nhập màu xe: ");
    mauXe=stdin.readLineSync()!;
  }

  void hienThi(){
    print("ID: $ID");
    print("Hãng sản xuất: $hangSX");
    print("Năm sản xuất: $namSX");
    print("Giá bán: $giaBan");
    print("Màu xe: $mauXe");
  }
}

class Oto extends Xe{
  late int soChoNgoi;

  //Oto(super.ID, super.hangSX, super.namSX, super.giaBan, super.mauXe, this.soChoNgoi);

  @override
  void NhapInfo(){
    super.NhapInfo();
    stdout.write("Nhập số chỗ ngồi: ");
    soChoNgoi=int.parse(stdin.readLineSync()!);
  }

  @override
  void hienThi(){
    super.hienThi();
    print("Số chỗ ngồi: $soChoNgoi");
  }
}

class Moto extends Xe{
  late double congSuat;

  //Moto(super.ID, super.hangSX, super.namSX, super.giaBan, super.mauXe, this.congSuat);

  @override
  void NhapInfo(){
    super.NhapInfo();
    stdout.write("Nhập số công suất: ");
    congSuat=double.parse(stdin.readLineSync()!);
  }

  @override
  void hienThi(){
    super.hienThi();
    print("Công suất: $congSuat");
  }
}

class Truck extends Xe{
  late double trongTai;

  //Truck(super.ID, super.hangSX, super.namSX, super.giaBan, super.mauXe, this.trongTai);
    
  @override
  void NhapInfo(){
    super.NhapInfo();
    stdout.write("Nhập trọng tải: ");
    trongTai=double.parse(stdin.readLineSync()!);
  }

  @override
  void hienThi(){
    super.hienThi();
    print("Trọng tải: $trongTai");
  }
}


class danhSachXe{
  List<Xe> cacPhuongTien=[];

  //Thêm phương tiện
  void themPhuongTien(Xe xe){
    cacPhuongTien.add(xe);
    print("Thêm thành công!!!");
  }

  void xoaPhuongTien(String Id){
    for(int i=0;i< cacPhuongTien.length;i++)
    {
      if(Id==cacPhuongTien[i].ID){
        cacPhuongTien.removeAt(i);
        print("Đã xóa thành công xe có ID: $Id");
        print("----------------------------");
      }
    }
  }

  void timPhuongTien(String hangSX, String mauXe){
    for(int i=0;i< cacPhuongTien.length;i++){
      if(hangSX==cacPhuongTien[i].hangSX||mauXe==cacPhuongTien[i].mauXe){
        cacPhuongTien[i].hienThi();
        print("------------------------------");        
      }
    }

  }

  void showXe(){
    for(var xe in cacPhuongTien){
      xe.hienThi();
      print("---------------------");
    }
  }
}


void main(){
    danhSachXe ds = danhSachXe();
    bool Runing =true;

    while(Runing){
      print("----Quản lí phương tiện-----");
      print("1. Thêm phương tiện");
      print("2. Xóa phương tiện");
      print("3. Tìm phương tiện");
      print("4. Danh sách xe");
      print("5. Thoát");
      stdout.write("Chọn chức năng: ");
      int choice =int.parse(stdin.readLineSync()!);
      
      switch(choice){
        case 1: 
          stdout.write("Chọn phương tiện(1.Ôtô, 2.Xe máy. 3.Xe tải): ");
          int loaiPhuongTien=int.parse(stdin.readLineSync()!);

          if(loaiPhuongTien==1){
            Oto oto =Oto();
            oto.NhapInfo();
            ds.themPhuongTien(oto);
          }
          else if(loaiPhuongTien==2){
            Moto moto = Moto();
            moto.NhapInfo();
            ds.themPhuongTien(moto);
          }else if(loaiPhuongTien==3){
            Truck xeTai = Truck();
            xeTai.NhapInfo();
            ds.themPhuongTien(xeTai);
          }else
            break;

        case 2:
          stdout.write("Nhập ID muốn xóa: ");
          String xoaID=stdin.readLineSync()!;
          ds.xoaPhuongTien(xoaID);

        case 3:
          stdout.write("Nhập hãng sản xuất: ");
          String hangSX=stdin.readLineSync()!;
          stdout.write("Nhập màu xe: ");
          String mauXe=stdin.readLineSync()!;
          ds.timPhuongTien(hangSX, mauXe);

        case 4:
          print("DANH SÁCH CÁC XE");
          ds.showXe();

        case 5:
          Runing=false;
          print("Đang thoát");
          print("-----------------------------");

      }
    }
    
}