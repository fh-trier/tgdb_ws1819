-- +------------------------------------------------------+
-- | DELETE SCHEMA                                        |
-- +------------------------------------------------------+
DROP TABLE "CITIES" CASCADE CONSTRAINTS PURGE;
DROP TABLE "CONTACTS" CASCADE CONSTRAINTS PURGE;
DROP TABLE "COUNTRIES" CASCADE CONSTRAINTS PURGE;
DROP TABLE "EMPLOYEES" CASCADE CONSTRAINTS PURGE;
DROP TABLE "METALS" CASCADE CONSTRAINTS PURGE;
DROP TABLE "SHELFS" CASCADE CONSTRAINTS PURGE;
DROP TABLE "STATES" CASCADE CONSTRAINTS PURGE;
DROP TABLE "STORAGE" CASCADE CONSTRAINTS PURGE;
DROP TABLE "SUPPLIERS" CASCADE CONSTRAINTS PURGE;

-- +------------------------------------------------------+
-- | CREATE TABLES                                        |
-- +------------------------------------------------------+
CREATE TABLE "CITIES" (
  "CITY_ID"             CHAR(37)                      NOT NULL,
  "CITY_NAME"           VARCHAR(32)                   NOT NULL,
  "CITY_POSTALCODE"     VARCHAR(10)                   NOT NULL,
  "STATE_ID"            CHAR(37)                      NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_CITIES" PRIMARY KEY ("CITY_ID")
  --CONSTRAINT "CK_CITIES_CITY_ID" CHECK (REGEXP_LIKE("CITY_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_CITIES_STATE_ID" CHECK (REGEXP_LIKE("STATE_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);

CREATE TABLE "CONTACTS" (
  "CONTACT_ID"          CHAR(37)                      NOT NULL,
  "CONTACT_FIRSTNAME"   VARCHAR2(32)                  NOT NULL,
  "CONTACT_LASTNAME"    VARCHAR(32)                   NOT NULL,
  "CONTACT_PHONE"       VARCHAR(37),
  "CONTACT_MOBILE"      VARCHAR(37),
  "CONTACT_MAIL"        VARCHAR(37),
  "SUPPLIER_ID"         CHAR(37)                      NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_CONTACTS" PRIMARY KEY ("CONTACT_ID")
  --CONSTRAINT "CK_CONTACTS_CONTACT_ID" CHECK (REGEXP_LIKE("CONTACT_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_CONTACTS_SUPPLIER_ID" CHECK (REGEXP_LIKE("SUPPLIER_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);


CREATE TABLE "COUNTRIES" (
  "COUNTRY_ID"          CHAR(37)                      NOT NULL,
  "COUNTRY_NAME"        VARCHAR(32)                   NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_COUNTRIES" PRIMARY KEY ("COUNTRY_ID")
  --CONSTRAINT "CK_COUNTRIES_COUNTRY_ID" CHECK (REGEXP_LIKE("COUNTRY_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);


CREATE TABLE "EMPLOYEES" (
  "EMPLOYEE_ID"         CHAR(37)                      NOT NULL,
  "EMPLOYEE_FIRSTNAME"  VARCHAR2(32)                  NOT NULL,
  "EMPLOYEE_LASTNAME"   VARCHAR(32)                   NOT NULL,
  "EMPLOYEE_BIRTHDAY"   DATE                          NOT NULL,
  "EMPLOYEE_HIREDATE"   DATE                          NOT NULL,
  "EMPLOYEE_STREET"     VARCHAR(32)                   NOT NULL,
  "CITY_ID"             CHAR(37)                      NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_EMPLOYEES" PRIMARY KEY ("EMPLOYEE_ID")
  --CONSTRAINT "CK_EMPLOYEES_EMPLOYEE_ID" CHECK (REGEXP_LIKE("EMPLOYEE_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_EMPLOYEES_CITY_ID" CHECK (REGEXP_LIKE("CITY_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);


CREATE TABLE "METALS" (
  "METAL_ID"            CHAR(37)                      NOT NULL,
  "METAL_NAME"          VARCHAR(32)                   NOT NULL,
  "METAL_PROPERTY"      VARCHAR(32),
  "METAL_TYPE"          VARCHAR(32),
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_METALS" PRIMARY KEY ("METAL_ID")
  --CONSTRAINT "CK_METALS_METAL_ID" CHECK (REGEXP_LIKE("METAL_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);


CREATE TABLE "SHELFS" (
  "SHELF_ID"            CHAR(37)                      NOT NULL,
  "SHELF_NAME"          VARCHAR2(3)                   NOT NULL,
  "SHELF_NUMBER"        NUMBER(3,0)                   NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_SHELFS" PRIMARY KEY ("SHELF_ID"),
  --CONSTRAINT "CK_SHELFS_SHELF_ID" CHECK (REGEXP_LIKE("SHELF_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$', 'c')),
  CONSTRAINT "CK_SHELFS_SHELF_NAME" CHECK (REGEXP_LIKE("SHELF_NAME", '^[A-Z]{1,3}')),
  CONSTRAINT "CK_SHELFS_SHELF_NUMBER" CHECK (SHELF_NUMBER > 0)
);


CREATE TABLE "STATES" (
  "STATE_ID"            CHAR(37)                      NOT NULL,
  "STATE_NAME"          VARCHAR(32)                   NOT NULL,
  "COUNTRY_ID"          CHAR(37)                      NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_STATES" PRIMARY KEY ("STATE_ID")
  --CONSTRAINT "CK_STATES_STATE_ID" CHECK (REGEXP_LIKE("STATE_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_STATES_COUNTRY_ID" CHECK (REGEXP_LIKE("COUNTRY_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);


CREATE TABLE "STORAGE" (
  "STORAGE_ID"          CHAR(37)                      NOT NULL,
  "CONTACT_ID"          CHAR(37),
  "EMPLOYEE_ID"         CHAR(37),
  "METAL_ID"            CHAR(37)                      NOT NULL,
  "SHELF_ID"            CHAR(37)                      NOT NULL,
  "X_LENGTH"            NUMBER(5,0)                   NOT NULL,
  "Y_LENGTH"            NUMBER(5,0)                   NOT NULL,
  "SURFACE_AREA"        NUMBER(16,0)                  GENERATED ALWAYS AS (X_LENGTH * Y_LENGTH),
  "METAL_THICKNESS"     NUMBER(3)                     NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_STORAGE" PRIMARY KEY ("STORAGE_ID")
  --CONSTRAINT "CK_STORAGE_STORAGE_ID" CHECK (REGEXP_LIKE("STORAGE_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_STORAGE_METAL_ID" CHECK (REGEXP_LIKE("METAL_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_STORAGE_SHELF_ID" CHECK (REGEXP_LIKE("SHELF_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);


CREATE TABLE "SUPPLIERS" (
  "SUPPLIER_ID"         CHAR(37)                      NOT NULL,
  "SUPPLIER_NAME"       VARCHAR2(32)                  NOT NULL,
  "SUPPLIER_STREET"     VARCHAR2(37)                  NOT NULL,
  "CITY_ID"             CHAR(37)                      NOT NULL,
  "CREATION_DATE"       DATE        DEFAULT SYSDATE   NOT NULL,
  CONSTRAINT "PK_SUPPLIERS" PRIMARY KEY ("SUPPLIER_ID")
  --CONSTRAINT "CK_SUPPLIERS_SUPPLIER_ID" CHECK (REGEXP_LIKE("SUPPLIER_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')),
  --CONSTRAINT "CK_SUPPLIERS_CITY_ID" CHECK (REGEXP_LIKE("CITY_ID", '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))
);

-- +------------------------------------------------------+
-- | CREATE FOREIGN KEYS                                  |
-- +------------------------------------------------------+
ALTER TABLE "CITIES"
ADD CONSTRAINT "FK_CITIES_STATE_ID"
FOREIGN KEY ("STATE_ID")
REFERENCES "STATES"("STATE_ID")
ON DELETE CASCADE;

ALTER TABLE "CONTACTS"
ADD CONSTRAINT "FK_CONTACTS_SUPPLIER_ID"
FOREIGN KEY ("SUPPLIER_ID")
REFERENCES "SUPPLIERS"("SUPPLIER_ID")
ON DELETE CASCADE;

ALTER TABLE "EMPLOYEES"
ADD CONSTRAINT "FK_EMPLOYEES_CITY_ID"
FOREIGN KEY ("CITY_ID")
REFERENCES "CITIES"("CITY_ID")
ON DELETE CASCADE;

ALTER TABLE "STATES"
ADD CONSTRAINT "FK_STATES_COUNTRY_ID"
FOREIGN KEY ("COUNTRY_ID")
REFERENCES "COUNTRIES"("COUNTRY_ID")
ON DELETE CASCADE;

ALTER TABLE "STORAGE"
ADD CONSTRAINT "FK_STORAGE_CONTACT_ID"
FOREIGN KEY ("CONTACT_ID")
REFERENCES "CONTACTS"("CONTACT_ID")
ON DELETE SET NULL;

ALTER TABLE "STORAGE"
ADD CONSTRAINT "FK_STORAGE_EMPLOYEE_ID"
FOREIGN KEY ("EMPLOYEE_ID")
REFERENCES "EMPLOYEES"("EMPLOYEE_ID")
ON DELETE SET NULL;

ALTER TABLE "STORAGE"
ADD CONSTRAINT "FK_STORAGE_METAL_ID"
FOREIGN KEY ("METAL_ID")
REFERENCES "METALS"("METAL_ID")
ON DELETE CASCADE;

ALTER TABLE "STORAGE"
ADD CONSTRAINT "FK_STORAGE_SHELF_ID"
FOREIGN KEY ("SHELF_ID")
REFERENCES "SHELFS"("SHELF_ID")
ON DELETE CASCADE;

ALTER TABLE "SUPPLIERS"
ADD CONSTRAINT "FK_SUPPLIERS_CITY_ID"
FOREIGN KEY ("CITY_ID")
REFERENCES "CITIES"("CITY_ID")
ON DELETE CASCADE;


-- +------------------------------------------------------+
-- | CREATE FUNCTIONS                                     |
-- +------------------------------------------------------+
CREATE OR REPLACE AND COMPILE
JAVA SOURCE NAMED "NEW_UUID"
AS
public class FrontBackEndUtils {
   public static String randomUUID() {
        return java.util.UUID.randomUUID().toString();
   }
}
/

CREATE OR REPLACE FUNCTION NEW_UUID
RETURN VARCHAR2
AS LANGUAGE JAVA
NAME 'FrontBackEndUtils.randomUUID() return java.lang.String';
/

-- +------------------------------------------------------+
-- | CREATE MOCK DATA                                     |
-- +------------------------------------------------------+

INSERT ALL
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Deutschland')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Belgien')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Luxemburg')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Niederlande')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Frankreich')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Schweiz')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'China')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Österreich')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Tschechien')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Polen')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Dänemark')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'United States of America')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Spanien')
  INTO COUNTRIES(COUNTRY_ID, COUNTRY_NAME) VALUES (NEW_UUID(), 'Italien')
SELECT 1 FROM dual;


INSERT ALL
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Rheinland-Pfalz', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Nordrhein-Westfalen', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Saarland', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Baden-Württemberg', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Bayern', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Hessen', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Thüringen', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Berlin', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Hamburg', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
  INTO STATES (STATE_ID, STATE_NAME, COUNTRY_ID) VALUES (NEW_UUID(), 'Bremen', (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'Deutschland'))
SELECT 1 FROM dual;


INSERT ALL
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Trier-Nord', '54292', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Trier-Süd', '54290', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Trier-West', '54291', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Trier-Ost', '54293', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Bitburg', '54634', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Prüm', '54595', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Konz', '54329', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Rheinland-Pfalz'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Berlin', '10115', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Berlin'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Berlin', '10585', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Berlin'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Berlin', '10709', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Berlin'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Berlin', '10779', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Berlin'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Köln', '50667', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Nordrhein-Westfalen'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Köln', '50674', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Nordrhein-Westfalen'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Köln', '50739', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Nordrhein-Westfalen'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Saarbrücken', '66111', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Saarbrücken', '66115', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Saarbrücken', '66119', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Saarbrücken', '66123', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Merzig', '66663', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Saarlouis', '66740', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
  INTO CITIES (CITY_ID, CITY_NAME, CITY_POSTALCODE, STATE_ID) VALUES (NEW_UUID(), 'Saarlouis', '66798', (SELECT STATE_ID FROM STATES WHERE STATE_NAME = 'Saarland'))
SELECT 1 FROM dual;


INSERT ALL
  INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_STREET, CITY_ID) VALUES (NEW_UUID(), 'Stahlhandel Saarlouis E.K.', 'Saarstraße 1', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = 66740))
  INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_STREET, CITY_ID) VALUES (NEW_UUID(), 'Edelmetalle Benelux GBR', 'Hauptstraße 1', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = 54595))
  INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_STREET, CITY_ID) VALUES (NEW_UUID(), 'Thyssenkrupp AG', 'Zum Schmelzhofen 1000', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = 50667))
  INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_STREET, CITY_ID) VALUES (NEW_UUID(), 'Kruppstahl AG', 'Stahlstraße 5', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = 50739))
  INTO SUPPLIERS (SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_STREET, CITY_ID) VALUES (NEW_UUID(), 'Mannesmann Stahlhandel GmbH', 'Rudower Chaussee 46', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = 10115))
SELECT 1 FROM dual;


INSERT ALL
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Volker', 'Raschek', NULL, NULL, NULL, (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Kruppstahl AG'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Mia', 'Heinrich', NULL, NULL, 'm.heinrich@kruppstahl.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Kruppstahl AG'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Lena', 'Hörnchen', '+49 5447 788 8774', NULL, 'l.hoernchen@kruppstahl.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Kruppstahl AG'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Sophie', 'Müller', '+49 5447 788 6611', NULL, 's.mueller@kruppstahl.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Kruppstahl AG'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Ben', 'Hammerschlag', '+49 8799 421 0211', NULL, 'b.hammerschlag@thyssen.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Thyssenkrupp AG'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Max', 'Schnelllauf', '+49 8799 421 0281', NULL, 'b.hammerschlag@thyssen.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Thyssenkrupp AG'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Lukas', 'Wegberg', '+49 7881 155 8447', NULL, 'l.wegberg@edelmetalle.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Edelmetalle Benelux GBR'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Marie', 'Kleinlaut', '+49 7881 155 8127', NULL, 'm.kleinlaut@edelmetalle.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Edelmetalle Benelux GBR'))
  INTO CONTACTS (CONTACT_ID, CONTACT_FIRSTNAME, CONTACT_LASTNAME, CONTACT_PHONE, CONTACT_MOBILE, CONTACT_MAIL, SUPPLIER_ID) VALUES (NEW_UUID(), 'Lara', 'Nixcroft', '+49 7881 155 7847', NULL, 'l.nixcroft@edelmetalle.de', (SELECT SUPPLIER_ID FROM SUPPLIERS WHERE SUPPLIER_NAME = 'Edelmetalle Benelux GBR'))
SELECT 1 FROM dual;


INSERT ALL
  INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_FIRSTNAME, EMPLOYEE_LASTNAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_HIREDATE, EMPLOYEE_STREET, CITY_ID) VALUES (NEW_UUID(), 'Maximilian', 'Arbeitsscheu', TO_DATE('1988-06-21', 'YYYY-MM-DD'), TO_DATE('2007-04-18', 'YYYY-MM-DD'), 'Hauptstraße 1', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = '54595'))
  INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_FIRSTNAME, EMPLOYEE_LASTNAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_HIREDATE, EMPLOYEE_STREET, CITY_ID) VALUES (NEW_UUID(), 'Henry', 'Großkreutz', TO_DATE('1990-09-01', 'YYYY-MM-DD'), TO_DATE('2009-02-10', 'YYYY-MM-DD'), 'Zum Bahnhof 1', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = '54292'))
  INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_FIRSTNAME, EMPLOYEE_LASTNAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_HIREDATE, EMPLOYEE_STREET, CITY_ID) VALUES (NEW_UUID(), 'Leni', 'Mayer', TO_DATE('1996-10-15', 'YYYY-MM-DD'), TO_DATE('2015-05-01', 'YYYY-MM-DD'), 'Paulinstraße 75', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = '54290'))
  INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_FIRSTNAME, EMPLOYEE_LASTNAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_HIREDATE, EMPLOYEE_STREET, CITY_ID) VALUES (NEW_UUID(), 'Johanna', 'Freilauf', TO_DATE('1993-07-22', 'YYYY-MM-DD'), TO_DATE('2012-04-01', 'YYYY-MM-DD'), 'Maarstraße 55', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = '54292'))
  INTO EMPLOYEES (EMPLOYEE_ID, EMPLOYEE_FIRSTNAME, EMPLOYEE_LASTNAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_HIREDATE, EMPLOYEE_STREET, CITY_ID) VALUES (NEW_UUID(), 'Julian', 'Messner', TO_DATE('1997-12-15', 'YYYY-MM-DD'), TO_DATE('2016-10-15', 'YYYY-MM-DD'), 'Zurmainerstraße 1', (SELECT CITY_ID FROM CITIES WHERE CITY_POSTALCODE = '54292'))
SELECT 1 FROM dual;


INSERT ALL
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.4301', NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.4301', 'Träne')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.4301', 'Geschliffen')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.6582', NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.6582', 'Träne')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.6582', 'Geschliffen')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.4452', NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.4452', 'Träne')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Edelstahl', '1.4452', 'Geschliffen')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Schwarzstahl', 'S235', NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Schwarzstahl', 'S355', NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Kupfer', NULL, NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Messing', NULL, NULL)
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Aluminium', NULL, 'Geschliffen')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Aluminium', NULL, 'Träne')
  INTO METALS (METAL_ID, METAL_NAME, METAL_PROPERTY, METAL_TYPE) VALUES(NEW_UUID(), 'Aluminium', NULL, NULL)
SELECT 1 FROM dual;



INSERT ALL
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 10)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 20)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 30)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 40)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 50)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 60)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 70)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 80)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 90)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'A', 100)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 10)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 20)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 30)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 40)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 50)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 60)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 70)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 80)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 90)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'B', 100)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 10)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 20)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 30)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 40)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 50)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 60)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 70)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 80)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 90)
  INTO SHELFS (SHELF_ID, SHELF_NAME, SHELF_NUMBER) VALUES(NEW_UUID(), 'C', 100)
