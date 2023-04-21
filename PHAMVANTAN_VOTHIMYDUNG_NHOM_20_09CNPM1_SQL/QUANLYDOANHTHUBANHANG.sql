

USE QLYBANHANGNOITHAT

--tổng doanh thu bán hàng từ tháng 4 -> tháng 10

SELECT SUM(KHACH_MUA_HANG.soluong * HANG.dongia) AS TongDoanhThuBanHang
FROM KHACH_MUA_HANG 
JOIN HANG  ON KHACH_MUA_HANG.mahang = HANG.mahang
WHERE KHACH_MUA_HANG.ngaymuahang BETWEEN '2022-04-01' AND '2023-10-10'

SELECT * FROM KHACH_MUA_HANG
SELECT * FROM HANG

--  In ra danh sách 4 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng)
SELECT TOP 4 *
FROM KHACH_MUA_HANG
ORDER BY (soluong*dongiamua) DESC

---- Tháng mấy trong năm 2022, doanh số bán hàng cao nhất
SELECT MONTH(ngaymuahang) AS thángmuanhiềunhất
FROM KHACH_MUA_HANG
WHERE YEAR(ngaymuahang) = 2022
GROUP BY MONTH(ngaymuahang)
HAVING SUM(dongiamua*soluong) >= ALL(SELECT SUM(dongiamua*soluong) FROM KHACH_MUA_HANG 
	WHERE YEAR(ngaymuahang) = 2022 GROUP BY MONTH(ngaymuahang))

--- doanh thu bán hàng của từng tháng trong năm 2022

SELECT MONTH(ngaymuahang) Thang, SUM(soluong* dongiamua) DoanhThu
FROM KHACH_MUA_HANG
WHERE YEAR(ngaymuahang) = 2022
GROUP BY MONTH(ngaymuahang)
