package kr.co.dingdong.domain;

public class ReportDTO {

    private int idx;

    private int boardNum;

    private String reporter;

    private String reportee;
    private String context;
    private String reportDate;

    @Override
    public String toString() {
        return "ReportDTO{" +
                "idx=" + idx +
                ", boardNum=" + boardNum +
                ", reporter='" + reporter + '\'' +
                ", reportee='" + reportee + '\'' +
                ", context='" + context + '\'' +
                ", reportDate='" + reportDate + '\'' +
                '}';
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public String getReporter() {
        return reporter;
    }

    public void setReporter(String reporter) {
        this.reporter = reporter;
    }

    public String getReportee() {
        return reportee;
    }

    public void setReportee(String reportee) {
        this.reportee = reportee;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }
}
