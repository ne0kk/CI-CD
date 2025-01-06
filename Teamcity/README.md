# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).

## Основная часть

1. Создайте новый проект в teamcity на основе fork.
2. Сделайте autodetect конфигурации.
3. Сохраните необходимые шаги, запустите первую сборку master.
4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.
5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
8. Мигрируйте `build configuration` в репозиторий.
9. Создайте отдельную ветку `feature/add_reply` в репозитории.
10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.
12. Сделайте push всех изменений в новую ветку репозитория.
13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
19. В ответе пришлите ссылку на репозиторий.

# Решение домашнего задания к занятию 11 «Teamcity»

Внесение информации о хосте
Выполнение playbook

![image](https://github.com/user-attachments/assets/5c80724a-2918-45a9-b1c0-eb41e98eb447)

Созданы ВМ

![image](https://github.com/user-attachments/assets/86301343-4ade-47db-ad41-ee15905c7481)

Teamcity запущен

![image](https://github.com/user-attachments/assets/fdeeee7c-a120-4192-b5e9-9f1f5830e8c6)

Fork сделан

![image](https://github.com/user-attachments/assets/34cc3fdd-ed08-4c21-be46-a8c6f208586c)

авторизация агента 

![image](https://github.com/user-attachments/assets/10b18f7a-dcf8-4f0d-8d91-7a9932b7099d)

Создание билда с форка 

![image](https://github.com/user-attachments/assets/61dd35f5-b424-43e4-80cc-f28692516ee4)

Автодедект конфига

![image](https://github.com/user-attachments/assets/bd122781-6ff9-417c-95d2-9f0b089f89d8)

Выполнен билд

![image](https://github.com/user-attachments/assets/862f7611-5bc6-4286-bb9e-83283d3ba2ed)
![image](https://github.com/user-attachments/assets/3b2a5c5d-dc63-469b-b983-e4f02923c482)

Добавил шаги

![image](https://github.com/user-attachments/assets/7f329d8a-3cbb-4f64-aae4-bc4ddf1853f6)

Выполнен deploy в Nexus

![image](https://github.com/user-attachments/assets/d0fec14c-6ceb-4c06-88f4-71ce8bb96802)

![image](https://github.com/user-attachments/assets/1137587c-3500-401e-9e2f-6774a0ea6958)

Выполнил миграцию 

![image](https://github.com/user-attachments/assets/d7d41bc5-68b2-4961-b2f5-670cfd83a6e4)

Создал новую ветку 

![image](https://github.com/user-attachments/assets/19d73129-8528-444e-a831-1182a842ccb8)

Изменения в ветку внесены, тест выполнился автоматически
![image](https://github.com/user-attachments/assets/2753f830-c61f-4c10-ab83-924ae0b10ab1)

Выполнен pull

![image](https://github.com/user-attachments/assets/f4f9357e-80f0-496e-9f79-44593b023600)

По ветке master нет собранного артефакта так как версия не изменилась 
![image](https://github.com/user-attachments/assets/7fe088d6-6b56-47d4-a588-382975e57d70)

после изменения сборка прошла версия обновилась, в мастере обновилась конфигурация 
![image](https://github.com/user-attachments/assets/bd7b4673-d3f5-4b79-a84a-8884bde37fd8)
![image](https://github.com/user-attachments/assets/231396d1-1454-4cf9-8e67-135c9eaf054b)
![image](https://github.com/user-attachments/assets/4b60a07c-d4a2-4484-afa4-f01ac8b56fa8)


https://github.com/ne0kk/example-teamcity.git
