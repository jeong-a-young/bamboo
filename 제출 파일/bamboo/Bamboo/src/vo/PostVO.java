package vo;

import java.sql.Date;

public class PostVO {
	private int postId;
	private String postWriter;
	private String postTitle;
	private String postType;
	private String postSet;
	private String postContents;
	private Date postTime;
	private String postPhoto;
	
	public PostVO() {
		super();
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}

	public String getPostSet() {
		return postSet;
	}

	public void setPostSet(String postSet) {
		this.postSet = postSet;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public String getPostPhoto() {
		return postPhoto;
	}

	public void setPostPhoto(String postPhoto) {
		this.postPhoto = postPhoto;
	}
	
}