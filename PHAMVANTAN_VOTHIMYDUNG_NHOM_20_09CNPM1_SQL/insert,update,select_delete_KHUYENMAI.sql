
USE QLYBANHANGNOITHAT;

SELECT * FROM KHUYENMAI;



--Tạo store procedure để thêm mới một khuyến mãi vào bảng KHUYENMAI

CREATE PROCEDURE ThemmoiKM
	@MaKhuyenMai NVARCHAR(30),
	@TenKhuyenMai NVARCHAR(30)

AS
BEGIN
	INSERT INTO KHUYENMAI
	(
		makhuyenmai,
		tenkhuyenmai
	)
	VALUES(
		-- Giá trị
		@MaKhuyenMai,
		@TenKhuyenMai
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM KHUYENMAI;

EXEC ThemmoiKM 'KM007', N'Giảm giá 50%'


--Tạo procedure UPDATE thông tin Khuyến mãi
CREATE PROCEDURE updateKM
	@MaKhuyenMai NVARCHAR(30),
	@TenKhuyenMai NVARCHAR(30)

AS
BEGIN
	UPDATE KHUYENMAI
	SET
		tenkhuyenmai = @TenKhuyenMai
	WHERE makhuyenmai = @MaKhuyenMai;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM KHUYENMAI;

EXEC updateKM  'KM007', N' Giảm giá 75%'


-- tạo procedure để select thông tin chi tiết của 1 mãi khuyến mãi

CREATE PROCEDURE selectKM
	@MaKhuyenMai NVARCHAR(30)
AS
BEGIN
	SELECT
		 tenkhuyenmai
	FROM KHUYENMAI
	WHERE makhuyenmai = @MaKhuyenMai;
END

GO;

EXEC selectKM 'KM006'

--tạo procedure để delete thông tin chi tiết của 1 mã khuyến mãi

CREATE PROCEDURE XoaKhuyenMai
    @MaKhuyenMai NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem makhuyenmai đã tồn tại trong bảng KHUYENMAI hay chưa
    IF NOT EXISTS (SELECT * FROM KHUYENMAI WHERE makhuyenmai = @MaKhuyenMai)
    BEGIN
        RETURN 1; -- Trả về 1 nếu mabophan chưa tồn tại trong bảng khuyến mãi
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng khuyến mãi
    DELETE FROM KHUYENMAI WHERE makhuyenmai = @MaKhuyenMai;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM KHUYENMAI

EXEC XoaKhuyenMai 'KM007'
		
	
