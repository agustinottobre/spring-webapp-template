
<h2>User List</h2>
${request}
<div class="col-sm-12">
	<c:if test="${not empty errorMessage}">
		<div class="alert alert-error">${errorMessage}</div>
	</c:if>

	<div class="well">
		<a href="${pageContext.request.contextPath}/user/create?form"
			class="btn btn-primary">New User</a><br> <br>
		<form:form action="${pageContext.request.contextPath}/user/search"
			method="get" modelAttribute="userSearchForm"
			class="form-inline my-inline">
			<form:input path="name" class="form-control" />
			<input type="submit" value="Search" class="btn btn-default" />
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
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.birth}</td>
					<td><form:form
							action="${pageContext.request.contextPath}/user"
							class="form-inline">
							<input type="hidden" name="id" value="${user.id}" />
							<input type="submit" class="btn btn-default"
								name="redirectToUpdate" value="Update" />
							<input type="submit" class="btn btn-danger"
								name="redirectToDelete" value="Delete" />
						</form:form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<util:pagination page="${page}" query="name=${param.name}" />
</div>
