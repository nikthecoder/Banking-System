INSERT INTO kontotyp(ktnr,ktnamn,ränta)
VALUES(1,'bondkonto',3.4);
INSERT INTO kontotyp(ktnr,ktnamn,ränta)
VALUES(2,'potatiskonto',4.4);
INSERT INTO kontotyp(ktnr,ktnamn,ränta)
VALUES(3,'griskonto',2.4);
COMMIT;
INSERT INTO konto(knr,ktnr,regdatum,saldo)
VALUES(123,1,SYSDATE - 321,0);
INSERT INTO konto(knr,ktnr,regdatum,saldo)
VALUES(5899,2,SYSDATE - 2546,0);
INSERT INTO konto(knr,ktnr,regdatum,saldo)
VALUES(5587,3,SYSDATE - 10,0);
INSERT INTO konto(knr,ktnr,regdatum,saldo)
VALUES(8896,1,SYSDATE - 45,0);
COMMIT;
INSERT INTO kontoägare(radnr,pnr,knr)
VALUES(radnr_seq.NEXTVAL,'540126-1111',123);
INSERT INTO kontoägare(radnr,pnr,knr)
VALUES(radnr_seq.NEXTVAL,'691124-4478',123);
INSERT INTO kontoägare(radnr,pnr,knr)
VALUES(radnr_seq.NEXTVAL,'540126-1111',5899);
INSERT INTO kontoägare(radnr,pnr,knr)
VALUES(radnr_seq.NEXTVAL,'691124-4478',8896);
COMMIT;