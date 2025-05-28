#!/bin/bash

# Параметры подключения к БД
DB_HOST="localhost"
DB_USER="username"
DB_PASS="password"
DB_NAME="BD"

# Путь к файлу бэкапа
BACKUP_FILE="/path/to/backup/folder/BD_backup.sql.gz"

# Временный файл для распаковки
UNZIPPED_BACKUP="/tmp/BD_restore.sql"

# Проверяем существование файла бэкапа
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Файл бэкапа не найден: $BACKUP_FILE"
    exit 1
fi

# Распаковываем файл (если он сжат)
if [[ $BACKUP_FILE == *.gz ]]; then
    echo "Распаковываем файл бэкапа..."
    gunzip -c "$BACKUP_FILE" > "$UNZIPPED_BACKUP" || { echo "Ошибка распаковки"; exit 1; }
    RESTORE_FILE="$UNZIPPED_BACKUP"
else
    RESTORE_FILE="$BACKUP_FILE"
fi

# Восстанавливаем базу данных
echo "Восстанавливаем базу данных $DB_NAME из $BACKUP_FILE..."

# Сначала удаляем существующую БД (осторожно!)
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS $DB_NAME; CREATE DATABASE $DB_NAME;" || { echo "Ошибка при пересоздании БД"; exit 1; }

# Затем восстанавливаем данные
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME < "$RESTORE_FILE" || { echo "Ошибка при восстановлении БД"; exit 1; }

# Удаляем временный файл
if [ -f "$UNZIPPED_BACKUP" ]; then
    rm "$UNZIPPED_BACKUP"
fi

echo "Восстановление базы данных $DB_NAME успешно завершено"