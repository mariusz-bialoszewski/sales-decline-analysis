# 📊 Sales Decline Analysis – E-commerce

## 📌 Project Overview
This project analyzes a decline in sales in an e-commerce dataset.  
The goal was to identify the key driver behind the drop in revenue using SQL and Power BI.

---

## 🎯 Business Problem
A decrease in total revenue was observed over time.  
The objective was to determine whether the decline was caused by:

- fewer customers  
- lower average order value (AOV)  
- changes in customer behavior  

---

## 🛠 Tools & Technologies
- SQL Server – data extraction and transformation  
- Power BI – data visualization and dashboard creation  

---

## 📂 Dataset
The analysis is based on the Olist e-commerce dataset, including:

- orders  
- order_items  
- customers  
- products  
- category translation  

---

## 🔎 Analysis Steps

### 1. Data Preparation (SQL)
- joined multiple tables (orders, order_items, customers, products)  
- filtered only delivered orders  
- calculated key metrics:
  - revenue  
  - number of orders  
  - number of customers  
  - average order value (AOV)  

---

### 2. Aggregation
- monthly aggregation of:
  - total revenue  
  - number of orders  
  - number of customers  
- created a final dataset (SQL view) for reporting  

---

### 3. Visualization (Power BI)
Built an interactive dashboard including:

- KPI metrics (Revenue, Orders, Customers, AOV)  
- Sales trend over time  
- Customer analysis  
- Top 10 product categories by revenue  
- Filters (time, category)  

---

## 📈 Key Insights

- Sales decline is primarily driven by a decrease in the number of customers  
- Average Order Value (AOV) remains stable over time  
- Customer behavior has not significantly changed  
- The issue is related to customer acquisition, not basket value  

---

## 📊 Dashboard
![Dashboard Preview](dashboard.png)

---

## 🚀 Conclusions

The decline in revenue is not caused by lower spending per customer,  
but by a reduction in the number of active customers.

👉 Recommended actions:
- improve customer acquisition strategies  
- analyze marketing performance  
- focus on retention campaigns  

---

## 💡 Author Note
This project was created as part of a data analytics portfolio to demonstrate:

- SQL data transformation  
- business thinking and analytical approach  
- dashboard design in Power BI  

---

---

# 🇵🇱 Analiza spadku sprzedaży – E-commerce

## 📌 Opis projektu
Projekt polega na analizie spadku sprzedaży w danych e-commerce.  
Celem było zidentyfikowanie głównej przyczyny spadku przychodów przy użyciu SQL oraz Power BI.

---

## 🎯 Problem biznesowy
Zaobserwowano spadek przychodów w czasie.  
Celem analizy było ustalenie, czy spadek wynika z:

- mniejszej liczby klientów  
- spadku średniej wartości zamówienia (AOV)  
- zmiany zachowań zakupowych klientów  

---

## 🛠 Narzędzia
- SQL Server – przygotowanie i transformacja danych  
- Power BI – wizualizacja danych i dashboard  

---

## 📂 Dane
Analiza oparta jest na zbiorze danych Olist, zawierającym m.in.:

- zamówienia  
- pozycje zamówień  
- klientów  
- produkty  
- tłumaczenia kategorii  

---

## 🔎 Etapy analizy

### 1. Przygotowanie danych (SQL)
- połączenie tabel (orders, order_items, customers, products)  
- filtrowanie zamówień o statusie „delivered”  
- wyliczenie metryk:
  - przychód  
  - liczba zamówień  
  - liczba klientów  
  - AOV  

---

### 2. Agregacja
- agregacja miesięczna:
  - przychodu  
  - liczby zamówień  
  - liczby klientów  
- stworzenie widoku SQL do raportowania  

---

### 3. Wizualizacja (Power BI)
Dashboard zawiera:

- KPI (przychód, zamówienia, klienci, AOV)  
- trend sprzedaży w czasie  
- analiza klientów  
- TOP 10 kategorii produktowych  
- filtry (czas, kategoria)  

---

## 📈 Kluczowe wnioski

- Spadek sprzedaży wynika głównie ze spadku liczby klientów  
- Średnia wartość zamówienia (AOV) pozostaje stabilna  
- Zachowania zakupowe klientów nie uległy istotnej zmianie  
- Problem dotyczy pozyskiwania klientów, nie ich wydatków  

---

## 📊 Dashboard
![Podgląd dashboardu](dashboard.png)

---

## 🚀 Wnioski biznesowe

Spadek przychodów nie wynika ze zmniejszenia wartości koszyka,  
lecz z mniejszej liczby aktywnych klientów.

👉 Rekomendacje:
- działania marketingowe  
- poprawa pozyskiwania klientów  
- działania retencyjne  

---

## 💡 Uwagi autora
Projekt został wykonany jako część portfolio Data Analyst, pokazujący:

- pracę z SQL  
- analizę danych  
- myślenie biznesowe  
- tworzenie dashboardów  

---
