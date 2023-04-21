

USE  QLYBANHANGNOITHAT
GO

CREATE TABLE KHACH (
  makhach NVARCHAR(30) PRIMARY KEY,
  tenkhach NVARCHAR(30),
  diachi NVARCHAR(50),
  sodt NVARCHAR(30)
);
CREATE TABLE DICHVU (
  madichvu NVARCHAR(30) PRIMARY KEY,
  tendichvu NVARCHAR(50)
);
CREATE TABLE LOAIHANG (
  maloaihang NVARCHAR(30) PRIMARY KEY,
  tenloaihang NVARCHAR(50)
);
CREATE TABLE KHUYENMAI (
  makhuyenmai NVARCHAR(30) PRIMARY KEY,
  tenkhuyenmai NVARCHAR(50)
);
CREATE TABLE BOPHAN (
  mabophan NVARCHAR(30) PRIMARY KEY,
  tenbophan NVARCHAR(50)
);
CREATE TABLE NHANVIEN (
  manhanvien NVARCHAR(30) PRIMARY KEY,
  mabophan NVARCHAR(30),
  tennhanvien NVARCHAR(30),
  diachi NVARCHAR(50),
  sodt NVARCHAR(30),
  FOREIGN KEY (mabophan) REFERENCES BOPHAN(mabophan)
);
CREATE TABLE HANG (
  mahang NVARCHAR(30) PRIMARY KEY,
  maloaihang NVARCHAR(30),
  makhuyenmai NVARCHAR(30),
  tenhang NVARCHAR(30),
  dongia money,
  thoigianbaohanh NVARCHAR(30),
  donvitinh NVARCHAR(30),
  FOREIGN KEY (maloaihang) REFERENCES LOAIHANG(maloaihang),
  FOREIGN KEY (makhuyenmai) REFERENCES KHUYENMAI(makhuyenmai)
);

CREATE TABLE KHACH_MUA_HANG (
  sohoadon NVARCHAR(30) PRIMARY KEY,
  makhach NVARCHAR(30),
  mahang NVARCHAR(30),
  manhanvien NVARCHAR(30),
  dongiamua money,
  soluong float,
  ngaymuahang DATE,
  ngaygiaohang DATE,
  tiendattruoc money,
  FOREIGN KEY (makhach) REFERENCES KHACH(makhach),
  FOREIGN KEY (mahang) REFERENCES HANG(mahang),
  FOREIGN KEY (manhanvien) REFERENCES NHANVIEN(manhanvien)
);
CREATE TABLE THANH_TOAN_TIEN (
  sohoadon NVARCHAR(30) PRIMARY KEY,
  makhach NVARCHAR(30),
  manhanvien NVARCHAR(30),
  ngaythanhtoan DATE,
  sotienthanhtoan money,
  FOREIGN KEY (makhach) REFERENCES KHACH(makhach),
  FOREIGN KEY (manhanvien) REFERENCES NHANVIEN(manhanvien)
);
CREATE TABLE KHACH_SUDUNG_DICHVU (
  sohoadon NVARCHAR(30) PRIMARY KEY,
  makhach NVARCHAR(30),
  madichvu NVARCHAR(30),
  manhanvien NVARCHAR(30),
  tiendattruoc money,
  ngaysudungdichvu DATE,
  ngaynhansanpham DATE,
  giadichvuchinhthuc money
  FOREIGN KEY (makhach) REFERENCES KHACH(makhach),
  FOREIGN KEY (manhanvien) REFERENCES NHANVIEN(manhanvien),
  FOREIGN KEY (madichvu) REFERENCES DICHVU(madichvu)
);

