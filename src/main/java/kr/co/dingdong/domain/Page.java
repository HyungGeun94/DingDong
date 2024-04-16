package kr.co.dingdong.domain;

public class Page {

    private int num;
    private int count;
    private int postNum = 10;
    private int pageNum;
    private int displayPost;

    private int pageNum_cnt =10;
    private int endPageNum;
    private int startPageNum;
    private boolean prev;
    private boolean next;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
        dataCalc();
    }

    private void dataCalc(){

        endPageNum=(int)(Math.ceil((double)num/pageNum_cnt)*pageNum_cnt);

        startPageNum = endPageNum-pageNum_cnt+1;

        int endPageNum_tmp= (int)Math.ceil(((double)count/pageNum_cnt));

        if(endPageNum>endPageNum_tmp){
            endPageNum=endPageNum_tmp;
        }

        prev = startPageNum == 1 ? false : true;

        next = endPageNum * pageNum_cnt >= count ? false : true;

        displayPost = (num - 1) * postNum;


    }

    private String searchTypeKeyword;

    public void setSearchTypeKeyword(String searchType, String keyword) {

        if(searchType.equals("") || keyword.equals("")) {
            searchTypeKeyword = "";
        } else {
            searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword;
        }
    }

    public String getSearchTypeKeyword() {
        return searchTypeKeyword;
    }

    public int getPostNum() {
        return postNum;
    }

    public void setPostNum(int postNum) {
        this.postNum = postNum;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getDisplayPost() {
        return displayPost;
    }

    public void setDisplayPost(int displayPost) {
        this.displayPost = displayPost;
    }

    public int getPageNum_cnt() {
        return pageNum_cnt;
    }

    public void setPageNum_cnt(int pageNum_cnt) {
        this.pageNum_cnt = pageNum_cnt;
    }

    public int getEndPageNum() {
        return endPageNum;
    }

    public void setEndPageNum(int endPageNum) {
        this.endPageNum = endPageNum;
    }

    public int getStartPageNum() {
        return startPageNum;
    }

    public void setStartPageNum(int startPageNum) {
        this.startPageNum = startPageNum;
    }

    public boolean getPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean getNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }
}
