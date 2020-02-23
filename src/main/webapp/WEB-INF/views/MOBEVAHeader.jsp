<%@ page pageEncoding="UTF-8"%>
<header id="ms-header" class="position-relative">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-lg-3">
				<a class="navbar-brand ms-logo-pad" href="<spring:url value='/'/>"><img
					src="images/Logo.png" class="img-fluid" alt="Logo"></a>
			</div>
			<div class="col-md-8 col-lg-9">
				<div class="ms-skew-bg position-absolute ms-w-100">
					<div class="ms-header-top">
						<div class="d-inline float-right">
							<!-- 								判斷是否登入顯示名字 -->
							<c:if test="${loginsuccess==1}">
								<span style="color: white;">&nbsp;&nbsp;&nbsp;Hello!!
									${loginuser.u_name}</span>
							</c:if>
						</div>
						<div class="d-inline float-right">
							<!-- <button id="opener" class="img-fluid mx-1 mx-md-2" alt="User Icon"><img
                                               src="images/User_icon.png"></button> -->
							<!-- <a href="#."><img src="images/User_icon.png" class="img-fluid mx-1 mx-md-2"
                                               alt="User Icon"></a> -->
							<a href="cart"><img src="images/shopping-cart01.png"
								class="img-fluid mx-1 mx-md-2" alt="Shop Icon"></a>
							<!-- 										判斷是否登入顯示登出按鍵 -->
							<c:if test="${loginsuccess==1}">
								<a
									onclick="javascript:location.href='<spring:url value='/logout' />'"><img
									src="images/logout.png" class="img-fluid mx-1 mx-md-2"
									alt="logout Icon"></a>
							</c:if>
							<c:if test="${loginsuccess!=1}">
								<a href="login"><img src="images/user01.png"
									class="img-fluid mx-1 mx-md-2" id="opener" alt="User Icon"></a>
							</c:if>
						</div>
						<div class="text-white d-inline">
							<p class="d-inline-block mb-auto ms-font-oswald text-white">
							</p>
						</div>
					</div>
					<div class="ms-header-main ms-bg-orange px-1 px-lg-4">
						<nav class="navbar navbar-expand-lg ms-header-area">
							<button class="navbar-toggler collapsed" type="button"
								data-toggle="collapse" data-target="#hamburgernavmenucontent"
								aria-controls="hamburgernavmenucontent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="menu_toggle"> <span class="hamburger">
										<span></span> <span></span> <span></span>
								</span> <span class="hamburger-cross"> <span></span> <span></span>
								</span>
								</span>
							</button>
							<div class="collapse navbar-collapse ms-header-content"
								id="hamburgernavmenucontent">
								<ul class="navbar-nav">
									<li class="nav-item"><a
										class="nav-link ms-font-oswald ms-font-17 text-white"
										href='<spring:url value='/'/>'>首頁</a></li>
									<li class="nav-item"><a
										class="nav-link ms-font-oswald ms-font-17 text-white"
										href="<spring:url value='/about_us'/>">關於我們</a></li>

									<li class="dropdown nav-item"><a
										class="nav-link ms-font-oswald ms-font-17 text-white"
										data-toggle="dropdown" href="#." role="button"
										aria-haspopup="true" aria-expanded="false">服務項目</a>
										<div class="dropdown-menu">
											<a class="dropdown-item ms-font-oswald ms-font-17"
												href="<spring:url value='/booking'/>">預約方案 </a> <a
												class="dropdown-item ms-font-oswald ms-font-17"
												href="<spring:url value='/maintain_order'/>">預約查詢</a>
										</div></li>

									<li class="dropdown nav-item"><a
										class="nav-link ms-font-oswald ms-font-17 text-white"
										href="<spring:url value='/profile'/>" role="button" aria-haspopup="true"
										aria-expanded="false">會員資料</a></li>


									<li class="dropdown nav-item"><a
										class="nav-link ms-font-oswald ms-font-17 text-white"
										href="<spring:url value='/shop'/>" role="button" aria-haspopup="true"
										aria-expanded="false">購物專區</a>

										<div class="dropdown-menu">
											<a class="dropdown-item ms-font-oswald ms-font-17"
												href="<spring:url value='/cart'/>">購物車</a> <a
												class="dropdown-item ms-font-oswald ms-font-17"
												href="<spring:url value='/order_list'/>">訂單查詢</a>
										</div> <!-- <div class="dropdown-menu">
                                                      <a class="dropdown-item ms-font-oswald ms-font-17"
                                                          href="shop.html">購物專區</a>
                                                      <a class="dropdown-item ms-font-oswald ms-font-17"
                                                          href="shop_detail.html">商品內容</a>
                                                  </div> --></li>
									<li class="nav-item"><a
										class="nav-link ms-font-oswald ms-font-17 text-white"
										href="<spring:url value='/contact'/>">聯絡我們</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>