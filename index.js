const express = require("express");
const bodyParser = require("body-parser");
const shell = require("shelljs");

const app = express();

app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("auto deploy project").end();
});

app.post("/api/git/autodeploy", (req, res) => {
  const { repository } = req.body;
  const { html_url } = repository;

  const projectName = html_url.substr(html_url.lastIndexOf("/") + 1);

  console.log(`开始执行：${projectName}.sh`);

  const result = shell.exec(
    `cd /root/html/yang/deploy/shell && ./${projectName}.sh`
  );

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

app.listen(9030, function() {
  console.log("express server : 9030 : ok");
});
