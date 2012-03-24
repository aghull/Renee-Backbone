$(function() {

  Post = Backbone.Model.extend({
    urlRoot: '/posts'
  })

  Posts = Backbone.Collection.extend({
    model: Post,
    url: '/posts'
  });

  posts = new Posts;
})