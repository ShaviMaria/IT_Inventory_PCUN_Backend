#This is the sql database

CREATE DATABASE IF NOT EXISTS IT_Inventory;

USE IT_Inventory;

CREATE TABLE IF NOT EXISTS Property(
    Id_Property BIGINT UNSIGNED AUTO_INCREMENT,
    Property_Code VARCHAR(50) UNIQUE NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    PRIMARY KEY(Id_Property)
);

CREATE TABLE IF NOT EXISTS Departament(
    Id_Departament BIGINT UNSIGNED AUTO_INCREMENT,
    Departament VARCHAR(50) NOT NULL,
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Departament),
    CONSTRAINT Property_FK_Departament
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Google_Account(
    Id_Google_Account BIGINT UNSIGNED AUTO_INCREMENT,
    Google_Account VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Email_Recovery VARCHAR(50),
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Google_Account),
    CONSTRAINT Property_FK_Google_Account
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone_Line(
    Id_Phone_Line BIGINT UNSIGNED AUTO_INCREMENT,
    Phone_Company VARCHAR(50) NOT NULL,
    Phone_Number VARCHAR(12) NOT NULL UNIQUE,
    SIM_Code VARCHAR(30) UNIQUE,
    PRIMARY KEY(Id_Phone_Line)
);

