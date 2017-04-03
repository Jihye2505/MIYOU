package global.sesoc.gitTest.util;

/**
 * 寃뚯떆�뙋 �럹�씠吏� 泥섎━ �겢�옒�뒪
 */
public class PageNavigator {
	//�럹�씠吏� 愿��젴 �젙蹂� 
	private int countPerPage;		//�럹�씠吏��떦 湲�紐⑸줉 �닔
	private int pagePerGroup;		//洹몃９�떦 �럹�씠吏� �닔 
	private int currentPage;		//�쁽�옱 �럹�씠吏� (理쒓렐 湲��씠 1遺��꽣 �떆�옉)
	private int totalRecordsCount;	//�쟾泥� 湲� �닔
	private int totalPageCount;		//�쟾泥� �럹�씠吏� �닔
	private int currentGroup;		//�쁽�옱 洹몃９ (理쒓렐 洹몃９�씠 0遺��꽣 �떆�옉)
	private int startPageGroup;		//�쁽�옱 洹몃９�쓽 泥� �럹�씠吏�
	private int endPageGroup;		//�쁽�옱 洹몃９�쓽 留덉�留� �럹�씠吏�
	private int startRecord;		//�쟾泥� �젅肄붾뱶 以� �쁽�옱 �럹�씠吏� 泥� 湲��쓽 �쐞移� (0遺��꽣 �떆�옉)
	
	/*
	 * �깮�꽦�옄
	 */
	public PageNavigator(int countPerPage, int pagePerGroup, int currentPage, int totalRecordsCount) {
		//�럹�씠吏��떦 湲� �닔, 洹몃９�떦 �럹�씠吏� �닔, �쁽�옱 �럹�씠吏�, �쟾泥� 湲� �닔瑜� �쟾�떖諛쏆쓬
		this.countPerPage = countPerPage;		this.pagePerGroup = pagePerGroup;
		this.totalRecordsCount = totalRecordsCount;
		
		//�쟾泥� �럹�씠吏� �닔
		totalPageCount = (totalRecordsCount + countPerPage - 1) / countPerPage;

		//�쟾�떖�맂 �쁽�옱 �럹�씠吏�媛� 1蹂대떎 �옉�쑝硫� �쁽�옱�럹�씠吏�瑜� 1�럹�씠吏�濡� 吏��젙
		if (currentPage < 1)	currentPage = 1;
		//�쟾�떖�맂 �쁽�옱 �럹�씠吏�媛� 留덉�留� �럹�씠吏�蹂대떎 �겕硫� �쁽�옱�럹�씠吏�瑜� 留덉�留� �럹�씠吏�濡� 吏��젙
		if (currentPage > totalPageCount)	currentPage = totalPageCount;
		
		this.currentPage = currentPage;

		//�쁽�옱 洹몃９
		currentGroup = (currentPage - 1) / pagePerGroup;
		
		//�쁽�옱 洹몃９�쓽 泥� �럹�씠吏�
		startPageGroup = currentGroup * pagePerGroup + 1;
		//�쁽�옱 洹몃９�쓽 泥� �럹�씠吏�媛� 1蹂대떎 �옉�쑝硫� 1濡� 泥섎━
		startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;
		//�쁽�옱 洹몃９�쓽 留덉�留� �럹�씠吏�
		endPageGroup = startPageGroup + pagePerGroup - 1;
		//�쁽�옱 洹몃９�쓽 留덉�留� �럹�씠吏�媛� �쟾泥� �럹�씠吏� �닔蹂대떎 �옉�쑝硫� �쟾泥댄럹�씠吏� �닔瑜� 留덉�留됱쑝濡�.
		endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;

		//�쟾泥� �젅肄붾뱶 以� �쁽�옱 �럹�씠吏� 泥� 湲��쓽 �쐞移�
		startRecord = (currentPage - 1) * countPerPage;			
	}

	/*
	 * Getters and Setters
	 */
	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getPagePerGroup() {
		return pagePerGroup;
	}

	public void setPagePerGroup(int pagePerGroup) {
		this.pagePerGroup = pagePerGroup;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordsCount() {
		return totalRecordsCount;
	}

	public void setTotalRecordsCount(int totalRecordsCount) {
		this.totalRecordsCount = totalRecordsCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	@Override
	public String toString() {
		return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
				+ currentPage + ", totalRecordsCount=" + totalRecordsCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}
	
}
