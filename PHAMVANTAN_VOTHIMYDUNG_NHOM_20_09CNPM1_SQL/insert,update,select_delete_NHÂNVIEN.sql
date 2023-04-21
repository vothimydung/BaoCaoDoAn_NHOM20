
USE QLYBANHANGNOITHAT;

SELECT * FROM NHANVIEN;


--Tạo store procedure để thêm mới một nv vào bảng nhanvien

CREATE PROCEDURE ThemmoiNV
	@MaNV NVARCHAR(30),
	@Mabophan NVARCHAR(30),
	@TenNV NVARCHAR(30),
	@Diachi NVARCHAR(50),
	@SDT NVARCHAR(30)

AS
BEGIN
	INSERT INTO NHANVIEN
	(
		manhanvien,
		mabophan,
		tennhanvien,
		diachi,
		sodt
	)
	VALUES(
		-- Giá trị
		@MaNV,
		@Mabophan,
		@TenNV,
		@Diachi,
		@SDT
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM NHANVIEN;

EXEC ThemmoiNV 'NV009', 'BP006', 'Lê Thị Hoàng', 'Hà Nội', '0324567898'


--Tạo procedure UPDATE thông tin nhân viên
CREATE PROCEDURE updateSV
	@MaNV NVARCHAR(30),
	@Mabophan NVARCHAR(30),
	@TenNV NVARCHAR(30),
	@Diachi NVARCHAR(50),
	@SDT NVARCHAR(30)

AS
BEGIN
	UPDATE NHANVIEN
	SET
		mabophan = @Mabophan,
		tennhanvien = @TenNV,
		diachi = @Diachi,
		sodt = @SDT
	WHERE manhanvien = @MaNV;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM NHANVIEN;

EXEC updateSV  'NV009', 'BP006', N'Lê Thị Hoàng', N'Quảng Ngãi', '0324567898'


-- tạo procedure để select thông tin chi tiết của 1 nhân viên

CREATE PROCEDURE selectNV
	@MaNV NVARCHAR(30)
AS
BEGIN
	SELECT
		mabophan, tennhanvien, diachi, sodt
	FROM NHANVIEN
	WHERE manhanvien = @MaNV;
END

GO;

EXEC selectNV 'NV008'

--tạo procedure để delete thông tin chi tiết của 1 nhân viên

CREATE PROCEDURE XoaNhanVien 
    @MaNV NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem manv đã tồn tại trong bảng nhanvien hay chưa
    IF NOT EXISTS (SELECT * FROM NHANVIEN WHERE manhanvien = @MaNV)
    BEGIN
        RETURN 1; -- Trả về 1 nếu manv chưa tồn tại trong bảng nhanvien
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng nhanvien
    DELETE FROM NHANVIEN WHERE manhanvien = @MaNV;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM NHANVIEN

EXEC XoaNhanVien 'NV009'
		
	
