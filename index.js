const express = require("express");
const bodyParser = require("body-parser");
const shell = require("shelljs");

const app = express();

app.use(bodyParser.json());

app.post("/api/git/autodeploy", (req, res) => {
  console.log(req.body);

  const { repository } = req.body;
  const { html_url } = repository;

  console.log("====");
  console.log(html_url);
  console.log("====");
  // const result = shell.exec("cd /root/html/deploy &&./dep.sh");
  const result = {
    code: 0
  };

  if (result.code === 0) {
    res
      .status(200)
      .send(result.stdout)
      .end();
  } else {
    res
      .status(500)
      .send(result.stderr)
      .end();
  }
});

app.listen(9012, function() {
  console.log("express server : 9012 : ok");
});
