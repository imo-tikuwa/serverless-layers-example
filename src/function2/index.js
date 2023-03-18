const axios = require("axios");

module.exports.handler = async (event) => {
  // 関数2
  // レイヤーよりaxiosをインポートし、自身のブログへのgetリクエストを行いレスポンスステータスをチェックする
  const status = await axios
    .get("https://blog.imo-tikuwa.com/", {
      timeout: 5000,
    })
    .then((response) => response.status)
    .catch((error) => error.response.status);
  return {
    statusCode: status,
    event,
  };
};
