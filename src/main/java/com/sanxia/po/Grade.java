package com.sanxia.po;

public class Grade {
    private Integer id;

    private String uuid;

    private Integer eCourseId;

    private Integer stuId;

    private Long grade;

    public Grade(Integer id, String uuid, Integer eCourseId, Integer stuId, Long grade) {
        this.id = id;
        this.uuid = uuid;
        this.eCourseId = eCourseId;
        this.stuId = stuId;
        this.grade = grade;
    }

    public Grade(String uuid, Integer eCourseId, Integer stuId) {
        this.uuid = uuid;
        this.eCourseId = eCourseId;
        this.stuId = stuId;
    }

    public Grade() {
    }

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

    public Integer geteCourseId() {
        return eCourseId;
    }

    public void seteCourseId(Integer eCourseId) {
        this.eCourseId = eCourseId;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Long getGrade() {
        return grade;
    }

    public void setGrade(Long grade) {
        this.grade = grade;
    }
}