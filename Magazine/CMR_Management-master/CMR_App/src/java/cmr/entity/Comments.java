/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.entity;

/**
 *
 * @author BUIVUHUECHI
 */
public class Comments {

    private int comment_id;
    private int articleID;
    private String commentContent;
    private int commentAuthor;

    public Comments() {
    }

    public Comments(int comment_id, int articleID, String commentContent, int commentAuthor) {
        this.comment_id = comment_id;
        this.articleID = articleID;
        this.commentContent = commentContent;
        this.commentAuthor = commentAuthor;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public int getCommentAuthor() {
        return commentAuthor;
    }

    public void setCommentAuthor(int commentAuthor) {
        this.commentAuthor = commentAuthor;
    }

}
