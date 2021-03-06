package com.zs.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * FbdMonitoring entity. @author MyEclipse Persistence Tools
 */

public class FbdMonitoring implements java.io.Serializable {

	// Fields

	private String MId;
	private String fbdId;
	private Integer MCamera;
	private Integer MDisk;
	private String MDiskCapacity;
	private String MNum;
	private String MPass;
	private String MDisplayer;
	private String MMainframeBrand;
	private String MMainframeNumber;
	private Integer MInterface;
	private Date MTimeStart;
	private Double MUsedYear;
	private String MScrap;
	private String MPeriod;
	private String MNote;
	private String MState;
	private String MType;
	private Timestamp MCreateTime;
	private String MStateRealy;
	private String UNum;

	private SectionFenbodian fbd;
	
	// Constructors

	public SectionFenbodian getFbd() {
		return fbd;
	}
	public void setFbd(SectionFenbodian fbd) {
		this.fbd = fbd;
	}

	/** default constructor */
	public FbdMonitoring() {
	}

	/** minimal constructor */
	public FbdMonitoring(String MId) {
		this.MId = MId;
	}

	/** full constructor */
	public FbdMonitoring(String MId, String fbdId, Integer MCamera,
			Integer MDisk, String MDiskCapacity, String MNum, String MPass,
			String MDisplayer, String MMainframeBrand, String MMainframeNumber,
			Integer MInterface, Date MTimeStart, Double MUsedYear,
			String MScrap, String MPeriod, String MNote, String MState,
			String MType, Timestamp MCreateTime, String MStateRealy, String UNum) {
		this.MId = MId;
		this.fbdId = fbdId;
		this.MCamera = MCamera;
		this.MDisk = MDisk;
		this.MDiskCapacity = MDiskCapacity;
		this.MNum = MNum;
		this.MPass = MPass;
		this.MDisplayer = MDisplayer;
		this.MMainframeBrand = MMainframeBrand;
		this.MMainframeNumber = MMainframeNumber;
		this.MInterface = MInterface;
		this.MTimeStart = MTimeStart;
		this.MUsedYear = MUsedYear;
		this.MScrap = MScrap;
		this.MPeriod = MPeriod;
		this.MNote = MNote;
		this.MState = MState;
		this.MType = MType;
		this.MCreateTime = MCreateTime;
		this.MStateRealy = MStateRealy;
		this.UNum = UNum;
	}

	// Property accessors

	public String getMId() {
		return this.MId;
	}

	public void setMId(String MId) {
		this.MId = MId;
	}

	public String getFbdId() {
		return this.fbdId;
	}

	public void setFbdId(String fbdId) {
		this.fbdId = fbdId;
	}

	public Integer getMCamera() {
		return this.MCamera;
	}

	public void setMCamera(Integer MCamera) {
		this.MCamera = MCamera;
	}

	public Integer getMDisk() {
		return this.MDisk;
	}

	public void setMDisk(Integer MDisk) {
		this.MDisk = MDisk;
	}

	public String getMDiskCapacity() {
		return this.MDiskCapacity;
	}

	public void setMDiskCapacity(String MDiskCapacity) {
		this.MDiskCapacity = MDiskCapacity;
	}

	public String getMNum() {
		return this.MNum;
	}

	public void setMNum(String MNum) {
		this.MNum = MNum;
	}

	public String getMPass() {
		return this.MPass;
	}

	public void setMPass(String MPass) {
		this.MPass = MPass;
	}

	public String getMDisplayer() {
		return this.MDisplayer;
	}

	public void setMDisplayer(String MDisplayer) {
		this.MDisplayer = MDisplayer;
	}

	public String getMMainframeBrand() {
		return this.MMainframeBrand;
	}

	public void setMMainframeBrand(String MMainframeBrand) {
		this.MMainframeBrand = MMainframeBrand;
	}

	public String getMMainframeNumber() {
		return this.MMainframeNumber;
	}

	public void setMMainframeNumber(String MMainframeNumber) {
		this.MMainframeNumber = MMainframeNumber;
	}

	public Integer getMInterface() {
		return this.MInterface;
	}

	public void setMInterface(Integer MInterface) {
		this.MInterface = MInterface;
	}

	public Date getMTimeStart() {
		return this.MTimeStart;
	}

	public void setMTimeStart(Date MTimeStart) {
		this.MTimeStart = MTimeStart;
	}

	public Double getMUsedYear() {
		return this.MUsedYear;
	}

	public void setMUsedYear(Double MUsedYear) {
		this.MUsedYear = MUsedYear;
	}

	public String getMScrap() {
		return this.MScrap;
	}

	public void setMScrap(String MScrap) {
		this.MScrap = MScrap;
	}

	public String getMPeriod() {
		return this.MPeriod;
	}

	public void setMPeriod(String MPeriod) {
		this.MPeriod = MPeriod;
	}

	public String getMNote() {
		return this.MNote;
	}

	public void setMNote(String MNote) {
		this.MNote = MNote;
	}

	public String getMState() {
		return this.MState;
	}

	public void setMState(String MState) {
		this.MState = MState;
	}

	public String getMType() {
		return this.MType;
	}

	public void setMType(String MType) {
		this.MType = MType;
	}

	public Timestamp getMCreateTime() {
		return this.MCreateTime;
	}

	public void setMCreateTime(Timestamp MCreateTime) {
		this.MCreateTime = MCreateTime;
	}

	public String getMStateRealy() {
		return this.MStateRealy;
	}

	public void setMStateRealy(String MStateRealy) {
		this.MStateRealy = MStateRealy;
	}

	public String getUNum() {
		return this.UNum;
	}

	public void setUNum(String UNum) {
		this.UNum = UNum;
	}

}