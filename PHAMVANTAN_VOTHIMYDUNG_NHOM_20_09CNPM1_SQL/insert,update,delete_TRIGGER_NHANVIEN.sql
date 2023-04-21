
USE QLYBANHANGNOITHAT
--insert,update,delete_TRIGGER_NHANVIEN

SELECT * FROM NHANVIEN

--Tạo Trigger để thêm mới một nv vào bảng nhanvien

CREATE TRIGGER trg_insert_NHANVIEN
ON NHANVIEN
AFTER INSERT
AS
BEGIN
  -- Thêm dữ liệu vào bảng Nhân viên_backup
  INSERT INTO NHANVIEN (manhanvien, mabophan, tennhanvien, diachi,sodt)
	VALUES('NV009', 'BP002', N'Nguyễn Thị Tú', 'Hà Nội', '0987654356')
  SELECT * FROM inserted;
END;

BACKUP DATABASE [QLYBANHANGNOITHAT] TO DISK = 'D:\SQL.bak' WITH INIT

--Tạo Trigger để update mới một nv vào bảng nhanvien

CREATE TRIGGER trg_update_NHANVIEN
ON NHANVIEN
AFTER UPDATE
AS
BEGIN
  -- Cập nhật dữ liệu vào bảng nhanvien_backup
  UPDATE NHANVIEN
  SET NHANVIEN.manhanvien = i.manhanvien,
      NHANVIEN.mabophan = i.mabophan,
      NHANVIEN.tennhanvien = i.tennhanvien,
	  NHANVIEN.diachi = i.diachi,
      NHANVIEN.sodt = i.sodt
  FROM NHANVIEN 
  INNER JOIN inserted i ON NHANVIEN.manhanvien = i.manhanvien;
END;


--Tạo Trigger để delete mới một nv vào bảng nhanvien

CREATE TRIGGER trg_delete_NHANVIEN
ON NHANVIEN
FOR DELETE
AS
BEGIN
  -- Xóa dữ liệu nhân viên trong bảng nhanvien_backup
  DELETE NHANVIEN
  FROM NHANVIEN 
  INNER JOIN deleted ON NHANVIEN.manhanvien = deleted.manhanvien;
END;