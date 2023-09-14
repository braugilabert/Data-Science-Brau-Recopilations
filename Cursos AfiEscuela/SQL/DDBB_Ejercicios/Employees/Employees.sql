USE [EMPLOYEES]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[empleado] (
    [id_empleado]			[int]             NOT NULL,
    [fecha_nacimiento]	[date]            NOT NULL,
    [nombre]				[varchar](14)     NOT NULL,
    [apellido]			[varchar](16)     NOT NULL,
    [genero]				[char](1)  NOT NULL,
    [fecha_contrato]		[date]            NOT NULL,
    CONSTRAINT [PK_Empleados] PRIMARY KEY NONCLUSTERED (id_empleado) 
);


CREATE TABLE [dbo].[departamento] (
    [id_departamento]			[char](4)         NOT NULL,
    [nombre_departamento]		[varchar](40)     NOT NULL UNIQUE,
    CONSTRAINT [PK_Departamento] PRIMARY KEY NONCLUSTERED (id_departamento),
);


CREATE TABLE [dbo].[departamento_empleado] (
    [id_empleado]			[int]         NOT NULL,
    [id_departamento]		[char](4)     NOT NULL,
    [fecha_inicio]		[date]        NOT NULL,
    [fecha_fin]			[date],

    CONSTRAINT [FK_DepEmpleado_Empleado] FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    CONSTRAINT [FK_DepEmpleado_DEP] FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento) ON DELETE CASCADE,
    CONSTRAINT [PK_DepEmpleado] PRIMARY KEY (id_empleado, id_departamento, fecha_inicio)
);


CREATE TABLE [dbo].[responsable_departamento] (
   [id_departamento]	[char](4)  NOT NULL,
   [id_empleado]      [int]      NOT NULL,
   [fecha_inicio]		[date]     NOT NULL,
   [fecha_fin]		[date],
   CONSTRAINT [FK_Resp_Empleado] FOREIGN KEY (id_empleado)  REFERENCES empleado(id_empleado)    ON DELETE CASCADE,
   CONSTRAINT [FK_Resp_Dep] FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento) ON DELETE CASCADE,
   CONSTRAINT [PK_Resp] PRIMARY KEY (id_empleado, id_departamento, fecha_inicio)
);


CREATE TABLE [dbo].[titulo] (
    [id_empleado]      [int]          NOT NULL,
    [titulo]       [varchar](50)  NOT NULL,
    [fecha_inicio]   [date]         NOT NULL,
    [fecha_fin]     [date],
    CONSTRAINT [FK_Titulo_Empleado] FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    CONSTRAINT [PK_Titulo] PRIMARY KEY (id_empleado, titulo, fecha_inicio)
);


CREATE TABLE [dbo].[salario] (
    [id_empleado]     [int]    NOT NULL,
    [salario]			[int]    NOT NULL,
    [fecha_inicio]	[date]   NOT NULL,
    [fecha_fin]		[date],
    CONSTRAINT [FK_Salario_Empleado] FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    CONSTRAINT [PK_Salario] PRIMARY KEY (id_empleado, fecha_inicio)
);


INSERT INTO empleado VALUES (1, '1956-03-19', 'Pilar', 'Lujan', 'F', '1989-04-15');
	
INSERT INTO empleado VALUES(2, '1988-11-17', 'Rocio', 'Alvarado', 'F', '2013-03-11');
	
INSERT INTO empleado VALUES(3, '1988-11-17', 'Estrella', 'Serrano', 'F', '2013-03-11');
	
INSERT INTO empleado VALUES(4, '1956-01-07', 'Maria', 'Solano', 'F', '1999-05-27');
	
INSERT INTO empleado VALUES(5, '1982-06-09', 'Julia', 'Rodriguez', 'F', '2009-07-07');
	
INSERT INTO empleado VALUES(6, '1980-12-15', 'Carlos', 'Flores', 'M', '2006-02-05');
	
INSERT INTO empleado VALUES(7, '1969-01-30', 'Jesus', 'Zaragoza', 'M', '1997-04-19');
	
INSERT INTO empleado VALUES(8, '1990-06-29', 'Pedro', 'Cortus', 'M', '2010-09-21');
	
INSERT INTO empleado VALUES(9, '1974-07-24', 'Alejandro', 'Rico', 'M', '2004-11-09');
	
INSERT INTO empleado VALUES(10, '1955-09-06', 'Armando', 'Marrero', 'M', '1995-04-01');

