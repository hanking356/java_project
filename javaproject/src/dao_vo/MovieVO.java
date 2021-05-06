package dao_vo;

public class MovieVO {

	String title;
	String actor;
	String director;
	String genre;


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

//	@Override
//	public String toString() {
//		return "movieVO [title=" + title + ", actor=" + actor + ", director=" + director + ", genre=" + genre + "]";
//	}

}
