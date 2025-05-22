# Используем официальный Node.js образ
FROM node:18

# Создаем рабочую директорию
WORKDIR /app

# Копируем файлы
COPY package*.json ./
RUN npm install
COPY . .

# Открываем порт
EXPOSE 3000

# Запускаем приложение
CMD ["node", "app.js"]
