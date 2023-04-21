
USE QLYBANHANGNOITHAT;

SELECT * FROM BOPHAN;


--Tạo store procedure để thêm mới một bộ phận vào bảng BOPHAN

CREATE PROCEDURE ThemmoiBP
	@MaBoPhan NVARCHAR(30),
	@TenBoPhan NVARCHAR(30)

AS
BEGIN
	INSERT INTO BOPHAN
	(
		mabophan,
		tenbophan
	)
	VALUES(
		-- Giá trị
		@MaBoPhan,
		@TenBoPhan
	);-- kết thúc thêm mới dữ liệu

	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END


SELECT * FROM BOPHAN;

EXEC ThemmoiBP 'BP007', N'Phòng tư vấn khách hàng'


--Tạo procedure UPDATE thông tin bộ phận
CREATE PROCEDURE updateBP
	@Mabophan NVARCHAR(30),
	@Tenbophan NVARCHAR(30)

AS
BEGIN
	UPDATE BOPHAN
	SET
		tenbophan = @Tenbophan
	WHERE mabophan = @Mabophan;
	--kiểm tra xem đã insert thành công hay chưa
	If @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;

END

SELECT * FROM BOPHAN;

EXEC updateBP  'BP007', N' tư vấn khách hàng'


-- tạo procedure để select thông tin chi tiết của 1 bộ phận

CREATE PROCEDURE selectBP
	@Mabophan NVARCHAR(30)
AS
BEGIN
	SELECT
		 tenbophan
	FROM BOPHAN
	WHERE mabophan = @Mabophan;
END

GO;

EXEC selectBP 'BP007'

--tạo procedure để delete thông tin chi tiết của 1 bộ phận

CREATE PROCEDURE XoaBoPhan 
    @Mabophan NVARCHAR(30)
AS
BEGIN
    -- Kiểm tra xem mabophan đã tồn tại trong bảng bộ phận hay chưa
    IF NOT EXISTS (SELECT * FROM BOPHAN WHERE mabophan = @Mabophan)
    BEGIN
        RETURN 1; -- Trả về 1 nếu mabophan chưa tồn tại trong bảng bộ phận
    END

    BEGIN TRANSACTION; -- Bắt đầu transaction để đảm bảo tính toàn vẹn của dữ liệu

    -- Xóa dữ liệu trong bảng bộ phận
    DELETE FROM BOPHAN WHERE mabophan = @Mabophan;

    COMMIT TRANSACTION; -- Kết thúc transaction và lưu các thay đổi vào database

    RETURN 0; -- Trả về 0 nếu xóa thành công
END

SELECT * FROM BOPHAN

EXEC XoaBoPhan 'BP007'
		
	
