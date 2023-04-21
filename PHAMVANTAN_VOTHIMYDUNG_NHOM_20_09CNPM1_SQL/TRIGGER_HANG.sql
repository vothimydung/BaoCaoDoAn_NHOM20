

--insert,update,delete_TRIGGER_HÀNG

SELECT * FROM HANG

--Tạo Trigger để thêm mới vào bảng hàng

CREATE TRIGGER trg_insert_hang
ON HANG
FOR INSERT
AS
BEGIN
  -- Thêm dữ liệu vào bảng HANG_backup
  INSERT INTO HANG (mahang, maloaihang, makhuyenmai, tenhang, dongia, thoigianbaohanh, donvitinh)
	VALUES('H011', 'LH003', 'KM003', N'Tủ gỗ', '5000000', 24, 'Cái')
  SELECT * FROM inserted;
END;

BACKUP DATABASE [QLYBANHANGNOITHAT] TO DISK = 'D:\SQL.bak' WITH INIT

--Tạo Trigger để update mới một hàng vào bảng HANG

CREATE TRIGGER trg_update_hang
ON HANG
FOR UPDATE
AS
BEGIN
  -- Cập nhật dữ liệu vào bảng 
  UPDATE HANG
  SET HANG.mahang = i.mahang,
      HANG.maloaihang = i.maloaihang,
      HANG.makhuyenmai = i.makhuyenmai,
	  HANG.tenhang = i.tenhang,
      HANG.dongia = i.dongia,
	  HANG.thoigianbaohanh = i.thoigianbaohanh,
      HANG.donvitinh = i.donvitinh
  FROM HANG 
  INNER JOIN inserted i ON HANG.mahang = i.mahang;
END;


--Tạo Trigger để delete bảng Hàng

CREATE TRIGGER trg_delete_hang
ON HANG
FOR DELETE
AS
BEGIN
  -- Xóa dữ liệu hàng trong bảng
  DELETE HANG
  FROM HANG 
  INNER JOIN deleted ON HANG.mahang = deleted.mahang;
END;