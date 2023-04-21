
USE QLYBANHANGNOITHAT;

SELECT * FROM LOAIHANG;

--Tạo store procedure để thêm mới một loại hàng vào bảng LOAIHANG

CREATE PROCEDURE ThemmoiLoaiHang
	@MaLoaiHang NVARCHAR(30),
	@TenLoaiHang NVARCHAR(30)

AS
BEGIN
	INSERT INTO LOAIHANG
	(
		maloaihang,
		tenloaihang
	)
	VALUES(
		-- Giá trị
		@MaLoaiHang,
		@TenLoaiHang
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM LOAIHANG;

EXEC ThemmoiLoaiHang 'LH006', N'Đèn'


--Tạo procedure UPDATE thông tin loại hàng
CREATE PROCEDURE updateLoaiHang
	@MaLoaiHang NVARCHAR(30),
	@TenLoaiHang NVARCHAR(30)

AS
BEGIN
	UPDATE LOAIHANG
	SET
		tenloaihang = @TenLoaiHang
	WHERE maloaihang = @MaLoaiHang;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM LOAIHANG;

EXEC updateLoaiHang 'LH006', N'Đèn treo'


-- tạo procedure để select thông tin chi tiết của 1 loại hàng

CREATE PROCEDURE selectLoaiHang
	@MaLoaiHang NVARCHAR(30)
AS
BEGIN
	SELECT
		 tenloaihang
	FROM LOAIHANG
	WHERE maloaihang = @MaLoaiHang;
END

GO;

EXEC selectLoaiHang 'LH006'

--tạo procedure để delete thông tin chi tiết của 1 loại hàng

CREATE PROCEDURE XoaLoaiHang
    @MaLoaiHang NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem maloaihang đã tồn tại trong bảng LOAIHANG hay chưa
    IF NOT EXISTS (SELECT * FROM LOAIHANG WHERE maloaihang = @MaLoaiHang)
    BEGIN
        RETURN 1; -- Trả về 1 nếu maloaihang chưa tồn tại trong bảng loại hàng
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng loại hàng
    DELETE FROM LOAIHANG WHERE maloaihang = @MaLoaiHang;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM LOAIHANG

EXEC XoaLoaiHang 'LH006'
		
	