CREATE TABLE IF NOT EXISTS Join_Google_Account_Phone_Line(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Google_Account BIGINT UNSIGNED NOT NULL,
    Id_Phone_Line BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Google_Account_FK_Join_Google_Account_Phone_Line
    FOREIGN KEY(Id_Google_Account) REFERENCES Google_Account(Id_Google_Account) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Phone_Line_FK_Join_Google_Account_Phone_Line
    FOREIGN KEY(Id_Phone_Line) REFERENCES Phone_Line(Id_Phone_Line) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Apple_ID(
    Id_Apple_ID BIGINT UNSIGNED AUTO_INCREMENT,
    Apple_ID VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Secret_Question_1 VARCHAR(100),
    Secret_Question_1_Password VARCHAR(50),
    Secret_Question_2 VARCHAR(100),
    Secret_Question_2_Password VARCHAR(50),
    Secret_Question_3 VARCHAR(100),
    Secret_Question_3_Password VARCHAR(50),
    Property BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Apple_ID),
    CONSTRAINT Property_FK_Apple_ID
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Apple_ID_Phone_Line(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Apple_ID BIGINT UNSIGNED NOT NULL,
    Id_Phone_Line BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Apple_ID_FK_Join_Apple_ID_Phone_Line
    FOREIGN KEY(Id_Apple_ID) REFERENCES Apple_ID(Id_Apple_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Phone_Line_FK_Join_Apple_ID_Phone_Line
    FOREIGN KEY(Id_Phone_Line) REFERENCES Phone_Line(Id_Phone_Line) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TradeMark(
    Id_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY(Id_TradeMark)
);

CREATE TABLE IF NOT EXISTS Operating_System_TradeMark(
    Id_Operating_System_Trademark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Operating_System_Trademark),
    CONSTRAINT TradeMark_FK_Operating_System_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS UPS_TradeMark(
    Id_UPS_Trademark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_UPS_Trademark),
    CONSTRAINT TradeMark_FK_UPS_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Monitor_TradeMark(
    Id_Monitor_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Monitor_Trademark),
    CONSTRAINT TradeMark_FK_Monitor_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CPU_TradeMark(
    Id_CPU_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_CPU_Trademark),
    CONSTRAINT TradeMark_FK_CPU_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Cell_Phone_TradeMark(
    Id_Cell_Phone_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Cell_Phone_Trademark),
    CONSTRAINT TradeMark_FK_Cell_Phone_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Tablet_TradeMark(
    Id_Tablet_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Tablet_Trademark),
    CONSTRAINT TradeMark_FK_Tablet_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone_TradeMark(
    Id_Phone_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Phone_Trademark),
    CONSTRAINT TradeMark_FK_Phone_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PC_TradeMark(
    Id_PC_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_PC_Trademark),
    CONSTRAINT TradeMark_FK_PC_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Printer_TradeMark(
    Id_Printer_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Printer_Trademark),
    CONSTRAINT TradeMark_FK_PC_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Switch_TradeMark(
    Id_Switch_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Switch_Trademark),
    CONSTRAINT TradeMark_FK_Switch_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Router_TradeMark(
    Id_Router_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Router_Trademark),
    CONSTRAINT TradeMark_FK_Router_TradeMark
    FOREIGN KEY(TradeMark) REFERENCES TradeMark(Id_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Model(
    Id_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(Id_Model)
);

CREATE TABLE IF NOT EXISTS UPS_Model(
    Id_UPS_Model BIGINT UNSIGNED AUTO_INCREMENT,
    VA VARCHAR(5),
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_UPS_Model)
    CONSTRAINT Model_FK_UPS_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_UPS_Model
    FOREIGN KEY(TradeMark) REFERENCES UPS_TradeMark(Id_UPS_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Monitor_Model(
    Id_Monitor_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Refresh_Rate VARCHAR(10),
    Size VARCHAR(20) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Monitor_Model)
    CONSTRAINT Model_FK_Monitor_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Monitor_Model
    FOREIGN KEY(TradeMark) REFERENCES Monitor_TradeMark(Id_Monitor_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CPU_Model(
    Id_CPU_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Speed VARCHAR(5) NOT NULL,
    Generation INT NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_CPU_Model)
    CONSTRAINT Model_FK_CPU_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_CPU_Model
    FOREIGN KEY(TradeMark) REFERENCES CPU_TradeMark(Id_CPU_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Router_Model(
    Id_Router_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Speed VARCHAR(5) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Router_Model)
    CONSTRAINT Model_FK_Router_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Router_Model
    FOREIGN KEY(TradeMark) REFERENCES Router_TradeMark(Id_Router_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Switch_Model(
    Id_Switch_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Speed VARCHAR(5) NOT NULL,
    Manageable INT(1) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Switch_Model)
    CONSTRAINT Model_FK_Switch_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Switch_Model
    FOREIGN KEY(TradeMark) REFERENCES Switch_TradeMark(Id_Switch_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Printer_Model(
    Id_Printer_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Type VARCHAR(10) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Printer_Model)
    CONSTRAINT Model_FK_Printer_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Printer_Model
    FOREIGN KEY(TradeMark) REFERENCES Printer_TradeMark(Id_Printer_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PC_Model(
    Id_PC_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Type VARCHAR(10) NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_PC_Model)
    CONSTRAINT Model_FK_PC_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_PC_Model
    FOREIGN KEY(TradeMark) REFERENCES PC_TradeMark(Id_PC_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone_Model(
    Id_Phone_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Phone_Model)
    CONSTRAINT Model_FK_Phone_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Phone_Model
    FOREIGN KEY(TradeMark) REFERENCES Phone_TradeMark(Id_Phone_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Tablet_Model(
    Id_Tablet_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Tablet_Model)
    CONSTRAINT Model_FK_Tablet_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Tablet_Model
    FOREIGN KEY(TradeMark) REFERENCES Tablet_TradeMark(Id_Tablet_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Cell_Phone_Model(
    Id_Cell_Phone_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Cell_Phone_Model)
    CONSTRAINT Model_FK_Cell_Phone_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT TradeMark_FK_Cell_Phone_Model
    FOREIGN KEY(TradeMark) REFERENCES Cell_Phone_TradeMark(Id_Cell_Phone_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS HostName(
    Id_HostName BIGINT UNSIGNED AUTO_INCREMENT,
    HostName VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(10) NOT NULL,
    PRIMARY KEY(Id_HostName)
);

CREATE TABLE IF NOT EXISTS Operating_System(
    Id_Operating_System BIGINT UNSIGNED AUTO_INCREMENT,
    Operating_System VARCHAR(20) NOT NULL UNIQUE,
    Architecture VARCHAR(10) NOT NULL,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Operating_System),
    CONSTRAINT Operating_System_TradeMark_FK_Operating_System
    FOREIGN KEY(TradeMark) REFERENCES Operating_System_TradeMark(Id_Operating_System_Trademark) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS IP_Address(
    Id_IP_Address BIGINT UNSIGNED AUTO_INCREMENT,
    IP_Address VARCHAR(20) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    PRIMARY KEY(Id_IP_Address)
);

CREATE TABLE IF NOT EXISTS Network(
    Id_Network BIGINT UNSIGNED AUTO_INCREMENT,
    Name VARCHAR(20) NOT NULL,
    Subnet_Mask VARCHAR(15) NOT NULL,
    DHCP INT NOT NULL,
    DHCP_Server BIGINT UNSIGNED,
    IP_Address BIGINT UNSIGNED NOT NULL,
    Broadcast BIGINT UNSIGNED NOT NULL,
    Gateway BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Network),
    CONSTRAINT IP_Address_FK_Network_1
    FOREIGN KEY(DHCP_Server) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT IP_Address_FK_Network_2
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT IP_Address_FK_Network_3
    FOREIGN KEY(Broadcast) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT IP_Address_FK_Network_4
    FOREIGN KEY(Gateway) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE
);