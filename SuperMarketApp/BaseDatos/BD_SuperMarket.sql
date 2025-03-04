USE [SuperMarketDB]
GO
/****** Object:  Table [dbo].[Almacenes]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacenes](
	[AlmacenID] [int] IDENTITY(1,1) NOT NULL,
	[NombreAlmacen] [varchar](100) NULL,
	[Direccion] [text] NULL,
 CONSTRAINT [PK__Almacene__022A0856302E97DB] PRIMARY KEY CLUSTERED 
(
	[AlmacenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](100) NULL,
	[Descripcion] [text] NULL,
 CONSTRAINT [PK__Categori__F353C1C583F1F266] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesFactura]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesFactura](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[FacturaID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [decimal](10, 2) NULL,
	[Subtotal] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Detalles__6E19D6FA62EB5ABE] PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPedido]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPedido](
	[DetallePedidoID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioCompra] [decimal](10, 2) NULL,
	[Subtotal] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Detalles__6ED21C0187E8A243] PRIMARY KEY CLUSTERED 
(
	[DetallePedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devoluciones]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devoluciones](
	[DevolucionID] [int] IDENTITY(1,1) NOT NULL,
	[FacturaID] [int] NULL,
	[ProductoID] [int] NULL,
	[CantidadDevuelta] [int] NULL,
	[FechaDevolucion] [datetime] NULL,
	[Motivo] [text] NULL,
 CONSTRAINT [PK__Devoluci__28E7B0E7C7A321F5] PRIMARY KEY CLUSTERED 
(
	[DevolucionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[FacturaID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[UsuarioID] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[TipoVentaID] [int] NULL,
	[TotalDevoluciones] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Facturas__5C0248052A922092] PRIMARY KEY CLUSTERED 
(
	[FacturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[InventarioID] [int] IDENTITY(1,1) NOT NULL,
	[AlmacenID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NULL,
 CONSTRAINT [PK__Inventar__FB8A24B714775B9A] PRIMARY KEY CLUSTERED 
(
	[InventarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[ProveedorID] [int] NULL,
	[FechaPedido] [datetime] NULL,
	[Total] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Pedidos__09BA1410B9FAAE21] PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](100) NULL,
	[Descripcion] [text] NULL,
	[PrecioVenta] [decimal](10, 2) NULL,
	[PrecioCompra] [decimal](10, 2) NULL,
	[CantidadEnInventario] [int] NULL,
	[FechaVencimiento] [date] NULL,
	[CodigoBarras] [varchar](50) NULL,
	[CategoriaID] [int] NULL,
 CONSTRAINT [PK__Producto__A430AE830844838C] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProveedor] [varchar](100) NULL,
	[Contacto] [varchar](100) NULL,
	[Direccion] [text] NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK__Proveedo__61266BB9A09C28FC] PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NULL,
 CONSTRAINT [PK__Roles__F92302D19FC326FE] PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoVenta]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoVenta](
	[TipoVentaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoVenta] [varchar](50) NULL,
 CONSTRAINT [PK__TipoVent__8A3EF34E2E1DBEB6] PRIMARY KEY CLUSTERED 
(
	[TipoVentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/02/2025 5:20:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Contrasena] [varchar](100) NULL,
	[RolID] [int] NULL,
	[UsuarioLogin] [varchar](max) NULL,
 CONSTRAINT [PK__Usuarios__2B3DE79807733E4D] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([CategoriaID], [NombreCategoria], [Descripcion]) VALUES (1, N'Generico', N'Generico')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [Descripcion], [PrecioVenta], [PrecioCompra], [CantidadEnInventario], [FechaVencimiento], [CodigoBarras], [CategoriaID]) VALUES (1, N'Pan', N'Pan', CAST(100.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 2, CAST(N'2025-02-20' AS Date), N'123456789', 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [Descripcion], [PrecioVenta], [PrecioCompra], [CantidadEnInventario], [FechaVencimiento], [CodigoBarras], [CategoriaID]) VALUES (2, N'Leche', N'Leche', CAST(100.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 3, CAST(N'2025-02-20' AS Date), N'95959578995959', 1)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RolID], [NombreRol]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([RolID], [NombreRol]) VALUES (2, N'Cajero')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Contrasena], [RolID], [UsuarioLogin]) VALUES (1, N'John Rodriguez', N'Joerodriguezsa@gmail.com', N'$2a$11$O2w05DcZKwDPhiR40RKkI.sNChrxp1jq4MywZSS1eed2J3OUSH5S2', 1, N'101010')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Contrasena], [RolID], [UsuarioLogin]) VALUES (2, N'Cajero 1', N'Cajero@gmail.com', N'$2a$11$O2w05DcZKwDPhiR40RKkI.sNChrxp1jq4MywZSS1eed2J3OUSH5S2', 2, N'111111')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [Correo], [Contrasena], [RolID], [UsuarioLogin]) VALUES (3, N'John Rodriguez', N'Joerodriguezsa@gmail.com', N'$2a$11$O2w05DcZKwDPhiR40RKkI.sNChrxp1jq4MywZSS1eed2J3OUSH5S2', 1, N'131313')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Facturas] ADD  CONSTRAINT [DF__Facturas__TotalD__31EC6D26]  DEFAULT ((0)) FOR [TotalDevoluciones]
GO
ALTER TABLE [dbo].[DetallesFactura]  WITH CHECK ADD  CONSTRAINT [FK__DetallesF__Factu__36B12243] FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([FacturaID])
GO
ALTER TABLE [dbo].[DetallesFactura] CHECK CONSTRAINT [FK__DetallesF__Factu__36B12243]
GO
ALTER TABLE [dbo].[DetallesFactura]  WITH CHECK ADD  CONSTRAINT [FK__DetallesF__Produ__37A5467C] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[DetallesFactura] CHECK CONSTRAINT [FK__DetallesF__Produ__37A5467C]
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK__DetallesP__Pedid__3D5E1FD2] FOREIGN KEY([PedidoID])
REFERENCES [dbo].[Pedidos] ([PedidoID])
GO
ALTER TABLE [dbo].[DetallesPedido] CHECK CONSTRAINT [FK__DetallesP__Pedid__3D5E1FD2]
GO
ALTER TABLE [dbo].[DetallesPedido]  WITH CHECK ADD  CONSTRAINT [FK__DetallesP__Produ__3E52440B] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[DetallesPedido] CHECK CONSTRAINT [FK__DetallesP__Produ__3E52440B]
GO
ALTER TABLE [dbo].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK__Devolucio__Factu__46E78A0C] FOREIGN KEY([FacturaID])
REFERENCES [dbo].[Facturas] ([FacturaID])
GO
ALTER TABLE [dbo].[Devoluciones] CHECK CONSTRAINT [FK__Devolucio__Factu__46E78A0C]
GO
ALTER TABLE [dbo].[Devoluciones]  WITH CHECK ADD  CONSTRAINT [FK__Devolucio__Produ__47DBAE45] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[Devoluciones] CHECK CONSTRAINT [FK__Devolucio__Produ__47DBAE45]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK__Facturas__TipoVe__33D4B598] FOREIGN KEY([TipoVentaID])
REFERENCES [dbo].[TipoVenta] ([TipoVentaID])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK__Facturas__TipoVe__33D4B598]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK__Facturas__Usuari__32E0915F] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK__Facturas__Usuari__32E0915F]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK__Inventari__Almac__4316F928] FOREIGN KEY([AlmacenID])
REFERENCES [dbo].[Almacenes] ([AlmacenID])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK__Inventari__Almac__4316F928]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK__Inventari__Produ__440B1D61] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK__Inventari__Produ__440B1D61]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK__Pedidos__Proveed__3A81B327] FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[Proveedores] ([ProveedorID])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK__Pedidos__Proveed__3A81B327]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK__Productos__Categ__2D27B809] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categorias] ([CategoriaID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK__Productos__Categ__2D27B809]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK__Usuarios__RolID__267ABA7A] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roles] ([RolID])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK__Usuarios__RolID__267ABA7A]
GO
