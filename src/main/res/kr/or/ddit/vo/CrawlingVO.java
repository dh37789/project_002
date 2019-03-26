package kr.or.ddit.vo;

import org.jsoup.select.Elements;

public class CrawlingVO {

	private String crawlingTitle;
	private String crawlingHref;
	private String crawlingTotal;
			
	public String getCrawlingTotal() {
		return crawlingTotal;
	}
	public void setCrawlingTotal(String crawlingTotal) {
		this.crawlingTotal = crawlingTotal;
	}
	public String getCrawlingTitle() {
		return crawlingTitle;
	}
	public void setCrawlingTitle(String crawlingTitle) {
		this.crawlingTitle = crawlingTitle;
	}
	public String getCrawlingHref() {
		return crawlingHref;
	}
	public void setCrawlingHref(String crawlingHref) {
		this.crawlingHref = crawlingHref;
	}

	

}
