<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

 <c:set  var = "postId"         value ="${post_id} "/>
  <c:set  var="startnum"           value="${ searchVo.pagination.startPage         }" /> 
  <c:set  var="endnum"             value="${ searchVo.pagination.endPage           }" /> 
  <c:set  var="totalpagecount"     value="${ searchVo.pagination.totalPageCount  }" /> 
  <c:set  var = "prevPage"         value ="${searchVo.pagination.prevPage} "/>
  <c:set  var = "nextPage"         value ="${searchVo.pagination.nextPage} "/>

  
   <ul class="pagination">
	    <c:choose>	     
		     <c:when test="${searchVo.pagination.existPrevPage}">
		  	    <li class ="page-item"><a class ="page-link" href="/Pds/View?post_id=${postId }&nowpage=1">처음</a> </li>
	      		<li class ="page-item prev_item"><a class ="page-link" href="/Pds/View?post_id=${postId}&nowpage=${prevPage}">⏪</a> </li>
		     </c:when>
		     <c:otherwise>
		     	<li class ="page-item"><a class ="page-link" href="#" onclick="return false;">처음</a> </li>
	     	    <li class ="page-item prev_item"><a class ="page-link" href="#" onclick="return false;">⏪</a> </li>
		     </c:otherwise>
	    </c:choose>
	      
	   		
			  
		
		   <c:forEach  var="pagenum"  begin="${startnum}"  end="${endnum}"  step="1">
		     <c:choose>
		       <c:when test="${pagenum eq searchVo.pagination.currentPage}">
			        <li class="page-item"><a class="page-link" href="/Pds/View?post_id=${postId }&nowpage=${ pagenum }"
			        style="font-weight: bold; color: blue; text-decoration: underline;">
			        ${ pagenum }</a></li>
		       </c:when>
		       <c:otherwise>
		       		<li class="page-item"><a class="page-link" href="/Pds/View?post_id=${postId }&nowpage=${ pagenum }">
			        ${ pagenum }</a></li>
		       </c:otherwise>
		     </c:choose>     
		   </c:forEach>
		   <c:choose>
		   	<c:when test="${searchVo.pagination.existNextPage}">
		   		<li class ="page-item next_item"><a class ="page-link" href="/Pds/View?post_id=${postId}&nowpage=${ nextPage}">⏩</a> </li>
		        <li class ="page-item"><a class ="page-link" href="/Pds/View?post_id=${postId}&nowpage=${ totalpagecount }">마지막</a> </li>
		   	</c:when>
		   	<c:otherwise>
		   		<li class ="page-item next_item"><a class ="page-link" href="#" onclick="return false;">⏩</a> </li>
		        <li class ="page-item"><a class ="page-link" href="#" onclick="return false;">마지막</a> </li>
		   	</c:otherwise>
		   </c:choose>
		   
	</ul>
 
  
  
  
  

</nav>
  