-- ============================================================
-- LEKCJA 3 | SQL & Bazy Danych
-- Autor: Marek Bekier
-- Data: 2026-03-25
-- Temat: Review Lekcja 1 & 2 + Subqueries (zagnieżdżone SELECT)
-- Projekt: Data Analytics Path | DAT-38 | Epik: DAT-5
-- ============================================================


-- ============================================================
-- CZĘŚĆ 1: REVIEW — POWTÓRKA LEKCJA 1 & 2
-- ============================================================

-- SELECT podstawowy
SELECT imie, nazwisko, miasto
FROM klienci;

-- SELECT wszystkich kolumn
SELECT *
FROM klienci;

-- WHERE — filtrowanie
SELECT imie, nazwisko
FROM klienci
WHERE miasto = 'Warszawa';

-- IN — lista wartości
SELECT imie, nazwisko
FROM klienci
WHERE miasto IN ('Warszawa', 'Kraków', 'Zakopane');

-- NOT IN — wykluczenie z listy
SELECT imie, nazwisko
FROM klienci
WHERE miasto NOT IN ('Warszawa', 'Kraków');

-- BETWEEN — zakres wartości
SELECT imie, nazwisko, wzrost
FROM klienci
WHERE wzrost BETWEEN 160 AND 190;

-- NOT BETWEEN
SELECT imie, nazwisko, wzrost
FROM klienci
WHERE wzrost NOT BETWEEN 160 AND 190;

-- LIKE — wzorzec tekstowy (% = dowolne znaki)
SELECT imie, nazwisko
FROM klienci
WHERE imie LIKE 'A%';

-- LIKE z podkreślnikiem (_ = dokładnie jedna litera)
SELECT imie, nazwisko
FROM klienci
WHERE imie LIKE '_nna';

-- NOT LIKE
SELECT imie, nazwisko
FROM klienci
WHERE imie NOT LIKE 'A%';

-- IS NULL / IS NOT NULL
SELECT imie, nazwisko
FROM klienci
WHERE punkty IS NULL;

SELECT imie, nazwisko
FROM klienci
WHERE punkty IS NOT NULL;

-- ORDER BY ASC / DESC
SELECT imie, nazwisko, miasto
FROM klienci
ORDER BY nazwisko ASC;

SELECT imie, nazwisko, wynagrodzenie
FROM pracownicy
ORDER BY wynagrodzenie DESC;

-- DISTINCT — unikalne wartości
SELECT DISTINCT miasto
FROM klienci
ORDER BY miasto ASC;

-- GROUP BY + COUNT
SELECT miasto, COUNT(*) AS liczba_klientow
FROM klienci
GROUP BY miasto
ORDER BY liczba_klientow DESC;

-- GROUP BY + HAVING — filtrowanie grup
SELECT miasto, COUNT(*) AS liczba_klientow
FROM klienci
GROUP BY miasto
HAVING COUNT(*) > 3
ORDER BY liczba_klientow DESC;

-- Funkcje agregujące: SUM, AVG, ROUND, MIN, MAX
SELECT
    SUM(wynagrodzenie)        AS suma_wynagrodzen,
    ROUND(AVG(wynagrodzenie), 2) AS srednia_wynagrodzenie,
    MIN(wynagrodzenie)        AS najnizsze,
    MAX(wynagrodzenie)        AS najwyzsze,
    COUNT(*)                  AS liczba_pracownikow
FROM pracownicy;

-- TRIM — usunięcie spacji
SELECT TRIM('   Jan Kowalski   ') AS oczyszczone;

-- ALTER TABLE RENAME COLUMN
ALTER TABLE klienci RENAME COLUMN nazwizko TO nazwisko;


-- ============================================================
-- CZĘŚĆ 2: SUBQUERIES — ZAGNIEŻDŻONE SELECT
-- ============================================================
-- Subquery = SELECT osadzony wewnątrz innego zapytania.
-- Wewnętrzny SELECT wykonuje się PIERWSZY,
-- jego wynik jest używany przez zewnętrzne zapytanie.


-- ------------------------------------------------------------
-- 2.1 SUBQUERY W WHERE — porównanie z wynikiem agregacji
-- ------------------------------------------------------------

-- Pracownicy zarabiający powyżej średniej
SELECT imie, nazwisko, wynagrodzenie
FROM pracownicy
WHERE wynagrodzenie > (SELECT AVG(wynagrodzenie) FROM pracownicy)
ORDER BY wynagrodzenie DESC;

-- Klienci z miasta, w którym mieszka najwięcej klientów
SELECT imie, nazwisko, miasto
FROM klienci
WHERE miasto = (
    SELECT miasto
    FROM klienci
    GROUP BY miasto
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Pracownicy z najwyższym wynagrodzeniem w swojej kategorii
SELECT imie, nazwisko, wynagrodzenie
FROM pracownicy
WHERE wynagrodzenie = (SELECT MAX(wynagrodzenie) FROM pracownicy);


-- ------------------------------------------------------------
-- 2.2 SUBQUERY W FROM — tabela tymczasowa (inline view)
-- ------------------------------------------------------------

-- Podsumowanie imion z liczbą wystąpień >= 2
SELECT *
FROM (
    SELECT imie, COUNT(*) AS ile_osob
    FROM klienci
    GROUP BY imie
) AS podsumowanie_imion
WHERE ile_osob >= 2
ORDER BY ile_osob DESC;

-- Średnia wynagrodzeń tylko dla działów z więcej niż 5 pracownikami
SELECT dzial, ROUND(AVG(wynagrodzenie), 2) AS srednia
FROM (
    SELECT dzial, wynagrodzenie
    FROM pracownicy
    WHERE wynagrodzenie > 3000
) AS filtrowane
GROUP BY dzial
HAVING COUNT(*) > 5;


-- ------------------------------------------------------------
-- 2.3 SUBQUERY W SELECT — kolumna wyliczana z innej tabeli
-- ------------------------------------------------------------

-- Liczba zamówień dla każdego klienta
SELECT
    k.imie,
    k.nazwisko,
    (SELECT COUNT(*)
     FROM zamowienia z
     WHERE z.id_klienta = k.id) AS liczba_zamowien
FROM klienci k
ORDER BY liczba_zamowien DESC;

-- Ostatnia data zamówienia dla każdego klienta
SELECT
    k.imie,
    k.nazwisko,
    (SELECT MAX(z.data_zamowienia)
     FROM zamowienia z
     WHERE z.id_klienta = k.id) AS ostatnie_zamowienie
FROM klienci k;


-- ------------------------------------------------------------
-- 2.4 SUBQUERY Z IN — filtrowanie przez zbiór wyników
-- ------------------------------------------------------------

-- Klienci, którzy złożyli co najmniej jedno zamówienie
SELECT imie, nazwisko
FROM klienci
WHERE id IN (
    SELECT DISTINCT id_klienta
    FROM zamowienia
);

-- Klienci, którzy NIE złożyli żadnego zamówienia
SELECT imie, nazwisko
FROM klienci
WHERE id NOT IN (
    SELECT DISTINCT id_klienta
    FROM zamowienia
);


-- ============================================================
-- KONIEC LEKCJI 3
-- Następna lekcja: MODUŁ 4 | DAT-45
-- ============================================================
