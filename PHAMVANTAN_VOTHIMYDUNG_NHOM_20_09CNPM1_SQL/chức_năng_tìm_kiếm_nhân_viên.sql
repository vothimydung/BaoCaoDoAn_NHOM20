
-- CHỨC NĂNG TÌM KIẾM SỬ DỤNG Stored procedure
--tạo procedure để lấy toàn bộ nhân viên

USE QLYBANHANGNOITHAT;

SELECT * FROM NHANVIEN
 
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SelectALLNhanvien
	@tukhoa NVARCHAR(50) -- tìm kiếm nhân viên dựa theo từ khóa
	 -- 1: tìm theo mã nhân viên
	 -- 2: tìm theo mã bộ phận
	 -- 3: tìm theo tên nhân viên
	 

AS
	SELECT manhanvien, mabophan, tennhanvien, diachi, sodt FROM NHANVIEN
	WHERE
		 manhanvien like '%' + LOWER(LTRIM(@tukhoa)) + '%' 
		 or mabophan like '%' + LOWER(LTRIM(@tukhoa)) + '%' 
		 or LOWER(tennhanvien) like '%' + LOWER(LTRIM(@tukhoa)) + '%'
		  
	ORDER BY tennhanvien;

EXEC SelectALLNhanvien N'NV003';

EXEC SelectALLNhanvien N'BP002';

EXEC SelectALLNhanvien N'Lê Văn Nam';