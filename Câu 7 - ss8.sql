create database donhang;
use donhang;
CREATE TABLE ChiTietDonHang (
    ma_chi_tiet INT,
    ma_don_hang INT,
    ten_san_pham VARCHAR(100),
    so_luong INT,
    don_gia DECIMAL(10, 2),
    thanh_tien DECIMAL(10, 2)
);
INSERT INTO ChiTietDonHang (ma_chi_tiet, ma_don_hang, ten_san_pham, so_luong, don_gia, thanh_tien) VALUES
(1, 1001, 'Cà Phê Sữa', 2, 29000.00, 58000.00),
(2, 1001, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(3, 1002, 'Trà Đào Cam Sả', 1, 45000.00, 45000.00),
(4, 1003, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(5, 1004, 'Trà Sữa Trân Châu Đường Đen', 2, 55000.00, 110000.00),
(6, 1005, 'Bạc Xỉu', 1, 35000.00, 35000.00),
(7, 1006, 'Cà Phê Sữa', 3, 29000.00, 87000.00),
(8, 1006, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00),
(9, 1007, 'Trà Đào Cam Sả', 2, 45000.00, 90000.00),
(10, 1008, 'Trà Sữa Trân Châu Đường Đen', 1, 55000.00, 55000.00),
(11, 1009, 'Cà Phê Sữa', 1, 29000.00, 29000.00),
(12, 1010, 'Trà Chanh Gừng Mật Ong', 1, 42000.00, 42000.00);
select * from chitietdonhang;
-- Nhiệm vụ 1: Xây dựng Báo cáo Hiệu suất Sản phẩm.
SELECT 
    ten_san_pham,
    SUM(so_luong) AS tong_so_ly_ban,
    SUM(thanh_tien) AS tong_doanh_thu,
    COUNT(ma_don_hang) AS so_don_hang_chua_sp
FROM
    ChiTietDonHang
GROUP BY ten_san_pham
ORDER BY tong_doanh_thu DESC , tong_so_ly_ban DESC;
-- Nhiệm vụ 2: Phân tích và Đề xuất Chiến lược.
/*
1. Phân loại Sản phẩm và lập luận.
	Xác định 2 sản phẩm "ngôi sao" (có hiệu suất tốt nhất).
	- Hai sản phẩm ngôi sao được xác định là Cà Phê Sữa và Trà Sữa Trân Châu Đường Đen.
    - Cà Phê Sữa: Đây là sản phẩm dẫn đầu tuyệt đối vì đạt hiệu suất cao nhất ở cả hai tiêu chí: 
    Tổng Doanh Thu (203,000 VNĐ) và Mức Độ Phổ Biến (xuất hiện trong 4 đơn hàng).
	- Trà Sữa Trân Châu Đường Đen: Đạt Tổng Doanh Thu cao thứ hai (165,000 VNĐ), 
    cho thấy đây là sản phẩm có giá trị đơn hàng cao và được khách hàng sẵn sàng chi trả.
	Xác định 2 sản phẩm "cần xem xét" (có hiệu suất thấp nhất).
   - Hai sản phẩm cần xem xét là Bạc Xỉu và Trà Chanh Gừng Mật Ong.
	- Bạc Xỉu: Sản phẩm này có Tổng Doanh Thu thấp nhất (70,000 VNĐ) và chỉ bán được 2 ly, 
	mặc dù có mức độ phổ biến ngang với một số sản phẩm khác (2 đơn hàng). Hiệu suất thấp này đòi hỏi phải có sự can thiệp.
	- Trà Chanh Gừng Mật Ong: Có Tổng Doanh Thu thấp thứ hai (84,000 VNĐ) và cũng chỉ xuất hiện 
	trong 2 đơn hàng. Sản phẩm này chưa tạo được sự khác biệt hay sức hút đáng kể.
2. Đề xuất Chiến lược
	- Đối với Sản phẩm Ngôi sao: Cà Phê Sữa
		+ Đề xuất chương trình khuyến mãi: "Combo Khởi Đầu Ngày Mới".
		+ Chi tiết: Khi khách hàng mua 2 ly Cà Phê Sữa (hoặc 1 Cà Phê Sữa + 1 Bánh Mì/Bánh Ngọt), họ sẽ được giảm 10% tổng giá trị hoặc tặng kèm một món ăn sáng nhẹ.
		+ Mục tiêu: Tận dụng sự phổ biến sẵn có để tăng số lượng bán trên mỗi đơn hàng và thúc đẩy doanh số tổng thể, đồng thời tạo thói quen mua hàng kèm theo (cross-selling).
	- Đối với Sản phẩm Cần xem xét: Bạc Xỉu
		+ Đề xuất hành động: Thay đổi công thức và giới thiệu phiên bản đặc biệt dùng thử.
		+ Chi tiết: Ra mắt "Bạc Xỉu Kem Trứng" hoặc "Bạc Xỉu Muối Biển" trong thời gian giới hạn (ví dụ: 2 tuần) với mức giá không đổi hoặc giảm nhẹ.
		+ Mục tiêu: Kích thích sự tò mò của khách hàng và thu hút họ thử nghiệm lại sản phẩm Bạc Xỉu, giải quyết vấn đề có thể là công thức hiện tại chưa đủ hấp dẫn. Nếu sau giai đoạn dùng thử mà doanh số vẫn không cải thiện, ban quản lý nên cân nhắc loại bỏ sản phẩm này khỏi thực đơn để tối ưu hóa chi phí nguyên vật liệu và quy trình vận hành.
*/