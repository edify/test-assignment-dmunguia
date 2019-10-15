const moment = require('moment');

const DATE_FORMAT = 'DD-MM-YYYY';

class UserService {
  disableUsers(usersPayload) {    
    let users = JSON.parse(usersPayload);
    const currentDate = moment();
    users.forEach((user) => {
      if (user.enabled) {
        let expires = moment(user.expires, DATE_FORMAT);
        if (expires.isBefore(currentDate)) {
          user.enabled = false;
        }
      }
    });

    return JSON.stringify(users);
  }
}

module.exports = UserService;
