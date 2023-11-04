ALTER TABLE rozliczenia.pracownicy
ALTER COLUMN telefon TYPE BIGINT;

INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
    (1, 'Anna', 'Skruszeniec', 'ul. Sezamkowa', 789012345),
    (2, 'Julia', 'Nowicka', 'ul. Kwiatowa', 123456789),
	(3, 'Katarzyna', 'Pawlak', 'ul. Szpitalna', 900700500),
    (4, 'Agnieszka', 'Klempka','ul. Akademicka', 345897123),
	(5, 'Tomasz', 'Kozak', 'ul. Poranna', 409862345),
    (6, 'Piotr', 'Adamek', 'ul. Dąbrowicza', 908658321),
	(7, 'Natalia', 'Maciejewska', 'ul. Piłsudskiego', 876532458),
    (8, 'Adam', 'Podolski', 'ul. Cezara', 9872349699),
	(9, 'Magdalena', 'Dąbrowska', 'ul. Grabowskiego', 972145970),
    (10, 'Andrzej', 'Pionka', 'ul. Wiosenna',762980654);
	
INSERT INTO rozliczenia.godziny (id_godziny, dataa, liczba_godzin, id_pracownika)
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
	
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES 
    (98, 'menager', 9000, 11),
    (99, 'sprzedawca', 4000, 12),
    (100, 'sekretarka', 4500, 13),
    (101, 'sprzątaczka', 3800, 14),
    (102, 'kierownik', 6500, 15),
    (103, 'dostawca', 5000, 16),
    (104, 'asystent', 4800, 17),
    (105, 'kucharz', 5000, 18),
    (106, 'właściciel', 6000, 19),
    (107, 'naprawca', 4000, 20);
	
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
 VALUES 
   (11, 'pieniężna', 300),
   (12, 'świąteczna', 500),
   (13, 'świąteczna', 200),
   (14, 'pieniężna', 300),
   (15, 'pieniężna', 800),
   (16, 'świąteczna', 900),
   (17, 'pieniężna', 200),
   (18, 'urodzinowa', 150),
   (19, 'pieniężna', 250),
   (20, 'pieniężna', 400);
   
   ALTER TABLE rozliczenia.godziny
ADD CONSTRAINT fk_godziny_pracownicy
FOREIGN KEY (id_pracownika)
REFERENCES rozliczenia.pracownicy (id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD CONSTRAINT fk_pensje_premie
FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie (id_premii);

