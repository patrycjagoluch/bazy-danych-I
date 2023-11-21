CREATE DATABASE firma;
CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
  id_pracownika INT PRIMARY KEY NOT NULL,
  imie VARCHAR(20) NOT NULL,
  nazwisko VARCHAR(20) NOT NULL,
  adres VARCHAR(50) NOT NULL,
  telefon INT NOT NULL
);

CREATE TABLE ksiegowosc.godziny (
 id_godziny INT NOT NULL PRIMARY KEY,
 dataa DATE NOT NULL,
 liczba_godzin INT NOT NULL,
 id_pracownika INT NOT NULL
);

CREATE TABLE ksiegowosc.pensje(
id_pensji INT NOT NULL PRIMARY KEY,
stanowisko VARCHAR(50) NOT NULL,
kwota INT NOT NULL
);

CREATE TABLE ksiegowosc.premie(
id_premii INT NOT NULL PRIMARY KEY,
rodzaj VARCHAR(50) NOT NULL,
kwota INT
);

CREATE TABLE ksiegowosc.wynagrodzenie(
id_wynagrodzenia INT PRIMARY KEY NOT NULL,
dataa DATE NOT NULL,
id_pracownika INT NOT NULL,
id_godziny INT NOT NULL,
id_pensji INT NOT NULL,
id_premii INT NOT NULL
);

ALTER TABLE ksiegowosc.pracownicy
ALTER COLUMN telefon TYPE BIGINT;

INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
    (1, 'Anna', 'Skruszeniec', 'ul. Sezamkowa', 789012345),
    (2, 'Julia', 'Nowicka', 'ul. Kwiatowa', 123456789),
	(3, 'Katarzyna', 'Pawlak', 'ul. Szpitalna', 900700500),
    (4, 'Agnieszka', 'Klempka','ul. Akademicka', 345897123),
	(5, 'Tomasz', 'Kozak', 'ul. Poranna', 409862345),
    (6, 'Piotr', 'Adamek', 'ul. Dabrowicza', 908658321),
	(7, 'Natalia', 'Maciejewska', 'ul. Pilsudskiego', 876532458),
    (8, 'Adam', 'Podolski', 'ul. Cezara', 9872349699),
	(9, 'Magdalena', 'Dabrowska', 'ul. Grabowskiego', 972145970),
    (10, 'Andrzej', 'Pionka', 'ul. Wiosenna',762980654);

INSERT INTO ksiegowosc.godziny (id_godziny, dataa, liczba_godzin, id_pracownika)
VALUES 
    (5, '2023-10-31', 8, 5),
    (20, '2023-10-20', 10, 4),
    (8, '2023-09-13', 8, 10),
    (456, '2023-09-29', 12, 8),
    (287, '2023-10-15', 7, 1),
    (89, '2023-10-07', 9, 3),
    (322, '2023-09-02', 9, 2),
    (865, '2023-09-30', 8, 9),
    (521, '2023-11-05', 8, 10),
    (490, '2023-11-03', 8, 6);
	
INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES 
    (98, 'menager', 9000),
    (99, 'naprawca', 1000),
    (100, 'sekretarka', 4500),
    (101, 'sprzataczka', 3800),
    (102, 'kierownik', 6500),
    (103, 'dostawca', 5000),
    (104, 'asystent', 2300),
    (105, 'kucharz', 950),
    (106, 'kieronik', 6000),
    (107, 'naprawca', 1300);
	
INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
 VALUES 
   (11, 'urodzinowa', 300),
   (12, 'swiateczna', 500),
   (13, 'swiateczna', 0),
   (14, 'pieniezna', 0),
   (15, 'pieniezna', 800),
   (16, 'swiateczna', 900),
   (17, 'pieniezna', 200),
   (18, 'urodzinowa', 0),
   (19, 'pieniezna', 0),
   (20, 'pieniezna', 400);

INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia, dataa,id_pracownika,id_godziny, id_pensji, id_premii)
VALUES
	( 1,'2023-10-31', 5, 5, 98, 11 ),
	( 2,'2023-10-20', 4, 20, 99, 12),
	( 3,'2023-09-13', 10, 8, 100, 13),
	( 4,'2023-09-29', 8, 456, 101, 14),
	( 5,'2023-10-15', 1, 287, 102, 15),
	( 6,'2023-10-07', 3, 89, 103, 16),
	( 7,'2023-09-02', 2, 322, 104, 17 ),
	(8, '2023-09-30', 9, 865, 105, 18 ),
	( 9, '2023-11-05', 10, 521, 106, 19),
	( 10, '2023-11-03', 6, 490, 107, 20);

COMMENT ON TABLE ksiegowosc.pracownicy IS 'brak obcych kluczy';
COMMENT ON TABLE ksiegowosc.godziny IS 'ma klucz obcy z pracownika';
COMMENT ON TABLE ksiegowosc.pensje IS 'ma klucz obcy z premii';
COMMENT ON TABLE ksiegowosc.premie IS 'brak obcych kluczy';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'ma kluch obcy z czterech tabeli';

