class UrlUtils {
  getParams(url) {
    let params = {};
    let urlParts = url.split('?');
    if (urlParts.length > 1) {
      let queryString = urlParts[1];
      let pairs = queryString.split('&');
      pairs.forEach((pair) => {
        let [key, value] = pair.split('=');
        params[key] = value;
      });
    }

    return params;
  }
}

module.exports = UrlUtils;
