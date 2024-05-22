const functions = require("firebase-functions");
const express = require("express");
const cors = require("cors");
const fetch = require("node-fetch");

const app = express();
app.use(cors({origin: true}));

app.get("/youtube", async (req, res) => {
  const videoId = req.query.id;
  const apiKey = "AIzaSyDhXT-_EASXnbInRhZccH_Kwlh6kdyoW80";
  const url = `https://www.googleapis.com/youtube/v3/videos?part=snippet&id=${videoId}&key=${apiKey}`;

  try {
    const response = await fetch(url);
    const data = await response.json();
    res.json(data);
  } catch (error) {
    res.status(500).send(error.toString());
  }
});

exports.api = functions.https.onRequest(app);
