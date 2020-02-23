package com.web.mobeva.dao.user;

import com.web.mobeva.model.user.UserInfoBean;

public interface UserLoginDao {

	UserInfoBean saveOpenID(String u_openid, String u_name, String u_email);

}
