










# Домашнее задание к занятию 9 «Процессы CI/CD»

## Подготовка к выполнению

1. Создайте два VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).
![image](https://github.com/user-attachments/assets/3e303942-b9ab-46f6-a265-a221ceb5d875)

2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.
![image](https://github.com/user-attachments/assets/db04526b-e6d9-441e-a08a-b16039749836)

Исправил ошибки playbook связанные с версией postgress
![image](https://github.com/user-attachments/assets/6c5939b2-be97-4cb0-bbf8-99b034788c74)
       
        Раскомментируйте строки, начинающиеся с baseurl.
        Замените все вхождения http://mirrorlist.centos.orgна http://vault.centos.org.
        Замените все вхождения http://mirror.centos.orgна http://vault.centos.org.учс
3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.
4. Запустите playbook, ожидайте успешного завершения.
![image](https://github.com/user-attachments/assets/a518372c-e819-4a48-a7f2-9435072f86f2)
5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).
![image](https://github.com/user-attachments/assets/547d2821-3436-4249-8367-baf12fca0f81)

7.  Проверьте готовность Nexus через [бразуер](http://localhost:8081).
![image](https://github.com/user-attachments/assets/61bc0921-c153-4bcc-978f-d286c831eef8)



## Знакомоство с SonarQube

### Основная часть

1. Создайте новый проект, название произвольное.
![image](https://github.com/user-attachments/assets/10441f75-6a8e-49cd-85f9-02dca90b969a)
admin: 7f588663152e3f61dc97392734da60075a67c68d
2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.
![image](https://github.com/user-attachments/assets/ed685182-d6e8-404b-9dc6-ec2fede7c34b)

3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
![image](https://github.com/user-attachments/assets/a46c9433-4dc4-454b-8dc6-b943de187fb9)

4. Проверьте `sonar-scanner --version`.
![image](https://github.com/user-attachments/assets/78c67258-33b8-45e7-b3e8-6a691f59e469)

5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.

![image](https://github.com/user-attachments/assets/f68d78c8-9c80-4dc2-92d7-eec353d13a35)
6. Посмотрите результат в интерфейсе.
![image](https://github.com/user-attachments/assets/91d47bbb-8369-4265-be23-29d015da6dbe)

7. Исправьте ошибки, которые он выявил, включая warnings.
![image](https://github.com/user-attachments/assets/2c3e84f7-bb04-43a0-b37a-9e0400a4dd55)

8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.
![image](https://github.com/user-attachments/assets/56529f48-6032-44ce-80fb-29eac891b367)

9. Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.
![image](https://github.com/user-attachments/assets/81e2cdf5-6c97-452e-a3d4-446699082f63)

## Знакомство с Nexus

### Основная часть

1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.
   
2. В него же загрузите такой же артефакт, но с version: 8_102.
3. Проверьте, что все файлы загрузились успешно.
![image](https://github.com/user-attachments/assets/c0a13ecd-30e2-446d-9c70-219a4b0789d2)

4. В ответе пришлите файл `maven-metadata.xml` для этого артефекта.
![image](https://github.com/user-attachments/assets/6f381b5a-1a17-4889-9a8b-79acedd9303a)

### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).
2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.
4. Проверьте `mvn --version`.
![image](https://github.com/user-attachments/assets/897f28da-6da1-451f-9454-7056508f37ca)

5. Заберите директорию [mvn](./mvn) с pom.

### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).
![image](https://github.com/user-attachments/assets/edac115b-4a4a-4867-98b5-10c5bb0b5011)

2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.
![image](https://github.com/user-attachments/assets/1f4393a7-edbd-4ab7-8348-295a93b10baf)

3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.
![image](https://github.com/user-attachments/assets/1d1e4a7c-6838-4bd4-8546-d16cbcb09d37)

4. В ответе пришлите исправленный файл `pom.xml`.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
