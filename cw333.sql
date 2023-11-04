SELECT nazwisko, adres
FROM rozliczenia.pracownicy;

SELECT 
  date_part('dow', dataa) AS dzien,
 date_part('month', dataa) AS miesiac 
 FROM rozliczenia.godziny;
 
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto NUMERIC;

UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.7;