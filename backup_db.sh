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
find ${BACKUP_DIR} -name "${DB_NAME}_*.sql.gz" -type f -mtime +7 -exec rm {} \;