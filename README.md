# Generador de horarios

Programa que genera horarios.

Práctica de Lenguajes de Programación (2019-2020)

## Enunciado
Cada año, a principio de curso comienza la dura tarea de hacer los horarios de 
las clases. Este año, ya que tenemos tiempo, queremos automatizar el proceso 
de manera que se pueda hacer automáticamente. Las limitaciones que se plantean
son las siguientes:

- Tenemos cinco asignaturas: estadística, álgebra, computadores, programación y física. Cada una de tres horas de clase semanales.
- Las clases se harán los lunes, los martes y los miércoles de 15:30 a 20:30 (5 horas diarias).
- No se pueden hacer tres horas seguidas de la misma asignatura pero si tres el mismo día (siempre que haya otra en el medio).
- Al profesor de estadística le va bien cualquier día a cualquier hora.
- A la profesora de álgebra le van bien los lunes y los miércoles a cualquier hora.
- Al profesor de computadores le van bien los lunes y los miércoles a partir de las 18:30h.
- A la profesora de programación le van bien los lunes y los miércoles a cualquier hora.
- Al profesor de física no le va bien más tarde de las 17:30h. Excepto los martes, que no puede a partir de las 16:30h.

Se pide escribir en PROLOG los predicados necesarios para conseguir todos los 
posibles horarios que cumplen estas restricciones. Los resultados se tienen
que escribir en un fichero llamado 'resultats.txt' juntamente con el número 
total de horarios que se han encontrado.

---

### Notas
- Este ejercicio se tiene que hacer en grupos de dos personas.
- La fecha máxima de entrega es el día del examen final.
- Mecanismo de entrega: aula digital.
- Formato de entrega: archivo de PROLOG con los predicados comentados y con los nombres y DNI de los integrantes del grupo al principio.
- Mecanismo de ejecución:
  - Una vez consultada la base de conocimientos, se ejecutará el predicado `?- horari.`.