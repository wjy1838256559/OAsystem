package com.zrgj.oa.test;

import com.zrgj.oa.biz.ForumBiz;
import com.zrgj.oa.biz.impl.ForumBizImpl;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 *
 *	����:������̳���
 *
 * 	2016-11-21
 */
public class ForumTest {
	
	public static void main(String[] args) {
		ForumBiz forumBiz=new ForumBizImpl();
		Forum forum=new Forum();
		forum.setName("JAVA SE");
		forum.setDescription("java���������������");
		forumBiz.add(forum);
	}

}
