package com.zs.action.zmz;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


import org.apache.log4j.Logger;

import com.zs.action.IMyBaseAction;
import com.zs.action.MyBaseAction;
import com.zs.entity.Users;
import com.zs.entity.ZmCall;
import com.zs.service.IService;
import com.zs.service.iDataImportService;
import com.zs.tools.NameOfDate;
import com.zs.tools.Page;

public class CallAction extends MyBaseAction implements IMyBaseAction{
	IService ser;
	iDataImportService importSer;
	Page page;
	
	ZmCall call;
	List calls;
	
	String result="call";
	String result_succ="succ";
	String result_fail="fail";
	
	String id;
	String name;
	String section;
	String cnum;
	String phone;
	String dates;
	String datee;
	String cz;
	
	
	private Logger logger=Logger.getLogger(CallAction.class);
	private File fileExcel;
	private String fileExcelContentType;
	private String fileExcelFileName; 
	
	
	public iDataImportService getImportSer() {
		return importSer;
	}
	public void setImportSer(iDataImportService importSer) {
		this.importSer = importSer;
	}
	public File getFileExcel() {
		return fileExcel;
	}
	public void setFileExcel(File fileExcel) {
		this.fileExcel = fileExcel;
	}
	public String getFileExcelContentType() {
		return fileExcelContentType;
	}
	public void setFileExcelContentType(String fileExcelContentType) {
		this.fileExcelContentType = fileExcelContentType;
	}
	public String getFileExcelFileName() {
		return fileExcelFileName;
	}
	public void setFileExcelFileName(String fileExcelFileName) {
		this.fileExcelFileName = fileExcelFileName;
	}
	public ZmCall getCall() {
		return call;
	}
	public void setCall(ZmCall call) {
		this.call = call;
	}
	public List getCalls() {
		return calls;
	}
	public void setCalls(List calls) {
		this.calls = calls;
	}
	public IService getSer() {
		return ser;
	}
	public void setSer(IService ser) {
		this.ser = ser;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getDatee() {
		return datee;
	}
	public void setDatee(String datee) {
		this.datee = datee;
	}
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCz() {
		return cz;
	}
	public void setCz(String cz) {
		this.cz = cz;
	}
	
	//------------------------------------------------
	public void clearOptions() {
		id=null;     
		name=null;   
		section=null;
		cnum=null;
		phone= null;
		dates=null;  
		datee=null;  
		cz=null;
		call=null;
		calls=null;
		if (page==null) {
			page=new Page(1, 0, 10);
		}
	}
	
	private void clearSpace(){
		if(id!=null){
			id=id.trim();
		}
		if(name!=null){
			name=name.trim();
		}
		if(section!=null){
			section=section.trim();
		}
		if(cnum!=null){
			cnum=cnum.trim();
		}
		if(phone!=null){
			phone=phone.trim();
		}
	}
	
	public String queryOfFenye() throws UnsupportedEncodingException {
		clearSpace();
		if (cz!=null && cz.equals("yes")) {
			clearOptions();
		}
		clearSpace();
		String hql="from ZmCall where CState= '有效' ";
		if (id!=null) {
			hql=hql+" and CId like '%"+id+"%'";
		}
		if (name!=null && !name.trim().equals("")) {
			hql=hql+" and CName like '%"+name+"%'";
		}
		if (section!=null && !section.trim().equals("")) {
			hql=hql+" and CSection like '%"+section+"%'";
		}
		if (cnum!=null && !cnum.trim().equals("")) {
			hql=hql+" and CNum like '%"+cnum+"%'";
		}
		if (phone!=null && !phone.trim().equals("")) {
			hql=hql+" and CPhone like '%"+phone+"%'";
		}
		if (dates!=null && !dates.trim().equals("")) {
			hql=hql+" and CDate >= '"+dates+"'";
		}
		if (datee!=null && !datee.trim().equals("")) {
			hql=hql+" and CDate <= '"+datee+"'";
		}
		hql=hql+" order by CCreateTime desc , CDate desc";
		calls=ser.query(hql, null, hql, page, ser);
		ser.receiveStructure(getRequest());
		return result;
	}
	
	public String gotoQuery() throws UnsupportedEncodingException {
		clearOptions();
		String hql="from ZmCall where CState= '有效' order by CCreateTime desc , CDate desc";
		calls=ser.query(hql, null, hql, page, ser);
		ser.receiveStructure(getRequest());
		return result;
	}
	
	public String delete() throws Exception {
		clearSpace();
		if (id!=null) {
			call=(ZmCall) ser.get(ZmCall.class, id);
			ser.delete(call);
		}
		return gotoQuery();
	}
	
	public String update() throws Exception {
		clearSpace();
		if(call!=null && call.getCId()!=null && !"".equals(call.getCId().trim())){
			ZmCall zc=(ZmCall) ser.get(ZmCall.class, call.getCId());
			zc.setCState("无效");
			ser.update(zc);
			getRequest().setAttribute("zc", zc);
			
			call.setCId("c"+NameOfDate.getNum());
			Users user=(Users) getSession().getAttribute("user");
			if(user!=null){
				call.setCIt(user.getUName());
			}
			call.setCWeek(zc.getCWeek());
			call.setCCreateTime(new Timestamp(new Date().getTime()));
			if(call.getCJob().equals("入职")){
				call.setCType("注册");
			}else if(call.getCJob().equals("离职")){
				call.setCType("注销");
			}else{
				call.setCType("维护");
			}
			call.setCState("有效");
			call.setUNum(user.getUNum());
			ser.save(call);
			getRequest().setAttribute("call", call);
		}
		return gotoQuery();
	}
	
	public String add() throws Exception {
		clearSpace();
		if(call!=null){
			call.setCId("c"+NameOfDate.getNum());
			Users user=(Users) getSession().getAttribute("user");
			if(user!=null){
				call.setCIt(user.getUName());
			}
			Calendar ca = Calendar.getInstance();
			ca.setTime(call.getCDate());
			call.setCWeek(ca.get(Calendar.WEEK_OF_YEAR));
			call.setCCreateTime(new Timestamp(new Date().getTime()));
			if(call.getCJob().equals("入职")){
				call.setCType("注册");
			}else if(call.getCJob().equals("离职")){
				call.setCType("注销");
			}else{
				call.setCType("维护");
			}
			call.setCState("有效");
			call.setUNum(user.getUNum());
			ser.save(call);
			getRequest().setAttribute("call", call);
		}
		return gotoQuery();
	}
	public String importExcel() throws InterruptedException, IOException, ParseException {
		Users users=(Users) getSession().getAttribute("user");
		importSer.importExcelData(fileExcelFileName, fileExcel,users.getUNum());
		return gotoQuery();
	}
}
