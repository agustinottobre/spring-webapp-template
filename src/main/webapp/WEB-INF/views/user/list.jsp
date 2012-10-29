
<div class="row">
  <h2>User List</h2>
  ${request}
  <div class="span12">
    <c:if test="${not empty errorMessage}">
      <div class="alert alert-error">${f:h(errorMessage)}</div>
    </c:if>

    <div class="well">
      <a href="${pageContext.request.contextPath}/user/create?form"
        class="btn btn-primary">New User</a>
      <form:form action="${pageContext.request.contextPath}/user/search"
        method="get" modelAttribute="userSearchForm" class="form-search">
        <form:input path="name" cssClass="input-medium search-query" />
        <input type="submit" value="Search" class="btn" />
      </form:form>
    </div>

    <table class="table table-striped table-bordered table-condensed">
      <thead>
        <tr>
          <th>id</th>
          <th>name</th>
          <th>email</th>
          <th>birth</th>
          <th>actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="user" items="${page.content}">
          <tr>
            <td>${f:h(user.id)}</td>
            <td>${f:h(user.name)}</td>
            <td>${f:h(user.email)}</td>
            <td>${f:h(user.birth)}</td>
            <td><form:form
                action="${pageContext.request.contextPath}/user"
                class="form-inline">
                <input type="hidden" name="id" value="${f:h(user.id)}" />
                <input type="submit" class="btn" name="redirectToUpdate"
                  value="Update" />
                <input type="submit" class="btn btn-danger"
                  name="redirectToDelete" value="Delete" />
              </form:form></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div class="pagination">
      <util:pagination page="${page}" />
    </div>
  </div>

</div>