
CREATE DATABASE ShopSneaker;
GO

USE ShopSneaker;
GO

-- Bảng DanhMuc
CREATE TABLE DanhMuc (
    MaDanhMuc varchar(10) PRIMARY KEY,
    TenDanhMuc nvarchar(100)
);
GO
-- Bảng ThuongHieu
CREATE TABLE ThuongHieu (
    MaThuongHieu varchar(10) PRIMARY KEY,
    TenThuongHieu nvarchar(100)
);
GO
-- Bảng ChucVu
CREATE TABLE ChucVu (
    MaChucVu varchar(10) PRIMARY KEY,
    TenChucVu nvarchar(100)
);
GO

-- Bảng NhanVien
CREATE TABLE NhanVien (
    MaNhanVien varchar(10) PRIMARY KEY,
    HoTen nvarchar(100),
    SoDienThoai nvarchar(11),
    Email nvarchar(100),
    DiaChi nvarchar(100),
    SoCMND nvarchar(100) UNIQUE,
    MaChucVu varchar(10),
    FOREIGN KEY (MaChucVu) REFERENCES ChucVu(MaChucVu)
);
GO

-- Bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNhaCungCap varchar(25) PRIMARY KEY,
    TenNhaCungCap nvarchar(100)
);
GO

-- Bảng SanPham
-- Bảng SanPham
CREATE TABLE SanPham (
    MaSanPham varchar(10) PRIMARY KEY,
    MaDanhMuc varchar(10),
    MaNhaCungCap varchar(25),
    MaThuongHieu varchar(10),
    TenSanPham nvarchar(100),
    MoTa nvarchar(100),
    Gia decimal(18, 2) CHECK(Gia >= 0),
    TonKho int CHECK(TonKho >= 0),
    Size decimal(3, 1),
    MauSac nvarchar(50),
	HinhAnh Nvarchar(255),
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc),
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap),
    FOREIGN KEY (MaThuongHieu) REFERENCES ThuongHieu(MaThuongHieu)
);
GO


-- Bảng LoaiTaiKhoan
CREATE TABLE LoaiTaiKhoan (
    MaLoaiTaiKhoan varchar(10) PRIMARY KEY,
    TenLoaiTaiKhoan nvarchar(50)
);
GO

-- Bảng TaiKhoan
CREATE TABLE TaiKhoan (
    MaNhanVien varchar(10) UNIQUE,
    TenDangNhap nvarchar(100) PRIMARY KEY,
    MatKhau nvarchar(100) NOT NULL,
    MaLoaiTaiKhoan varchar(10),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaLoaiTaiKhoan) REFERENCES LoaiTaiKhoan(MaLoaiTaiKhoan)
);
GO

-- Bảng KhachHang
CREATE TABLE KhachHang (
    MaKhachHang varchar(10) PRIMARY KEY,
    HoTen nvarchar(100),
    SoDienThoai nvarchar(11),
    DiaChi nvarchar(100),
    Email nvarchar(100)
);
GO

-- Bảng HoaDon
CREATE TABLE HoaDon (
    MaHoaDon varchar(100) PRIMARY KEY,
    MaNhanVien varchar(10),
    MaKhachHang varchar(10),
    NgayHoaDon datetime,
    TongTien decimal CHECK(TongTien >= 0),
    TongTienSauGiamGia decimal CHECK(TongTienSauGiamGia >= 0),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);
GO

-- Bảng PhieuNhap
CREATE TABLE PhieuNhap (
    MaPhieuNhap varchar(100) PRIMARY KEY,
    MaNhanVien varchar(10),
    NgayPhieuNhap datetime,
    TongTien decimal CHECK(TongTien >= 0),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);
GO

-- Bảng ChiTietHoaDon
CREATE TABLE ChiTietHoaDon (
    MaSanPham varchar(10),
    MaHoaDon varchar(100),
    SoLuong int CHECK(SoLuong >= 0),
    Gia decimal(10,2) CHECK (Gia >= 0),
    PRIMARY KEY (MaSanPham, MaHoaDon),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon)
);
GO

-- Bảng ChiTietPhieuNhap
CREATE TABLE ChiTietPhieuNhap (
    MaSanPham varchar(10),
    MaPhieuNhap varchar(100),
    SoLuong int CHECK(SoLuong >= 0),
    GiaVon decimal CHECK(GiaVon >= 0),
    PRIMARY KEY (MaSanPham, MaPhieuNhap),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham),
    FOREIGN KEY (MaPhieuNhap) REFERENCES PhieuNhap(MaPhieuNhap)
);
GO

-- Bảng PhieuGiamGia (Voucher)
CREATE TABLE PhieuGiamGia (
    MaPhieuGiamGia varchar(20) PRIMARY KEY,
    TenPhieuGiamGia nvarchar(100),
    GiaTri decimal(5,2) CHECK(GiaTri >= 0),
    LoaiGiamGia nvarchar(10) CHECK(LoaiGiamGia IN ('TIEN', 'PERCENT')), -- TIEN = giảm theo số tiền, PERCENT = giảm theo phần trăm
    NgayBatDau datetime,
    NgayKetThuc datetime
);
GO

-- Bảng ChiTietPhieuGiamGia (Chi tiết voucher áp dụng cho đơn hàng)
CREATE TABLE ChiTietPhieuGiamGia (
    MaHoaDon varchar(100),
    MaPhieuGiamGia varchar(20),
    PRIMARY KEY (MaHoaDon, MaPhieuGiamGia),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaPhieuGiamGia) REFERENCES PhieuGiamGia(MaPhieuGiamGia)
);
GO