INSERT INTO KHACH(makhach, tenkhach, diachi, sodt)
VALUES('KH001',N'Nguyễn Thị Thu Thảo','Quảng Nam','0827171702'),
('KH002',N'Võ Thị mỹ Dung','Quảng Ngãi','0862626203') ,
('KH003',N'Phạm Văn Tân',N'Bình Định','09826262604'),
('KH004',N'Lê Văn A','TP.Hồ Chí Minh','0862626205') ,
('KH005',N'Trần Thanh Bình',N'Tiền Giang','09826262606'),
('KH006', 'Trần Văn Hà', 'Nghệ An', '0945123456'),
('KH007', 'Lê Thị Giang', 'Hà Nội', '0934123456'),
('KH008', 'Nguyễn Văn Hạnh', 'Hải Dương', '0912789456'),
('KH009', 'Phạm Thị Thương', 'Bắc Giang', '0987456123'),
('KH010', 'Trần Văn Khải', 'Bình Dương', '0978456123'); 
 
INSERT INTO DICHVU(madichvu, tendichvu) 
VALUES('DV001', 'Thiết kế nội thất'),
('DV002', 'Dịch vụ giao hàng'),
('DV003', 'Dịch vụ bảo hành'),
('DV004', 'Dịch vụ lắp ráp'),
('DV005', 'Dịch vụ sửa chữa');

INSERT INTO LOAIHANG(maloaihang, tenloaihang) VALUES
('LH001', 'Bàn'),
('LH002', 'Ghế'),
('LH003', 'Tủ'),
('LH004', 'Thảm'),
('LH005', 'Kệ');

INSERT INTO KHUYENMAI(makhuyenmai, tenkhuyenmai) VALUES
('KM001', 'Giảm giá 10%'),
('KM002', 'Giảm giá 20%'),
('KM003', 'Giảm giá 40%'),
('KM004', 'Miễn phí vận chuyển'),
('KM005', 'Tặng quà hấp dẫn'),
('KM006', 'Đổi điểm thưởng');

INSERT INTO BOPHAN(mabophan, tenbophan)
VALUES
('BP001', 'Phòng kinh doanh'),
('BP002', 'Phòng kế toán'),
('BP003', 'Phòng nhân sự'),
('BP004', 'Phòng thiết kế'),
('BP005', 'Phòng bảo trì'),
('BP006', 'Phòng lắp ráp');

INSERT INTO NHANVIEN(manhanvien, mabophan, tennhanvien, diachi, sodt)
VALUES
('NV001','BP002', N'Nguyễn Thị Thu', N'Hà Nội', '0982626521'),
('NV002','BP001', N'Lê Văn Nam', N'Cần Thơ', '0972525252'),
('NV003','BP001', N'Trần Thị Bình', N'TP.Hồ Chí Minh', '0328388388'),
('NV004','BP003', N'Lê Hoàng Nhật', N'Cần Thơ', '0972525252'),
('NV005','BP003', N'Nguyễn Hoàng Nam', N'TP.Hồ Chí Minh', '0328388388'),
('NV006','BP004', N'Trương Thị Thư', N'Hà Nội', '0328388388'),
('NV007','BP005', N'Lê Văn Bá', N'TP.Hồ Chí Minh', '0972525252'),
('NV008','BP006', N'Nguyễn Thị Hoa', N'Hà Nội', '0328388388');
 
INSERT INTO HANG(mahang, maloaihang, makhuyenmai, tenhang, dongia, thoigianbaohanh, donvitinh) 
VALUES
('H001', 'LH001', 'KM001', 'Bàn làm việc', 5000000, 24, 'Cái'),
('H002', 'LH002', 'KM002', 'Ghế xoay văn phòng', 2500000, 24, 'Cái'),
('H003', 'LH005', 'KM003', 'Kệ sách sắt', 2000000, 12, 'Cái'),
('H004', 'LH004', 'KM006', 'Thảm trải sàn', 500000, 12, 'm2'),
('H005', 'LH003', 'KM002', 'Tủ quần áo gỗ', 8000000, 24, 'Cái'),
('H006', 'LH002', 'KM004', 'Ghế sofa đơn', 3500000, 12, 'Cái'),
('H007', 'LH001', 'KM001', 'Bàn trà gỗ', 1200000, 12, 'Cái'),
('H008', 'LH005', 'KM005', 'Giá sách gỗ', 2500000, 24, 'Cái'),
('H009', 'LH001', 'KM002', 'Bàn học sinh', 1500000, 12, 'Cái'),
('H010', 'LH004', 'KM006', 'Thảm trải sàn văn phòng', 800000, 12, 'm2');

