package com.yhao.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yhao.dao.ChapterDao;
import com.yhao.entity.Album;
import com.yhao.entity.Chapter;

@Service("chapterService")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class ChapterServiceImpl implements ChapterService {

	
	@Resource(name="chapterDao")
	private ChapterDao chapterDao;
	
	@Override
	public void addItem(Chapter t) {
		chapterDao.insertItem(t);
	}

	@Override
	public void modifyItem(Chapter t) {
	}

	@Override
	public void dropItem(Chapter t) {
	}

	@Override
	public Chapter queryItem(Chapter t) {
		return chapterDao.selectItem(t);
	}

	@Override
	public List<Chapter> queryItems() {
		return null;
	}

	@Override
	public Integer countChapterByAlbumId(Album album) {
		return chapterDao.getCountChapterByAlbumId(album);
	}

	//查询该专辑下的所有章节数据
	public List<Chapter> queryByAlbumIds(Album album) {
		return chapterDao.selectByAlbumIds(album);
	}

}
