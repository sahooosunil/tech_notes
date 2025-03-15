package com.urotaxi.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "contact_us")
public class ContactUs implements Serializable {
    private static final long serialVersionUID = 7325232410399231239L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected int sno;
    protected String name;
    @Column(name = "mobile_no")
    protected String mobileNo;
    protected String message;

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public int hashCode() {
        return Objects.hash(message, mobileNo, name, sno);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ContactUs other = (ContactUs) obj;
        return Objects.equals(message, other.message) && Objects.equals(mobileNo, other.mobileNo)
                && Objects.equals(name, other.name) && sno == other.sno;
    }

}
