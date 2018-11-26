package com.yhao.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yhao.dao.AlbumDao;
import com.yhao.entity.Album;
import com.yhao.service.AlbumService;

@Service("albumService")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class AlbumServiceImpl implements AlbumService {
	
	@Resource(name="albumDao")
	private AlbumDao albumDao;
	
	@Resource(name="chapterService")
	private ChapterService chapterService;
	
	@Override
	public void addItem(Album t) {
		t.setCount(chapterService.countChapterByAlbumId(t));
		albumDao.insertItem(t);

	}

	@Override
	public void modifyItem(Album t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void dropItem(Album t) {
		albumDao.deleteItem(t);

	}

	@Override
	public Album queryItem(Album t) {
		return albumDao.selectItem(t);
	}

	@Override
	public List<Album> queryItems() {
		return albumDao.selectItems();
	}

}
