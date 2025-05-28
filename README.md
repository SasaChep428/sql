SQL - код для создания пользователя:
  -- Создание пользователя
  CREATE USER 'sa'@'localhost' IDENTIFIED BY 'De_03';
  -- Выдача прав на базу данных
  GRANT ALL PRIVILEGES ON BD.* TO 'sa'@'localhost';
  --Обновление прав без перезагрузки сервера
  FLUSH PRIVILEGES;
Но он не сработает, так как нужен плагин "mysql_native_password"
Чтобы включить этот плагин в MySQL, можно:
Добавить строку mysql_native_password=ON в раздел [mysqld] конфигурационного файла MySQL. В системах на базе Debian/Ubuntu этот файл находится в каталоге /etc/mysql/.

Полностью заменить localhost в самом MySQL нельзя, но можно настроить сервер на прослушивание других имён или IP-адресов:
создать файл *.ini и прописать в нем следуюший код( и запустить файл):
[mysqld]
bind-address = 0.0.0.0  # или конкретный IP

Мне кажется, что имеется ввиду изменение имени соединения, а не сервера.


Инструкции по использованию скрипта 
Сохраните скрипт в файл, backup_db.sh
Сделайте его исполняемым: chmod +x backup_db.sh
Укажите  путь для сохранения бэкапов
Запускайте скрипт вручную или настройте cron для автоматического выполнения

---------------------------------------------------------------------------------------------
#!/bin/bash

# Параметры подключения к БД
DB_HOST="localhost"
DB_USER="username"
DB_PASS="password"
DB_NAME="BD"

# Директория для хранения бэкапов
BACKUP_DIR="/path/to/backup/folder"

# Имя файла бэкапа (с датой и временем)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"

# Создаем директорию для бэкапов, если ее нет
mkdir -p ${BACKUP_DIR}

# Выполняем дамп базы данных
mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} > ${BACKUP_FILE}

# Проверяем успешность выполнения
if [ $? -eq 0 ]; then
    echo "Резервное копирование успешно завершено. Файл: ${BACKUP_FILE}"
    # Можно добавить сжатие
    gzip ${BACKUP_FILE}
    echo "Файл сжат: ${BACKUP_FILE}.gz"
else
    echo "Ошибка при создании резервной копии"
    exit 1
fi

# Удаляем старые бэкапы (старше 7 дней)
find ${BACKUP_DIR} -name "${DB_NAME}_*.sql.gz" -type f -mtime +7 -exec rm {} \;#!/bin/bash

# Параметры подключения к БД
DB_HOST="localhost"
DB_USER="username"
DB_PASS="password"
DB_NAME="BD"

# Директория для хранения бэкапов
BACKUP_DIR="/path/to/backup/folder"

# Имя файла бэкапа (с датой и временем)
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"

# Создаем директорию для бэкапов, если ее нет
mkdir -p ${BACKUP_DIR}

# Выполняем дамп базы данных
mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} > ${BACKUP_FILE}

# Проверяем успешность выполнения
if [ $? -eq 0 ]; then
    echo "Резервное копирование успешно завершено. Файл: ${BACKUP_FILE}"
    # Можно добавить сжатие
    gzip ${BACKUP_FILE}
    echo "Файл сжат: ${BACKUP_FILE}.gz"
else
    echo "Ошибка при создании резервной копии"
    exit 1
fi

# Удаляем старые бэкапы (старше 7 дней)
find ${BACKUP_DIR} -name "${DB_NAME}_*.sql.gz" -type f -mtime +7 -exec rm {} \;
------------------------------------------------------------------------------------------------------
