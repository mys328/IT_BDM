package com.zs.interceptor;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zs.action.xtz.SiteAction;
import com.zs.dao.IBaseDaoOfSpring;
import com.zs.entity.CompanySection;
import com.zs.entity.DaCount;
import com.zs.entity.DaDemPer;
import com.zs.entity.DaDemand;
import com.zs.entity.DaPerform;
import com.zs.entity.FbdAsdl;
import com.zs.entity.FbdComputer;
import com.zs.entity.FbdListLink;
import com.zs.entity.FbdMonitoring;
import com.zs.entity.GoOut;
import com.zs.entity.Goods;
import com.zs.entity.Permission;
import com.zs.entity.QuotaMan;
import com.zs.entity.Role;
import com.zs.entity.RolePermission;
import com.zs.entity.SectionFenbodian;
import com.zs.entity.SectionFenbu;
import com.zs.entity.SectionQubu;
import com.zs.entity.Sim;
import com.zs.entity.Timeline;
import com.zs.entity.Users;
import com.zs.entity.WhBqDraw;
import com.zs.entity.WhDeviceScout;
import com.zs.entity.WhExpressList;
import com.zs.entity.WhMassageReceive;
import com.zs.entity.WhMeetingScout;
import com.zs.entity.WhMonitorScout;
import com.zs.entity.WhOutRepair;
import com.zs.entity.WhThreeMeetingScout;
import com.zs.entity.XtBqRepair;
import com.zs.entity.XtBqq;
import com.zs.entity.XtBranches;
import com.zs.entity.XtHitches;
import com.zs.entity.XtNetImo;
import com.zs.entity.XtPdaChange;
import com.zs.entity.XtProject;
import com.zs.entity.XtSite;
import com.zs.entity.XtZmData;
import com.zs.entity.XtZmNumber;
import com.zs.entity.YjOut;
import com.zs.entity.ZmBq;
import com.zs.entity.ZmByNumber;
import com.zs.entity.ZmCall;
import com.zs.entity.ZmComputer;
import com.zs.entity.ZmMail;
import com.zs.entity.ZmNetCall;
import com.zs.entity.ZmOaNumber;
import com.zs.entity.ZmPhoneLine;
import com.zs.entity.ZmPrinter;
import com.zs.entity.ZmVpn;
import com.zs.entity.ZmWifi;
import com.zs.service.IService;
import com.zs.tools.NameOfDate;

public class QuotaInterceptor extends AbstractInterceptor{

	
	/**
	 * 指标拦截器
	 * 张顺，2017-2-6
	 */
	private static final long serialVersionUID = 1L;
	IService ser;
	HttpServletRequest request;
	HttpServletResponse response;
	Map session;
	String path;
	String reqPamrs;
	Users user;
	String actionName;
	String methodName;
	private static final String PRO_NAME="/IT_BDM";
	private Logger logger=Logger.getLogger(QuotaInterceptor.class);
	
	
	
	public String getActionName() {
		return actionName;
	}
	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	public IService getSer() {
		return ser;
	}
	public void setSer(IService ser) {
		this.ser = ser;
	}

	private void allInit(ActionInvocation arg0) {
		// 取得请求相关的ActionContext实例  
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
    	//获取其他信息
		ActionContext ctx = arg0.getInvocationContext();  
        session = ctx.getSession();  
        //获得url
        path = request.getRequestURI();//url
        reqPamrs = request.getQueryString();//后面的参数
        //获取登录者信息
        user =(Users) session.get("user"); 
        //获取action的名字
        actionName = arg0.getProxy().getActionName();
        //获取action的方法名字
        methodName = arg0.getProxy().getMethod();
	}
	
	/**
	 * 张顺，2017-2-8
	 * <br>存指标信息到数据库
	 * @param unum 账号
	 * @param time 日期
	 * @param type 操作类型
	 * @param table 表名
	 */
	public void saveQuota(String unum,Date time,String type,String table){
		if (unum!=null && time!=null && type!=null && table!=null) {
			List<QuotaMan> qms=ser.find("from QuotaMan where UNum=? and qmDate=? and qmTable=?", new Object[]{unum,time,table});
			if (type.equals("注册")) {
				if (qms.size()>0) {
					QuotaMan qm=qms.get(0);
					qm.setQmTypeZc(qm.getQmTypeZc()+1);
					ser.update(qm);
				}else {
					QuotaMan qm=new QuotaMan("q"+NameOfDate.getNum(), unum, 1, 0, 0, time, table);
					ser.save(qm);
				}
			}else if (type.equals("维护")) {
				if (qms.size()>0) {
					QuotaMan qm=qms.get(0);
					qm.setQmTypeWh(qm.getQmTypeWh()+1);
					ser.update(qm);
				}else {
					QuotaMan qm=new QuotaMan("q"+NameOfDate.getNum(), unum, 0, 1, 0, time, table);
					ser.save(qm);
				}
			}else if (type.equals("注销")) {
				if (qms.size()>0) {
					QuotaMan qm=qms.get(0);
					qm.setQmTypeZx(qm.getQmTypeZx()+1);
					ser.update(qm);
				}else {
					QuotaMan qm=new QuotaMan("q"+NameOfDate.getNum(), unum, 0, 0, 1, time, table);
					ser.save(qm);
				}
			}else {
				logger.error("操作类型在三种之外，换句话说，这里出现了注册、维护、注销之外的操作类型，该条信息的一些情况：type="+type+",unum="+unum+",time="+time.toLocaleString()+",table="+table+"");
			}
		}else {
			logger.error("必要信息为null，导致无法把指标信息存入数据库，具体是哪个为null，请自己调查！");
		}
	}
	
