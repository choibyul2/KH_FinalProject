package org.zerock.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.myapp.domain.Criteria;
import org.zerock.myapp.domain.FaqDTO;
import org.zerock.myapp.domain.FaqVO;

public interface FaqMapper {

	/* FAQ 게시글 목록 조회 */
	@Select("SELECT /*+ index_desc(FAQ) */ * FROM FAQ")
	public abstract List<FaqVO> selectAll();
	
	//-------------- XML 매핑 방식으로 생성 --------------//
	// 상세조회, 등록, 수정, 삭제
	
	
	/* FAQ 게시글 상세 조회 */
	public abstract FaqVO select(Integer no);
	
	/* FAQ 게시글 등록 */
	public abstract Integer insert(FaqDTO dto);
	
	/* FAQ 게시글 수정 */
	public abstract Integer update(FaqDTO dto);
	
	/* FAQ 게시글 삭제 */
	public abstract Integer delete(Integer no);
	
	/* FAQ 게시글 목록 조회(페이징 적용) */
	public abstract List<FaqVO> getListPaging(Criteria cri);

	/* 공지사항 게시글 총 갯수 */
	public abstract Integer getTotal();
	
} // end class