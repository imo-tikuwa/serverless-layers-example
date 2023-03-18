const moment = require("moment");

module.exports.handler = async (event) => {
  // 関数1
  // レイヤーよりmomentをインポートし、現在の時刻を返す
  return {
    message: moment().format("YYYY-MM-DD HH:mm:ss"),
    event,
  };
};
