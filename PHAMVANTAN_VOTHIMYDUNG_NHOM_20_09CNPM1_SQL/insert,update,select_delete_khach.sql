
USE QLYBANHANGNOITHAT;

SELECT * FROM KHACH;


--Tạo store procedure để thêm mới một Khách vào bảng khach

CREATE PROCEDURE ThemmoiKhach
	@MaKhach NVARCHAR(30),
	@TenKhach NVARCHAR(30),
	@Diachi NVARCHAR(50),
	@SDT NVARCHAR(30)

AS
BEGIN
	INSERT INTO KHACH
	(
		makhach,
		tenkhach,
		diachi,
		sodt
	)
	VALUES(
		-- Giá trị
		@MaKhach,
		@TenKhach,
		@Diachi,
		@SDT
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM KHACH;

EXEC ThemmoiKhach'KH012', 'Lê Thị Hòa', 'Hà Nội', '0324567898'


--Tạo procedure UPDATE thông tin khách hàng
CREATE PROCEDURE updateKhach
	@MaKhach NVARCHAR(30),
	@TenKhach NVARCHAR(30),
	@Diachi NVARCHAR(50),
	@SDT NVARCHAR(30)

AS
BEGIN
	UPDATE KHACH
	SET
		tenkhach = @TenKhach,
		diachi = @Diachi,
		sodt = @SDT
	WHERE makhach = @MaKhach;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM KHACH;

EXEC updateKhach 'KH012', N'Lê Thị Hoàng', N'Quảng Ngãi', '0324567898'


-- tạo procedure để select thông tin chi tiết của 1 khách hàng

CREATE PROCEDURE selectKH
	@MaNV NVARCHAR(30)
AS
BEGIN
	SELECT
		tenkhach, diachi, sodt
	FROM KHACH
	WHERE makhach = @MaKhach;
END

GO;

EXEC selectKH 'KH009'

--tạo procedure để delete thông tin chi tiết của 1 khách hàng

CREATE PROCEDURE XoaKhach 
    @MaKhach NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem makhach đã tồn tại trong bảng KHACH hay chưa
    IF NOT EXISTS (SELECT * FROM KHACH WHERE makhach = @MaKhach)
    BEGIN
        RETURN 1; -- Trả về 1 nếu makhach chưa tồn tại trong bảng KHACH
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng KHACH
    DELETE FROM KHACH WHERE makhach = @MaKhach;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM KHACH

EXEC XoaKhach 'KH012'
		
	
