package org.zerock.myapp.mapper;

import java.util.List;

import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.FaqDTO;

public interface FaqSearchMapper { // 메인페이지에서 검색
	
	//상품검색
	public abstract List<FaqDTO> faqSearchList(Criteria cri);
	
	//상품 총 개수
	public abstract Integer totalFaq(Criteria cri);
	
} // end interface
