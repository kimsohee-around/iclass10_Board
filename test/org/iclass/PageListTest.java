package org.iclass;


import org.iclass.dao.CommunityDao;
import org.iclass.vo.Community;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PageListTest {

	@DisplayName("페이지목록 확인을 위해 여러개 insert")
	@Test
	void insertMany() {
		CommunityDao dao = CommunityDao.getInstance();
		
		for(int i=1;i<300;i++) {
			dao.insert(Community.builder()
					.title("오늘의 주제는 " + i)
					.content("주말은 어떻게 잘 보낼것인가"+i)
					.writer("김자바"+i)
					.ip("192.168.1.200")
					.build()
					);
		}
		
			
	}

}