SELECT 1 FROM dual;


BEGIN
  FOR i IN 1..25 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 5447 788 8774'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2007-04-18', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Edelstahl' AND METAL_PROPERTY = '1.4301' AND METAL_TYPE = 'Träne'),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'C' AND SHELF_NUMBER = 70),
      4500,
      2500,
      15
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..55 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 8799 421 0281'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2016-10-15', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Edelstahl' AND METAL_PROPERTY = '1.4301' AND METAL_TYPE = 'Geschliffen'),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'A' AND SHELF_NUMBER = 30),
      5000,
      3000,
      10
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..10 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 7881 155 7847'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2012-04-01', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Schwarzstahl' AND METAL_PROPERTY = 'S235' AND METAL_TYPE IS NULL),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'B' AND SHELF_NUMBER = 10),
      5000,
      2500,
      25
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..5 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 7881 155 7847'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2012-04-01', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Kupfer' AND METAL_PROPERTY IS NULL AND METAL_TYPE IS NULL),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'C' AND SHELF_NUMBER = 20),
      5000,
      3000,
      35
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..20 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 5447 788 8774'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2009-02-10', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Aluminium' AND METAL_PROPERTY IS NULL AND METAL_TYPE = 'Geschliffen'),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'A' AND SHELF_NUMBER = 80),
      7500,
      1000,
      5
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..20 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 5447 788 8774'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2009-02-10', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Aluminium' AND METAL_PROPERTY IS NULL AND METAL_TYPE = 'Träne'),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'A' AND SHELF_NUMBER = 70),
      4000,
      500,
      5
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..20 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 5447 788 8774'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2009-02-10', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Aluminium' AND METAL_PROPERTY IS NULL AND METAL_TYPE IS NULL),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'A' AND SHELF_NUMBER = 60),
      6000,
      2500,
      2
    );
  END LOOP;
