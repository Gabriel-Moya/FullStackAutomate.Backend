import express from 'express';

const app = express();
const port = 4000;

app.get('/health-check', (_, res) => {
  const healthchek = {
    uptime: process.uptime(),
    message: 'OK',
    timestamp: Date.now()
  };

  try {
    res.send(healthchek);
  } catch (error) {
    healthchek.message = error;
    res.status(503).send();
  }
});

app.get('/', (_, res) => {
  res.send('Hello v0.0.1');
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
