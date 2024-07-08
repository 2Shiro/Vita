<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="startnum" value="${pagingVo.pagination.startPage}" />
<c:set var="endnum" value="${pagingVo.pagination.endPage}" />
<c:set var="totalpagecount" value="${pagingVo.pagination.totalPageCount}" />

<div id="pagination">
<nav aria-label="Page navigation example" id="paging">
	<ul class="pagination">
		<c:if test="${nowpage > 1}">
			<li class="page-item"><a class="page-link" id="paging"
				href="/QnA?nowpage=1&pro_id=${pro_id}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" id="paging"
				href="/QnA?nowpage=${nowpage - 1}&pro_id=${pro_id}" aria-label="Previous">
					<span aria-hidden="true">&lt;</span>
			</a></li>
		</c:if>
		<c:forEach var="pagenum" begin="${startnum}" end="${endnum}" step="1">
			<li class="page-item"><a class="page-link" id="paging"
				href="/QnA?nowpage=${ pagenum }&pro_id=${pro_id}"> ${ pagenum }
			</a></li>
		</c:forEach>
		<c:if test="${pagingVo.pagination.existNextPage}">
			<li class="page-item"><a class="page-link" id="paging"
				href="/QnA?nowpage=${ nowpage + 1 }&pro_id=${pro_id}"
					aria-label="Next"> <span aria-hidden="true">&gt;</span>
			</a></li>
			<li class="page-item"><a class="page-link" id="paging"
				href="/QnA?nowpage=${ totalpagecount }&pro_id=${pro_id}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
	</ul>
</nav>
</div>