INSERT INTO empleado VALUES(11, '1966-05-06', 'Pilar', 'Perez', 'F', '1985-04-01');


INSERT INTO departamento VALUES('d001', 'Administracion');
	
INSERT INTO departamento VALUES('d002', 'Compras');
	
INSERT INTO departamento VALUES('d003', 'Recursos humanos');
	
INSERT INTO departamento VALUES('d004', 'Direccion');
	
	
INSERT INTO departamento_empleado VALUES(1, 'd001', '1989-04-15', NULL);
	
INSERT INTO departamento_empleado VALUES(2, 'd001', '2013-03-11', NULL);
	
INSERT INTO departamento_empleado VALUES(3, 'd004', '2013-03-11', NULL);
	
INSERT INTO departamento_empleado VALUES(4, 'd002', '1999-05-27', NULL);
	
INSERT INTO departamento_empleado VALUES(5, 'd002', '2009-07-07', NULL);
	
INSERT INTO departamento_empleado VALUES(6, 'd003', '2006-02-05', NULL);
	
INSERT INTO departamento_empleado VALUES(7, 'd001', '1997-04-19', '2009-09-01');
	
INSERT INTO departamento_empleado VALUES(8, 'd003', '2010-09-21', NULL);
	
INSERT INTO departamento_empleado VALUES(9, 'd004', '2004-11-09', NULL);
	
INSERT INTO departamento_empleado VALUES(10, 'd004', '1995-04-01', NULL);

INSERT INTO departamento_empleado VALUES(11, 'd004', '1985-04-01', NULL);


INSERT INTO responsable_departamento VALUES('d001', 7, '1997-04-19', '2009-09-01');

INSERT INTO responsable_departamento VALUES('d001', 1, '2009-09-01', NULL);
	
INSERT INTO responsable_departamento VALUES('d002', 1, '1999-05-27', NULL);
	
INSERT INTO responsable_departamento VALUES('d003', 1, '2013-03-11', NULL);
	
INSERT INTO responsable_departamento VALUES('d004', 1, '2004-11-09', NULL);


INSERT INTO titulo VALUES(1, 'Administrativo', '1989-04-15', '2009-09-01');
	
INSERT INTO titulo VALUES(1, 'Director de administracion', '2009-09-01', NULL);
	
INSERT INTO titulo VALUES(2, 'Auxiliar administrativo', '2013-03-11', NULL);
	
INSERT INTO titulo VALUES(3, 'Director general', '2013-03-11', NULL);
	
INSERT INTO titulo VALUES(4, 'Responsable de compras', '1999-05-27', NULL);
	
INSERT INTO titulo VALUES(5, 'Auxiliar administrativo', '2009-07-07', NULL);
	
INSERT INTO titulo VALUES(6, 'Responsable de contrataciones', '2006-02-05', NULL);
	
INSERT INTO titulo VALUES(7, 'Director de administracion', '1997-04-19', '2009-09-01');
	
INSERT INTO titulo VALUES(8, 'Auxiliar administrativo', '2010-09-21', NULL);
	
INSERT INTO titulo VALUES(9, 'Secretaria', '2004-11-09', NULL);
	
INSERT INTO titulo VALUES(10, 'Subdirector general', '1995-04-01', NULL);

INSERT INTO titulo VALUES(11, 'Vicepresidente Ejecutivo', '1985-04-01', NULL);
	

INSERT INTO salario VALUES(1, 30000, '1989-04-15', '2009-09-01');
	
INSERT INTO salario VALUES(1, 45000, '2009-09-01', NULL);
	
INSERT INTO salario VALUES(2, 20000, '2009-09-01', NULL);
	
INSERT INTO salario VALUES(3, 60000, '2013-03-11', NULL);
	
INSERT INTO salario VALUES(4, 40000, '1999-05-27', NULL);
	
INSERT INTO salario VALUES(5, 18000, '2009-07-07', NULL);
	
INSERT INTO salario VALUES(6, 40000, '2006-02-05', NULL);
	
INSERT INTO salario VALUES(7, 50000, '1997-04-19', '2009-09-01');
	
INSERT INTO salario VALUES(8, 20000, '2010-09-21', NULL);
	
INSERT INTO salario VALUES(9, 35000, '2004-11-09', NULL);
	
INSERT INTO salario VALUES(10, 55000, '1995-04-01', NULL);

INSERT INTO salario VALUES(11, 75000, '1985-04-01', NULL);

GO