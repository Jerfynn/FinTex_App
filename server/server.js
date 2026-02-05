// server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Sample users
const users = [
  { id: 1, name: "Jerfin", email: "jerfin@example.com", password: "123456" },
  { id: 2, name: "Subin", email: "subin@example.com", password: "password" },
];

// Login route
app.post('/login', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ success: false, message: "Email and password required" });
  }

  const user = users.find(u => u.email === email && u.password === password);

  if (user) {
    // ✅ Always send JSON
    return res.status(200).json({ success: true, message: "Login success", name: user.name });
  } else {
    return res.status(401).json({ success: false, message: "Invalid email or password" });
  }
});

// Test endpoint
app.get('/', (req, res) => {
  res.json({ message: "Server is running" });
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
