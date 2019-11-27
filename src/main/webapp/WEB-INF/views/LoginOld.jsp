<%@ include file="Header.jsp"%>

<c:if test="${!flag2}">
<c:if test="${flag}">
<tr><td colspan="2"><center><b>Your account has been registered</b></center></td></tr>
</c:if>

<c:if test="${!flag}">
<tr><td colspan="2"><center><b>Username already exists. Try logging in.</b></center></td></tr>
</c:if>
</c:if>

<div class="container">
  <h2 class="text-center">Login</h2>
<form class="form-horizontal" action="perform_login" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2">Username:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" placeholder="Enter Username" name="username">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" placeholder="Enter password" name="password">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>

<%@ include file="Footer.jsp" %>