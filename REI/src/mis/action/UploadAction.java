package mis.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import common.FileUpload;
import mis.dao.UserDAO;
import mis.dao.UserApplyDAO;
import mis.entity.User;
import mis.entity.UserApply;

//业务处理Action

//action是多实例的，对每一个请求都会new一个action,所以不必担心，参数会冲突
@SuppressWarnings("serial")
@Results( { @Result(name = "cpicture", location = "/WEB-INF/cpicture.jsp"),                     //上传照片页面
            @Result(name = "ipicture", location = "/WEB-INF/ipicture.jsp")                    //上传报销单的证明照片页面
		  })
public class UploadAction  extends ActionSupport{
	@Autowired  
	private  HttpServletRequest request; 
	@Autowired
	private UserDAO dao;
	@Autowired
	private UserApplyDAO adao;
	
	// 拿实体类当组合参数，实际上是它的属性帮我们传参了，常用
	private User user;
	private User usera;

	//上传文件集合   
    private List<File> file;   

	//上传文件名集合   
    private List<String> fileFileName;  
    
    private FileUpload fu = new FileUpload();
    
    //上传照片
    public String uploadpicture() throws Exception
    {
    	HttpSession session=request.getSession(true);        //true,若存在会话则返回该会话，否则新建一个会话。
    	User u=(User)session.getAttribute("user");           //当前登录的用户
    	String type=request.getParameter("type");            //类型
    	UserApply ua=new UserApply();
    	ua=adao.checkuser(u.getId(),0,1);                    //查找与用户对应的待审核用户
    	if(file!=null){                                      //文件不空
			fu.setFile(file);                                //上传文件集合
			fu.setFileFileName(fileFileName);                //上传文件名集合
			List<String> ls=fu.upload();                     //执行上传功能
			if(type.equals("cp"))
			{
				u.setCpicture(ls.get(0));                        //设置用户的证件照片
				ua.setCpicture(ls.get(0));                       //设置用户审核表的证件照片
			}else if(type.equals("ip")){
				u.setIpicture(ls.get(0));                        //设置用户的身份证照片
				ua.setIpicture(ls.get(0));                       //设置用户审核表的身份证照片
			}
			dao.update(u);
			adao.update(ua);
			request.setAttribute("uploadpstatus", "上传照片成功！");
		}else{
			request.setAttribute("uploadpstatus", "上传照片失败！"); 
		}
    	return "cpicture";
    }    
    
////////////////////////////////////////////////////////////////////实现get/set  
    public User getUser() {
		return user;
	}
    
	public void setUser(User user) {
		this.user = user;
	}
	
    public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
}