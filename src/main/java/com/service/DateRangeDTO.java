package com.service;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DateRangeDTO {

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private java.util.Date startDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private java.util.Date endDate;

    // Các phương thức getter và setter

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private java.util.Date selectedDate;
    private java.util.Date selectedMonth;
    private java.util.Date selectedYear;


}