INSERT INTO KHACH_MUA_HANG(sohoadon, makhach, mahang, manhanvien, dongiamua, soluong, ngaymuahang, ngaygiaohang, tiendattruoc) VALUES
('HD001', 'KH001', 'H001', 'NV001', 4500000, 2, '2022-01-15', '2022-01-20', 2000000),
('HD002', 'KH002', 'H002', 'NV002', 2000000, 3, '2022-02-05', '2022-02-08', 500000),
('HD003', 'KH003', 'H003', 'NV001', 800000, 1, '2022-03-10', '2022-03-15', 0),
('HD004', 'KH004', 'H004', 'NV003', 500000, 5, '2022-04-05', '2022-04-07', 500000),
('HD005', 'KH005', 'H005', 'NV004', 6400000, 1, '2022-05-12', '2022-05-20', 3000000),
('HD006', 'KH006', 'H006', 'NV005', 3500000, 2, '2022-06-20', '2022-06-25', 2000000),
('HD007', 'KH007', 'H007', 'NV006', 1080000, 2, '2022-07-05', '2022-07-08', 160000),
('HD008', 'KH008', 'H008', 'NV007', 2500000, 1, '2022-08-10', '2022-08-15', 0),
('HD009', 'KH009', 'H009', 'NV008', 1200000, 3, '2022-09-20', '2022-09-25', 200000),
('HD010', 'KH010', 'H010', 'NV008', 800000, 8, '2022-10-05', '2022-10-07', 1000000);

INSERT INTO THANH_TOAN_TIEN(sohoadon, makhach, manhanvien, ngaythanhtoan, sotienthanhtoan) VALUES
('HD001', 'KH001', 'NV001', '2022-01-21', 3000000),
('HD002', 'KH002', 'NV002', '2022-02-10', 2500000),
('HD003', 'KH003', 'NV001', '2022-03-18', 1500000),
('HD004', 'KH004', 'NV003', '2022-04-08', 2000000),
('HD005', 'KH005', 'NV004', '2022-05-25', 3500000),
('HD006', 'KH006', 'NV005', '2022-06-30', 2500000),
('HD007', 'KH007', 'NV006', '2022-07-12', 1800000),
('HD008', 'KH008', 'NV007', '2022-08-20', 1000000),
('HD009', 'KH009', 'NV008', '2022-09-30', 2200000),
('HD010', 'KH010', 'NV008', '2022-10-10', 2800000);

INSERT INTO KHACH_SUDUNG_DICHVU(sohoadon, makhach, madichvu, manhanvien, tiendattruoc, ngaysudungdichvu, ngaynhansanpham, giadichvuchinhthuc)
 VALUES
('HD001', 'KH001', 'DV001', 'NV001', 2000000, '2022-01-21', '2022-02-01', 3000000),
('HD002', 'KH002', 'DV002', 'NV002', 500000, '2022-02-10', '2022-02-18', 2500000),
('HD003', 'KH003', 'DV003', 'NV001', 0, '2022-03-18', '2022-03-25', 1500000),
('HD004', 'KH004', 'DV004', 'NV003', 500000, '2022-04-08', '2022-04-12', 2000000),
('HD005', 'KH005', 'DV005', 'NV002', 3000000, '2022-05-25', '2022-06-01', 3500000),
('HD006', 'KH006', 'DV001', 'NV001', 2000000, '2022-06-30', '2022-07-07', 2500000),
('HD007', 'KH007', 'DV002', 'NV002', 160000, '2022-07-12', '2022-07-15', 1800000),
('HD008', 'KH008', 'DV003', 'NV001', 0, '2022-08-20', '2022-08-30', 1000000),
('HD009', 'KH009', 'DV004', 'NV003', 200000, '2022-09-30', '2022-10-05', 2200000),
('HD010', 'KH010', 'DV005', 'NV002', 1000000, '2022-10-10', '2022-10-15', 2800000);




SELECT * FROM KHACH;

SELECT * FROM DICHVU;


SELECT * FROM LOAIHANG;



SELECT * FROM KHACH_SUDUNG_DICHVU;


