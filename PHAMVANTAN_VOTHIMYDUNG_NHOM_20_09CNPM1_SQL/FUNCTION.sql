

-- thêm Nhân viên bằng hàng FUNCTION

CREATE FUNCTION them_nhan_vien(@MaNV NVARCHAR(30),
			 @MaBP NVARCHAR(30), 
			 @TenNV NVARCHAR(50), 
			 @SĐT NVARCHAR(20), 
			 @Diachi NVARCHAR(50))
RETURNS VOID
AS 
BEGIN
    INSERT INTO NHANVIEN(manhanvien, mabophan, tennhanvien, diachi, sodt) 
    VALUES (@MaNV, @MaBP, @TenNV, @Diachi, @SĐT);
END;

SELECT * FROM NHANVIEN

--Tạo hàm đọc danh sách nhân viên theo mã bộ phận truyền vào

CREATE FUNCTION Danh_sach_nhan_vien(@Mabophan NVARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM NHANVIEN
    WHERE CONVERT(NVARCHAR(30), mabophan) = @Mabophan
)
GO
--Gọi hàm
SELECT * FROM Danh_sach_nhan_vien('BP003')
 