package com.webstar365.common;

public final class Rule {
    
    /**
     * 星数换算分数
     * @param star 星数
     * @return 分数
     */
    public static float starToScore(Float star) {
        float score = 0;
        if(star != null) {
            score = star / 7  * 10;
        }
        return score;
    }
    
    /**
     * 分数换算星数
     * @param score 分数
     * @return 星数
     */
    public static float scoreToStar(float score) {
        float star;
        if(score <= 0 || score > 10)    //如果分数不在正常范围，则为0颗星
            star = 0;
        else if(score <= 3)    //如果分数为0.0~3.0，则为1星
            star = 1;
        else if(score <= 4.5)  //如果分数为3.0~4.5，则为2星
            star = 2; 
        else if(score <= 6)    //如果分数为4.5~6.0，则为3星
            star = 3;
        else if(score <= 7)    //如果分数为6.0~7.0，则为4星
            star = 4;
        else if(score <= 8)    //如果分数为7.0~8.0，则为5星
            star = 5;
        else if(score <= 9)    //如果分数为8.0~9.0，则为6星
            star = 6;
        else                   //如果分数为9.0~10.0，则为7星
            star = 7;
        return star;
    }
    
}
