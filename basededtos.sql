CREATE DATABASE `sistemaalmacen` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(5) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `cliente` (
  `idCliente` varchar(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Tipodecliente` varchar(10) NOT NULL,
  `Telefono` char(9) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `detalledeventa` (
  `idDetalledeventa` int NOT NULL,
  `idVenta` int NOT NULL,
  `idProducto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`idDetalledeventa`),
  KEY `idVenta` (`idVenta`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `detalledeventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idventa`),
  CONSTRAINT `detalledeventa_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `marca` (
  `idmarca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(5) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `idcategoria` int NOT NULL,
  `idmarca` int NOT NULL,
  `idtipo` int NOT NULL,
  `idproveedor` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `preciocompra` decimal(10,2) NOT NULL,
  `precioventa` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `producto_ibfk_1` (`idcategoria`),
  KEY `producto_ibfk_2` (`idmarca`),
  KEY `producto_ibfk_3` (`idtipo`),
  KEY `producto_ibfk_4` (`idproveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`idtipo`),
  CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL AUTO_INCREMENT,
  `ruc` char(11) NOT NULL,
  `razonsocial` varchar(50) NOT NULL,
  `telefono` char(9) NOT NULL,
  `estado` varchar(5) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `tipo` (
  `idtipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(5) NOT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
CREATE TABLE `usuario` (
  `idUsuario` char(8) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Contraseña` varchar(32) NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `venta` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(50) NOT NULL,
  `idproducto` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `igv` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `producto_idx` (`idproducto`),
  CONSTRAINT `producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
