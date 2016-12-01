package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.zrgj.oa.dao.PrivilegeDao;
import com.zrgj.oa.dao.RoleDao;
import com.zrgj.oa.entity.Privilege;
import com.zrgj.oa.entity.Role;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 *
 *	功能:角色数据库操作层实现类
 * 
 *  日期：2016-11-20
 */
public class RoleDaoImpl implements RoleDao {
	
	private PrivilegeDao privilegeDao=new PrivilegeDaoImpl();
	
	public Role getById(Integer id) {
		String sql="select * from role where id=?";
		ResultSet rs=DBUtil.getRes(sql, id);
		List<Role> roleList=rsToRoleList(rs);
		if(roleList!=null && roleList.size()>0){
			return roleList.get(0);
		}
		return null;
	}

	public int add(Role entity) {
		int result=0;
		String sql="insert into role values(null,?,?)";
		Object[] obj={entity.getName(),entity.getDescription()};
		result=DBUtil.add_update_delete(sql, obj);
		Set<Privilege> privileges=entity.getPrivilegeList();
		if(privileges!=null && privileges.size()>0){
			for(Iterator<Privilege> iterator=privileges.iterator();iterator.hasNext();){
				Privilege privilege=iterator.next();
				if(privilege!=null && privilege.getId()!=null){
					String str="insert into role_privilege values(null,?,?)";
					result=DBUtil.add_update_delete(str, entity.getId(),privilege.getId());
				}
			}
		}
		return result;
	}

	public int update(Role entity) {
		int result=0;
		String sql="update role set name=?,description=? where id=?";
		result=DBUtil.add_update_delete(sql, entity.getName(),entity.getDescription());
		String roleSql="select * from role_privilege where roleId=?";
		ResultSet rs=DBUtil.getRes(roleSql, entity.getId());
		List<Integer> idList=null;
		if(rs!=null){
			idList=new ArrayList<Integer>();
			try {
				while(rs.next()){
					Integer id=rs.getInt("id");
					if(id!=null){
						idList.add(id);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		Set<Privilege> privilegeList = entity.getPrivilegeList();
		if(privilegeList!=null && privilegeList.size()>0){
			for(Iterator<Privilege> iterator=privilegeList.iterator();iterator.hasNext();){
				Privilege privilege=iterator.next();
				if(privilege!=null && privilege.getId()!=null){
					String str="update role_privilege set privilege";
				}
			}
		}
		return 0;
	}

	public int delete(Integer id) {
		return 0;
	}

	public List<Role> findAll() {
		String sql="select * from role";
		ResultSet rs=DBUtil.getRes(sql);
		return rsToRoleList(rs);
	}

	public List<Role> getByPrivilegeId(Integer privilegeId) {
		String sql="select roleId from role_privilege where privilegeId=?";
		ResultSet rs=DBUtil.getRes(sql, privilegeId);
		List<Role> roleList=null;
		if(rs!=null){
			roleList=new ArrayList<Role>();
			try {
				while(rs.next()){
					int roleId=rs.getInt("roleId");
					Role role=getById(roleId);
					roleList.add(role);
				}
				return roleList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}
	
	public List<Role> rsToRoleList(ResultSet rs){
		List<Role> roleList=null;
		if(rs!=null){
			roleList=new ArrayList<Role>();
			try {
				while(rs.next()){
					Role role=new Role();
					Integer roleId=rs.getInt("id");
					if(roleId!=null){
						role.setId(roleId);
						List<Privilege> privileges=privilegeDao.getByRoleId(roleId);
						role.setPrivilegeList(new HashSet<Privilege>(privileges));
						role.setName(rs.getString("name"));
						role.setDescription(rs.getString("description"));
					}
					roleList.add(role);
				}
				return roleList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}
	
}
