package kr.co.dingdong.domain;

public class JjimDTO {


    private int idx;
    private int boardNum;
    private int memberIdx;
    private int jjim;


    @Override
    public String toString() {
        return "JjimDTO{" +
                "idx=" + idx +
                ", boardNum=" + boardNum +
                ", memberIdx=" + memberIdx +
                ", jjim=" + jjim +
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

    public int getMemberIdx() {
        return memberIdx;
    }

    public void setMemberIdx(int memberIdx) {
        this.memberIdx = memberIdx;
    }

    public int getJjim() {
        return jjim;
    }

    public void setJjim(int jjim) {
        this.jjim = jjim;
    }
}
