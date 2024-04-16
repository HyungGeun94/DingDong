package kr.co.dingdong.domain;

public class CommunityGoodDTO {


   private int idx;
    private int boardNum;
    private String id;
    private int good;


    @Override
    public String toString() {
        return "CommunityGoodDTO{" +
                "idx=" + idx +
                ", boardNum=" + boardNum +
                ", id='" + id + '\'' +
                ", good=" + good +
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }
}
