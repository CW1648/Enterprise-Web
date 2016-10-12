/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

import java.io.InputStream;
import java.sql.Date;


/**
 *
 * @author BUIVUHUECHI
 */
public class Articles {

    private int articleID;
    private String articleTitle;
    private String articleContent;
    private InputStream articlePicture;
    private int articleAuthor;
    private int articleFaculty;
    private String articleStatus;
    private Date submitted_at;
    private Date updated_at;

    public Articles() {
    }

    public Articles(int articleID, String articleTitle, String articleContent, InputStream articlePicture, int articleAuthor, int articleFaculty, String articleStatus, Date submitted_at, Date updated_at) {
        this.articleID = articleID;
        this.articleTitle = articleTitle;
        this.articleContent = articleContent;
        this.articlePicture = articlePicture;
        this.articleAuthor = articleAuthor;
        this.articleFaculty = articleFaculty;
        this.articleStatus = articleStatus;
        this.submitted_at = submitted_at;
        this.updated_at = updated_at;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public InputStream getArticlePicture() {
        return articlePicture;
    }

    public void setArticlePicture(InputStream articlePicture) {
        this.articlePicture = articlePicture;
    }

    public int getArticleAuthor() {
        return articleAuthor;
    }

    public void setArticleAuthor(int articleAuthor) {
        this.articleAuthor = articleAuthor;
    }

    public int getArticleFaculty() {
        return articleFaculty;
    }

    public void setArticleFaculty(int articleFaculty) {
        this.articleFaculty = articleFaculty;
    }

    public String getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(String articleStatus) {
        this.articleStatus = articleStatus;
    }

    public Date getSubmitted_at() {
        return submitted_at;
    }

    public void setSubmitted_at(Date submitted_at) {
        this.submitted_at = submitted_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }
    
    

}
