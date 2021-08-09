<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <header id="main-header">
      <nav><a href="/">
        <img src="/resources/images/logoTxt.png" alt="Logo" id="logo" /></a>
        <link rel="stylesheet" href="/resources/css/header.css" />
        
<c:choose>
<c:when test="${loginID!=null }">
<ul>

          <li><a href="${pageContext.request.contextPath}/mypage.mp">MyPage</a></li>
         <li><a href="${pageContext.request.contextPath}/member/logout"><i class="fas fa-sign-out-alt"></i></a></li>
        <li><i class="fas fa-user-alt"   id="popBtn"  data-placement="bottom"
                class="btn btn-lg btn-danger"
                data-toggle="popover lightbox"
                title="Popover title"
                data-content="And here's some amazing content. It's very engaging. Right?"></i></li> 
        </ul>
</c:when>
<c:otherwise>
<ul>
 <li><a href="${pageContext.request.contextPath}/member/whichMember">Login</a></li>
 </ul>
</c:otherwise>
</c:choose>
      </nav>
      
    </header>

   
  
  
  
  </body>
</html>
</body>
</html>