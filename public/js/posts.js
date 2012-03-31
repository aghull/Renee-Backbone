$(function() {

  Post = Backbone.Model.extend()
  Comment = Backbone.Model.extend()

  Posts = Backbone.Collection.extend({
    model: Post,
  });

  Comments = Backbone.Collection.extend({
    model: Comment
  });

  posts = new Posts
  posts.url='/posts'
  posts.fetch({
    'success': function(posts) {
      posts.each(function(post) {
        post.comments = new Comments;
        post.comments.url = '/posts/'+post.id+'/comments';
        post.comments.fetch();
      })
    }
  })

})