using System;
using System.Collections.Generic;
using System.Text;


public class User
{
	private String userName;
	private String password;
	private int points;
	private int id;
	public User(String userName,String password,int id,int points)
	{
		this.userName = userName;
		this.password = password;
		this.points = points;
		this.id= id;

	}
	public String getUserName()
	{

		return this.userName;
	}
	public String getPassword()
	{

		return this.password;
	}
	public int getPoints()
	{

		return this.points;
	}
	public int getID()
	{

		return this.id;
	}
	public void addPoint()
    {
		this.points += 1;
    }
}

