package org.example.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class ProdSearchCondition {

    private  String keyword ="T";

    private  String option ="";

    public ProdSearchCondition(){}

    public ProdSearchCondition(String keyword, String option) {
        this.keyword = keyword;
        this.option = option;
    }


    public String getQueryString(){
        return UriComponentsBuilder.newInstance()
                .queryParam("keyword",keyword)
                .queryParam("option",option)
                .build().toString();
    }


    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    @Override
    public String toString() {
        return "ProdSearchCondition{" +
                "keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                '}';
    }
}
