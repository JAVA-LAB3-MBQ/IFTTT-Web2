package dao;

import domain.*;

public interface IThisDao {
	public boolean addThis(IfThisListenWeibo this_);
	public boolean addThis(IfThisTime this_);
	public boolean addThis(IfThisReceiveMail this_);
	
	public boolean removeThis(IfThisListenWeibo this_);
	public boolean removeThis(IfThisTime this_);
	public boolean removeThis(IfThisReceiveMail this_);
}
