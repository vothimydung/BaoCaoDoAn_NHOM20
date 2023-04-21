-- CHỨC NĂNG TÌM KIẾM SỬ DỤNG Stored procedure
--tạo procedure để lấy toàn bộ hàng

USE QLYBANHANGNOITHAT;

SELECT * FROM HANG
 
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE SelectALLHang
	@tukhoa NVARCHAR(50) -- tìm kiếm hàng dựa theo từ khóa
	 -- 1: tìm theo mã hàng
	 -- 2: tìm theo mã loại hàng
	 -- 2: tìm theo tên hàng
	
AS
	SELECT mahang, maloaihang, makhuyenmai, tenhang, dongia, thoigianbaohanh, donvitinh FROM HANG
	WHERE
		 mahang like '%' + LOWER(LTRIM(@tukhoa)) + '%' 
		 or maloaihang like '%' + LOWER(LTRIM(@tukhoa)) + '%' 
		 or LOWER(tenhang) like '%' + LOWER(LTRIM(@tukhoa)) + '%'
		  
	ORDER BY tenhang;


EXEC SelectALLHang 'LH002';

EXEC SelectALLHang N'Bàn';