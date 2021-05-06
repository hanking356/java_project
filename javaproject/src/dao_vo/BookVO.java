package dao_vo;

public class BookVO {

	String title;
	String genre;
	String writer;
	String company;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

//	@Override
//	public String toString() {
//		return "movieVO [title=" + title + ", genre=" + genre + ", writer=" + writer + ", company=" + company + "]";
//	}

}
