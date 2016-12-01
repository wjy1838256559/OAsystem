package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import com.zrgj.oa.dao.PrivilegeDao;
import com.zrgj.oa.dao.RoleDao;
import com.zrgj.oa.entity.Privilege;
import com.zrgj.oa.entity.Role;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 * 
 *         功能:权限数据库访问接口实现类
 * 
 *         日期：2016-11-20
 */
public class PrivilegeDaoImpl implements PrivilegeDao {
	
	//private RoleDao roleDao=new RoleDaoImpl();

	public Privilege getById(Integer id) {
		String sql = "select * from privilege where id=?";
		ResultSet rs = DBUtil.getRes(sql, id);
		List<Privilege> privileges=rsToPrivilegeList(rs);
		if(privileges!=null && privileges.size()>0){
			return privileges.get(0);
		}
		return null;
	}

	public int add(Privilege entity) {
		String sql="insert into privilege values(null,?,?,?)";
		Integer parentId=null;
		if(entity.getParent()!=null){
			parentId=entity.getParent().getId();
		}
		Object[] obj={
				parentId,entity.getName(),entity.getUrl()
		};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Privilege entity) {
		String sql="update privilege set name=?,url=?,parentId=? where id=?";
		Integer parentId=null;
		if(entity.getParent()!=null){
			parentId=entity.getParent().getId();
		}
		Object[] obj={entity.getName(),entity.getUrl(),parentId,entity.getId()};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		return 0;
	}

	public List<Privilege> findAll() {
		String sql="select * from privilege";
		ResultSet rs=DBUtil.getRes(sql);
		return rsToPrivilegeList(rs);
	}

	public List<Privilege> getPrivilegeByIds(Long[] ids) {
		String sql="select * from privilege where id in(?)";
		ResultSet rs=DBUtil.getRes(sql, ids);
		return rsToPrivilegeList(rs);
		
	}

	public List<Privilege> getTopList() {
		String sql="select * from privilege where parentId is null";
		ResultSet rs=DBUtil.getRes(sql);
		return rsToPrivilegeList(rs);
	}

	public List<String> getAllPrivilegeUrls() {
		String sql="select distinct url from privilege where url is not null";
		ResultSet rs=DBUtil.getRes(sql);
		List<String> strList=null;
		if(rs!=null){
			strList=new ArrayList<String>();
			try {
				while(rs.next()){
					strList.add(rs.getString("url"));
				}
				return strList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	public List<Privilege> getChildren(Integer parentId) {
		String sql="select * from privilege where parentId=?";
		ResultSet rs=DBUtil.getRes(sql, parentId);
		return rsToPrivilegeList(rs);
	}

	private List<Privilege> rsToPrivilegeList(ResultSet rs) {
		List<Privilege> privileges = null;
		if (rs != null) {
			privileges = new ArrayList<Privilege>();
			try {
				while (rs.next()) {
					Privilege privilege = new Privilege();
					Integer id=rs.getInt("id");
					if(id!=null){
						privilege.setId(id);
						//List<Role> roleList=roleDao.getByPrivilegeId(id);
						//privilege.setRoles(new HashSet<Role>(roleList));
						List<Privilege> children=getChildren(id);
						privilege.setChildren(new HashSet<Privilege>(children));
						privilege.setName(rs.getString("name"));
						privilege.setUrl(rs.getString("url"));
						Integer parentId = rs.getInt("parentId");
						if (parentId != null) {
							Privilege parent = getById(parentId);
							privilege.setParent(parent);
						}
						privileges.add(privilege);
					}
				}
				return privileges;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	public List<Privilege> getByRoleId(Integer roleId) {
		String sql="select privilegeId from role_privilege where roleId=?";
		ResultSet rs=DBUtil.getRes(sql, roleId);
		List<Privilege> privileges=null;
		if(rs!=null){
			privileges=new ArrayList<Privilege>();
			try {
				while(rs.next()){
					int privilegeId=rs.getInt("privilegeId");
					Privilege privilege=getById(privilegeId);
					privileges.add(privilege);
				}
				return privileges;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

}
