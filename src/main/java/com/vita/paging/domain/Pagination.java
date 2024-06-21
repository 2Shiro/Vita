package com.vita.paging.domain;

import com.vita.paging.domain.SearchVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pagination {
	 private int totalRecordCount;     // 검색된 전체 데이터 수 : user_id 에 해당하는 + 검색된
	    private int totalPageCount;       // 전체 페이지 수
	    private int startPage;            // 첫 페이지 번호
	    private int endPage;              // 끝 페이지 번호
	    private int limitStart;           // LIMIT 시작 위치
	    private int currentPage;		// 현재 페이지
	    private boolean existPrevPage;    // 이전 페이지 존재 여부
	    private boolean existNextPage;    // 다음 페이지 존재 여부
	    private int prevPage; //이전페이지
	    private int nextPage;//다음페이지
	    
	    //전체 데이터수랑 가져오고 페이지 초기값 가져오기
	    public Pagination(int totalRecordCount, SearchVo params) {
	    	this.currentPage = params.getPage();
	        if (totalRecordCount > 0) {
	            this.totalRecordCount = totalRecordCount;
	            calculation(params);
	        }
	    }

	    private void calculation(SearchVo params) {

	        // 전체 페이지 수 계산    = 전체 페이지 수  / 페이지당 출력할 데이터 개수
	        totalPageCount = ((totalRecordCount - 1) / params.getRecordSize()) + 1;

	        // 현재 페이지 번호가 전체 페이지 수보다 큰 경우, 현재 페이지 번호에 전체 페이지 수 저장
	        //사용자가 임의로 URL을 건드는 경우를 생각함
	        if (params.getPage() > totalPageCount) {
	            params.setPage(totalPageCount);
	        }

	        // 첫 페이지 번호 계산 현제페이지 -1 나누기 화면하단에 출력할 페이지사이즈 (나는 5) 곱하기 
	        startPage = ((params.getPage() - 1) / params.getPageSize()) * params.getPageSize() + 1;
                                      
	        // 끝 페이지 번호 계산
	        endPage = startPage + params.getPageSize() - 1;

	        // 끝 페이지가 전체 페이지 수보다 큰 경우, 끝 페이지 전체 페이지 수 저장
	        if (endPage > totalPageCount) {
	            endPage = totalPageCount;
	        }

	        // LIMIT 시작 위치 계산
	        limitStart = (params.getPage() - 1) * params.getRecordSize();

	        // 이전 페이지 존재 여부 확인
	        existPrevPage = params.getPage() > 1;
	        if (existPrevPage) {
	            prevPage = params.getPage() - 1;
	            
	        } else {
	        	prevPage  =1;
	        }

	        
	     // 다음 페이지 존재 여부 확인
	        existNextPage = params.getPage() < totalPageCount;

	        
	        if (existNextPage) { // 다음 페이지가 존재하는 경우
	            nextPage = params.getPage() + 1; // 현재 페이지 번호에 1을 더한 값을 다음 페이지 번호로 설정
	        }else {
	        	nextPage =totalPageCount;
	        }
	        
	    }
}
