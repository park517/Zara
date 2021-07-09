package com.project.zara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project.zara.model.CourseVO;

@Mapper
public interface CourseMapper {

	//카테고리 별 레코드 수
	@Select("SELECT COUNT(*) FROM course WHERE cos_category = #{cos_category}")
	public int selectCosRowCount(@Param("cos_category") int cos_category);
	
	//총 레코드 수
	@Select("SELECT COUNT(*) FROM course")
	public int selectRowCount();
	
	//전체 게시글 조회
	public List<CourseVO> selectList(Map<String, Object> map);
	
	//카테고리 별 게시글 조회
	public List<CourseVO> selectCosList(Map<String, Object> map);
	
	//글쓰기
	@Insert("INSERT into course (cos_num, mem_id, cos_category, cos_title, cos_content, hit, create_at, update_at) VALUES (seq_course.nextval, #{mem_id}, #{cos_category}, #{cos_title}, #{cos_content}, #{hit}, SYSDATE, null)")
	public void insertCosBoard(CourseVO course);
	
	//글 상세보기
	@Select("SELECT * FROM course WHERE cos_num = #{cos_num}")
	public CourseVO selectCosBoard(Integer cos_num);
	
	//글 수정
	public void updateCosBoard(CourseVO course);
	
	//글 삭제
	@Delete("DELETE FROM course WHERE cos_num = #{cos_num}")
	public void deleteCosBoard(Integer cos_num);
	
	//글 조회수 증가
	@Update("UPDATE course SET hit = hit + 1 WHERE cos_num = #{cos_num}")
	public void updateCosHit(Integer cos_num);
	
	// 유저별 코스 가져오기
	public List<CourseVO> getcosList(String mem_id);
}
