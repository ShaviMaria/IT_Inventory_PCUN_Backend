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

CREATE TABLE IF NOT EXISTS Server_TradeMark(
    Id_Server_TradeMark BIGINT UNSIGNED AUTO_INCREMENT,
    TradeMark BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Server_TradeMark),
    CONSTRAINT TradeMark_FK_Server_TradeMark
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

CREATE TABLE IF NOT EXISTS Server_Model(
    Id_Server_Model BIGINT UNSIGNED AUTO_INCREMENT,
    Model BIGINT UNSIGNED NOT NULL,
    TradeMark BIGINT UNSIGNED,
    PRIMARY KEY(Id_Server_Model),
    CONSTRAINT Model_FK_Server_Model
    FOREIGN KEY(Model) REFERENCES Model(Id_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Server_TradeMark_FK_Server_Model
    FOREIGN KEY(TradeMark) REFERENCES Server_TradeMark(Id_Server_TradeMark) ON UPDATE CASCADE ON DELETE CASCADE
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

ALTER TABLE IP_Address ADD COLUMN Network BIGINT UNSIGNED NOT NULL,
ADD CONSTRAINT Network_FK_IP_Address FOREIGN KEY(IP_Address) REFERENCES Network(Id_Network) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS UPS(
    Id_UPS BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_UPS),
    CONSTRAINT Property_FK_UPS
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT UPS_Model_FK_UPS
    FOREIGN KEY(Model) REFERENCES UPS_Model(Id_UPS_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS User(
    Id_User BIGINT UNSIGNED AUTO_INCREMENT,
    Employee_Number VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    First_Surname VARCHAR(50) NOT NULL,
    Second_Surname VARCHAR(50) NOT NULL,
    Job VARCHAR(50),
    Email VARCHAR(50),
    Generic_Email VARCHAR(50),
    Windows_User VARCHAR(15),
    Windows_Password VARCHAR(50),
    Have_SAP_Password INT(1),
    SAP_Password VARCHAR(50),
    Domain_User VARCHAR(20),
    Domain_Password VARCHAR(50),
    Status VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Note_3 VARCHAR(100),
    UPS BIGINT UNSIGNED,
    Departament BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_User),
    CONSTRAINT UPS_FK_User
    FOREIGN KEY(UPS) REFERENCES UPS(Id_UPS) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Departament_FK_User
    FOREIGN KEY(Departament) REFERENCES Departament(Id_Departament) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Cell_Phone(
    Id_Cell_Phone BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) UNIQUE,
    Imei_1 VARCHAR(50) NOT NULL UNIQUE,
    Imei_2 VARCHAR(50) UNIQUE,
    Storage_Capacity VARCHAR(10),
    Platformed INT(1),
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Status VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL,
    Property BIGINT UNSIGNED NOT NULL,
    User BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    Apple_ID BIGINT UNSIGNED,
    PRIMARY KEY(Id_Cell_Phone),
    CONSTRAINT Property_FK_Cell_Phone
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT User_FK_Cell_Phone
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Model_FK_Cell_Phone
    FOREIGN KEY(Model) REFERENCES Cell_Phone_Model(Id_Cell_Phone_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Apple_ID_FK_Cell_Phone
    FOREIGN KEY(Apple_ID) REFERENCES Apple_ID(Id_Apple_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Tablet(
    Id_Tablet BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Storage_Capacity VARCHAR(10),
    Platformed INT(1),
    Status VARCHAR(10) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Property BIGINT UNSIGNED NOT NULL,
    User BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    Apple_ID BIGINT UNSIGNED,
    PRIMARY KEY(Id_Tablet),
    CONSTRAINT Property_FK_Tablet
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT User_FK_Tablet
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Model_FK_Tablet
    FOREIGN KEY(Model) REFERENCES Cell_Tablet_Model(Id_Tablet_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Apple_ID_FK_Tablet
    FOREIGN KEY(Apple_ID) REFERENCES Apple_ID(Id_Apple_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Phone(
    Id_Phone BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Type VARCHAR(20) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Registration_Date DATE NOT NULL,
    Property BIGINT UNSIGNED NOT NULL,
    User BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Phone),
    CONSTRAINT Property_FK_Phone
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT User_FK_Phone
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Model_FK_Phone
    FOREIGN KEY(Model) REFERENCES Phone_Model(Id_Phone_Model) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE IF NOT EXISTS PC(
    Id_PC BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) UNIQUE,
    Type VARCHAR(20) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    RAM_Capacity INT(3),
    Type_Storage VARCHAR(5),
    Storage_Capacity INT(6),
    Platformed INT(1) NOT NULL,
    Registration_Date DATE NOT NULL,
    Warranty_Status VARCHAR(10),
    Warranty_Start DATE,
    Warranty_Expiration DATE,
    Property BIGINT UNSIGNED NOT NULL,
    HostName BIGINT UNSIGNED,
    CPU BIGINT UNSIGNED NOT NULL,
    IP_Address BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_PC),
    CONSTRAINT Property_FK_PC
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT HostName_FK_PC
    FOREIGN KEY(HostName) REFERENCES HostName(Id_HostName) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT CPU_Model_FK_PC
    FOREIGN KEY(CPU) REFERENCES CPU_Model(Id_CPU_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT IP_Address_FK_PC
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PC_Model_FK_PC
    FOREIGN KEY(Model) REFERENCES PC_Model(Id_PC_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Operating_System_PC(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Operating_System BIGINT UNSIGNED NOT NULL,
    Id_PC BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Operating_System_FK_Join_Operating_System_PC
    FOREIGN KEY(Id_Operating_System) REFERENCES Operating_System(Id_Operating_System) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PC_FK_Join_Operating_System_PC
    FOREIGN KEY(Id_PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Printer(
    Id_Printer BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Connection_Type VARCHAR(10),
    Modality VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    IP_Address BIGINT UNSIGNED UNIQUE,
    Property BIGINT UNSIGNED,
    Departament BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL
    PRIMARY KEY(Id_Printer),
    CONSTRAINT IP_Address_FK_Printer
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Property_FK_Printer
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Departament_FK_Printer
    FOREIGN KEY(Departament) REFERENCES Departament(Id_Departament) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Printer_Model_FK_Printer
    FOREIGN KEY(Model) REFERENCES Printer_Model(Id_Printer_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Switch(
    Id_Switch BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    IP_Address BIGINT UNSIGNED,
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL
    PRIMARY KEY(Id_Switch),
    CONSTRAINT IP_Address_FK_Switch
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Property_FK_Switch
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Switch_Model_FK_Switch
    FOREIGN KEY(Model) REFERENCES Switch_Model(Id_Switch_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Router(
    Id_Router BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Router),
    CONSTRAINT Property_FK_Router
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Router_Model_FK_Router
    FOREIGN KEY(Model) REFERENCES Router_Model(Id_Router_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Monitor(
    Id_Monitor BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) NOT NULL UNIQUE,
    Status VARCHAR(20) NOT NULL,
    Registration_Date DATE NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    PC BIGINT UNSIGNED,
    Property BIGINT UNSIGNED NOT NULL,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Monitor),
    CONSTRAINT PC_FK_Monitor
    FOREIGN KEY(PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Property_FK_Monitor
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Monitor_Model_FK_Monitor
    FOREIGN KEY(Model) REFERENCES Monitor_Model(Id_Monitor_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Server(
    Id_Server BIGINT UNSIGNED AUTO_INCREMENT,
    Serial_Number VARCHAR(50) UNIQUE,
    Status VARCHAR(10) NOT NULL,
    Note_1 VARCHAR(100),
    Note_2 VARCHAR(100),
    RAM_Capacity INT(3),
    Type_Storage VARCHAR(5),
    Storage_Capacity INT(6),
    Platformed INT(1) NOT NULL,
    Registration_Date DATE NOT NULL,
    Warranty_Status VARCHAR(10),
    Warranty_Start DATE,
    Warranty_Expiration DATE,
    Property BIGINT UNSIGNED NOT NULL,
    HostName BIGINT UNSIGNED,
    CPU BIGINT UNSIGNED NOT NULL,
    IP_Address BIGINT UNSIGNED,
    Model BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Server),
    CONSTRAINT Property_FK_Server
    FOREIGN KEY(Property) REFERENCES Property(Id_Property) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT HostName_FK_Server
    FOREIGN KEY(HostName) REFERENCES HostName(Id_HostName) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT CPU_Model_FK_Server
    FOREIGN KEY(CPU) REFERENCES CPU_Model(Id_CPU_Model) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT IP_Address_FK_Server
    FOREIGN KEY(IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Server_Model_FK_Server
    FOREIGN KEY(Model) REFERENCES Server_Model(Id_Server_Model) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS System_User(
    Id_System_User BIGINT UNSIGNED AUTO_INCREMENT,
    Password TEXT NOT NULL,
    User_Type VARCHAR(20) NOT NULL,
    User BIGINT UNSIGNED NOT NULL UNIQUE,
    PRIMARY KEY(Id_System_User),
    CONSTRAINT User_FK_System_User
    FOREIGN KEY(User) REFERENCES User(Id_User) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Event(
    Id_Event BIGINT UNSIGNED AUTO_INCREMENT,
    Event VARCHAR(50) NOT NULL,
    Event_Date DATE NOT NULL,
    Details VARCHAR(200) NOT NULL,
    User BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Event),
    CONSTRAINT System_User_FK_Event
    FOREIGN KEY(User) REFERENCES System_User(Id_System_User) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_User_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_User BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT User_FK_Join_User_Event
    FOREIGN KEY(Id_User) REFERENCES User(Id_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_User_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Cell_Phone_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Cell_Phone BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Cell_Phone_FK_Join_Cell_Phone_Event
    FOREIGN KEY(Id_Cell_Phone) REFERENCES Cell_Phone(Id_Cell_Phone) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Cell_Phone_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Tablet_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Tablet BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Tablet_FK_Join_Tablet_Event
    FOREIGN KEY(Id_Tablet) REFERENCES Tablet(Id_Tablet) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Tablet_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Phone_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Phone BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Phone_FK_Join_Phone_Event
    FOREIGN KEY(Id_Phone) REFERENCES Phone(Id_Phone) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Phone_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_PC_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_PC BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT PC_FK_Join_PC_Event
    FOREIGN KEY(Id_PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_PC_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Printer_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Printer BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Printer_FK_Join_Printer_Event
    FOREIGN KEY(Id_Printer) REFERENCES Printer(Id_Printer) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Printer_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Switch_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Switch BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Swtich_FK_Join_Switch_Event
    FOREIGN KEY(Id_Switch) REFERENCES Switch(Id_Switch) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Switch_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Router_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Router BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Router_Fk_Join_Router_Event
    FOREIGN KEY(Id_Router) REFERENCES Router(Id_Router) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Router_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Monitor_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Monitor BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Monitor_FK_Join_Monitor_Event
    FOREIGN KEY(Id_Monitor) REFERENCES Monitor(Id_Monitor) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Monitor_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_UPS_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_UPS BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT UPS_FK_Join_UPS_Event
    FOREIGN KEY(Id_UPS) REFERENCES UPS(Id_UPS) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_UPS_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Server_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Server BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Server_FK_Join_Server_Event
    FOREIGN KEY(Id_Server) REFERENCES Server(Id_Server) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_Server_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_System_User_Event(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_System_User BIGINT UNSIGNED NOT NULL,
    Id_Event BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT System_User_FK_Join_System_User_Event
    FOREIGN KEY(Id_System_User) REFERENCES System_User(Id_System_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Event_FK_Join_System_User_Event
    FOREIGN KEY(Id_Event) REFERENCES Event(Id_Event) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_IP_Address_Router(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_IP_Address BIGINT UNSIGNED NOT NULL,
    Id_Router BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT IP_Address_FK_Join_IP_Address_Router
    FOREIGN KEY(Id_IP_Address) REFERENCES IP_Address(Id_IP_Address) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Router_FK_Join_IP_Address_Router
    FOREIGN KEY(Id_Router) REFERENCES Router(Id_Router) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_User_PC(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_User BIGINT UNSIGNED NOT NULL,
    Id_PC BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT User_FK_Join_User_PC
    FOREIGN KEY(Id_User) REFERENCES User(Id_User) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT PC_FK_Join_User_PCA
    FOREIGN KEY(Id_PC) REFERENCES PC(Id_PC) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Join_Tablet_Google_Account(
    Id_Join BIGINT UNSIGNED AUTO_INCREMENT,
    Id_Google_Account BIGINT UNSIGNED NOT NULL,
    Id_Tablet BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY(Id_Join),
    CONSTRAINT Google_Account_FK_Join_Tablet_Google_Account
    FOREIGN KEY(Id_Google_Account) REFERENCES Google_Account(Id_Google_Account) ON UPDATE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Tablet_FK_Join_Tablet_Google_Account
    FOREIGN KEY(Id_Tablet) REFERENCES Tablet(Id_Tablet) ON UPDATE CASCADE ON DELETE CASCADE
);