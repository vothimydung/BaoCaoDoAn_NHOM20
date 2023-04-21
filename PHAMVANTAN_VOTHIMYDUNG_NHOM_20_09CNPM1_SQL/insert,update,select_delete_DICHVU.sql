
USE QLYBANHANGNOITHAT;

SELECT * FROM DICHVU;

--Tạo store procedure để thêm mới một dịch vụ vào bảng DICHVU

CREATE PROCEDURE ThemmoiDV
	@MaDichVu NVARCHAR(30),
	@TenDichVu NVARCHAR(30)

AS
BEGIN
	INSERT INTO DICHVU
	(
		madichvu,
		tendichvu
	)
	VALUES(
		-- Giá trị
		@MaDichVu,
		@TenDichVu
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM DICHVU;

EXEC ThemmoiDV 'DV006', N'Dịch vụ chăm sóc KH'


--Tạo procedure UPDATE thông tin dịch vụ
CREATE PROCEDURE updateDV
	@MaDichVu NVARCHAR(30),
	@TenDichVu NVARCHAR(30)

AS
BEGIN
	UPDATE DICHVU
	SET
		tendichvu = @TenDichVu
	WHERE madichvu = @MaDichVu;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM DICHVU;

EXEC updateDV  'DV006', N' tư vấn khách hàng'


-- tạo procedure để select thông tin chi tiết của 1 dichvu

CREATE PROCEDURE selectDV
	@MaDichVu NVARCHAR(30)
AS
BEGIN
	SELECT
		 tendichvu
	FROM DICHVU
	WHERE madichvu = @MaDichVu;
END

GO;

EXEC selectDV 'DV006'

--tạo procedure để delete thông tin chi tiết của 1 bộ phận

CREATE PROCEDURE XoaDichVu
    @MaDichVu NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem mabophan đã tồn tại trong bảng bộ phận hay chưa
    IF NOT EXISTS (SELECT * FROM DICHVU WHERE madichvu = @MaDichVu)
    BEGIN
        RETURN 1; -- Trả về 1 nếu mabophan chưa tồn tại trong bảng bộ phận
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng bộ phận
    DELETE FROM DICHVU WHERE madichvu = @MaDichVu;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM DICHVU

EXEC XoaDichVu 'DV006'
		
	
