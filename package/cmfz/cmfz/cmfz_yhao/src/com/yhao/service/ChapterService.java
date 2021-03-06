package com.yhao.service;

import java.util.List;

import com.yhao.entity.Album;
import com.yhao.entity.Chapter;

public interface ChapterService extends IService<Chapter> {
	
	Integer countChapterByAlbumId(Album album);
	
	//查询该专辑下的所有章节数据
	List<Chapter> queryByAlbumIds(Album album);
}
