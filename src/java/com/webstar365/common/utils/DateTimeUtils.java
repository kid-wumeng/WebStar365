package com.webstar365.common.utils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

public class DateTimeUtils {
    
    /**
     * 获取多个年份
     * @param startYear 开始年份
     * @param endYear 结束年份
     * @return 成功：年份的集合 | 失败：null
     */
    public static List<String> getYears(int startYear, int endYear) {
        ArrayList<String> years = new ArrayList<String>();
        years.add(0, "");
        for(int year=startYear; year<=endYear; year++) {
            years.add(String.valueOf(year));
        }
        if(years.size() != 0) {
            return years;
        }
        else {
            return null;
        }
    }
    
    /**
     * 获取多个年份(到今年为止)
     * @param startYear 开始年份
     * @return 成功：年份的集合 | 失败：null
     */
    public static List<String> getYears(int startYear) {
        int thisYear = new GregorianCalendar().get(Calendar.YEAR);
        return getYears(startYear, thisYear);
    }
    
    /**
     * 获取全部月份
     * @return 成功：全部月份的集合 | 失败：null
     */
    public static List<String> getMonths() {
        ArrayList<String> months = new ArrayList<String>();
        months.add(0, "");
        for(int month=1; month<=12; month++) {
            months.add(String.valueOf(month));
        }
        if(months.size() != 0) {
            return months;
        }
        else {
            return null;
        }
    }
    
    /**
     * 获取日份
     * @param endDays 结束日份 
     * @return 成功：日份的集合 | 失败：null
     */
    public static List<String> getDays(int endDays) {
        ArrayList<String> days = new ArrayList<String>();
        days.add(0, "");
        for(int day=1; day<=endDays; day++) {
            days.add(String.valueOf(day));
        }
        if(days.size() != 0) {
            return days;
        }
        else {
            return null;
        }
    }
    
    /**
     * 获取日份（以31天为准）
     * @return 成功：日份的集合 | 失败：null
     */
    public static List<String> getDays() {
        return getDays(31);
    } 
    
}
