package com.web.mobeva.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth // Builder Design Pattern
				.inMemoryAuthentication() // 自訂Runtime時的使用者帳號
				.passwordEncoder(new BCryptPasswordEncoder()).withUser("admin") // 新增user("admin12345") //指定密碼
				.password(new BCryptPasswordEncoder().encode("admin12345")).roles("ADMIN", "USER") // 指派權限群組
				.and() // 再新增使用者
				.passwordEncoder(new BCryptPasswordEncoder()).withUser("user")
				.password(new BCryptPasswordEncoder().encode("user12345")).roles("USER");

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http.headers().frameOptions().disable()
		.and()  
		.authorizeRequests()
				// ----------------靜態資源------------
				.antMatchers("/admin/css/**").permitAll().antMatchers("/admin/images/**").permitAll()
				.antMatchers("/admin/js/**").permitAll().antMatchers("/admin/lib/**").permitAll()
				.antMatchers("/admin/fonts/**").permitAll()
				// ----------------靜態資源------------
//						.antMatchers("/admin/b_login").permitAll()
//						.antMatchers("/admin/b_logindo").permitAll()
//						.antMatchers("/admin/b_cate").hasRole("ADMIN")
//				.antMatchers("/admin/b_index").hasRole("ADMIN")
//				.antMatchers("/admin/welcome").hasRole("ADMIN")
				.antMatchers("/admin/b_cate").hasRole("ADMIN")
				.antMatchers("/admin/**") // 對象為所有網址
				.authenticated() // 存取必須通過驗證
				.anyRequest().permitAll() //resource資料夾靜態資料可匿名存取
				.and()
				.formLogin()
				.loginPage("/admin/b_testlogin") // 則產生自訂login表單
				.loginProcessingUrl("/admin/b_testloginProcess")
				.failureUrl("/admin/b_testlogin?error") // 如果認證失敗，則導往/login並帶參數error
//				.defaultSuccessUrl("/admin/b_index") //認證通過後導往的Url
				.permitAll()
				.and()
				.logout()
				.logoutUrl("/admin/perform_logout")
				.logoutSuccessUrl("/admin/b_testlogin?logout") //
				.permitAll()
				
				.and()
				.csrf()
				.disable();

	}

}
