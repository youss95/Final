<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header id="main-header">
      <nav>
        <img src="/resources/images/logoTxt.png" alt="Logo" id="logo" />
<c:choose>
<c:when test="${loginID!=null }">
<ul>
          <li><a href="${pageContext.request.contextPath}/mypage.mp">MyPage</a></li>
         <li><a href="${pageContext.request.contextPath}/member/logout"><i class="fas fa-sign-out-alt"></i></a></li>
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