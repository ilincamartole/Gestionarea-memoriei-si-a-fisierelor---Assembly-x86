# Gestionarea_memoriei_si_stocarea_fisierelor-Assembly-x86
Acest proiect reprezintă o **simulare la nivel de bază a gestionării memoriei și a sistemului de fișiere**, implementată în **Assembly x86**.  
Scopul este de a ilustra, într-un mod practic, **cum un sistem de operare poate aloca, accesa, șterge și reorganiza fișierele** în structuri de memorie unidimensionale și bidimensionale.

Proiect realizat în cadrul cursului **Arhitectura Sistemelor de Calcul**  
Facultatea de Matematică și Informatică, **Universitatea din București**

---

## Prezentare generală

Simulatorul oferă două moduri principale de funcționare:

- **Model 1D al memoriei** – memoria este reprezentată ca un vector liniar de **1024 celule**
- **Model 2D al memoriei** – memoria este organizată ca o **matrice 256 x 1024**

Fiecare celulă poate stoca un **descriptor de fișier** (valoare întreagă), corespunzător unui fișier salvat în sistem.

---

## Funcționalități principale

Sistemul permite următoarele operații:

- **Adăugare fișier (Add)** – alocă un fișier nou în blocurile de memorie disponibile  
- **Căutare fișier (Get)** – afișează pozițiile (coordonatele) fișierului după descriptor  
- **Ștergere fișier (Delete)** – eliberează blocurile de memorie ocupate de fișierul respectiv  
- **Defragmentare (Defrag)** – compactează memoria prin mutarea fișierelor existente  
- **Afișare memorie (Display)** – listează toate fișierele stocate și intervalele ocupate

---