ALTER TABLE ksiegowosc.wynagrodzenie 
ADD CONSTRAINT fk_wynagrodzenie_godziny
FOREIGN KEY (dataa)
REFERENCES ksiegowosc.godziny (dataa);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT fk_wynagrodzenie_pracownicy
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy (id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT fk_wynagrodzenie_pensje
FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensje (id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT fk_wynagrodzenie_premie
FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.premie (id_premii);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD CONSTRAINT fk_wynagrodzenie_godziny
FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny (id_godziny);


SELECT id_pracownika, nazwisko --a)
FROM ksiegowosc.pracownicy;

SELECT p.id_pracownika -- b)
FROM ksiegowosc.pracownicy p
INNER JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
INNER JOIN ksiegowosc.pensje s ON w.id_pensji = s.id_pensji
INNER JOIN ksiegowosc.premie r ON w.id_premii = r.id_premii 
WHERE (s.kwota + COALESCE(r.kwota, 0)) > 1000; --fun gdy premia jest null daje jej 0 

SELECT p.id_pracownika -- c)
FROM ksiegowosc.pracownicy p
INNER JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.premie r ON w.id_premii = r.id_premii
INNER JOIN ksiegowosc.pensje s ON w.id_pensji = s.id_pensji
WHERE (r.kwota IS NULL OR r.kwota = 0) AND s.kwota > 2000;

SELECT * FROM ksiegowosc.pracownicy WHERE LEFT (imie,1) = 'J'; --zwraca pierwsza litere ze stringu imie
SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%' AND RIGHT(imie,1) = 'a'; --right zwraca 1 ostatniÄ… litere ze stringu imie
-- LIKE szuka czegos w kolumnie (wystepuje razem z where ). % ozancza kilka, _ jeden znak


SELECT imie, nazwisko, SUM(g.liczba_godzin - 8) nadgodziny  --f) tworzy trzecia kolumne gdzie oblicza gdzie sa nadgodziny
FROM ksiegowosc.pracownicy p
INNER JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
WHERE g.liczba_godzin > 8
GROUP BY p.id_pracownika, imie, nazwisko; -- group by bo oblicza dla kazdego pracownika

SELECT imie, nazwisko     -- ok g)
FROM ksiegowosc.pracownicy p
INNER JOIN  ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
INNER JOIN  ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
WHERE pe.kwota > 1500 AND pe.kwota < 3000;

SELECT imie, nazwisko     -- h)
FROM ksiegowosc.pracownicy p
INNER JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
INNER JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
INNER JOIN ksiegowosc.premie m ON w.id_premii = m.id_premii
WHERE g.liczba_godzin > 8 AND m.kwota IS NULL; 

SELECT p.id_pracownika, imie, nazwisko, kwota -- i) 
FROM ksiegowosc.pracownicy p  
INNER JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika 
INNER JOIN ksiegowosc.pensje e ON w.id_pensji = e.id_pensji 
ORDER BY e.kwota;

SELECT p.id_pracownika, imie, nazwisko, s.kwota, r.kwota -- j)
FROM ksiegowosc.pracownicy p   
INNER JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika 
INNER JOIN ksiegowosc.pensje s ON w.id_pensji = s.id_pensji 
INNER JOIN ksiegowosc.premie r ON r.id_premii = w.id_premii 
ORDER BY s.kwota DESC, r.kwota DESC; --DESC - malejaca

SELECT stanowisko, COUNT(stanowisko) suma  --k) 
FROM ksiegowosc.pensje
GROUP BY stanowisko; --wypisuje kazde stanowisko i ile razy wystepuje

SELECT AVG(s.kwota + r.kwota) srednia, MIN (s.kwota + r.kwota ) mini, MAX (s.kwota + r.kwota ) maks --l)place liczy z zarobkow i premii
FROM ksiegowosc.pensje s
INNER JOIN ksiegowosc.wynagrodzenie w ON s.id_pensji = w.id_pensji
INNER JOIN ksiegowosc.premie r ON w.id_premii = r.id_premii
WHERE stanowisko = 'kierownik';

SELECT SUM(s.kwota) suma  --m) 
FROM ksiegowosc.pensje s;

SELECT SUM(s.kwota) suma, stanowisko  --n) 
FROM ksiegowosc.pensje s
GROUP BY s.stanowisko;

SELECT COUNT(r.kwota) liczba_premii, stanowisko  --o)
FROM ksiegowosc.premie r
INNER JOIN ksiegowosc.wynagrodzenie w ON w.id_premii = r.id_premii
INNER JOIN ksiegowosc.pensje s ON s.id_pensji = w.id_pensji
GROUP BY s.stanowisko;

ALTER TABLE ksiegowosc.wynagrodzenie --dodaje 
DROP CONSTRAINT IF EXISTS fk_wynagrodzenie_pracownicy;

ALTER TABLE ksiegowosc.wynagrodzenie  --usuwam
ADD CONSTRAINT fk_wynagrodzenie_pracownicy 
FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy (id_pracownika) 
ON DELETE CASCADE;

DELETE FROM ksiegowosc.pracownicy p --p)  
WHERE id_pracownika IN (
SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
INNER JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika = p.id_pracownika
INNER JOIN ksiegowosc.pensje s ON s.id_pensji = w.id_pensji
WHERE s.kwota < 1200);

SELECT * FROM ksiegowosc.pracownicy;