create database phantichkhachhang;
use phantichkhachhang;
-- Bước 1: Xây dựng Bảng Dữ liệu Phân tích Khách hàng.
create table DonHang (
    ma_don_hang INT PRIMARY KEY, 
    ma_khach_hang INT,
    ngay_dat_hang DATE,
    tong_gia_tri DECIMAL
);
INSERT INTO DonHang (ma_don_hang, ma_khach_hang, ngay_dat_hang, tong_gia_tri) VALUES
(19, 107, '2024-01-05', 750000), 
(20, 101, '2024-01-18', 380000),
(21, 104, '2024-02-01', 920000),
(22, 102, '2024-02-14', 650000),
(23, 103, '2024-03-01', 150000);
select * from donhang;
select ma_khach_hang,
    SUM(tong_gia_tri) as tong_chi_tieu,
    COUNT(ma_don_hang) as tong_so_don_hang,
    AVG(tong_gia_tri) as chi_tieu_trung_binh,
    MIN(ngay_dat_hang) as ngay_dau_tien,
    MAX(ngay_dat_hang) as ngay_gan_nhat
from DonHang
group by ma_khach_hang;
-- Bước 2: Thiết kế Hệ thống Phân hạng và Lập luận.
/*
1. Hạng Bạc (Silver)
	- Tiêu chí Phân hạng: Khách hàng đạt được một trong hai điều kiện sau: TCT >= 500,000 VND HOẶC TSDH >= 3 đơn hàng.
	- Quyền lợi Cốt lõi: Giảm giá cố định 3% cho các đơn hàng tiếp theo và Miễn phí Vận chuyển (VC) cho các đơn hàng có giá trị trên 500.000 VND.
	- Lập luận: Đây là hạng khởi điểm, nhằm tạo động lực ban đầu cho những khách hàng đã có dấu hiệu quay lại hoặc chi tiêu ở mức cơ bản.
2. Hạng Vàng (Gold) 
	- Tiêu chí Phân hạng: Khách hàng phải đạt cả hai điều kiện: TCT >= 2,000,000 VND VÀ TSDH >= 4 đơn hàng.
	- Quyền lợi Cốt lõi: Giảm giá cố định 5% cho mọi đơn hàng, Miễn phí VC cho các đơn hàng có giá trị trên 300.000 VND, 
    và Quà tặng sinh nhật trị giá 100.000 VND.
	- Lập luận: Ngưỡng này dành cho nhóm khách hàng thân thiết cốt lõi, thường xuyên mua sắm và có tổng chi tiêu cao. 
    Các quyền lợi gia tăng giúp duy trì lòng trung thành của họ.
3. Hạng Bạch Kim (Platinum)
	- Tiêu chí Phân hạng: Khách hàng phải đạt cả hai điều kiện: TCT >= 4,000,000 VND VÀ TSDH >= 5 đơn hàng.
	- Quyền lợi Cốt lõi: Giảm giá cố định 8% cho mọi đơn hàng, Miễn phí VC MỌI đơn hàng (không giới hạn giá trị), 
    và Ưu tiên tham gia sự kiện độc quyền (ra mắt sách).
	- Lập luận: Đây là hạng cao nhất, chỉ dành cho những khách hàng VIP đóng góp doanh thu lớn nhất. Việc cung cấp
    các ưu đãi tốt nhất là chiến lược then chốt để giữ chân tuyệt đối nhóm khách hàng siêu trung thành này.
*/
