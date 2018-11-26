package com.yhao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yhao.entity.Album;
import com.yhao.entity.Chapter;

public interface ChapterDao extends IDao<Chapter> {
	
	Integer getCountChapterByAlbumId(Album album);
	
	//查询该专辑下的所有章节数据
	List<Chapter> selectByAlbumIds(Album album);
}
