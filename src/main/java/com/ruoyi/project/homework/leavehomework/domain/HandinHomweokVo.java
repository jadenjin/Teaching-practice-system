package com.ruoyi.project.homework.leavehomework.domain;

public class HandinHomweokVo {

   private String classid;
   private String stuname;
   private String loginname;


   public String getClassid() {
      return classid;
   }

   public void setClassid(String classid) {
      this.classid = classid;
   }

   public String getStuname() {
      return stuname;
   }

   public void setStuname(String stuname) {
      this.stuname = stuname;
   }

   public String getLoginname() {
      return loginname;
   }

   public void setLoginname(String loginname) {
      this.loginname = loginname;
   }

   @Override
   public String toString() {
      return "HandinHomweokVo{" +
              "classid='" + classid + '\'' +
              ", stuname='" + stuname + '\'' +
              ", loginname='" + loginname + '\'' +
              '}';
   }
}