	/**
	 * 张顺 ，2017-2-8
	 * 日期时间类型去掉时间，仅保留日期
	 * @param time 日期时间
	 * @return 去掉时间后的日期
	 */
	public Timestamp removeTime(Timestamp time){
		if (time!=null) {
			time.setHours(0);
			time.setMinutes(0);
			time.setSeconds(0);
			time.setNanos(0);
		}
		return time;
	}
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		String result=arg0.invoke();
		allInit(arg0);
		
		//以下是指标的核心代码
		/*系统组*/
		if (actionName.equals("site")) {//站点资料
			XtSite site=(XtSite) request.getAttribute("site");
			if (site!=null) {
				String type=site.getSMaintainType();
				Timestamp time=removeTime(site.getSCreateTime());
				String unum=site.getUNum();
				saveQuota(unum, time, type, "站点资料登记");
			}
		}else if (actionName.equals("branches")) {//二级站点资料
			XtBranches branches=(XtBranches) request.getAttribute("b");
			if (branches!=null) {
				String type=branches.getBType();
				Timestamp time=removeTime(branches.getBCreateTime());
				String unum=branches.getUNum();
				saveQuota(unum, time, type, "二级站点登记");
			}
		}else if (actionName.equals("zmn")) {
			XtZmNumber zmn=(XtZmNumber) request.getAttribute("zmn");
			if (zmn!=null) {
				String type=zmn.getZmType();
				Timestamp time=removeTime(zmn.getZmCreateTime());
				String unum=zmn.getUNum();
				saveQuota(unum, time, type, "哲盟职能用户");
			}
		}else if (actionName.equals("zmd")) {
			XtZmData zmd=(XtZmData) request.getAttribute("zmd");
			if (zmd!=null) {
				String type=zmd.getDType();
				Timestamp time=removeTime(zmd.getDCreateTime());
				String unum=zmd.getUNum();
				saveQuota(unum, time, type, "哲盟数据检查");
			}
		}else if (actionName.equals("pdachange")) {
			XtPdaChange pda=(XtPdaChange) request.getAttribute("pda");
			if (pda!=null) {
				String type=pda.getCType();
				Timestamp time=removeTime(pda.getCCreateTime());
				String unum=pda.getUNum();
				saveQuota(unum, time, type, "巴枪条码变更");
			}
		}else if (actionName.equals("bqrepair")) {
			XtBqRepair bq=(XtBqRepair) request.getAttribute("bq");
			if (bq!=null) {
				String type=bq.getRType();
				Timestamp time=removeTime(bq.getRCreateTime());
				String unum=bq.getUNum();
				saveQuota(unum, time, type, "设备维修登记");
			}
		}else if (actionName.equals("hitches")) {
			XtHitches h=(XtHitches) request.getAttribute("h");
			if (h!=null) {
				String type=h.getHType();
				Timestamp time=removeTime(h.getHCreateTime());
				String unum=h.getUNum();
				saveQuota(unum, time, type, "哲盟异常登记");
			}
		}else if (actionName.equals("bqq")) {
			XtBqq b=(XtBqq) request.getAttribute("b");
			if (b!=null) {
				String type=b.getBType();
				Timestamp time=removeTime(b.getBServiceDate());
				String unum=b.getUNum();
				saveQuota(unum, time, type, "公司BQQ登记");
			}
		}else if (actionName.equals("netImo")) {
			XtNetImo imo=(XtNetImo) request.getAttribute("imo");
			if (imo!=null) {
				String type=imo.getIType();
				Timestamp time=removeTime(imo.getIServiceDate());
				String unum=imo.getIUnum();
				saveQuota(unum, time, type, "网点IMO登记");
			}
		}else if (actionName.equals("project")) {
			XtProject p=(XtProject) request.getAttribute("p");
			if (p!=null) {
				String type=p.getPType();
				Timestamp time=removeTime(p.getPCreateTime());
				String unum=p.getUNum();
				saveQuota(unum, time, type, "系统开发登记");
			}
		}
		/*硬件组*/
		else if (actionName.equals("fbd_asdl")) {
			FbdAsdl asdl=(FbdAsdl) request.getAttribute("asdl");
			if (asdl!=null) {
				String type=asdl.getAsdlType();
				Timestamp time=removeTime(asdl.getAsdlCreateTime());
				String unum=asdl.getUNum();
				saveQuota(unum, time, type, "ASDL宽带登记");
			}
		}else if (actionName.equals("fbd_m")) {
			FbdMonitoring m=(FbdMonitoring) request.getAttribute("m");
			if (m!=null) {
				String type=m.getMType();
				Timestamp time=removeTime(m.getMCreateTime());
				String unum=m.getUNum();
				saveQuota(unum, time, type, "监控信息登记");
			}
		}else if (actionName.equals("fbd_ll")) {
			FbdListLink ll=(FbdListLink) request.getAttribute("ll");
			if (ll!=null) {
				String type=ll.getLlType();
				Timestamp time=removeTime(ll.getLlCreateTime());
				String unum=ll.getUNum();
				saveQuota(unum, time, type, "监控材料清单");
			}
		}else if (actionName.equals("sim")) {
			Sim sim=(Sim) request.getAttribute("sim");
			if (sim!=null) {
				String type=sim.getSType();
				Timestamp time=removeTime(sim.getSCreateTime());
				String unum=sim.getUNum();
				saveQuota(unum, time, type, "SIM费用报销");
			}
		}else if (actionName.equals("outRegister")) {
			YjOut o=(YjOut) request.getAttribute("0");
			if (o!=null) {
				String type=o.getOType();
				Timestamp time=removeTime(o.getOCreateTime());
				String unum=o.getUNum();
				saveQuota(unum, time, type, "外出登记新");
			}
		}
		/*桌面组*/
		else if (actionName.equals("vpn")) {
			ZmVpn v=(ZmVpn) request.getAttribute("vpn");
			if (v!=null) {
				String type=v.getVType();
				Timestamp time=removeTime(v.getVCreateTime());
				String unum=v.getUNum();
				saveQuota(unum, time, type, "VPN账号登记");
			}
		}else if (actionName.equals("by")) {
			ZmByNumber by=(ZmByNumber) request.getAttribute("by");
			if (by!=null) {
				String type=by.getByType();
				Timestamp time=removeTime(by.getByCreateTime());
				String unum=by.getUNum();
				saveQuota(unum, time, type, "IMO账号登记");
			}
		}else if (actionName.equals("mail")) {
			ZmMail m=(ZmMail) request.getAttribute("m");
			if (m!=null) {
				String type=m.getMType();
				Timestamp time=removeTime(m.getMCreateTime());
				String unum=m.getUNum();
				saveQuota(unum, time, type, "邮箱账号登记");
			}
		}else if (actionName.equals("computer")) {
			ZmComputer c=(ZmComputer) request.getAttribute("c");
			if (c!=null) {
				String type=c.getCType();
				Timestamp time=removeTime(c.getCCreateTime());
				String unum=c.getUNum();
				saveQuota(unum, time, type, "公司电脑信息");
			}
		}else if (actionName.equals("bq")) {
			ZmBq bq=(ZmBq) request.getAttribute("bq");
			if (bq!=null) {
				String type=bq.getBType();
				Timestamp time=removeTime(bq.getBCreateTime());
				String unum=bq.getUNum();
				saveQuota(unum, time, type, "骏达设备登记");
			}
		}else if (actionName.equals("wifi")) {
			ZmWifi w=(ZmWifi) request.getAttribute("wifi");
			if (w!=null) {
				String type=w.getWType();
				Timestamp time=removeTime(w.getWCreateTime());
				String unum=w.getUNum();
				saveQuota(unum, time, type, "公司wifi管理");
			}
		}else if (actionName.equals("call")) {
			ZmCall c=(ZmCall) request.getAttribute("call");
			if (c!=null) {
				String type=c.getCType();
				Timestamp time=removeTime(c.getCCreateTime());
				String unum=c.getUNum();
				saveQuota(unum, time, type, "总部呼叫系统");
			}
		}else if (actionName.equals("netCall")) {
			ZmNetCall c=(ZmNetCall) request.getAttribute("c");
			if (c!=null) {
				String type=c.getNType();
				Timestamp time=removeTime(c.getNCreateDate());
				String unum=c.getUNum();
				saveQuota(unum, time, type, "网点呼叫系统");
			}
		}else if (actionName.equals("oa")) {
			ZmOaNumber obj=(ZmOaNumber) request.getAttribute("oa");
			if (obj!=null) {
				String type=obj.getOType();
				Timestamp time=removeTime(obj.getOCreateTime());
				String unum=obj.getUNum();
				saveQuota(unum, time, type, "OA账号登记");
			}
		}else if (actionName.equals("print")) {
			ZmPrinter obj=(ZmPrinter) request.getAttribute("p");
			if (obj!=null) {
				String type=obj.getPType();
				Timestamp time=removeTime(obj.getPCreateTime());
				String unum=obj.getUNum();
				saveQuota(unum, time, type, "打印机登记");
			}
		}else if (actionName.equals("phone")) {
			ZmPhoneLine obj=(ZmPhoneLine) request.getAttribute("phone");
			if (obj!=null) {
				String type=obj.getPType();
				Timestamp time=removeTime(obj.getPCreateTime());
				String unum=obj.getUNum();
				saveQuota(unum, time, type, "电话线分布");
			}
		}
		/*维护组*/
		
		
		
		close(); 
		return result; 
	}
	
	private void close() {

	}
}
