CREATE TABLE bankkund (
PNR VARCHAR2(11) NOT NULL,
FNAMN VARCHAR2(25) NOT NULL,
ENAMN VARCHAR2(25) NOT NULL,
PASSWD VARCHAR2(16) NOT NULL,
CONSTRAINT PK_bankkund PRIMARY KEY (PNR)
);

CREATE TABLE kontotyp (
KTNR NUMBER(6) NOT NULL,
KTNAMN VARCHAR2(20) NOT NULL,
RÄNTA NUMBER(5,2) NOT NULL,
CONSTRAINT PK_kontotyp PRIMARY KEY (KTNR)
);

CREATE TABLE ränteändring (
RNR NUMBER(6) NOT NULL,
KTNR NUMBER(6) NOT NULL,
RÄNTA NUMBER(5,2) NOT NULL,
RNR_DATUM DATE NOT NULL,
CONSTRAINT PK_ränteändring PRIMARY KEY (RNR)
);

CREATE TABLE konto (
KNR NUMBER(8) NOT NULL,
KTNR NUMBER(6) NOT NULL,
REGDATUM DATE NOT NULL,
SALDO NUMBER(10,2),
CONSTRAINT PK_konto PRIMARY KEY (KNR)
);

CREATE TABLE kontoägare (
RADNR NUMBER(9) NOT NULL,
PNR VARCHAR2(11) NOT NULL,
KNR NUMBER(8) NOT NULL,CONSTRAINT PK_kontoägare PRIMARY KEY (RADNR)
);

CREATE TABLE uttag (
RADNR NUMBER(9) NOT NULL,
PNR VARCHAR2(11) NOT NULL,
KNR NUMBER(8) NOT NULL,
BELOPP NUMBER(10,2),
DATUM DATE NOT NULL,
CONSTRAINT PK_uttag PRIMARY KEY (RADNR)
);

CREATE TABLE insättning (
RADNR NUMBER(9) NOT NULL,
PNR VARCHAR2(11) NOT NULL,
KNR NUMBER(8) NOT NULL,
BELOPP NUMBER(10,2),
DATUM DATE NOT NULL,
CONSTRAINT PK_insättning PRIMARY KEY (RADNR)
);

CREATE TABLE överföring (
RADNR NUMBER(9) NOT NULL,
PNR VARCHAR2(11) NOT NULL,
FRÅN_KNR NUMBER(8) NOT NULL,
TILL_KNR NUMBER(8) NOT NULL,
BELOPP NUMBER(10,2),
DATUM DATE NOT NULL,
CONSTRAINT PK_överföring PRIMARY KEY (RADNR)
);