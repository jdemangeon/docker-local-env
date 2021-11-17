import express from "express";
import axios from "axios";

const app = express();

app.get("/", async (req, res) => {
  const users = await axios.get<any[]>(
    `${process.env.USERBOOK_API_BASE_URL}/users`
  );

  res.send(`
    <html>
      <body>
        <h1>Welcome!</h1>
        <h2>Here's our members:</h2>
        <ul>${users.data
          .map((user) => `<li>${user.first_name} ${user.last_name}</li>`)
          .join("")}</ul>
      </body>
    </html>
  `);
});

app.listen(process.env.API_LISTENING_PORT, () => {
  console.log(
    `server started at http://localhost:${process.env.API_LISTENING_PORT}`
  );
});
