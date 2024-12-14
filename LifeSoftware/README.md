![image](https://github.com/user-attachments/assets/9867ac10-e255-42b3-b974-a68a8c5b8ce9)# Домашнее задание к занятию 7 «Жизненный цикл ПО»

## Подготовка к выполнению
Развернута и настроена локальная версия Jira.
![image](https://github.com/user-attachments/assets/e1b2f56a-1d45-4530-a0db-70c9e11e5d0f)

## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.
![image](https://github.com/user-attachments/assets/d5c8c707-d7d5-44e4-8998-6e2ef74c056c)

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.
![image](https://github.com/user-attachments/assets/2f0e27da-0f7a-4a13-bf28-c0fded05560b)

---
