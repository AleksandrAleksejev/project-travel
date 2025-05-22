const express = require('express');
const app = express();
const PORT = 3000;

app.get('/travel', (req, res) => {
  res.send('Моё любимое место для путешествий — Япония.');
});

app.listen(PORT, () => {
  console.log(`Сервер запущен на порту ${PORT}`);
});

