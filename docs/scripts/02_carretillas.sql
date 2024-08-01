CREATE TABLE
    `products` (
        `productId` int(11) NOT NULL AUTO_INCREMENT,
        `productName` varchar(255) NOT NULL,
        `productDescription` text NOT NULL,
        `productPrice` decimal(10, 2) NOT NULL,
        `productImgUrl` varchar(255) NOT NULL,
        `productStock` int(11) NOT NULL DEFAULT 0,
        `productStatus` char(3) NOT NULL,
        PRIMARY KEY (`productId`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `carretilla` (
        `usercod` BIGINT(10) NOT NULL,
        `productId` int(11) NOT NULL,
        `crrctd` INT(5) NOT NULL,
        `crrprc` DECIMAL(12, 2) NOT NULL,
        `crrfching` DATETIME NOT NULL,
        PRIMARY KEY (`usercod`, `productId`),
        INDEX `productId_idx` (`productId` ASC),
        CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE TABLE
    `carretillaanon` (
        `anoncod` varchar(128) NOT NULL,
        `productId` bigint(18) NOT NULL,
        `crrctd` int(5) NOT NULL,
        `crrprc` decimal(12, 2) NOT NULL,
        `crrfching` datetime NOT NULL,
        PRIMARY KEY (`anoncod`, `productId`),
        KEY `productId_idx` (`productId`),
        CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

use grupo3;

    INSERT INTO `products` (`productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStock`, `productStatus`) VALUES
('Cien Años de Soledad', 'Una obra maestra de Gabriel García Márquez que relata la historia de la familia Buendía a lo largo de varias generaciones en el pueblo ficticio de Macondo.', 15.99, 'https://images-na.ssl-images-amazon.com/images/I/91ZPbUswKaL.jpg', 10, 'ACT'),
('El Quijote de la Mancha', 'La famosa novela de Miguel de Cervantes que narra las aventuras de Don Quijote y su fiel escudero Sancho Panza.', 12.99, 'https://images-na.ssl-images-amazon.com/images/I/81dAIbT-ZmL.jpg', 8, 'ACT'),
('1984', 'Una novela distópica escrita por George Orwell que presenta un mundo totalitario bajo la constante vigilancia del Gran Hermano.', 14.50, 'https://images-na.ssl-images-amazon.com/images/I/81t2CVWEsUL.jpg', 5, 'ACT'),
('Matar a un Ruiseñor', 'Un clásico de la literatura estadounidense escrito por Harper Lee, que aborda temas de racismo y justicia en el sur de Estados Unidos.', 13.75, 'https://images-na.ssl-images-amazon.com/images/I/81OdwZG5F3L.jpg', 7, 'ACT'),
('Orgullo y Prejuicio', 'Una novela de Jane Austen que trata sobre las complejidades de las relaciones humanas y las diferencias de clase en la sociedad inglesa del siglo XIX.', 11.25, 'https://images-na.ssl-images-amazon.com/images/I/91HHqVTAJDL.jpg', 6, 'ACT'),
('El Principito', 'Una obra escrita por Antoine de Saint-Exupéry que cuenta la historia de un pequeño príncipe que viaja de planeta en planeta en busca de sabiduría.', 10.99, 'https://images-na.ssl-images-amazon.com/images/I/81UHB7MoIZL.jpg', 12, 'ACT'),
('El Señor de los Anillos: La Comunidad del Anillo', 'La primera parte de la épica trilogía de J.R.R. Tolkien, donde un joven hobbit llamado Frodo emprende una misión para destruir un poderoso anillo.', 18.99, 'https://images-na.ssl-images-amazon.com/images/I/91b0C2YNSrL.jpg', 9, 'ACT'),
('Crimen y Castigo', 'Una novela de Fyodor Dostoevsky que explora la moralidad y la psicología del crimen a través de la historia del joven estudiante Raskolnikov.', 16.50, 'https://images-na.ssl-images-amazon.com/images/I/81-WcvFBWML.jpg', 4, 'ACT');