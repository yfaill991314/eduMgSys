package com.sanxia.po;

public class EntityCourse {
    private Integer id;

    private String uuid;

    private Integer courseId;

    private String strEndDate;

    private String week;

    private Integer strTime;

    private Integer endTime;

    private Integer claRoomId;

    private Integer techerId;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getStrEndDate() {
        return strEndDate;
    }

    public void setStrEndDate(String strEndDate) {
        this.strEndDate = strEndDate == null ? null : strEndDate.trim();
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week == null ? null : week.trim();
    }

    public Integer getStrTime() {
        return strTime;
    }

    public void setStrTime(Integer strTime) {
        this.strTime = strTime;
    }

    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }

    public Integer getClaRoomId() {
        return claRoomId;
    }

    public void setClaRoomId(Integer claRoomId) {
        this.claRoomId = claRoomId;
    }

    public Integer getTecherId() {
        return techerId;
    }

    public void setTecherId(Integer techerId) {
        this.techerId = techerId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}