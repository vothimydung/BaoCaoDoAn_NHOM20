
USE QLYBANHANGNOITHAT;

SELECT * FROM HANG

--Tạo store procedure để thêm mới sản phẩm

CREATE PROCEDURE ThemmoiSP
	@MaHang NVARCHAR(30),
	@MaLoaiHang NVARCHAR(30),
	@MaKhuyenMai NVARCHAR(30),
	@TenHang NVARCHAR(50),
	@DonGia MONEY,
	@TGBaoHanh NVARCHAR(30),
	@DonViTinh NVARCHAR(30)

AS
BEGIN
	INSERT INTO HANG
	(
		mahang,
		maloaihang,
		makhuyenmai,
		tenhang,
		dongia,
		thoigianbaohanh,
		donvitinh
	)
	VALUES(
		-- Giá trị
		@MaHang,
		@MaLoaiHang,
		@MaKhuyenMai,
		@TenHang,
		@DonGia,
		@TGBaoHanh,
		@DonViTinh
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM HANG;

EXEC ThemmoiSP 'H011', 'LH003', 'KM003', N'Tủ gỗ', 5000000, '12', 'Cái'


--Tạo procedure UPDATE thông tin sản phẩm

CREATE PROCEDURE updateSP
	@MaHang NVARCHAR(30),
	@MaLoaiHang NVARCHAR(30),
	@MaKhuyenMai NVARCHAR(30),
	@TenHang NVARCHAR(50),
	@DonGia MONEY,
	@TGBaoHanh NVARCHAR(30),
	@DonViTinh NVARCHAR(30)

AS
BEGIN
	UPDATE HANG
	SET
		maloaihang = @MaLoaiHang,
		makhuyenmai = @MaKhuyenMai,
		tenhang = @TenHang,
		dongia = @DonGia,
		thoigianbaohanh = @TGBaoHanh,
		donvitinh = @DonViTinh
	WHERE mahang = @MaHang;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM HANG;

EXEC updateSP  'H011', 'LH004', 'KM003', N'Tủ gỗ', 5000000, '24', 'Cái'


-- tạo procedure để select thông tin chi tiết của 1 sản phẩm

CREATE PROCEDURE selectSP
	@MaHang NVARCHAR(30)
AS
BEGIN
	SELECT
		 maloaihang, makhuyenmai, tenhang, dongia, thoigianbaohanh, donvitinh
	FROM HANG
	WHERE mahang = @MaHang;
END;


EXEC selectSP 'H010'


-- tạo procedure để delete thông tin chi tiết của 1 sản phẩm

CREATE PROCEDURE XoaSanPham
    @MaHang NVARCHAR(30)
    
AS
BEGIN
    -- Kiểm tra xem masp đã tồn tại trong bảng sanpham chưa
    IF NOT EXISTS (SELECT * FROM HANG WHERE mahang = @MaHang)
    BEGIN
        RETURN 1; -- Trả về 1 nếu manv chưa tồn tại trong bảng nhanvien
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng nhanvien
    DELETE FROM HANG WHERE mahang = @MaHang;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM HANG

EXEC XoaSanPham 'H011'		
	
