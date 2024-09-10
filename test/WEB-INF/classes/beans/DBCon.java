package beans;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
public class DBCon implements HttpSessionBindingListener
{
	private Connection con=null;
	public DBCon()
	{
		BuildConnection();
	}
	private void BuildConnection()
	{
		try
		{
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			con=DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433","jian1","820728");
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
		}
	}
	
	public Connection getConnection()
	{
		if(con==null)
		BuildConnection();
		return this.con;
	}
	
	public void close()
	{
		try
		{
			con.close();
			con=null;
	  }
	  catch(SQLException sex)
	  {
	  	System.out.println(sex.toString());
	  }
	}
	public void valueBound(HttpSessionBindingEvent Event){}
	public void valueUnbound(HttpSessionBindingEvent Event)
	{
		if(con!=null)
		close();
	}
}