END;
/

BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO STORAGE (STORAGE_ID, CONTACT_ID, EMPLOYEE_ID, METAL_ID, SHELF_ID, X_LENGTH, Y_LENGTH, METAL_THICKNESS) VALUES(
      NEW_UUID(),
      (SELECT CONTACT_ID FROM CONTACTS WHERE CONTACT_PHONE = '+49 5447 788 8774'),
      (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE TRUNC(EMPLOYEE_HIREDATE) = TO_DATE('2009-02-10', 'YYYY-MM-DD')),
      (SELECT METAL_ID FROM METALS WHERE METAL_NAME = 'Schwarzstahl' AND METAL_PROPERTY = 'S355' AND METAL_TYPE IS NULL),
      (SELECT SHELF_ID FROM SHELFS WHERE SHELF_NAME = 'B' AND SHELF_NUMBER = 20),
      6000,
      1000,
      3
    );
  END LOOP;
END;
/

COMMIT;


CREATE OR REPLACE VIEW "JOINED_STORAGE" AS
  SELECT
    COUNT(ST.STORAGE_ID) AS "COUNT",
    M.METAL_NAME,
    M.METAL_PROPERTY,
    M.METAL_TYPE,
    ST.X_LENGTH,
    ST.Y_LENGTH,
    ST.METAL_THICKNESS,
    ST.SURFACE_AREA,
    SH.SHELF_NAME,
    SH.SHELF_NUMBER,
    SU.SUPPLIER_NAME
  FROM "STORAGE" ST
    INNER JOIN METALS M ON (M.METAL_ID = ST.METAL_ID)
    INNER JOIN SHELFS SH ON (SH.SHELF_ID = ST.SHELF_ID)
    INNER JOIN EMPLOYEES E ON (E.EMPLOYEE_ID = ST.EMPLOYEE_ID)
    INNER JOIN CONTACTS C ON (C.CONTACT_ID = ST.CONTACT_ID)
    INNER JOIN SUPPLIERS SU ON (SU.SUPPLIER_ID = C.SUPPLIER_ID)
  GROUP BY
    M.METAL_NAME,
    M.METAL_PROPERTY,
    M.METAL_TYPE,
    ST.X_LENGTH,
    ST.Y_LENGTH,
    ST.METAL_THICKNESS,
    ST.SURFACE_AREA,
    SH.SHELF_NAME,
    SH.SHELF_NUMBER,
    SU.SUPPLIER_NAME;

SELECT *
FROM JOINED_STORAGE
ORDER BY
  METAL_NAME,
  METAL_PROPERTY,
  METAL_TYPE;
