package kr.co.dingdong.domain;

public class CommunityBadDTO {

    private int idx;
    private int boardNum;
    private String id;
    private int bad;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "CommunityBadDTO{" +
                "idx=" + idx +
                ", boardNum=" + boardNum +
                ", id='" + id + '\'' +
                ", bad=" + bad +
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



    public int getBad() {
        return bad;
    }

    public void setBad(int bad) {
        this.bad = bad;
    }
}
