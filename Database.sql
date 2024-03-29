USE [QL_PK_NHAKHOA]
GO
/****** Object:  Table [dbo].[ctphieumuon]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ctphieumuon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpm] [nvarchar](10) NOT NULL,
	[idmathang] [nvarchar](10) NOT NULL,
	[soluong] [int] NOT NULL,
 CONSTRAINT [PK_ctphieumuon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ctphieunhap]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ctphieunhap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idpn] [nvarchar](10) NOT NULL,
	[idmathang] [nvarchar](10) NOT NULL,
	[soluong] [int] NOT NULL,
	[gia] [money] NOT NULL,
 CONSTRAINT [PK_ctphieunhap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lichsuhu]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lichsuhu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idmathang] [nvarchar](10) NOT NULL,
	[ngayhu] [date] NOT NULL,
	[soluonghu] [int] NOT NULL,
 CONSTRAINT [PK_lichsuhu_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mathang]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mathang](
	[idmathang] [nvarchar](10) NOT NULL,
	[tenmathang] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_idmathang] PRIMARY KEY CLUSTERED 
(
	[idmathang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ncc]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ncc](
	[idncc] [nvarchar](10) NOT NULL,
	[tenncc] [nvarchar](20) NOT NULL,
	[diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK_Idncc] PRIMARY KEY CLUSTERED 
(
	[idncc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[idnv] [nvarchar](10) NOT NULL,
	[ho] [nvarchar](10) NOT NULL,
	[ten] [nvarchar](10) NOT NULL,
	[gioitinh] [nvarchar](3) NOT NULL,
	[diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK_nhanvien] PRIMARY KEY CLUSTERED 
(
	[idnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanquyen]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanquyen](
	[idpq] [nvarchar](10) NOT NULL,
	[tenpq] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieumuon]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieumuon](
	[idpm] [nvarchar](10) NOT NULL,
	[ngaymuon] [date] NOT NULL,
	[idnv] [nvarchar](10) NOT NULL,
	[datra] [bit] NOT NULL,
 CONSTRAINT [PK__phieumuo__9DB7550D0A09CE93] PRIMARY KEY CLUSTERED 
(
	[idpm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieunhap]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieunhap](
	[idpn] [nvarchar](10) NOT NULL,
	[ngaynhap] [date] NOT NULL,
	[idnv] [nvarchar](10) NOT NULL,
	[idncc] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__phieunha__9DB7550E96C5EA98] PRIMARY KEY CLUSTERED 
(
	[idpn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userCH]    Script Date: 6/1/2021 11:05:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userCH](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[idpq] [nvarchar](10) NOT NULL,
	[fkidnv] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__userCH__F3DBC573B2A74768] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ctphieumuon] ON 

INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (1, N'PM1', N'MH1', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (2, N'PM1', N'MH2', 2)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (3, N'PM1', N'MH4', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (4, N'PM2', N'MH3', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (5, N'PM2', N'MH6', 2)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (6, N'PM2', N'MH5', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (7, N'PM2', N'MH4', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (8, N'PM3', N'MH4', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (9, N'PM3', N'MH6', 1)
INSERT [dbo].[ctphieumuon] ([id], [idpm], [idmathang], [soluong]) VALUES (10, N'PM3', N'MH5', 1)
SET IDENTITY_INSERT [dbo].[ctphieumuon] OFF
GO
SET IDENTITY_INSERT [dbo].[ctphieunhap] ON 

INSERT [dbo].[ctphieunhap] ([id], [idpn], [idmathang], [soluong], [gia]) VALUES (1, N'PN1', N'MH1', 10, 1000000.0000)
INSERT [dbo].[ctphieunhap] ([id], [idpn], [idmathang], [soluong], [gia]) VALUES (2, N'PN1', N'MH2', 10, 1000000.0000)
INSERT [dbo].[ctphieunhap] ([id], [idpn], [idmathang], [soluong], [gia]) VALUES (3, N'PN1', N'MH3', 10, 1000000.0000)
INSERT [dbo].[ctphieunhap] ([id], [idpn], [idmathang], [soluong], [gia]) VALUES (4, N'PN2', N'MH4', 10, 10000000.0000)
INSERT [dbo].[ctphieunhap] ([id], [idpn], [idmathang], [soluong], [gia]) VALUES (5, N'PN2', N'MH5', 10, 1000000.0000)
INSERT [dbo].[ctphieunhap] ([id], [idpn], [idmathang], [soluong], [gia]) VALUES (6, N'PN2', N'MH6', 10, 100000.0000)
SET IDENTITY_INSERT [dbo].[ctphieunhap] OFF
GO
SET IDENTITY_INSERT [dbo].[lichsuhu] ON 

INSERT [dbo].[lichsuhu] ([id], [idmathang], [ngayhu], [soluonghu]) VALUES (1, N'MH4', CAST(N'2021-05-31' AS Date), 0)
INSERT [dbo].[lichsuhu] ([id], [idmathang], [ngayhu], [soluonghu]) VALUES (2, N'MH6', CAST(N'2021-05-31' AS Date), 0)
INSERT [dbo].[lichsuhu] ([id], [idmathang], [ngayhu], [soluonghu]) VALUES (3, N'MH5', CAST(N'2021-05-31' AS Date), 1)
SET IDENTITY_INSERT [dbo].[lichsuhu] OFF
GO
INSERT [dbo].[mathang] ([idmathang], [tenmathang]) VALUES (N'MH1', N'Tay khoan')
INSERT [dbo].[mathang] ([idmathang], [tenmathang]) VALUES (N'MH2', N'Mũi khoan')
INSERT [dbo].[mathang] ([idmathang], [tenmathang]) VALUES (N'MH3', N'Máy cạo vôi răng')
INSERT [dbo].[mathang] ([idmathang], [tenmathang]) VALUES (N'MH4', N'Ghế dành cho bệnh nhân')
INSERT [dbo].[mathang] ([idmathang], [tenmathang]) VALUES (N'MH5', N'Thám trâm')
INSERT [dbo].[mathang] ([idmathang], [tenmathang]) VALUES (N'MH6', N'Gương')
GO
INSERT [dbo].[ncc] ([idncc], [tenncc], [diachi]) VALUES (N'NCC1', N' Cao Thành Lợi', N' ')
INSERT [dbo].[ncc] ([idncc], [tenncc], [diachi]) VALUES (N'NCC2', N'test', N' ')
GO
INSERT [dbo].[nhanvien] ([idnv], [ho], [ten], [gioitinh], [diachi]) VALUES (N'NV1', N'Lê', N'Đức', N'Nam', N'')
INSERT [dbo].[nhanvien] ([idnv], [ho], [ten], [gioitinh], [diachi]) VALUES (N'NV2', N'Nguyễn', N'Lộc', N'Nam', N' ')
INSERT [dbo].[nhanvien] ([idnv], [ho], [ten], [gioitinh], [diachi]) VALUES (N'NV3', N'Phạm', N'Thanh', N'Nữ', N' ')
INSERT [dbo].[nhanvien] ([idnv], [ho], [ten], [gioitinh], [diachi]) VALUES (N'NV4', N'Lưu', N'Đăng', N'Nam', N' ')
INSERT [dbo].[nhanvien] ([idnv], [ho], [ten], [gioitinh], [diachi]) VALUES (N'NV5', N'Nguyễn', N'Tuyết', N'Nữ', N' ')
INSERT [dbo].[nhanvien] ([idnv], [ho], [ten], [gioitinh], [diachi]) VALUES (N'NV6', N'Nguyễn', N'Thảo', N'Nữ', N' ')
GO
INSERT [dbo].[phanquyen] ([idpq], [tenpq]) VALUES (N'PQ1', N'Quản lý')
INSERT [dbo].[phanquyen] ([idpq], [tenpq]) VALUES (N'PQ2', N'Nhân viên')
GO
INSERT [dbo].[phieumuon] ([idpm], [ngaymuon], [idnv], [datra]) VALUES (N'PM1', CAST(N'2021-05-31' AS Date), N'NV4', 0)
INSERT [dbo].[phieumuon] ([idpm], [ngaymuon], [idnv], [datra]) VALUES (N'PM2', CAST(N'2021-05-31' AS Date), N'NV2', 0)
INSERT [dbo].[phieumuon] ([idpm], [ngaymuon], [idnv], [datra]) VALUES (N'PM3', CAST(N'2021-05-31' AS Date), N'NV1', 1)
GO
INSERT [dbo].[phieunhap] ([idpn], [ngaynhap], [idnv], [idncc]) VALUES (N'PN1', CAST(N'2021-05-31' AS Date), N'NV1', N'NCC1')
INSERT [dbo].[phieunhap] ([idpn], [ngaynhap], [idnv], [idncc]) VALUES (N'PN2', CAST(N'2021-05-31' AS Date), N'NV6', N'NCC1')
GO
INSERT [dbo].[userCH] ([username], [password], [idpq], [fkidnv]) VALUES (N'dang', N'123', N'PQ2', N'NV4')
INSERT [dbo].[userCH] ([username], [password], [idpq], [fkidnv]) VALUES (N'duc', N'admin', N'PQ1', N'NV1')
INSERT [dbo].[userCH] ([username], [password], [idpq], [fkidnv]) VALUES (N'loc', N'123', N'PQ2', N'NV2')
INSERT [dbo].[userCH] ([username], [password], [idpq], [fkidnv]) VALUES (N'thanh', N'132', N'PQ2', N'NV3')
INSERT [dbo].[userCH] ([username], [password], [idpq], [fkidnv]) VALUES (N'thao', N'123456789', N'PQ1', N'NV6')
INSERT [dbo].[userCH] ([username], [password], [idpq], [fkidnv]) VALUES (N'tuyet', N'123', N'PQ2', N'NV5')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_idpm_idMH]    Script Date: 6/1/2021 11:05:16 AM ******/
ALTER TABLE [dbo].[ctphieumuon] ADD  CONSTRAINT [UK_idpm_idMH] UNIQUE NONCLUSTERED 
(
	[idpm] ASC,
	[idmathang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_idpn_idMH]    Script Date: 6/1/2021 11:05:16 AM ******/
ALTER TABLE [dbo].[ctphieunhap] ADD  CONSTRAINT [UK_idpn_idMH] UNIQUE NONCLUSTERED 
(
	[idpn] ASC,
	[idmathang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_idMH_ngayhu]    Script Date: 6/1/2021 11:05:16 AM ******/
ALTER TABLE [dbo].[lichsuhu] ADD  CONSTRAINT [UK_idMH_ngayhu] UNIQUE NONCLUSTERED 
(
	[idmathang] ASC,
	[ngayhu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_username]    Script Date: 6/1/2021 11:05:16 AM ******/
ALTER TABLE [dbo].[nhanvien] ADD  CONSTRAINT [UK_username] UNIQUE NONCLUSTERED 
(
	[idnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_idnv]    Script Date: 6/1/2021 11:05:16 AM ******/
ALTER TABLE [dbo].[userCH] ADD  CONSTRAINT [UK_idnv] UNIQUE NONCLUSTERED 
(
	[fkidnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ncc] ADD  DEFAULT (' ') FOR [diachi]
GO
ALTER TABLE [dbo].[nhanvien] ADD  CONSTRAINT [DF__nhanvien__diachi__34C8D9D1]  DEFAULT (' ') FOR [diachi]
GO
ALTER TABLE [dbo].[ctphieumuon]  WITH CHECK ADD  CONSTRAINT [FK_ctphieumuon_mathang] FOREIGN KEY([idmathang])
REFERENCES [dbo].[mathang] ([idmathang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ctphieumuon] CHECK CONSTRAINT [FK_ctphieumuon_mathang]
GO
ALTER TABLE [dbo].[ctphieumuon]  WITH CHECK ADD  CONSTRAINT [FK_ctphieumuon_phieumuon] FOREIGN KEY([idpm])
REFERENCES [dbo].[phieumuon] ([idpm])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ctphieumuon] CHECK CONSTRAINT [FK_ctphieumuon_phieumuon]
GO
ALTER TABLE [dbo].[ctphieunhap]  WITH CHECK ADD  CONSTRAINT [FK_ctphieunhap_mathang] FOREIGN KEY([idmathang])
REFERENCES [dbo].[mathang] ([idmathang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ctphieunhap] CHECK CONSTRAINT [FK_ctphieunhap_mathang]
GO
ALTER TABLE [dbo].[ctphieunhap]  WITH CHECK ADD  CONSTRAINT [FK_ctphieunhap_phieunhap] FOREIGN KEY([idpn])
REFERENCES [dbo].[phieunhap] ([idpn])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ctphieunhap] CHECK CONSTRAINT [FK_ctphieunhap_phieunhap]
GO
ALTER TABLE [dbo].[lichsuhu]  WITH CHECK ADD  CONSTRAINT [FK_lichsuhu_mathang] FOREIGN KEY([idmathang])
REFERENCES [dbo].[mathang] ([idmathang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lichsuhu] CHECK CONSTRAINT [FK_lichsuhu_mathang]
GO
ALTER TABLE [dbo].[phieumuon]  WITH CHECK ADD  CONSTRAINT [FK_phieumuon_nhanvien] FOREIGN KEY([idnv])
REFERENCES [dbo].[nhanvien] ([idnv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[phieumuon] CHECK CONSTRAINT [FK_phieumuon_nhanvien]
GO
ALTER TABLE [dbo].[phieunhap]  WITH CHECK ADD  CONSTRAINT [FK_phieunhap_ncc] FOREIGN KEY([idncc])
REFERENCES [dbo].[ncc] ([idncc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[phieunhap] CHECK CONSTRAINT [FK_phieunhap_ncc]
GO
ALTER TABLE [dbo].[phieunhap]  WITH CHECK ADD  CONSTRAINT [FK_phieunhap_nhanvien] FOREIGN KEY([idnv])
REFERENCES [dbo].[nhanvien] ([idnv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[phieunhap] CHECK CONSTRAINT [FK_phieunhap_nhanvien]
GO
ALTER TABLE [dbo].[userCH]  WITH CHECK ADD  CONSTRAINT [FK__userCH__idpq__3E52440B] FOREIGN KEY([idpq])
REFERENCES [dbo].[phanquyen] ([idpq])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[userCH] CHECK CONSTRAINT [FK__userCH__idpq__3E52440B]
GO
ALTER TABLE [dbo].[userCH]  WITH CHECK ADD  CONSTRAINT [FK_userCH_nhanvien] FOREIGN KEY([fkidnv])
REFERENCES [dbo].[nhanvien] ([idnv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[userCH] CHECK CONSTRAINT [FK_userCH_nhanvien]
GO
ALTER TABLE [dbo].[ctphieumuon]  WITH CHECK ADD  CONSTRAINT [CK_ctphieumuon_soluong] CHECK  (([soluong]>(0)))
GO
ALTER TABLE [dbo].[ctphieumuon] CHECK CONSTRAINT [CK_ctphieumuon_soluong]
GO
ALTER TABLE [dbo].[ctphieunhap]  WITH CHECK ADD  CONSTRAINT [CK_ctphieunhap_gia] CHECK  (([gia]>(0)))
GO
ALTER TABLE [dbo].[ctphieunhap] CHECK CONSTRAINT [CK_ctphieunhap_gia]
GO
ALTER TABLE [dbo].[ctphieunhap]  WITH CHECK ADD  CONSTRAINT [CK_ctphieunhap_soluong] CHECK  (([soluong]>(0)))
GO
ALTER TABLE [dbo].[ctphieunhap] CHECK CONSTRAINT [CK_ctphieunhap_soluong]
GO
ALTER TABLE [dbo].[lichsuhu]  WITH CHECK ADD  CONSTRAINT [CK_ngayhu] CHECK  (([ngayhu]>'2000-1-1'))
GO
ALTER TABLE [dbo].[lichsuhu] CHECK CONSTRAINT [CK_ngayhu]
GO
ALTER TABLE [dbo].[lichsuhu]  WITH CHECK ADD  CONSTRAINT [CK_soluonghu] CHECK  (([soluonghu]>=(0)))
GO
ALTER TABLE [dbo].[lichsuhu] CHECK CONSTRAINT [CK_soluonghu]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [CK__nhanvien__gioitinh] CHECK  (([GioiTinh]=N'Nam' OR [GioiTinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [CK__nhanvien__gioitinh]
GO
ALTER TABLE [dbo].[phieumuon]  WITH CHECK ADD  CONSTRAINT [CK_phieumuon_ngaymuon] CHECK  (([ngaymuon]>'2000-1-1'))
GO
ALTER TABLE [dbo].[phieumuon] CHECK CONSTRAINT [CK_phieumuon_ngaymuon]
GO
ALTER TABLE [dbo].[phieunhap]  WITH CHECK ADD  CONSTRAINT [CK_phieunhap_ngaynhap] CHECK  (([ngaynhap]>'2000-1-1'))
GO
ALTER TABLE [dbo].[phieunhap] CHECK CONSTRAINT [CK_phieunhap_ngaynhap]
GO
